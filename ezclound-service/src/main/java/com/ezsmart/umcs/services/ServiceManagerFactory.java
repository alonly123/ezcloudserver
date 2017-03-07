package com.ezsmart.umcs.services;

import java.util.Map;

import com.ezsmart.umcs.exception.DaoException;

public class ServiceManagerFactory {

    public static String SERVICE_MANAGER_CLASSNAME = "com.ezsmart.umcs.services.impl.ServiceManagerImpl";

    public static ServiceManager getServiceManager(Map<String, String> properties) {
        Class<?> clazz;
        try {
            clazz = Class.forName(SERVICE_MANAGER_CLASSNAME);
            ServiceManager sm = (ServiceManager) clazz.newInstance();
            sm.init(properties);
            return sm;
        } catch (Exception e) {
            e.printStackTrace();
            throw new DaoException(e.getMessage(), e);
        }
    }
}
