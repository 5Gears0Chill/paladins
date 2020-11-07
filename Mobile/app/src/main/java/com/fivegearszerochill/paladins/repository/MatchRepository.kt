package com.fivegearszerochill.paladins.repository

import androidx.lifecycle.LiveData
import com.fivegearszerochill.paladins.data.api.RetrofitBuilder
import com.fivegearszerochill.paladins.domain.models.ResponseModel
import com.fivegearszerochill.paladins.domain.models.match.MatchDetailsModel
import com.fivegearszerochill.paladins.domain.requests.MatchDetailsRequest
import com.fivegearszerochill.paladins.domain.requests.NonLinkedMatchDetailsRequest
import kotlinx.coroutines.*

object MatchRepository : BaseRepository() {

    fun getMatchDetails(request: MatchDetailsRequest): LiveData<ResponseModel<List<MatchDetailsModel>>> {
        job = Job()
        return object: LiveData<ResponseModel<List<MatchDetailsModel>>>(){
            override fun onActive() {
                super.onActive()
                job?.let { job ->
                    CoroutineScope(Dispatchers.IO + job).launch {
                        val matchModel = RetrofitBuilder.matchService.getMatchDetails(request)
                        withContext(Dispatchers.Main){
                            value = matchModel
                            job.complete()
                        }
                    }
                }
            }
        }
    }

    fun getNonLinkedMatchDetails(request: NonLinkedMatchDetailsRequest): LiveData<ResponseModel<List<MatchDetailsModel>>> {
        job = Job()
        return object: LiveData<ResponseModel<List<MatchDetailsModel>>>(){
            override fun onActive() {
                super.onActive()
                job?.let { job ->
                    CoroutineScope(Dispatchers.IO + job).launch {
                        val matchModel = RetrofitBuilder.matchService.getNonLinkedMatchDetails(request)
                        withContext(Dispatchers.Main){
                            value = matchModel
                            job.complete()
                        }
                    }
                }
            }
        }
    }
}