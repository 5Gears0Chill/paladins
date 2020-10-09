package com.fivegearszerochill.paladins.domain.models.match

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

data class ItemsBoughtModel (
    @Expose
    @SerializedName("paladinsItemId")
    val paladinsItemID: Long,
    @Expose
    @SerializedName("itemName")
    val itemName: String,
    @Expose
    @SerializedName("itemLevel")
    val itemLevel: Long,
    @Expose
    @SerializedName("itemOrder")
    val itemOrder: Long
)