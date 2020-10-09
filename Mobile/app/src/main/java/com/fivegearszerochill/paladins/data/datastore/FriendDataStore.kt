package com.fivegearszerochill.paladins.data.datastore

import androidx.paging.PagingSource
import com.fivegearszerochill.paladins.data.api.RetrofitBuilder
import com.fivegearszerochill.paladins.domain.models.player.FriendModel
import com.fivegearszerochill.paladins.domain.requests.PlayerPagedRequest
import retrofit2.HttpException
import java.io.IOException

class FriendDataStore( private val playerName: String?) : PagingSource<Int, FriendModel>(), BaseDataStore {

    override suspend fun load(params: LoadParams<Int>): LoadResult<Int, FriendModel> {
        try {
            val request = PlayerPagedRequest(
                playerName = playerName,
                size = 10,
                number = params.key ?: 1
            )
            val response = RetrofitBuilder.playerService.getFriends(request)
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