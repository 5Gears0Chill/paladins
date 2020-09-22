package com.fivegearszerochill.paladins.data.datastore

import com.fivegearszerochill.paladins.domain.models.PagedResponseModel
import com.fivegearszerochill.paladins.domain.requests.PagedRequest
import kotlin.math.ceil

 interface BaseDataStore {

    fun <T>calculateTotalPages(response: PagedResponseModel<T>, request: PagedRequest): Int{
        return ceil(response.totalRows.toDouble() / request.pageSize!!).toInt()
    }

    fun calcNextPageNumber(totalPages: Int, currentPage: Int): Int?{
        if(currentPage < totalPages){
            return currentPage + 1
        }
        if(currentPage == totalPages){
            return null
        }
        return currentPage
    }
}