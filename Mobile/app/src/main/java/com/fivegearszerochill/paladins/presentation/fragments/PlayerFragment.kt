package com.fivegearszerochill.paladins.presentation.fragments

import android.annotation.SuppressLint
import android.os.Bundle
import android.view.KeyEvent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.inputmethod.EditorInfo
import androidx.core.os.bundleOf
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.navigation.NavController
import androidx.navigation.Navigation
import com.bumptech.glide.Glide
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.models.ResponseModel
import com.fivegearszerochill.paladins.domain.models.player.PlayerModel
import com.fivegearszerochill.paladins.domain.util.empty
import com.fivegearszerochill.paladins.domain.util.toHours
import com.fivegearszerochill.paladins.domain.util.toMinutes
import com.fivegearszerochill.paladins.presentation.viewmodels.PlayerViewModel
import kotlinx.android.synthetic.main.fragment_player.*


class PlayerFragment : Fragment(), View.OnClickListener {
    private lateinit var playerViewModel: PlayerViewModel
    private lateinit var navController: NavController

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_player, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setOnClickListeners()
        navController = Navigation.findNavController(view)
        playerViewModel = ViewModelProvider(this).get(PlayerViewModel::class.java)
        playerViewModel.player.observe(viewLifecycleOwner, {
            setPlayerInformation(it)
        })
        val query = savedInstanceState?.getString(LAST_SEARCH_QUERY) ?: DEFAULT_QUERY
        search(query)
        initSearch(query)
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString(LAST_SEARCH_QUERY, player_name_input.text?.trim().toString())
    }

    override fun onDestroy() {
        super.onDestroy()
        playerViewModel.cancelJobs()
    }

    private fun search(playerName: String) {
        playerViewModel.setPlayerRequest(playerName)
    }

    private fun initSearch(query: String) {
        player_name_input.setText(query)

        player_name_input.setOnEditorActionListener { _, actionId, _ ->
            if (actionId == EditorInfo.IME_ACTION_GO) {
                updateRepoListFromInput()
                true
            } else {
                false
            }
        }
        player_name_input.setOnKeyListener { _, keyCode, event ->
            if (event.action == KeyEvent.ACTION_DOWN && keyCode == KeyEvent.KEYCODE_ENTER) {
                updateRepoListFromInput()
                true
            } else {
                false
            }
        }
    }

    private fun updateRepoListFromInput() {
        player_name_input.text?.trim().let {
            if (it != null) {
                if (it.isNotEmpty()) {
                    search(it.toString())
                }
            }
        }
    }

    @SuppressLint("SetTextI18n")
    private fun setPlayerInformation(player: ResponseModel<PlayerModel>?) {
        name.text = player?.data?.name ?: String.empty()
        Glide.with(this)
            .load(player?.data?.avatarURL)
            .centerCrop()
            .into(player_image)
        minutes_played.text = """${
            player?.data?.hoursPlayed.toString().toHours()
        } ${player?.data?.minutesPlayed.toString().toMinutes()}"""
        wins.text = "${player?.data?.totalWINS} wins / ${player?.data?.totalLeaves} Leaves"
        total_worshipers.text = """${player?.data?.totalWorshippers.toString()} Worshippers"""
        total_xp.text = """${player?.data?.totalXP.toString()} XP"""
        account_level.text = """Account Level: ${player?.data?.accountLevel.toString()}"""
    }

    private fun setOnClickListeners() {
        view_friends.setOnClickListener(this)
        view_match_history.setOnClickListener(this)
        view_loadouts.setOnClickListener(this)
    }

    companion object {
        private const val LAST_SEARCH_QUERY: String = "last_search_query"
        private const val DEFAULT_QUERY = "muaazjoosuf"
    }

    override fun onClick(v: View?) {
        when (v!!.id) {
            R.id.view_friends -> {
                if (name.text.isNotEmpty()) {
                    val bundle = bundleOf("playerName" to name.text.toString())
                    navController.navigate(
                        R.id.action_playerFragment_to_friendsFragment,
                        bundle
                    )
                }
            }
            R.id.view_match_history -> {
                if (name.text.isNotEmpty()) {
                    val bundle = bundleOf("playerName" to name.text.toString())
                    navController.navigate(
                        R.id.action_playerFragment_to_matchHistoryFragment,
                        bundle
                    )
                }
            }
            R.id.view_loadouts -> {
                if (name.text.isNotEmpty()) {
                    val bundle = bundleOf("playerName" to name.text.toString())
                    navController.navigate(
                        R.id.action_playerFragment_to_loadoutFragment,
                        bundle
                    )
                }
            }
        }
    }
}
