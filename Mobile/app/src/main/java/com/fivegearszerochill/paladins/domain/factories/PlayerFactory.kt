package com.fivegearszerochill.paladins.domain.factories

import com.fivegearszerochill.paladins.domain.requests.PlayerBaseRequest

object PlayerFactory {

    fun createPlayerBaseRequest(name: String) : PlayerBaseRequest{
        return PlayerBaseRequest(name);
    }
}