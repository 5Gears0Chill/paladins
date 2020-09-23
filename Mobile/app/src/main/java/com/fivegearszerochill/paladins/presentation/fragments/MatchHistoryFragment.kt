package com.fivegearszerochill.paladins.presentation.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.util.empty
import com.fivegearszerochill.paladins.presentation.adapters.MatchHistoryAdapter
import com.fivegearszerochill.paladins.presentation.viewmodels.PlayerViewModel
import kotlinx.android.synthetic.main.fragment_match_history.*

class MatchHistoryFragment : Fragment() {
    private lateinit var playerViewModel: PlayerViewModel
    private val adapter = MatchHistoryAdapter()
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
        playerViewModel = ViewModelProvider(this).get(PlayerViewModel::class.java)
        playerViewModel.matchHistory.observe(viewLifecycleOwner, {
            it.data?.matchHistories?.let { matches ->
                run {
                    adapter.addAll(matches)
                    adapter.notifyDataSetChanged()
                }
            }
        })
        search(playerName)
    }

    private fun search(playerName: String) {
        playerViewModel.setPlayerRequest(playerName)
    }
    private fun initAdapter(){
        fragment_match_history_recycler_view.adapter = adapter
        fragment_match_history_recycler_view.layoutManager = LinearLayoutManager(activity)
    }
}