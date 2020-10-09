package com.fivegearszerochill.paladins.domain.models.match

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

data class MatchDetailsModel (
    @Expose
    @SerializedName("id")
    val id: Long,
    @Expose
    @SerializedName("paladinsMatchId")
    val paladinsMatchID: Long,
    @Expose
    @SerializedName("paladinsQueueId")
    val paladinsQueueID: Long,
    @Expose
    @SerializedName("paladinsPlayerId")
    val paladinsPlayerID: Long,
    @Expose
    @SerializedName("mapName")
    val mapName: String,
    @Expose
    @SerializedName("playerName")
    val playerName: String,
    @Expose
    @SerializedName("playerAccountLevel")
    val playerAccountLevel: Long,
    @Expose
    @SerializedName("mapGameType")
    val mapGameType: String,
    @Expose
    @SerializedName("hasReplay")
    val hasReplay: String,
    @Expose
    @SerializedName("length")
    val length: Long,
    @Expose
    @SerializedName("lengthInMinutes")
    val lengthInMinutes: Long,
    @Expose
    @SerializedName("winStatus")
    val winStatus: String,
    @Expose
    @SerializedName("region")
    val region: String,
    @Expose
    @SerializedName("teamOneScore")
    val teamOneScore: Long,
    @Expose
    @SerializedName("teamTwoScore")
    val teamTwoScore: Long,
    @Expose
    @SerializedName("paladinsChampionID")
    val paladinsChampionID: Long,
    @Expose
    @SerializedName("championName")
    val championName: String,
    @Expose
    @SerializedName("championIconUrl")
    val championIconUrl: String,
    @Expose
    @SerializedName("paladinsChampionSkinID")
    val paladinsChampionSkinID: Long,
    @Expose
    @SerializedName("selfHealing")
    val selfHealing: Long,
    @Expose
    @SerializedName("goldEarnedPerMinute")
    val goldEarnedPerMinute: Long,
    @Expose
    @SerializedName("goldEarnedTotal")
    val goldEarnedTotal: Long,
    @Expose
    @SerializedName("healingDone")
    val healingDone: Long,
    @Expose
    @SerializedName("damageDoneInHand")
    val damageDoneInHand: Long,
    @Expose
    @SerializedName("damageTaken")
    val damageTaken: Long,
    @Expose
    @SerializedName("damageMitigated")
    val damageMitigated: Long,
    @Expose
    @SerializedName("assists")
    val assists: Long,
    @Expose
    @SerializedName("objectiveAssists")
    val objectiveAssists: Long,
    @Expose
    @SerializedName("deaths")
    val deaths: Long,
    @Expose
    @SerializedName("kills")
    val kills: Long,
    @Expose
    @SerializedName("killingSpree")
    val killingSpree: Long,
    @Expose
    @SerializedName("killsDouble")
    val killsDouble: Long,
    @Expose
    @SerializedName("killsTriple")
    val killsTriple: Long,
    @Expose
    @SerializedName("killsQuadra")
    val killsQuadra: Long,
    @Expose
    @SerializedName("killsPenta")
    val killsPenta: Long,
    @Expose
    @SerializedName("multiKillMax")
    val multiKillMax: Long,
    @Expose
    @SerializedName("leagueLosses")
    val leagueLosses: Long,
    @Expose
    @SerializedName("leagueWins")
    val leagueWINS: Long,
    @Expose
    @SerializedName("leagueTier")
    val leagueTier: Long,
    @Expose
    @SerializedName("leaguePoints")
    val leaguePoints: Long,
    @Expose
    @SerializedName("matchBans")
    val matchBans: List<MatchBanModel>,
    @Expose
    @SerializedName("itemsBought")
    val itemsBought: List<ItemsBoughtModel>,
    @Expose
    @SerializedName("loadoutSelected")
    val loadoutSelected: List<LoadoutSelectedModel>
)

