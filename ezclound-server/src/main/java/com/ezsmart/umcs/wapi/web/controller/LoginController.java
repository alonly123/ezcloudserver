package com.ezsmart.umcs.wapi.web.controller;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.domain.LoginHistory;
import com.ezsmart.umcs.services.EzUserDetailService;
import com.ezsmart.umcs.services.impl.AccountServiceImpl;
import com.ezsmart.umcs.services.impl.LoginHistoryServiceImpl;
import com.ezsmart.umcs.wapi.util.LoginUtil;
import com.ezsmart.umcs.wapi.util.Util;
import com.ezsmart.umcs.wapi.util.ViewHelper;
import com.ezsmart.umcs.wapi.view.AccountView;
import com.ezsmart.umcs.wapi.view.LoginHistoryView;
import com.ezsmart.umcs.wapi.view.PageView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by lixiangyang on 16/4/1.
 */
@Controller
@RequestMapping("login")
public class LoginController {
    private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private AccountServiceImpl accountService;

    @Autowired
    private EzUserDetailService ezUserDetailService;

    @Autowired
    private LoginHistoryServiceImpl loginHistoryService;

    @RequestMapping("/page")
    public String loginPage() {
        return "login";
    }

    @ResponseBody
    @RequestMapping(value = "/do", produces = "application/json; charset=UTF-8")
    public Object login(String uCode, String password, HttpServletRequest request) {
        try {

            HttpSession session = request.getSession();

            Account account = accountService.getAccountByUCode(uCode);

            if (null == account) {
                LOGGER.info("login account does not exist uCode={}, password={}", new Object[]{uCode, password});
                return new BasicResult(false, 101, "账号错误");
            }

            password = Util.getMD5ByBase64(password);

            if (!password.equals(account.getPassword())) {
                LOGGER.info("login account does not exist uCode={}, password={}", new Object[]{uCode, password});
                return new BasicResult(false, 102, "密码错误");
            }

            UserDetails userDetails = ezUserDetailService.loadUserByUsername(uCode);
            Authentication authentication = new UsernamePasswordAuthenticationToken(
                    userDetails, userDetails.getPassword(), userDetails.getAuthorities());
            SecurityContext securityContext = SecurityContextHolder.getContext();
            securityContext.setAuthentication(authentication);

            session.setAttribute(CommonConstants.SESSION_SPRING_SECURITY_CONTEXT_KEY, securityContext);

            session.setAttribute(CommonConstants.SESSION_LOGIN_USER_KEY, account);

            loginHistoryService.addLoginHistory(uCode, request.getRemoteAddr());

            return new BasicResult(true, 0, "OK");
        } catch (Exception e) {
            LOGGER.error("login uCode={}, password={}", new Object[]{uCode, password, e});
            return new BasicResult(false, 99, "系统错误");
        }
    }


    @RequestMapping(value = "/out")
    public Object login(HttpServletRequest request) {
        HttpSession session = request.getSession();

        session.removeAttribute(CommonConstants.SESSION_SPRING_SECURITY_CONTEXT_KEY);
        session.removeAttribute(CommonConstants.SESSION_LOGIN_USER_KEY);

        return "redirect:/login/page";
    }

    @RequestMapping(value = "/history")
    public Object getLoginHistoryList(Model model,
                                      @RequestParam(value = "key", defaultValue = "") String keywords,
                                      @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                      @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
                                      HttpServletRequest request) {
        try {
            Account curAccount = LoginUtil.getLoginAccount(request);
            if (!CommonConstants.RoleType.ADMIN.getType().equals(curAccount.getRoleType())) {
                //要不要抛异常
            }
            int total = loginHistoryService.count(keywords);
            List<LoginHistory> loginHistoryList = loginHistoryService.getLoginHistoryList(keywords, pageNum, pageSize);
            List<LoginHistoryView> accountViewList = ViewHelper.toLoginHistoryViewList(loginHistoryList);
            PageView<LoginHistoryView> page = new PageView<LoginHistoryView>(pageSize, pageNum, total, accountViewList);

            model.addAttribute("loginHistoryList", page);
            return "/loginhistorylist";
        } catch (Exception e) {
            LOGGER.error("get loginhistory fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

}
