package com.fivegearszerochill.paladins.repository

import androidx.lifecycle.LiveData
import com.fivegearszerochill.paladins.data.api.RetrofitBuilder
import com.fivegearszerochill.paladins.domain.models.PagedResponseModel
import com.fivegearszerochill.paladins.domain.models.initial.ChampionModel
import com.fivegearszerochill.paladins.domain.requests.PagedRequest
import kotlinx.coroutines.*

object InitialRepository : BaseRepository() {

    fun getChampions(request: PagedRequest): LiveData<PagedResponseModel<ChampionModel>> {
        job = Job()
        return object: LiveData<PagedResponseModel<ChampionModel>>(){
            override fun onActive() {
                super.onActive()
                job?.let { job ->
                    CoroutineScope(Dispatchers.IO + job).launch {
                        val championResponse = RetrofitBuilder.initialService.getChampions(request)
                        withContext(Dispatchers.Main){
                            value = championResponse
                            job.complete()
                        }
                    }
                }
            }
        }
    }
}