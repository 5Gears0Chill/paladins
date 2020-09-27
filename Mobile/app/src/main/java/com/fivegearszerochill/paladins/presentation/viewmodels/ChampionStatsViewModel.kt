package com.fivegearszerochill.paladins.presentation.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.paging.PagingData
import androidx.paging.cachedIn
import com.fivegearszerochill.paladins.domain.models.player.ChampionStatsModel
import com.fivegearszerochill.paladins.repository.PagingRepository
import kotlinx.coroutines.flow.Flow

class ChampionStatsViewModel: ViewModel() {
    private var currentQueryValue: String? = null

    private var currentSearchResult: Flow<PagingData<ChampionStatsModel>>? = null

    fun searchRepo(playerName: String): Flow<PagingData<ChampionStatsModel>> {
        val lastResult = currentSearchResult
        if (playerName == currentQueryValue && lastResult != null) {
            return lastResult
        }
        currentQueryValue = playerName
        val newResult: Flow<PagingData<ChampionStatsModel>> = PagingRepository.getChampionStatsSearchResultStream(playerName)
            .cachedIn(viewModelScope)
        currentSearchResult = newResult
        return newResult
    }
}