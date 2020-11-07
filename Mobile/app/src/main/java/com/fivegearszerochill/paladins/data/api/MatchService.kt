package com.fivegearszerochill.paladins.data.api

import com.fivegearszerochill.paladins.domain.models.ResponseModel
import com.fivegearszerochill.paladins.domain.models.match.MatchDetailsModel
import com.fivegearszerochill.paladins.domain.requests.MatchDetailsRequest
import com.fivegearszerochill.paladins.domain.requests.NonLinkedMatchDetailsRequest
import retrofit2.http.Body
import retrofit2.http.POST

interface MatchService {
    @POST("Match/GetMatchDetails")
    suspend fun getMatchDetails(@Body request: MatchDetailsRequest) : ResponseModel<List<MatchDetailsModel>>

    @POST("Match/GetNonLinkedMatchDetails")
    suspend fun getNonLinkedMatchDetails(@Body request: NonLinkedMatchDetailsRequest) : ResponseModel<List<MatchDetailsModel>>
}