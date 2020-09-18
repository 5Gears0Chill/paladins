package com.fivegearszerochill.paladins.data.api

import com.fivegearszerochill.paladins.domain.models.player.PlayerModel
import com.fivegearszerochill.paladins.domain.models.ResponseModel
import com.fivegearszerochill.paladins.domain.requests.PlayerBaseRequest
import com.fivegearszerochill.paladins.domain.requests.PlayerLoadoutRequest
import retrofit2.http.Body
import retrofit2.http.POST

interface PlayerService {
    @POST("Player/GetPlayer")
    suspend fun getPlayer(@Body request: PlayerBaseRequest) : ResponseModel<PlayerModel>

    @POST("Player/GetFriends")
    suspend fun getFriends(@Body request: PlayerBaseRequest) : ResponseModel<PlayerModel>

    @POST("Player/GetChampionRanks")
    suspend fun getChampionRanks(@Body request: PlayerBaseRequest) : ResponseModel<PlayerModel>

    @POST("Player/GetMatchHistory")
    suspend fun getMatchHistory(@Body request: PlayerBaseRequest) : ResponseModel<PlayerModel>

    @POST("Player/GetPlayerLoadouts")
    suspend fun getLoadouts(@Body request: PlayerLoadoutRequest) : ResponseModel<PlayerModel>
}