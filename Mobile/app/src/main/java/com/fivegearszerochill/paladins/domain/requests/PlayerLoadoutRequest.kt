package com.fivegearszerochill.paladins.domain.requests

import java.sql.RowId

data class PlayerLoadoutRequest(
    val playerName: String? = null,
    val languageId: Int? = null,
)