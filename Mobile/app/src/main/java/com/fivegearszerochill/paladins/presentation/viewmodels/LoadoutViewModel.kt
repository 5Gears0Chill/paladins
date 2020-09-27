package com.fivegearszerochill.paladins.presentation.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.paging.PagingData
import androidx.paging.cachedIn
import com.fivegearszerochill.paladins.domain.models.player.LoadoutModel
import com.fivegearszerochill.paladins.repository.PagingRepository
import kotlinx.coroutines.flow.Flow

class LoadoutViewModel: ViewModel() {
    private var currentQueryValue: String? = null

    private var currentSearchResult: Flow<PagingData<LoadoutModel>>? = null

    fun searchRepo(playerName: String): Flow<PagingData<LoadoutModel>> {
        val lastResult = currentSearchResult
        if (playerName == currentQueryValue && lastResult != null) {
            return lastResult
        }
        currentQueryValue = playerName
        val newResult: Flow<PagingData<LoadoutModel>> = PagingRepository.getLoadoutSearchResultStream(playerName)
            .cachedIn(viewModelScope)
        currentSearchResult = newResult
        return newResult
    }
}