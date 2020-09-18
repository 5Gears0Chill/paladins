package com.fivegearszerochill.paladins.data.api

import com.fivegearszerochill.paladins.domain.models.PagedResponseModel
import com.fivegearszerochill.paladins.domain.models.initial.ChampionModel
import com.fivegearszerochill.paladins.domain.requests.PagedRequest
import retrofit2.http.Body
import retrofit2.http.POST

interface InitialService {
    @POST("/api/Initial/GetChampions")
    suspend fun getChampions(@Body request: PagedRequest): PagedResponseModel<ChampionModel>

}