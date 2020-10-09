package com.fivegearszerochill.paladins.domain.requests

data class MatchDetailsRequest(
    val matchId: String? = null,
    val playerMatchHistoryId: Int? = null
)