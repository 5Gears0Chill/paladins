package com.fivegearszerochill.paladins.domain.factories

import com.fivegearszerochill.paladins.domain.requests.MatchDetailsRequest
import com.fivegearszerochill.paladins.domain.requests.NonLinkedMatchDetailsRequest

object MatchFactory {

    fun createMatchDetailsRequest(matchId: String, playerMatchHistoryId: Int): MatchDetailsRequest {
        return MatchDetailsRequest(matchId, playerMatchHistoryId)
    }

    fun createNonLinkedMatchDetailsRequest(matchId: String): NonLinkedMatchDetailsRequest {
        return NonLinkedMatchDetailsRequest(matchId)
    }
}