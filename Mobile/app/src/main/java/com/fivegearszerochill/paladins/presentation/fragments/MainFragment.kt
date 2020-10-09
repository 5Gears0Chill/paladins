package com.fivegearszerochill.paladins.presentation.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.navigation.NavController
import androidx.navigation.Navigation
import com.fivegearszerochill.paladins.R
import kotlinx.android.synthetic.main.fragment_main.*

class FragmentMain : Fragment() {

    private lateinit var navController: NavController
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_main, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        navController = Navigation.findNavController(view)
        champion_button.setOnClickListener {
            navController.navigate(R.id.action_fragmentMain_to_championFragment)
        }
        item_button.setOnClickListener {
            navController.navigate(R.id.action_fragmentMain_to_itemFragment)
        }
        player_button.setOnClickListener{
           navController.navigate(R.id.action_fragmentMain_to_playerFragment)
        }
    }
}