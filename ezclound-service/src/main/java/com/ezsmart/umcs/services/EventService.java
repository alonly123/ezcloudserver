package com.ezsmart.umcs.services;

import com.ezsmart.umcs.condition.EventCondition;
import com.ezsmart.umcs.domain.Event;

import java.util.List;

public interface EventService {

    public List<Event> getEvents();

    public int count(EventCondition condition);

    public List<Event> getEventList(EventCondition condition, int pageNum, int pageSize);

    public Event getById(int id);
}
