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

fun String.appendUnit(unit: String):String {
    return "$this $unit"
}