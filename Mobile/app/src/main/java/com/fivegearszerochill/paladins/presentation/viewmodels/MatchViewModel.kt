package com.fivegearszerochill.paladins.presentation.viewmodels

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Transformations
import androidx.lifecycle.ViewModel
import com.fivegearszerochill.paladins.domain.factories.MatchFactory
import com.fivegearszerochill.paladins.domain.models.ResponseModel
import com.fivegearszerochill.paladins.domain.models.match.MatchDetailsModel
import com.fivegearszerochill.paladins.domain.requests.MatchDetailsRequest
import com.fivegearszerochill.paladins.repository.MatchRepository
import com.fivegearszerochill.paladins.repository.PlayerRepository

class MatchViewModel: ViewModel() {
    private val _matchDetailsRequest: MutableLiveData<MatchDetailsRequest> = MutableLiveData()

    val matchDetails: LiveData<ResponseModel<List<MatchDetailsModel>>> = Transformations
        .switchMap(_matchDetailsRequest){ request ->
            MatchRepository.getMatchDetails(request)
        }

    fun setMatchDetailsRequest(matchId: String, playerMatchHistoryId: Int){
        val update = MatchFactory.createMatchDetailsRequest(matchId, playerMatchHistoryId)
        when (_matchDetailsRequest.value) {
            update -> {
                return
            }
            else -> _matchDetailsRequest.value = update
        }
    }

    fun cancelJobs(){
        PlayerRepository.cancelJob()
    }
}