package com.fivegearszerochill.paladins.domain.models.initial

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

data class ItemModel(
    @Expose
    @SerializedName("id")
    val id: Long,
    @Expose
    @SerializedName("paladinsItemId")
    val paladinsItemID: Long,
    @Expose
    @SerializedName("description")
    val description: String,
    @Expose
    @SerializedName("shortDescription")
    val shortDescription: String,
    @Expose
    @SerializedName("deviceName")
    val deviceName: String,
    @Expose
    @SerializedName("paladinsChampionId")
    val paladinsChampionID: Long,
    @Expose
    @SerializedName("itemIconUrl")
    val itemIconURL: String,
    @Expose
    @SerializedName("price")
    val price: Long,
    @Expose
    @SerializedName("itemType")
    val itemType: String
)