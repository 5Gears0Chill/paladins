package com.fivegearszerochill.paladins.repository

import androidx.lifecycle.LiveData
import com.fivegearszerochill.paladins.data.api.RetrofitBuilder
import com.fivegearszerochill.paladins.domain.models.PagedResponseModel
import com.fivegearszerochill.paladins.domain.models.player.PlayerModel
import com.fivegearszerochill.paladins.domain.models.ResponseModel
import com.fivegearszerochill.paladins.domain.requests.PlayerBaseRequest
import com.fivegearszerochill.paladins.domain.requests.PlayerLoadoutRequest
import kotlinx.coroutines.*
import kotlinx.coroutines.Dispatchers.IO
import kotlinx.coroutines.Dispatchers.Main

object PlayerRepository : BaseRepository() {

    fun getPlayerAsync(request: PlayerBaseRequest): LiveData<ResponseModel<PlayerModel>>{
        job = Job()
        return object: LiveData<ResponseModel<PlayerModel>>(){
            override fun onActive() {
                super.onActive()
                job?.let { job ->
                    CoroutineScope(IO + job).launch {
                        val playerModel = RetrofitBuilder.playerService.getPlayer(request)
                        withContext(Main){
                            value = playerModel
                            job.complete()
                        }
                    }
                }
            }
        }
    }
}