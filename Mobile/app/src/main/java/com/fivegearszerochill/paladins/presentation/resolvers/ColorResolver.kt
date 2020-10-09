package com.fivegearszerochill.paladins.presentation.resolvers

import androidx.annotation.ColorRes
import com.fivegearszerochill.paladins.R

object ColorResolver{
    fun determinePlayerAccountLevelColor(accountLevel: Long?): Int{
        return when(accountLevel?.toInt()){
            in 1..100 -> R.color.AliceBlue
            in 101..200 -> R.color.Aqua
            in 201..300 -> R.color.MediumAquamarine
            in 301..400 -> R.color.MediumBlue
            in 401..500 -> R.color.DodgerBlue
            else -> R.color.PaleTurquoise
        }
    }

    fun determinePlayerHealingLevelColor(selfHealing: Long?): Int{
        return when(selfHealing?.toInt()){
            in 1..10000 -> R.color.LightSeaGreen
            in 10001..30000 -> R.color.Lime
            in 30001..70000 -> R.color.MediumAquamarine
            in 70001..100000 -> R.color.MediumSpringGreen
            in 100001..200000 -> R.color.PaleGreen
            else -> R.color.SpringGreen
        }
    }
}