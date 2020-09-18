package com.fivegearszerochill.paladins.data.api

import com.google.gson.Gson
import com.google.gson.GsonBuilder
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.create

object RetrofitBuilder {
    private const val BASE_URL: String = "http://10.0.2.2:64974/api/"

    private val gson: Gson = GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss").create()
    private val httpClient: OkHttpClient.Builder = OkHttpClient.Builder()
    private val logging: HttpLoggingInterceptor = HttpLoggingInterceptor()

    private val retrofitBuilder: Retrofit.Builder by lazy {
        logging.setLevel(HttpLoggingInterceptor.Level.BODY)
        httpClient.addInterceptor(logging)
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create(gson))
            .client(httpClient.build())
            .client(HttpResponseInterceptor.okHttpClient)
    }

    val playerService : PlayerService by lazy {
        retrofitBuilder
            .build()
            .create(PlayerService::class.java)
    }

    val initialService : InitialService by lazy {
        retrofitBuilder
            .build()
            .create(InitialService::class.java)
    }
}