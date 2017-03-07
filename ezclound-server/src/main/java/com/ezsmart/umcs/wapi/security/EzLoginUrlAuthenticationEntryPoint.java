package com.ezsmart.umcs.wapi.security;

import com.alibaba.fastjson.JSON;
import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.wapi.util.Util;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lixiangyang on 16/4/7.
 */
public class EzLoginUrlAuthenticationEntryPoint extends LoginUrlAuthenticationEntryPoint {

    public EzLoginUrlAuthenticationEntryPoint(String loginFormUrl) {
        super(loginFormUrl);
    }

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
        if (Util.isAjaxRequest(request)) {
            response.setContentType("application/json; charset=UTF-8");
            response.setHeader("Cache-Control", "no-cache");
            BasicResult result = new BasicResult();
            result.setCode(ReturnConstants.LOGIN_AUTHORIZATION_FAIL.getCode());
            result.setMsg(ReturnConstants.LOGIN_AUTHORIZATION_FAIL.getMessage());
            PrintWriter printWriter = response.getWriter();
            printWriter.write(JSON.toJSONString(result));
            printWriter.flush();
            printWriter.close();

        } else
            super.commence(request, response, authException);
    }
}
