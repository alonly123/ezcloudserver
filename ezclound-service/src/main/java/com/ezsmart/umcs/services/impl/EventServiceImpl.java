package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.condition.EventCondition;
import com.ezsmart.umcs.domain.Event;
import com.ezsmart.umcs.persistence.EventMapper;
import com.ezsmart.umcs.services.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class EventServiceImpl implements EventService {

    @Autowired
    private EventMapper eventMapper;

    @Override
    public List<Event> getEvents() {
        return null;
    }

    @Override
    public int count(EventCondition condition) {
        condition = null == condition ? new EventCondition() : condition;

        return eventMapper.countByCondition(condition);
    }

    @Override
    public List<Event> getEventList(EventCondition condition, int pageNum, int pageSize) {
        condition = null == condition ? new EventCondition() : condition;

        condition.setStartIndex((pageNum - 1) * pageSize + 1);
        condition.setEndIndex(pageNum * pageSize + 1);

        return eventMapper.selectListByCondition(condition);
    }

    @Override
    public Event getById(int id) {
        return eventMapper.selectById(id);
    }
}
