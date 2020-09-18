package com.fivegearszerochill.paladins.domain.requests

data class PagedRequest(
    val pageSize: Int? = null,
    val pageNumber: Int? = null,
)