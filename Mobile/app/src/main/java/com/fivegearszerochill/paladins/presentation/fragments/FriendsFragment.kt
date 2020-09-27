package com.fivegearszerochill.paladins.presentation.fragments

import android.os.Bundle
import android.view.KeyEvent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.inputmethod.EditorInfo
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.lifecycleScope
import androidx.paging.LoadState
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.util.empty
import com.fivegearszerochill.paladins.presentation.adapters.FriendsAdapter
import com.fivegearszerochill.paladins.presentation.viewmodels.FriendViewModel
import kotlinx.android.synthetic.main.fragment_friends.*
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.flow.distinctUntilChangedBy
import kotlinx.coroutines.flow.filter
import kotlinx.coroutines.launch

class FriendsFragment : Fragment() {

    private lateinit var viewModel: FriendViewModel
    private var searchJob: Job? = null

    private val adapter = FriendsAdapter(FriendsAdapter.FriendModelComparator)
    private lateinit var playerName: String

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        playerName = requireArguments().getString("playerName") ?: String.empty()
    }
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_friends, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        viewModel = ViewModelProvider(this).get(FriendViewModel::class.java)
        val decoration = DividerItemDecoration(activity, DividerItemDecoration.VERTICAL)
        fragment_friend_recycler_view.addItemDecoration(decoration)
        fragment_friend_recycler_view.layoutManager = LinearLayoutManager(activity)
        fragment_friend_recycler_view.adapter = adapter
        val query = savedInstanceState?.getString(LAST_SEARCH_QUERY) ?: playerName
        search(query)
        initSearch(query)
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString(LAST_SEARCH_QUERY, item_fragment_player_name_input.text?.trim().toString())
    }

    override fun onDestroy() {
        super.onDestroy()
        searchJob?.cancel()
    }

    private fun search(playerName: String) {
        // Make sure we cancel the previous job before creating a new one
        searchJob?.cancel()
        searchJob = lifecycleScope.launch {
            viewModel.searchRepo(playerName).collect {
                adapter.submitData(it)
            }
        }
    }

    private fun initSearch(query: String) {
        item_fragment_player_name_input.setText(query)

        item_fragment_player_name_input.setOnEditorActionListener { _, actionId, _ ->
            if (actionId == EditorInfo.IME_ACTION_GO) {
                updateRepoListFromInput()
                true
            } else {
                false
            }
        }
        item_fragment_player_name_input.setOnKeyListener { _, keyCode, event ->
            if (event.action == KeyEvent.ACTION_DOWN && keyCode == KeyEvent.KEYCODE_ENTER) {
                updateRepoListFromInput()
                true
            } else {
                false
            }
        }

        // Scroll to top when the list is refreshed from network.
        lifecycleScope.launch {
            adapter.loadStateFlow
                // Only emit when REFRESH LoadState for RemoteMediator changes.
                .distinctUntilChangedBy { it.refresh }
                // Only react to cases where Remote REFRESH completes i.e., NotLoading.
                .filter { it.refresh is LoadState.NotLoading }
                .collect { fragment_friend_recycler_view.scrollToPosition(0) }
        }
    }

    private fun updateRepoListFromInput() {
        item_fragment_player_name_input.text?.trim().let {
            if (it != null) {
                if (it.isNotEmpty()) {
                    fragment_friend_recycler_view.scrollToPosition(0)
                    search(it.toString())
                }
            }
        }
    }

    companion object {
        private const val LAST_SEARCH_QUERY: String = "last_search_query"
    }
}