package com.fivegearszerochill.paladins.domain.models.initial

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

data class ChampionAbilityModel(
    @Expose
    @SerializedName("description")
    val description: String,
    @Expose
    @SerializedName("paladinsAbilityId")
    val paladinsAbilityID: Long,
    @Expose
    @SerializedName("name")
    val name: String,
    @Expose
    @SerializedName("url")
    val url: String
)