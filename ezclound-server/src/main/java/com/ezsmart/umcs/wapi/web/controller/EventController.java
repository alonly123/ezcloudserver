package com.ezsmart.umcs.wapi.web.controller;

import com.ezsmart.umcs.condition.EventCondition;
import com.ezsmart.umcs.domain.Event;
import com.ezsmart.umcs.services.impl.EventServiceImpl;
import com.ezsmart.umcs.util.ServiceUtil;
import com.ezsmart.umcs.wapi.util.ViewHelper;
import com.ezsmart.umcs.wapi.view.EventView;
import com.ezsmart.umcs.wapi.view.PageView;
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
public class EventController {
    private static final Logger LOGGER = LoggerFactory.getLogger(EventController.class);

    @Autowired
    private EventServiceImpl eventService;

    @RequestMapping(value = "admin/event/r/list")
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

        EventCondition condition = new EventCondition();
        condition.setEventTimeStart(startTime);
        condition.setEventTimeEnd(endTime);

        int total = eventService.count(condition);
        List<Event> eventList = eventService.getEventList(condition, pageNum, pageSize);
        List<EventView> eventViewList = ViewHelper.toEventList(eventList);

        PageView<EventView> pageView = new PageView<EventView>(pageSize, pageNum, total, eventViewList);
        model.addAttribute("page", pageView);

        return "admin/event/list";
    }


    @RequestMapping(value = "admin/event/r/detail")
    public String list(
            Model model,
            int id
    ) {
        Event event = eventService.getById(id);
        if (event != null) {
            EventView eventView = new EventView(event);
            model.addAttribute("event", eventView);
        }
        return "admin/event/detail";
    }

}
