package com.fivegearszerochill.paladins.presentation.fragments

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.util.empty
import com.fivegearszerochill.paladins.presentation.adapters.FriendsAdapter
import com.fivegearszerochill.paladins.presentation.viewmodels.PlayerViewModel
import kotlinx.android.synthetic.main.fragment_friends.*

class FriendsFragment : Fragment() {

    lateinit var playerViewModel: PlayerViewModel
    private val adapter = FriendsAdapter()
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
        initAdapter()
        playerViewModel = ViewModelProvider(this).get(PlayerViewModel::class.java)
        playerViewModel.friends.observe(viewLifecycleOwner, {
            it.data?.friends?.let { friends ->
                run {
                    adapter.addAll(friends)
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
        fragment_friend_recycler_view.adapter = adapter
        fragment_friend_recycler_view.layoutManager = LinearLayoutManager(activity)
    }
}