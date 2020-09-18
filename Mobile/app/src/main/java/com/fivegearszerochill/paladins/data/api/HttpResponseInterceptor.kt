package com.fivegearszerochill.paladins.data.api

import com.fivegearszerochill.paladins.domain.enums.HttpResponse
import okhttp3.Interceptor
import okhttp3.OkHttpClient
import java.io.IOException

object HttpResponseInterceptor {
    val okHttpClient = OkHttpClient.Builder()
        .addInterceptor(object : Interceptor {
            @Throws(IOException::class)
            override fun intercept(chain: Interceptor.Chain): okhttp3.Response {
                val request = chain.request()
                val response = chain.proceed(request)

                if (response.code == HttpResponse.INTERNAL_SERVER_ERROR.code) {
                    return response
                }
                return response
            }
        })
        .build()

}