package com.fivegearszerochill.paladins.domain.enums

enum class HttpResponse(val code: Int) {
    INTERNAL_SERVER_ERROR(500),
    NOT_FOUND(404),
}