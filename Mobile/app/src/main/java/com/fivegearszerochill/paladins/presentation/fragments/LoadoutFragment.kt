package com.fivegearszerochill.paladins.presentation.fragments

import android.os.Bundle
import android.view.KeyEvent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.flow.distinctUntilChangedBy
import kotlinx.coroutines.flow.filter
import kotlinx.coroutines.launch
import android.view.inputmethod.EditorInfo
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.lifecycleScope
import androidx.paging.LoadState
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.util.empty
import com.fivegearszerochill.paladins.presentation.adapters.LoadoutAdapter
import com.fivegearszerochill.paladins.presentation.adapters.ReposLoadStateAdapter
import com.fivegearszerochill.paladins.presentation.viewmodels.LoadoutViewModel
import kotlinx.android.synthetic.main.fragment_loadout.*


class LoadoutFragment : Fragment() {
    private lateinit var viewModel: LoadoutViewModel
    private var searchJob: Job? = null
    private val adapter = LoadoutAdapter(LoadoutAdapter.LoadoutModelComparator)
    private lateinit var playerName: String

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        playerName = requireArguments().getString("playerName") ?: String.empty()
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_loadout, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        initAdapter()
        viewModel = ViewModelProvider(this).get(LoadoutViewModel::class.java)
        val query = savedInstanceState?.getString(LAST_SEARCH_QUERY) ?: playerName
        search(query)
        initSearch(query)
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString(LAST_SEARCH_QUERY, loadout_fragment_player_name_input.text?.trim().toString())
    }

    override fun onDestroy() {
        super.onDestroy()
        searchJob?.cancel()
    }

    private fun initAdapter(){
        val decoration = DividerItemDecoration(activity, DividerItemDecoration.VERTICAL)
        fragment_loadout_recycler_view.addItemDecoration(decoration)
        fragment_loadout_recycler_view.layoutManager = LinearLayoutManager(activity)
        fragment_loadout_recycler_view.adapter = adapter.withLoadStateHeaderAndFooter(
            header = ReposLoadStateAdapter { adapter.retry() },
            footer = ReposLoadStateAdapter { adapter.retry() }
        )
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
        loadout_fragment_player_name_input.setText(query)

        loadout_fragment_player_name_input.setOnEditorActionListener { _, actionId, _ ->
            if (actionId == EditorInfo.IME_ACTION_GO) {
                updateRepoListFromInput()
                true
            } else {
                false
            }
        }
        loadout_fragment_player_name_input.setOnKeyListener { _, keyCode, event ->
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
                .collect { fragment_loadout_recycler_view.scrollToPosition(0) }
        }
    }

    private fun updateRepoListFromInput() {
        loadout_fragment_player_name_input.text?.trim().let {
            if (it != null) {
                if (it.isNotEmpty()) {
                    fragment_loadout_recycler_view.scrollToPosition(0)
                    search(it.toString())
                }
            }
        }
    }

    companion object {
        private const val LAST_SEARCH_QUERY: String = "last_search_query"
    }
}