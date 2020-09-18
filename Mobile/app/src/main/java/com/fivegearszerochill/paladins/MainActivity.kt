package com.fivegearszerochill.paladins

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import com.fivegearszerochill.paladins.presentation.viewmodels.PlayerViewModel
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class MainActivity : AppCompatActivity() {

    lateinit var playerViewModel: PlayerViewModel
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        playerViewModel = ViewModelProvider(this).get(PlayerViewModel::class.java)

        playerViewModel.player.observe(this, Observer {
            println("DEBUG: $it")

        })

        playerViewModel.setPlayerRequest("muaazjoosuf")
    }

    override fun onDestroy() {
        super.onDestroy()
        playerViewModel.cancelJobs()
    }
}