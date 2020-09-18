package com.fivegearszerochill.paladins.repository

import kotlinx.coroutines.CompletableJob

open class BaseRepository {
    var job: CompletableJob? = null

    fun cancelJob(){
        job?.cancel()
    }
}