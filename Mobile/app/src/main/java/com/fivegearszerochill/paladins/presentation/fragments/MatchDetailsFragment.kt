package com.fivegearszerochill.paladins.presentation.fragments

import android.annotation.SuppressLint
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.content.res.AppCompatResources
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.constants.Units
import com.fivegearszerochill.paladins.domain.models.match.MatchDetailsModel
import com.fivegearszerochill.paladins.domain.util.appendUnit
import com.fivegearszerochill.paladins.domain.util.empty
import com.fivegearszerochill.paladins.presentation.adapters.PlayerMatchStatsAdapter
import com.fivegearszerochill.paladins.presentation.viewmodels.MatchViewModel
import kotlinx.android.synthetic.main.fragment_match_details.*

 class MatchDetailsFragment : Fragment() {
    private lateinit var matchViewModel: MatchViewModel
    private val adapter = PlayerMatchStatsAdapter()
    private lateinit var matchId: String
    private var playerMatchHistoryId: Int = 0
    private lateinit var playerName: String

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        matchId = requireArguments().getString("matchId") ?: String.empty()
        playerName = requireArguments().getString("playerName") ?: String.empty()
        playerMatchHistoryId = requireArguments().getInt("playerMatchHistoryId")
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_match_details, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        initAdapter()
        matchViewModel = ViewModelProvider(this).get(MatchViewModel::class.java)
        matchViewModel.matchDetails.observe(viewLifecycleOwner, {
            setOverallInformation(it.data?.find { match -> playerName == match.playerName })
            it.data?.let { matchDetails ->
                run {
                    adapter.addAll(matchDetails)
                    adapter.notifyDataSetChanged()
                }
            }
        })
        initObservable(matchId, playerMatchHistoryId)
    }

    @SuppressLint("SetTextI18n")
    private fun setOverallInformation(model: MatchDetailsModel?) {
        match_id.text = matchId
        win_status.text = model?.winStatus
        match_game_type.text = "${model?.mapName} ${model?.mapGameType}"
        when (model?.hasReplay) {
            "n" -> has_replay.text = "No Replay"
            "y" -> has_replay.text = "Replay Available"
        }
        length_in_minutes.text = model?.lengthInMinutes.toString().appendUnit(
            Units.minutes
        )
        team_one_score.text = model?.teamOneScore.toString().appendUnit(
            Units.teamOne
        )
        team_two_score.text = model?.teamTwoScore.toString().appendUnit(
            Units.teamTwo
        )
        if (model != null) {
            when {
                model.teamOneScore.toInt() > model.teamTwoScore.toInt() -> {
                    team_two_score.chipBackgroundColor = context?.let {
                        AppCompatResources.getColorStateList(
                            it, R.color.red
                        )
                    }
                    team_one_score.chipBackgroundColor = context?.let {
                        AppCompatResources.getColorStateList(
                            it, R.color.green
                        )
                    }
                }
                else -> {
                    team_two_score.chipBackgroundColor = context?.let {
                        AppCompatResources.getColorStateList(
                            it, R.color.green
                        )
                    }
                    team_one_score.chipBackgroundColor = context?.let {
                        AppCompatResources.getColorStateList(
                            it, R.color.red
                        )
                    }
                }
            }
        }
    }

    private fun initObservable(matchId: String, playerMatchHistoryId: Int) {
        matchViewModel.setMatchDetailsRequest(matchId, playerMatchHistoryId)
    }

    private fun initAdapter() {
        player_stats_rv.adapter = adapter
        player_stats_rv.layoutManager =
            LinearLayoutManager(activity, RecyclerView.HORIZONTAL, false)
    }
}