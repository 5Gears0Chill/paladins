package com.fivegearszerochill.paladins.domain.models.player

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName
import java.util.*

data class LoadoutModel (
    @Expose
    @SerializedName("id")
    val id: Long? = null,
    @Expose
    @SerializedName("paladinsChampionId")
    val paladinsChampionID: Long? = null,
    @Expose
    @SerializedName("loadoutName")
    val loadoutName: String? = null,
    @Expose
    @SerializedName("paladinsLoadoutId")
    val paladinsLoadoutID: Long? = null,
    @Expose
    @SerializedName("paladinsPlayerId")
    val paladinsPlayerID: Long? = null,
    @Expose
    @SerializedName("playerName")
    val playerName: String? = null,
    @Expose
    @SerializedName("createdOn")
    val createdOn: Date? = null,
    @Expose
    @SerializedName("lastUpdatedOn")
    val lastUpdatedOn: Date? = null,
    @Expose
    @SerializedName("loadoutItems")
    val loadoutItems: List<LoadoutItemModel>? = null
){
    override fun toString(): String {
        return "LoadoutModel(id=$id, paladinsChampionID=$paladinsChampionID, loadoutName=$loadoutName, paladinsLoadoutID=$paladinsLoadoutID, paladinsPlayerID=$paladinsPlayerID, playerName=$playerName, createdOn=$createdOn, lastUpdatedOn=$lastUpdatedOn, loadoutItems=$loadoutItems)"
    }
}