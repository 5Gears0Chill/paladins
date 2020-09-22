package com.fivegearszerochill.paladins.domain.util

fun String.Companion.empty():String {
    return ""
}

fun String.toMinutes():String {
    return "$this minutes"
}

fun String.toHours():String {
    return "$this hours"
}