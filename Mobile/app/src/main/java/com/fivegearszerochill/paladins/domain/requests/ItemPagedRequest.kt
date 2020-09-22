package com.fivegearszerochill.paladins.domain.requests

class ItemPagedRequest(
    val championId: Int? = null,
    page: Int? = null,
    number: Int? = null,
) : PagedRequest(page,number)