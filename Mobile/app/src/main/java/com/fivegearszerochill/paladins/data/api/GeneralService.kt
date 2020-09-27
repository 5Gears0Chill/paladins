package com.fivegearszerochill.paladins.data.api

import com.fivegearszerochill.paladins.domain.models.PagedResponseModel
import com.fivegearszerochill.paladins.domain.models.initial.ChampionModel
import com.fivegearszerochill.paladins.domain.models.initial.ItemModel
import com.fivegearszerochill.paladins.domain.requests.ItemPagedRequest
import com.fivegearszerochill.paladins.domain.requests.PagedRequest
import retrofit2.http.Body
import retrofit2.http.POST

interface GeneralService {
    @POST("/api/General/GetChampions")
    suspend fun getChampions(@Body request: PagedRequest): PagedResponseModel<ChampionModel>

    @POST("/api/General/GetItems")
    suspend fun getItems(@Body request: ItemPagedRequest): PagedResponseModel<ItemModel>
}
