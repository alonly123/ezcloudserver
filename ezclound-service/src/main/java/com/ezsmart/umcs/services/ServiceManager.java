package com.ezsmart.umcs.services;

import java.util.Map;

public interface ServiceManager {

    public void init(Map<String, String> properties);

    public EventService getEventService();
}
