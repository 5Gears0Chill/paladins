package com.fivegearszerochill.paladins.presentation.fragments

import android.os.Bundle
import android.view.KeyEvent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.inputmethod.EditorInfo
import android.widget.Toast
import androidx.core.os.bundleOf
import androidx.core.view.isVisible
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.lifecycleScope
import androidx.navigation.NavController
import androidx.navigation.Navigation
import androidx.paging.LoadState
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.interfaces.listeners.OnMatchHistoryClickedListener
import com.fivegearszerochill.paladins.domain.util.empty
import com.fivegearszerochill.paladins.presentation.adapters.MatchHistoryAdapter
import com.fivegearszerochill.paladins.presentation.adapters.ReposLoadStateAdapter
import com.fivegearszerochill.paladins.presentation.viewmodels.MatchHistoryViewModel
import kotlinx.android.synthetic.main.fragment_match_history.*
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.flow.distinctUntilChangedBy
import kotlinx.coroutines.flow.filter
import kotlinx.coroutines.launch


class MatchHistoryFragment : Fragment(), OnMatchHistoryClickedListener {
    private var searchJob: Job? = null
    private val adapter = MatchHistoryAdapter(this, MatchHistoryAdapter.MatchHistoryModelComparator)

    private lateinit var viewModel: MatchHistoryViewModel
    private lateinit var navController: NavController
    private lateinit var playerName: String

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        playerName = requireArguments().getString("playerName") ?: String.empty()
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_match_history, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        initAdapter()
        viewModel = ViewModelProvider(this).get(MatchHistoryViewModel::class.java)
        navController = Navigation.findNavController(view)
        val query = savedInstanceState?.getString(LAST_SEARCH_QUERY) ?: playerName
        search(query)
        initSearch(query)
    }

    override fun onStart() {
        super.onStart()
    }

    override fun onViewMatchDetailsClicked(matchId: String, id: Int) {
        val bundle = bundleOf(
            "matchId" to matchId,
            "playerMatchHistoryId" to id,
            "playerName" to playerName
        )
        navController.navigate(
            R.id.action_matchHistoryFragment_to_matchDetailsFragment,
            bundle
        )
    }
    private fun initAdapter(){
        retry_button?.setOnClickListener { adapter.retry() }
        val decoration = DividerItemDecoration(activity, DividerItemDecoration.VERTICAL)
        fragment_match_history_recycler_view?.addItemDecoration(decoration)
        fragment_match_history_recycler_view?.layoutManager = LinearLayoutManager(activity)
        fragment_match_history_recycler_view?.adapter =  adapter.withLoadStateHeaderAndFooter(
            header = ReposLoadStateAdapter { adapter.retry() },
            footer = ReposLoadStateAdapter { adapter.retry() }
        )
        adapter.addLoadStateListener { loadState ->
            fragment_match_history_recycler_view?.isVisible = loadState.source.refresh is LoadState.NotLoading
            progress_bar?.isVisible = loadState.source.refresh is LoadState.Loading
            retry_button?.isVisible = loadState.source.refresh is LoadState.Error
            val errorState = loadState.source.append as? LoadState.Error
                ?: loadState.source.prepend as? LoadState.Error
                ?: loadState.append as? LoadState.Error
                ?: loadState.prepend as? LoadState.Error
            errorState?.let {
                Toast.makeText(
                    activity,
                    "\uD83D\uDE28 Wooops ${it.error}",
                    Toast.LENGTH_LONG
                ).show()
            }
        }
    }

    private fun search(playerName: String) {
        searchJob?.cancel()
        searchJob = lifecycleScope.launch {
            viewModel.searchRepo(playerName).collect {
                adapter.submitData(it)
            }
        }
    }

    private fun initSearch(query: String) {
        match_history_fragment_player_name_input.setText(query)

        match_history_fragment_player_name_input.setOnEditorActionListener { _, actionId, _ ->
            if (actionId == EditorInfo.IME_ACTION_GO) {
                updateRepoListFromInput()
                true
            } else {
                false
            }
        }
        match_history_fragment_player_name_input.setOnKeyListener { _, keyCode, event ->
            if (event.action == KeyEvent.ACTION_DOWN && keyCode == KeyEvent.KEYCODE_ENTER) {
                updateRepoListFromInput()
                true
            } else {
                false
            }
        }

        lifecycleScope.launch {
            adapter.loadStateFlow
                .distinctUntilChangedBy { it.refresh }
                .filter { it.refresh is LoadState.NotLoading }
                .collect { fragment_match_history_recycler_view.scrollToPosition(0) }
        }
    }


    private fun updateRepoListFromInput() {
        match_history_fragment_player_name_input.text?.trim().let {
            if (it != null) {
                if (it.isNotEmpty()) {
                    fragment_match_history_recycler_view.scrollToPosition(0)
                    search(it.toString())
                }
            }
        }
    }

    companion object {
        private const val LAST_SEARCH_QUERY: String = "last_search_query"
    }

}