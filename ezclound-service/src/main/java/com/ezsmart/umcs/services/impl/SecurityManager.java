package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.domain.Account;

public class SecurityManager {

    public boolean isAdmin(Account account) {
        return false;
    }

    public boolean isTokenValid(String token) {
        return false;
    }
}
