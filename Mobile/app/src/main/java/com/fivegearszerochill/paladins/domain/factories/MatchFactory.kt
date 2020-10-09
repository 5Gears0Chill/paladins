package com.fivegearszerochill.paladins.domain.factories

import com.fivegearszerochill.paladins.domain.requests.MatchDetailsRequest

object MatchFactory{

    fun createMatchDetailsRequest(matchId: String, playerMatchHistoryId: Int) : MatchDetailsRequest {
        return MatchDetailsRequest(matchId, playerMatchHistoryId)
    }
}