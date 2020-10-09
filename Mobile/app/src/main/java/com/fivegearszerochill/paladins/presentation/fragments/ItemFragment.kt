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
import androidx.recyclerview.widget.GridLayoutManager
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.presentation.adapters.ItemAdapter
import com.fivegearszerochill.paladins.presentation.adapters.ReposLoadStateAdapter
import com.fivegearszerochill.paladins.presentation.viewmodels.ItemViewModel
import kotlinx.android.synthetic.main.fragment_item.*
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.flow.distinctUntilChangedBy
import kotlinx.coroutines.flow.filter
import kotlinx.coroutines.launch

@ExperimentalCoroutinesApi
class ItemFragment : Fragment() {

    private lateinit var viewModel: ItemViewModel
    private var searchJob: Job? = null
    private val adapter = ItemAdapter(ItemAdapter.ItemModelComparator)

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_item, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        initAdapter()
        viewModel = ViewModelProvider(this).get(ItemViewModel::class.java)
        val query = savedInstanceState?.getString(LAST_SEARCH_QUERY) ?: DEFAULT_QUERY
        search(query.toInt())
        initSearch(query)
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString(LAST_SEARCH_QUERY, item_fragment_champion_id_input.text?.trim().toString())
    }

    override fun onDestroy() {
        super.onDestroy()
        searchJob?.cancel()
    }

    private fun initAdapter(){
        val decoration = DividerItemDecoration(activity, DividerItemDecoration.VERTICAL)
        item_fragment_recyclerview.addItemDecoration(decoration)
        item_fragment_recyclerview.layoutManager = GridLayoutManager(activity,2)

        item_fragment_recyclerview.adapter = adapter.withLoadStateHeaderAndFooter(
            header = ReposLoadStateAdapter { adapter.retry() },
            footer = ReposLoadStateAdapter { adapter.retry() }
        )
    }
    private fun search(championId: Int) {
        // Make sure we cancel the previous job before creating a new one
        searchJob?.cancel()
        searchJob = lifecycleScope.launch {
            viewModel.searchRepo(championId).collect {
                adapter.submitData(it)
            }
        }
    }

    private fun initSearch(query: String) {
        item_fragment_champion_id_input.setText(query)

        item_fragment_champion_id_input.setOnEditorActionListener { _, actionId, _ ->
            if (actionId == EditorInfo.IME_ACTION_GO) {
                updateRepoListFromInput()
                true
            } else {
                false
            }
        }
        item_fragment_champion_id_input.setOnKeyListener { _, keyCode, event ->
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
                .collect { item_fragment_recyclerview.scrollToPosition(0) }
        }
    }

    private fun updateRepoListFromInput() {
        item_fragment_champion_id_input.text?.trim().let {
            if (it != null) {
                if (it.isNotEmpty()) {
                    item_fragment_recyclerview.scrollToPosition(0)
                    search(it.toString().toInt())
                }
            }
        }
    }

    companion object {
        private const val LAST_SEARCH_QUERY: String = "last_search_query"
        private const val DEFAULT_QUERY = "-1"
    }
}
