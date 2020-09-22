package com.fivegearszerochill.paladins.repository

import androidx.paging.Pager
import androidx.paging.PagingConfig
import androidx.paging.PagingData
import com.fivegearszerochill.paladins.data.datastore.ChampionDataStore
import com.fivegearszerochill.paladins.data.datastore.ItemDataStore
import com.fivegearszerochill.paladins.domain.models.initial.ChampionModel
import com.fivegearszerochill.paladins.domain.models.initial.ItemModel
import kotlinx.coroutines.flow.Flow

object PagingRepository {

    private const val NETWORK_PAGE_SIZE = 15

    fun getItemSearchResultStream(championId: Int): Flow<PagingData<ItemModel>> {
        return Pager(
            config = PagingConfig(
                pageSize = NETWORK_PAGE_SIZE,
                prefetchDistance = 6,
                enablePlaceholders = false
            ),
            pagingSourceFactory = { ItemDataStore(championId) }
        ).flow
    }

    fun getChampionSearchResultStream(): Flow<PagingData<ChampionModel>> {
        return Pager(
            config = PagingConfig(
                pageSize = NETWORK_PAGE_SIZE,
                prefetchDistance = 6,
                enablePlaceholders = false
            ),
            pagingSourceFactory = { ChampionDataStore() }
        ).flow
    }
}