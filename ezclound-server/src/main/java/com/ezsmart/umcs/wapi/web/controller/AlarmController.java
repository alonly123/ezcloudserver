package com.ezsmart.umcs.wapi.web.controller;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.AlarmCondition;
import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.domain.Alarm;
import com.ezsmart.umcs.services.impl.AlarmServiceImpl;
import com.ezsmart.umcs.util.ServiceUtil;
import com.ezsmart.umcs.wapi.util.LoginUtil;
import com.ezsmart.umcs.wapi.util.ViewHelper;
import com.ezsmart.umcs.wapi.view.AlarmView;
import com.ezsmart.umcs.wapi.view.PageView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

/**
 * Created by lixiangyang on 16/5/4.
 */
@Controller
public class AlarmController {
    private static final Logger LOGGER = LoggerFactory.getLogger(AlarmController.class);

    @Autowired
    private AlarmServiceImpl alarmService;

    @RequestMapping(value = "alarm/r/list")
    public String list(
            Model model,
            HttpServletRequest request,
            @RequestParam(value = "timeZone", defaultValue = "") String timeZone,
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", defaultValue = "20") int pageSize
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

        Account currentAccount = LoginUtil.getLoginAccount(request);
        AlarmCondition condition = new AlarmCondition();
        if (CommonConstants.AccountType.ROOT.getType().equals(currentAccount.getOwnerType())) {

        } else if (CommonConstants.AccountType.CHANNELCOMPANY.getType().equals(currentAccount.getOwnerType())) {
            condition.setChannelCompanyId(currentAccount.getOwnerId());
        } else if (CommonConstants.AccountType.CUSTOMER.getType().equals(currentAccount.getOwnerType())) {
            condition.setCustomerId(currentAccount.getOwnerId());
        }

        condition.setAlarmTimeStart(startTime);
        condition.setAlarmTimeEnd(endTime);

        int total = alarmService.count(condition);
        List<Alarm> alarmList = alarmService.getAlarmList(condition, pageNum, pageSize);
        List<AlarmView> alarmViews = ViewHelper.toAlarmViewList(alarmList);

        PageView<AlarmView> pageView = new PageView<AlarmView>(pageSize, pageNum, total, alarmViews);
        model.addAttribute("page", pageView);

        return "alarm/list";
    }


    @RequestMapping(value = "alarm/r/detail")
    public String list(
            Model model,
            int id
    ) {
        Alarm alarm = alarmService.getById(id);
        if (alarm != null) {
            AlarmView alarmView = new AlarmView(alarm);
            model.addAttribute("alarm", alarmView);
        }
        return "alarm/detail";
    }


    @RequestMapping(value = "alarm/w/ack", method = RequestMethod.POST)
    @ResponseBody
    public Object ack(int id, HttpServletRequest request) {
        try {
            Account account = LoginUtil.getLoginAccount(request);
            return alarmService.ack(id, account);
        } catch (Exception e) {
            LOGGER.error("ack error id={}", id, e);
        }

        return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
    }
}
