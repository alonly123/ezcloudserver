package com.ezsmart.umcs.wapi.web.controller;

import com.ezsmart.umcs.condition.SmsTaskCondition;
import com.ezsmart.umcs.domain.SmsTask;
import com.ezsmart.umcs.services.impl.SmsTaskServiceImpl;
import com.ezsmart.umcs.util.ServiceUtil;
import com.ezsmart.umcs.wapi.util.ViewHelper;
import com.ezsmart.umcs.wapi.view.PageView;
import com.ezsmart.umcs.wapi.view.SmsTaskView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

/**
 * Created by lixiangyang on 16/5/4.
 */
@Controller
public class SmsTaskController {
    private static final Logger LOGGER = LoggerFactory.getLogger(SmsTaskController.class);

    @Autowired
    private SmsTaskServiceImpl smsTaskService;

    @RequestMapping(value = "admin/SmsTask/r/list")
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

        SmsTaskCondition condition = new SmsTaskCondition();
        condition.setEventTimeStart(startTime);
        condition.setEventTimeEnd(endTime);

        int total = smsTaskService.count(condition);
        List<SmsTask> smsTasks = smsTaskService.getSmsTaskList(condition, pageNum, pageSize);
        List<SmsTaskView> smsTaskViews = ViewHelper.toSmsTaskViewList(smsTasks);

        PageView<SmsTaskView> pageView = new PageView<SmsTaskView>(pageSize, pageNum, total, smsTaskViews);
        model.addAttribute("page", pageView);

        return "admin/sms_task/list";
    }


    @RequestMapping(value = "admin/SmsTask/r/detail")
    public String list(
            Model model,
            int id
    ) {
        SmsTask smsTask = smsTaskService.getById(id);
        if (smsTask != null) {
            SmsTaskView smsTaskView = new SmsTaskView(smsTask);
            model.addAttribute("smsTask", smsTaskView);
        }
        return "admin/sms_task/detail";
    }

}
