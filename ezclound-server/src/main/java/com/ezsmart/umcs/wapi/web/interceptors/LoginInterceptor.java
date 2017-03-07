package com.ezsmart.umcs.wapi.web.interceptors;

import com.alibaba.fastjson.JSON;
import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.wapi.util.Util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by lixiangyang on 16/4/2.
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
    private static final Logger LOGGER = LoggerFactory.getLogger(LoginInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Account account = (Account) request.getSession().getAttribute(CommonConstants.SESSION_LOGIN_USER_KEY);

        if (account != null) {  //已经登录
            return true;
        } else {
            if (Util.isAjaxRequest(request)) {  //ajax
                response.setContentType("application/json; charset=UTF-8");
                response.setHeader("Cache-Control", "no-cache");

                BasicResult result = new BasicResult();
                result.setCode(401);
                result.setMsg("您未登录，请先登录");
                response.getWriter().write(JSON.toJSONString(result));
            } else {
                response.sendRedirect("/login/page");
            }
        }

        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
