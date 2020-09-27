package com.fivegearszerochill.paladins.data.datastore

import androidx.paging.PagingSource
import com.fivegearszerochill.paladins.data.api.RetrofitBuilder
import com.fivegearszerochill.paladins.domain.models.initial.ChampionModel
import com.fivegearszerochill.paladins.domain.requests.PagedRequest
import retrofit2.HttpException
import java.io.IOException

class ChampionDataStore: PagingSource<Int, ChampionModel>(), BaseDataStore{

    override suspend fun load(params: LoadParams<Int>): LoadResult<Int, ChampionModel> {
        try {
            val request = PagedRequest(
                pageSize = 6,
                pageNumber = params.key ?: 1
            )
            val response = RetrofitBuilder.generalService.getChampions(request)
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