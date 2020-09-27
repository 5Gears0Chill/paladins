package com.fivegearszerochill.paladins.domain.requests

class ItemPagedRequest(
    val championId: Int? = null,
    size: Int? = null,
    number: Int? = null,
) : PagedRequest(size, number)