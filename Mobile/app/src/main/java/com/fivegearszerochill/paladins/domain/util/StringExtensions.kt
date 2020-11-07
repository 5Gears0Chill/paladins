package com.fivegearszerochill.paladins.domain.util

import java.lang.Double.parseDouble

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

fun String.removeWhiteSpaces():String {
    return this.replace("\\s".toRegex(), "")
}

fun String.isNumeric():Boolean{
    var numeric = true
    try {
        val num = parseDouble(this)
    } catch (e: NumberFormatException) {
        numeric = false
    }
    return numeric;
}