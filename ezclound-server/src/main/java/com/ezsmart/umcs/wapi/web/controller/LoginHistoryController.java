package com.ezsmart.umcs.wapi.web.controller;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.LoginHistoryCondition;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.domain.LoginHistory;
import com.ezsmart.umcs.services.impl.LoginHistoryServiceImpl;
import com.ezsmart.umcs.util.ServiceUtil;
import com.ezsmart.umcs.wapi.util.ViewHelper;
import com.ezsmart.umcs.wapi.view.LoginHistoryView;
import com.ezsmart.umcs.wapi.view.PageView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by lixiangyang on 16/4/20.
 */
@Controller
public class LoginHistoryController extends BaseController {
    @Autowired
    private LoginHistoryServiceImpl loginHistoryService;

    @RequestMapping(value = "/admin/loginHistory/r/listPage")
    public String loginHistoryPage() {

        return "admin/login_history/list";
    }

    @RequestMapping(value = "/admin/loginHistory/r/list")
    public String loginHistoryList(
            Model model,
            @RequestParam(value = "keyword", defaultValue = "") String keyWord,
            @RequestParam(value = "timeZone", defaultValue = "") String timeZone,
            @RequestParam(value = "pageSize", defaultValue = "20") int pageSize,
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum
    ) throws ParseException {

        String format = "yyyy/MM/dd HH:mm:ss";
        String timeZoneSepatator = " - ";
        String[] timeStrs = timeZone.split(timeZoneSepatator);
        String startTimeStr = "";
        String endTimeStr = "";
        Date startTime = null;
        Date endTime = null;
        if (timeStrs == null || timeStrs.length < 2) {
            startTime = ServiceUtil.getTodayStartTime();
            endTime = ServiceUtil.getTodayEndTime();
            startTimeStr = ServiceUtil.formatDate(startTime, format);
            endTimeStr = ServiceUtil.formatDate(endTime, format);
            timeZone = startTimeStr + timeZoneSepatator + endTimeStr;
        } else {
            startTime = ServiceUtil.stringToDate(timeStrs[0], format);
            endTime = ServiceUtil.stringToDate(timeStrs[1], format);
        }

        model.addAttribute("timeZone", timeZone);

        LoginHistoryCondition condition = new LoginHistoryCondition();
        condition.setKeyWord(keyWord);
        condition.setLoginTimeStart(startTime);
        condition.setLoginTimeEnd(endTime);

        int total = loginHistoryService.count(condition);
        List<LoginHistory> loginHistoryList = loginHistoryService.getLoginHistoryList(condition, pageNum, pageSize);
        List<LoginHistoryView> accountViewList = ViewHelper.toLoginHistoryViewList(loginHistoryList);
        PageView<LoginHistoryView> page = new PageView<LoginHistoryView>(pageSize, pageNum, total, accountViewList);

        model.addAttribute("page", page);

        return "admin/login_history/list";
    }
}
