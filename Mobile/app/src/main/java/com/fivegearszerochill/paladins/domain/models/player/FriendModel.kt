package com.fivegearszerochill.paladins.domain.models.player

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName
import java.util.*

data class FriendModel(
    @Expose
    @SerializedName("id")
    val id: Long? = null,
    @Expose
    @SerializedName("name")
    val name: String? = null,
    @Expose
    @SerializedName("paladinsPlayerId")
    val paladinsPlayerID: Long? = null,
    @Expose
    @SerializedName("accountId")
    val accountID: Long? = null,
    @Expose
    @SerializedName("lastUpdatedOn")
    val lastUpdatedOn: Date? = null,
    @Expose
    @SerializedName("createdOn")
    val createdOn: Date? = null
){
    override fun toString(): String {
        return "FriendModel(id=$id, name=$name, paladinsPlayerID=$paladinsPlayerID, accountID=$accountID, lastUpdatedOn=$lastUpdatedOn, createdOn=$createdOn)"
    }
}