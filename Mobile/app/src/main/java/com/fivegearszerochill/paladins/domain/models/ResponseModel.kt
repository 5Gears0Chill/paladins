package com.fivegearszerochill.paladins.domain.models

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

data class ResponseModel<T>(
    @Expose
    @SerializedName("data")
    val data: T? = null,
    @Expose
    @SerializedName("validationResults")
    val validationResults: ValidationResultsModel? = null,
){
    override fun toString(): String {
        return "ResponseModel(data=$data, validationResults=$validationResults)"
    }
}
