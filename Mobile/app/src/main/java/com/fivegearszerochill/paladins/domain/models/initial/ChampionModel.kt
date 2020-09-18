package com.fivegearszerochill.paladins.domain.models.initial

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

data class ChampionModel (
    @Expose
    @SerializedName("id")
    val id: Long,
    @Expose
    @SerializedName("paladinsChampionId")
    val paladinsChampionID: Long,
    @Expose
    @SerializedName("latestChampion")
    val latestChampion: String,
    @Expose
    @SerializedName("role")
    val role: String,
    @Expose
    @SerializedName("speed")
    val speed: Long,
    @Expose
    @SerializedName("title")
    val title: String,
    @Expose
    @SerializedName("name")
    val name: String,
    @Expose
    @SerializedName("lore")
    val lore: String,
    @Expose
    @SerializedName("health")
    val health: Long,
    @Expose
    @SerializedName("championIconUrl")
    val championIconURL: String,
    @Expose
    @SerializedName("abilities")
    val abilities: List<ChampionAbilityModel>
)