package com.fivegearszerochill.paladins.domain.models.player

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

data class MatchHistoryModel(
    @Expose
    @SerializedName("id")
    val id: Long? = null,
    @Expose
    @SerializedName("paladinsMatchId")
    val paladinsMatchID: Long? = null,
    @Expose
    @SerializedName("paladinsChampionId")
    val paladinsChampionID: Long? = null,
    @Expose
    @SerializedName("championName")
    val championName: String? = null,
    @Expose
    @SerializedName("kills")
    val kills: Long? = null,
    @Expose
    @SerializedName("deaths")
    val deaths: Long? = null,
    @Expose
    @SerializedName("assists")
    val assists: Long? = null,
    @Expose
    @SerializedName("matchResult")
    val matchResult: String? = null
){
    override fun toString(): String {
        return "MatchHistoryModel(id=$id, paladinsMatchID=$paladinsMatchID, paladinsChampionID=$paladinsChampionID, championName=$championName, kills=$kills, deaths=$deaths, assists=$assists, matchResult=$matchResult)"
    }
}
