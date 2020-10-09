package com.fivegearszerochill.paladins.presentation.fragments

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.LinearLayout
import android.widget.Toast
import androidx.fragment.app.viewModels
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.lifecycleScope
import androidx.navigation.NavController
import androidx.navigation.Navigation
import androidx.recyclerview.widget.LinearLayoutManager
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.presentation.adapters.ChampionAdapter
import com.fivegearszerochill.paladins.presentation.adapters.ReposLoadStateAdapter
import com.fivegearszerochill.paladins.presentation.viewmodels.ChampionViewModel
import kotlinx.android.synthetic.main.fragment_champion.*
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch
import java.time.Duration

class ChampionFragment : Fragment() {

    private lateinit var viewModel: ChampionViewModel
    private val adapter = ChampionAdapter(ChampionAdapter.ChampionModelComparator)
    private var searchJob: Job? = null

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_champion, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        initAdapter()
        viewModel = ViewModelProvider(this).get(ChampionViewModel::class.java)

        search()
    }

    private fun initAdapter(){
        champion_fragment_recyclerview.layoutManager = LinearLayoutManager(activity)
        champion_fragment_recyclerview.adapter = adapter.withLoadStateHeaderAndFooter(
            header = ReposLoadStateAdapter { adapter.retry() },
            footer = ReposLoadStateAdapter { adapter.retry() }
        )
    }
    private fun search() {
        // Make sure we cancel the previous job before creating a new one
        searchJob?.cancel()
        searchJob = lifecycleScope.launch {
            viewModel.searchRepo().collect {
                adapter.submitData(it)
            }
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        searchJob?.cancel()
    }
}