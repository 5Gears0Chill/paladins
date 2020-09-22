package com.fivegearszerochill.paladins.presentation.viewmodels

import androidx.lifecycle.*
import androidx.paging.*
import com.fivegearszerochill.paladins.domain.models.initial.ItemModel
import com.fivegearszerochill.paladins.repository.PagingRepository
import kotlinx.coroutines.flow.Flow

class ItemViewModel : ViewModel() {
    private var currentQueryValue: Int? = null

    private var currentSearchResult: Flow<PagingData<ItemModel>>? = null

    fun searchRepo(championId: Int): Flow<PagingData<ItemModel>> {
        val lastResult = currentSearchResult
        if (championId == currentQueryValue && lastResult != null) {
            return lastResult
        }
        currentQueryValue = championId
        val newResult: Flow<PagingData<ItemModel>> = PagingRepository.getItemSearchResultStream(championId)
            .cachedIn(viewModelScope)
        currentSearchResult = newResult
        return newResult
    }

}