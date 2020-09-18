package com.fivegearszerochill.paladins.domain.models.player

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName
import java.util.*

data class PlayerModel(
    @Expose
    @SerializedName("playerId")
    val playerID: Long? = null,

    @Expose
    @SerializedName("paladinsPlayerId")
    val paladinsPlayerID: Long? = null,
    @Expose
    @SerializedName("name")
    val name: String? = null,

    @Expose
    @SerializedName("avatarUrl")
    val avatarURL: String? = null,

    @Expose
    @SerializedName("avatarId")
    val avatarID: Long? = null,
    @Expose
    @SerializedName("minutesPlayed")
    val minutesPlayed: Long? = null,
    @Expose
    @SerializedName("hoursPlayed")
    val hoursPlayed: Long? = null,
    @Expose
    @SerializedName("totalLeaves")
    val totalLeaves: Long? = null,
    @Expose
    @SerializedName("controllerTier")
    val controllerTier: Long? = null,
    @Expose
    @SerializedName("kbmTier")
    val kbmTier: Long? = null,
    @Expose
    @SerializedName("conquestTier")
    val conquestTier: Long? = null,
    @Expose
    @SerializedName("totalWorshippers")
    val totalWorshippers: Long? = null,
    @Expose
    @SerializedName("totalXP")
    val totalXP: Long? = null,
    @Expose
    @SerializedName("totalWins")
    val totalWINS: Long? = null,
    @Expose
    @SerializedName("lastLoginTimeStamp")
    val lastLoginTimeStamp: Date? = null,
    @Expose
    @SerializedName("accountCreatedOnTimeStamp")
    val accountCreatedOnTimeStamp: Date? = null,
    @Expose
    @SerializedName("accountLevel")
    val accountLevel: Long? = null,
    @Expose
    @SerializedName("loadingFrame")
    val loadingFrame: String? = null,
    @Expose
    @SerializedName("masteryLevel")
    val masteryLevel: Long? = null,
    @Expose
    @SerializedName("personalStatusMessage")
    val personalStatusMessage: String? = null,
    @Expose
    @SerializedName("createdOn")
    val createdOn: Date? = null,
    @Expose
    @SerializedName("lastUpdatedOn")
    val lastUpdatedOn: Date? = null,
    @Expose
    @SerializedName("isActive")
    val isActive: Boolean? = null,
    @Expose
    @SerializedName("rankDetailsModel")
    val rankDetailsModel: List<RankDetailsModel>? = null,
    @Expose
    @SerializedName("friends")
    val friends: List<FriendModel>? = null,
    @Expose
    @SerializedName("championStats")
    val championStats: List<ChampionStatModel>? = null,
    @Expose
    @SerializedName("loadouts")
    val loadouts: List<LoadoutModel>? = null,
    @Expose
    @SerializedName("matchHistories")
    val matchHistories: List<MatchHistoryModel>? = null
){
    override fun toString(): String {
        return "PlayerModel(playerID=$playerID, paladinsPlayerID=$paladinsPlayerID, name=$name, avatarURL=$avatarURL, avatarID=$avatarID, minutesPlayed=$minutesPlayed, hoursPlayed=$hoursPlayed, totalLeaves=$totalLeaves, controllerTier=$controllerTier, kbmTier=$kbmTier, conquestTier=$conquestTier, totalWorshippers=$totalWorshippers, totalXP=$totalXP, totalWINS=$totalWINS, lastLoginTimeStamp=$lastLoginTimeStamp, accountCreatedOnTimeStamp=$accountCreatedOnTimeStamp, accountLevel=$accountLevel, loadingFrame=$loadingFrame, masteryLevel=$masteryLevel, personalStatusMessage=$personalStatusMessage, createdOn=$createdOn, lastUpdatedOn=$lastUpdatedOn, isActive=$isActive, rankDetailsModel=$rankDetailsModel, friends=$friends, championStats=$championStats, loadouts=$loadouts, matchHistories=$matchHistories)"
    }
}

