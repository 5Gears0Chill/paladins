package com.fivegearszerochill.paladins

import android.Manifest
import android.app.SearchManager
import android.content.ComponentName
import android.content.Context
import android.content.pm.PackageManager
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import androidx.annotation.NonNull
import androidx.appcompat.app.ActionBarDrawerToggle
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.SearchView
import androidx.core.app.ActivityCompat
import androidx.core.view.GravityCompat
import androidx.navigation.NavOptions
import androidx.navigation.findNavController
import com.fivegearszerochill.paladins.domain.constants.PackNames
import com.fivegearszerochill.paladins.presentation.fragments.CameraBottomSheetFragment
import com.google.android.material.bottomsheet.BottomSheetDialog
import com.google.android.material.navigation.NavigationView
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.android.synthetic.main.activity_main.*


@AndroidEntryPoint
class MainActivity : AppCompatActivity(), NavigationView.OnNavigationItemSelectedListener {
    companion object {
        const val RC_HANDLE_CAMERA_PERM = 2
    }

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
                    .navigate(R.id.championFragment, null, navBuilder.build())
            }
            R.id.nav_items -> {
                findNavController(R.id.nav_host_fragment)
                    .navigate(R.id.itemFragment, null, navBuilder.build())
            }
            R.id.nav_maps -> {
                return true
            }
            R.id.nav_home -> {
                findNavController(R.id.nav_host_fragment)
                    .navigate(R.id.fragmentMain, null, navBuilder.build())
            }
            R.id.nav_custom_match -> {
                return true
            }
        }
        drawer.closeDrawer(GravityCompat.START)
        return true
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        val inflater = menuInflater
        inflater.inflate(R.menu.search_menu, menu)

        val searchManager = getSystemService(Context.SEARCH_SERVICE) as SearchManager
        (menu.findItem(R.id.action_search).actionView as SearchView).apply {
            setSearchableInfo(
                searchManager.getSearchableInfo(
                    ComponentName(
                        this@MainActivity,
                        PackNames.SEARCH_ACTIVITY
                    )
                )
            )
        }
        menu.findItem(R.id.action_search_image).setOnMenuItemClickListener {
            val value: Any = if (ActivityCompat.checkSelfPermission(
                    this,
                    Manifest.permission.CAMERA
                ) == PackageManager.PERMISSION_GRANTED
            ) {
                initCameraModal()
                true
            } else {
                askCameraPermission()
            }

            false
        }
        return true
    }


    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        if (requestCode != RC_HANDLE_CAMERA_PERM) {
            super.onRequestPermissionsResult(requestCode, permissions, grantResults)
            return
        }
        if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
            initCameraModal()
            return
        }
    }

    private fun askCameraPermission() {
        val permissions = arrayOf(Manifest.permission.CAMERA)
        if (!ActivityCompat.shouldShowRequestPermissionRationale(
                this,
                Manifest.permission.CAMERA
            )
        ) {
            ActivityCompat.requestPermissions(this, permissions, RC_HANDLE_CAMERA_PERM)
            return
        }
    }

    private fun initCameraModal(){
//        val modalSheetView = layoutInflater.inflate(
//            R.layout.fragment_modal_camera_bottom_sheet,
//            null
//        )
//        val dialog = BottomSheetDialog(this)
//        dialog.setContentView(modalSheetView)
//        dialog.show()
        val dialog = CameraBottomSheetFragment.newInstance()
        dialog?.show(supportFragmentManager, dialog.tag)
    }
}