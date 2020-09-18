package com.fivegearszerochill.paladins.domain.models.player

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName
import java.util.*

data class ChampionStatModel(
    @Expose
    @SerializedName("id")
    val id: Long? = null,
    @Expose
    @SerializedName("playerId")
    val playerID: Long? = null,
    @Expose
    @SerializedName("paladinsChampionId")
    val paladinsChampionID: Long? = null,
    @Expose
    @SerializedName("assists")
    val assists: Long? = null,
    @Expose
    @SerializedName("deaths")
    val deaths: Long? = null,
    @Expose
    @SerializedName("kills")
    val kills: Long? = null,
    @Expose
    @SerializedName("rank")
    val rank: Long? = null,
    @Expose
    @SerializedName("wins")
    val wins: Long? = null,
    @Expose
    @SerializedName("losses")
    val losses: Long? = null,
    @Expose
    @SerializedName("lastUpdatedOn")
    val lastUpdatedOn: Date? = null,
    @Expose
    @SerializedName("createdOn")
    val createdOn: Date? = null
){
    override fun toString(): String {
        return "ChampionStatModel(id=$id, playerID=$playerID, paladinsChampionID=$paladinsChampionID, assists=$assists, deaths=$deaths, kills=$kills, rank=$rank, wins=$wins, losses=$losses, lastUpdatedOn=$lastUpdatedOn, createdOn=$createdOn)"
    }
}