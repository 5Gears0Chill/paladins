package com.fivegearszerochill.paladins

import android.os.Bundle
import android.view.MenuItem
import androidx.appcompat.app.ActionBarDrawerToggle
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.GravityCompat
import androidx.navigation.NavOptions
import androidx.navigation.findNavController
import com.google.android.material.navigation.NavigationView
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.android.synthetic.main.activity_main.*


@AndroidEntryPoint
class MainActivity : AppCompatActivity(), NavigationView.OnNavigationItemSelectedListener{

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setSupportActionBar(toolbar)
    }

    override fun onStart() {
        super.onStart()
        val drawerToggle = ActionBarDrawerToggle(this, drawer, R.string.open, R.string.close)
        drawer.addDrawerListener(drawerToggle)
        drawerToggle.syncState()
        navigation_component.setNavigationItemSelectedListener(this)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)
    }

    override fun onBackPressed() {
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START)
        } else {
            super.onBackPressed()
        }
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        super.onOptionsItemSelected(item)
        return when (item.itemId) {
            android.R.id.home -> {
                drawer.openDrawer(GravityCompat.START)
                true
            }
            else -> super.onOptionsItemSelected(item)
        }
    }

    override fun onNavigationItemSelected(item: MenuItem): Boolean {
        val navBuilder = NavOptions.Builder()
        navBuilder.setEnterAnim(R.anim.slide_in_right).setExitAnim(R.anim.slide_out_left)
            .setPopEnterAnim(R.anim.slide_in_left).setPopExitAnim(R.anim.slide_out_right)
        when (item.itemId) {
            R.id.nav_player -> {
                findNavController(R.id.nav_host_fragment)
                    .navigate(R.id.playerFragment, null, navBuilder.build())
            }
            R.id.nav_champions -> {
                findNavController(R.id.nav_host_fragment)
                    .navigate(R.id.championFragment,null,navBuilder.build())
            }
            R.id.nav_items -> {
                findNavController(R.id.nav_host_fragment)
                    .navigate(R.id.itemFragment,null,navBuilder.build())
            }
            R.id.nav_maps -> {
                return true
            }
            R.id.nav_home -> {
                findNavController(R.id.nav_host_fragment)
                    .navigate(R.id.fragmentMain,null,navBuilder.build())
            }
            R.id.nav_custom_match -> {
                return true
            }
        }
        drawer.closeDrawer(GravityCompat.START)
        return true
    }

}