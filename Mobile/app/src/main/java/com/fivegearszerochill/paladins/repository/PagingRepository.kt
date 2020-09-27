package com.fivegearszerochill.paladins.repository

import androidx.paging.Pager
import androidx.paging.PagingConfig
import androidx.paging.PagingData
import com.fivegearszerochill.paladins.data.datastore.*
import com.fivegearszerochill.paladins.domain.models.initial.ChampionModel
import com.fivegearszerochill.paladins.domain.models.initial.ItemModel
import com.fivegearszerochill.paladins.domain.models.player.ChampionStatsModel
import com.fivegearszerochill.paladins.domain.models.player.FriendModel
import com.fivegearszerochill.paladins.domain.models.player.LoadoutModel
import com.fivegearszerochill.paladins.domain.models.player.MatchHistoryModel
import kotlinx.coroutines.flow.Flow

object PagingRepository {

    private const val NETWORK_PAGE_SIZE = 20
    private const val NETWORK_PREFETCH_SIZE = 10

    fun getItemSearchResultStream(championId: Int): Flow<PagingData<ItemModel>> {
        return Pager(
            config = PagingConfig(
                pageSize = NETWORK_PAGE_SIZE,
                prefetchDistance = NETWORK_PREFETCH_SIZE,
                enablePlaceholders = false
            ),
            pagingSourceFactory = { ItemDataStore(championId) }
        ).flow
    }

    fun getChampionSearchResultStream(): Flow<PagingData<ChampionModel>> {
        return Pager(
            config = PagingConfig(
                pageSize = NETWORK_PAGE_SIZE,
                prefetchDistance = NETWORK_PREFETCH_SIZE,
                enablePlaceholders = false
            ),
            pagingSourceFactory = { ChampionDataStore() }
        ).flow
    }

    fun getChampionStatsSearchResultStream(playerName: String): Flow<PagingData<ChampionStatsModel>> {
        return Pager(
            config = PagingConfig(
                pageSize = NETWORK_PAGE_SIZE,
                prefetchDistance = NETWORK_PREFETCH_SIZE,
                enablePlaceholders = false
            ),
            pagingSourceFactory = { ChampionStatsDataStore(playerName) }
        ).flow
    }

  fun getFriendSearchResultStream(playerName: String): Flow<PagingData<FriendModel>> {
        return Pager(
            config = PagingConfig(
                pageSize = NETWORK_PAGE_SIZE,
                prefetchDistance = NETWORK_PREFETCH_SIZE,
                enablePlaceholders = false
            ),
            pagingSourceFactory = { FriendDataStore(playerName) }
        ).flow
  }

  fun getLoadoutSearchResultStream(playerName: String): Flow<PagingData<LoadoutModel>> {
        return Pager(
            config = PagingConfig(
                pageSize = NETWORK_PAGE_SIZE,
                prefetchDistance = NETWORK_PREFETCH_SIZE,
                enablePlaceholders = false
            ),
            pagingSourceFactory = { LoadoutDataStore(playerName) }
        ).flow
  }

  fun getMatchHistorySearchResultStream(playerName: String): Flow<PagingData<MatchHistoryModel>> {
        return Pager(
              config = PagingConfig(
                  pageSize = NETWORK_PAGE_SIZE,
                  prefetchDistance = NETWORK_PREFETCH_SIZE,
                  enablePlaceholders = false
              ),
            pagingSourceFactory = { MatchHistoryDataStore(playerName) }
      ).flow
  }


}