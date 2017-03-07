package com.ezsmart.umcs.wapi.security;

import com.alibaba.fastjson.JSON;
import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.wapi.util.Util;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lixiangyang on 16/4/7.
 */
public class EzAccessDeniedHandler implements AccessDeniedHandler {
    private String accessDeniedUrl;

    public String getAccessDeniedUrl() {
        return accessDeniedUrl;
    }

    public void setAccessDeniedUrl(String accessDeniedUrl) {
        this.accessDeniedUrl = accessDeniedUrl;
    }

    public EzAccessDeniedHandler(String accessDeniedUrl) {
        this.accessDeniedUrl = accessDeniedUrl;
    }

    public EzAccessDeniedHandler() {
    }

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException e) throws IOException, ServletException {

        //如果是ajax请求
        if (Util.isAjaxRequest(request)) {

            BasicResult result = new BasicResult(false, ReturnConstants.ACCESS_DENIED.getCode(), ReturnConstants.ACCESS_DENIED.getMessage());
            response.setContentType("application/json; charset=UTF-8");
            response.setHeader("Cache-Control", "no-cache");
            PrintWriter out = response.getWriter();
            out.print(JSON.toJSONString(result));
            out.flush();
            out.close();
            return;
        } else {

            String path = request.getContextPath();
//            String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+path+"/";
            response.sendRedirect(accessDeniedUrl);
        }

    }
}
