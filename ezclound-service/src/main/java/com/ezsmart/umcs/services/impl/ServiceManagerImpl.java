package com.ezsmart.umcs.services.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;

import com.ezsmart.umcs.dao.SessionFactoryManager;
import com.ezsmart.umcs.services.EventService;
import com.ezsmart.umcs.services.ServiceManager;

public class ServiceManagerImpl implements ServiceManager {

    private boolean m_inited = false;

    private SqlSessionFactory m_sqlSessionFactory = null;
    private EventServiceImpl m_eventService;
    private AccountServiceImpl m_accountService;

    @Override
    public synchronized void init(Map<String, String> properties) {

    }

    public EventService getEventService() {
        return m_eventService;
    }

    public SqlSessionFactory getSqlSessionFactory() {
        return m_sqlSessionFactory;
    }

}
