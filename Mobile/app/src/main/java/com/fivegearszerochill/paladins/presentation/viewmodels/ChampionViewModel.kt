package com.fivegearszerochill.paladins.presentation.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.paging.PagingData
import androidx.paging.cachedIn
import com.fivegearszerochill.paladins.domain.models.initial.ChampionModel
import com.fivegearszerochill.paladins.domain.models.initial.ItemModel
import com.fivegearszerochill.paladins.repository.PagingRepository
import kotlinx.coroutines.flow.Flow

class ChampionViewModel : ViewModel() {

    fun searchRepo(): Flow<PagingData<ChampionModel>> {
        return PagingRepository.getChampionSearchResultStream()
            .cachedIn(viewModelScope)
    }
}