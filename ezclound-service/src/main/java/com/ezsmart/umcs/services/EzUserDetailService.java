package com.ezsmart.umcs.services;

import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.services.impl.AccountServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lixiangyang on 16/4/6.
 */
@Component
public class EzUserDetailService implements UserDetailsService {

    @Autowired
    private AccountServiceImpl accountService;

    @Override
    public UserDetails loadUserByUsername(String ucode) throws UsernameNotFoundException {
        Account account = accountService.getAccountByUCode(ucode);


        List<SimpleGrantedAuthority> authos = new ArrayList<SimpleGrantedAuthority>();

        if ("admin".equals(account.getUcode())) {
            SimpleGrantedAuthority adminAuth = new SimpleGrantedAuthority("ROLE_ADMIN");
            authos.add(adminAuth);
        }

        if (CommonConstants.AccountType.ROOT.getType().equals(account.getOwnerType())) {
            SimpleGrantedAuthority rootAuth = new SimpleGrantedAuthority("ROLE_ROOT");
            authos.add(rootAuth);
        }

        if (CommonConstants.AccountType.CHANNELCOMPANY.getType().equals(account.getOwnerType())) {
            SimpleGrantedAuthority channelAuth = new SimpleGrantedAuthority("ROLE_CHANNEL");
            authos.add(channelAuth);
        }

        if (CommonConstants.AccountType.CUSTOMER.getType().equals(account.getOwnerType())) {
            SimpleGrantedAuthority customerAuth = new SimpleGrantedAuthority("ROLE_CUSTOMER");
            authos.add(customerAuth);
        }

        User user = new User(account.getUcode(), account.getPassword(), true, true, true, true, authos);
        return user;
    }
}
