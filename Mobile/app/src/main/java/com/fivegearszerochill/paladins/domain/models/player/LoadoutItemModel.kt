package com.fivegearszerochill.paladins.domain.models.player

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

data class LoadoutItemModel (
    @Expose
    @SerializedName("id")
    val id: Long? = null,
    @Expose
    @SerializedName("paladinsItemId")
    val paladinsItemID: Long? = null,
    @Expose
    @SerializedName("pointsAssignedToItem")
    val pointsAssignedToItem: Long? = null,
    @Expose
    @SerializedName("cardName")
    val cardName: String? = null
){
    override fun toString(): String {
        return "LoadoutItemModel(id=$id, paladinsItemID=$paladinsItemID, pointsAssignedToItem=$pointsAssignedToItem, cardName=$cardName)"
    }
}