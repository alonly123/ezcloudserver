package com.ezsmart.umcs.wapi.util;

import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.domain.Account;
import com.google.common.collect.Lists;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.CollectionUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by lixiangyang on 16/4/5.
 */
public class LoginUtil {
    public static Account getLoginAccount(HttpServletRequest request) {
        return (Account) request.getSession().getAttribute(CommonConstants.SESSION_LOGIN_USER_KEY);
    }

    public static List<String> getLoginRoles() {
        SecurityContext securityContext = SecurityContextHolder.getContext();
        Authentication authentication = securityContext.getAuthentication();
        List<GrantedAuthority> authorities = (List<GrantedAuthority>) authentication.getAuthorities();

        List<String> roles = Lists.newArrayList();
        if (CollectionUtils.isEmpty(authorities)) {
            return roles;
        }

        for (GrantedAuthority a : authorities) {
            roles.add(a.getAuthority());
        }

        return roles;
    }
}
