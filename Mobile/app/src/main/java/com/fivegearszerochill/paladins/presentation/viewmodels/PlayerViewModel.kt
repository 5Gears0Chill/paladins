package com.fivegearszerochill.paladins.presentation.viewmodels

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Transformations
import androidx.lifecycle.ViewModel
import com.fivegearszerochill.paladins.domain.factories.PlayerFactory
import com.fivegearszerochill.paladins.domain.models.player.PlayerModel
import com.fivegearszerochill.paladins.domain.models.ResponseModel
import com.fivegearszerochill.paladins.domain.requests.PlayerBaseRequest
import com.fivegearszerochill.paladins.repository.PlayerRepository

class PlayerViewModel: ViewModel() {
    private val _playerBaseRequest: MutableLiveData<PlayerBaseRequest> = MutableLiveData()

    val player: LiveData<ResponseModel<PlayerModel>> = Transformations
        .switchMap(_playerBaseRequest){ request ->
            PlayerRepository.getPlayerAsync(request)
        }

    fun setPlayerRequest(playerName: String){
        val update = PlayerFactory.createPlayerBaseRequest(playerName)
        when (_playerBaseRequest.value) {
            update -> {
                return
            }
            else -> _playerBaseRequest.value = update
        }

    }

    fun cancelJobs(){
        PlayerRepository.cancelJob()
    }
}