package com.fivegearszerochill.paladins.domain.requests

class PlayerPagedRequest(
    val playerName: String? = null,
    size: Int? = null,
    number: Int? = null,
) : PagedRequest(size,number)