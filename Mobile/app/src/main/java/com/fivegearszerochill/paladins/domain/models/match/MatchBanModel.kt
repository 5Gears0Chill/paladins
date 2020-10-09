package com.fivegearszerochill.paladins.domain.models.match

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

data class MatchBanModel (
    @Expose
    @SerializedName("paladinsMatchId")
    val paladinsMatchID: Long,
    @Expose
    @SerializedName("banPosition")
    val banPosition: Long,
    @Expose
    @SerializedName("paladinsChampionId")
    val paladinsChampionID: Long,
    @Expose
    @SerializedName("championName")
    val championName: String,
    @Expose
    @SerializedName("championIconUrl")
    val championIconUrl: String
)



