package com.fivegearszerochill.paladins.presentation.activities

import android.annotation.SuppressLint
import android.app.SearchManager
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.content.res.AppCompatResources
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.constants.Units
import com.fivegearszerochill.paladins.domain.models.match.MatchDetailsModel
import com.fivegearszerochill.paladins.domain.util.appendUnit
import com.fivegearszerochill.paladins.domain.util.empty
import com.fivegearszerochill.paladins.domain.util.isNumeric
import com.fivegearszerochill.paladins.domain.util.removeWhiteSpaces
import com.fivegearszerochill.paladins.presentation.adapters.PlayerMatchStatsAdapter
import com.fivegearszerochill.paladins.presentation.viewmodels.NonLinkedMatchViewModel
import com.google.android.material.snackbar.Snackbar
import kotlinx.android.synthetic.main.activity_search.*

class SearchActivity : AppCompatActivity() {
    private lateinit var matchViewModel: NonLinkedMatchViewModel
    private val adapter = PlayerMatchStatsAdapter()
    private var query: String = String.empty()

    //TODO: CREATE WAY TO INTERCHANGE LAYOUT BASED ON INACTIVE
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_search)
        initAdapter()
        matchViewModel = ViewModelProvider(this).get(NonLinkedMatchViewModel::class.java)
        val intent = intent
        if (Intent.ACTION_SEARCH == intent.action) {
            query = intent.getStringExtra(SearchManager.QUERY).toString()
            query = query.removeWhiteSpaces()
            if (query.isNumeric()) {
                handleObservable()
            } else {
                Toast.makeText(this, "Not a valid Match ID", Toast.LENGTH_LONG).show()
            }
        }
    }

    private fun handleObservable() {
        matchViewModel.matchDetails.observe(this, {
            val isValid = it?.validationResults?.isValid
            if (isValid != null) {
                if (isValid) {
                    setOverallInformation(it.data?.firstOrNull())
                    it.data?.let { matchDetails ->
                        run {
                            adapter.addAll(matchDetails)
                            adapter.notifyDataSetChanged()
                        }
                    }
                } else {
                    it.validationResults.errorMessages?.forEach { str ->
                        val snack = Snackbar.make(root_layout, str, Snackbar.LENGTH_LONG)
                        snack.setAction("OK") {
                           snack.dismiss()
                        }
                        snack.show()
                    }
                }
            }
        })
        initObservable(query)
    }

    @SuppressLint("SetTextI18n")
    private fun setOverallInformation(model: MatchDetailsModel?) {
        match_id.text = model?.paladinsMatchID.toString()
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
                    team_two_score.chipBackgroundColor = this.let {
                        AppCompatResources.getColorStateList(
                            it, R.color.red
                        )
                    }
                    team_one_score.chipBackgroundColor = this.let {
                        AppCompatResources.getColorStateList(
                            it, R.color.green
                        )
                    }
                }
                else -> {
                    team_two_score.chipBackgroundColor = this.let {
                        AppCompatResources.getColorStateList(
                            it, R.color.green
                        )
                    }
                    team_one_score.chipBackgroundColor = this.let {
                        AppCompatResources.getColorStateList(
                            it, R.color.red
                        )
                    }
                }
            }
        }
    }

    private fun initObservable(matchId: String) {
        matchViewModel.setMatchDetailsRequest(matchId)
    }

    private fun initAdapter() {
        player_stats_rv.adapter = adapter
        player_stats_rv.layoutManager =
            LinearLayoutManager(this, RecyclerView.HORIZONTAL, false)
    }
}