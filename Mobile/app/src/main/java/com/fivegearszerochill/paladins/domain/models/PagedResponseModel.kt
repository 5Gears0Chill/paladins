package com.fivegearszerochill.paladins.domain.models

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

data class PagedResponseModel<T>(
    @Expose
    @SerializedName("data")
    val data: List<T>,
    @Expose
    @SerializedName("totalRows")
    val totalRows: Long,
)