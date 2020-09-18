package com.fivegearszerochill.paladins.domain.models.player

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

data class RankDetailsModel (
    @Expose
    @SerializedName("rankedName")
    val rankedName: String? = null,
    @Expose
    @SerializedName("leaves")
    val leaves: Long? = null,
    @Expose
    @SerializedName("losses")
    val losses: Long? = null,
    @Expose
    @SerializedName("points")
    val points: Long? = null,
    @Expose
    @SerializedName("previousRank")
    val previousRank: Long? = null,
    @Expose
    @SerializedName("rank")
    val rank: Long? = null,
    @Expose
    @SerializedName("season")
    val season: Long? = null,
    @Expose
    @SerializedName("tier")
    val tier: Long? = null,
    @Expose
    @SerializedName("trend")
    val trend: Long? = null,
    @Expose
    @SerializedName("wins")
    val wins: Long? = null
){
    override fun toString(): String {
        return "RankDetailsModel(rankedName=$rankedName, leaves=$leaves, losses=$losses, points=$points, previousRank=$previousRank, rank=$rank, season=$season, tier=$tier, trend=$trend, wins=$wins)"
    }
}