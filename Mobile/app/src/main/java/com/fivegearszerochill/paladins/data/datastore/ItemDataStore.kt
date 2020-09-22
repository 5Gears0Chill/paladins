package com.fivegearszerochill.paladins.data.datastore

import androidx.paging.PagingSource
import com.fivegearszerochill.paladins.data.api.RetrofitBuilder
import com.fivegearszerochill.paladins.domain.models.initial.ItemModel
import com.fivegearszerochill.paladins.domain.requests.ItemPagedRequest
import com.fivegearszerochill.paladins.domain.requests.PagedRequest
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.async
import kotlinx.coroutines.launch
import retrofit2.HttpException
import java.io.IOException
import java.lang.Exception

class ItemDataStore(
    private val championId: Int?) :
    PagingSource<Int, ItemModel>() , BaseDataStore{

    override suspend fun load(params: LoadParams<Int>): LoadResult<Int, ItemModel> {
        try{
            val request = ItemPagedRequest(
                championId = championId ?: -1,
                page = 10,
                number = params.key ?: 1
            )
            val response = RetrofitBuilder.initialService.getItems(request)
            val totalPages = calculateTotalPages(response, request)
            return LoadResult.Page(
                data = response.data,
                prevKey = null, // Only paging forward.
                nextKey = request.pageNumber?.let { calcNextPageNumber(totalPages, it) },
            )
        }catch (e: IOException) {
            // IOException for network failures.
            return LoadResult.Error(e)
        } catch (e: HttpException) {
            // HttpException for any non-2xx HTTP status codes.
            return LoadResult.Error(e)
        }
    }
}