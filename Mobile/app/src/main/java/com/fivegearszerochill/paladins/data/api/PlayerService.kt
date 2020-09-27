package com.fivegearszerochill.paladins.data.api

import com.fivegearszerochill.paladins.domain.models.PagedResponseModel
import com.fivegearszerochill.paladins.domain.models.ResponseModel
import com.fivegearszerochill.paladins.domain.models.player.*
import com.fivegearszerochill.paladins.domain.requests.PlayerBaseRequest
import com.fivegearszerochill.paladins.domain.requests.PlayerPagedRequest
import retrofit2.http.Body
import retrofit2.http.POST

interface PlayerService {
    @POST("Player/GetPlayer")
    suspend fun getPlayer(@Body request: PlayerBaseRequest) : ResponseModel<PlayerModel>

    @POST("Player/GetPlayerFriends")
    suspend fun getFriends(@Body request: PlayerPagedRequest) : PagedResponseModel<FriendModel>

    @POST("Player/GetChampionStats")
    suspend fun getChampionStats(@Body request: PlayerPagedRequest) : PagedResponseModel<ChampionStatsModel>

    @POST("Player/GetPlayerMatchHistory")
    suspend fun getMatchHistory(@Body request: PlayerPagedRequest) : PagedResponseModel<MatchHistoryModel>

    @POST("Player/GetPlayerLoadouts")
    suspend fun getLoadouts(@Body request: PlayerPagedRequest) : PagedResponseModel<LoadoutModel>
}