package com.fivegearszerochill.paladins.domain.models

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

data class ValidationResultsModel (
    @Expose
    @SerializedName("isValid")
    val isValid: Boolean? = null,
    @Expose
    @SerializedName("errorMessages")
    val errorMessages: List<String>? = null
){
    override fun toString(): String {
        return "ValidationResultsModel(isValid=$isValid, errorMessages=$errorMessages)"
    }
}
