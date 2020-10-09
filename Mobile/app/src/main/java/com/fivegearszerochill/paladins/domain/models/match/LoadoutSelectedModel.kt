package com.fivegearszerochill.paladins.domain.models.match

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

data class LoadoutSelectedModel (
    @Expose
    @SerializedName("paladinsMatchId")
    val paladinsMatchID: Long,
    @Expose
    @SerializedName("paladinsPlayerId")
    val paladinsPlayerID: Long,
    @Expose
    @SerializedName("paladinsItemId")
    val paladinsItemID: Long,
    @Expose
    @SerializedName("loadoutItemLevel")
    val loadoutItemLevel: Long,
    @Expose
    @SerializedName("loadoutItemName")
    val loadoutItemName: String
)
