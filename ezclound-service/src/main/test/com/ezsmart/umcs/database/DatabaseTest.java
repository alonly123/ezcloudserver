package com.ezsmart.umcs.database;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ezsmart.umcs.domain.Event;
import com.ezsmart.umcs.services.ServiceManager;
import com.ezsmart.umcs.services.ServiceManagerFactory;

public class DatabaseTest {

    public static void main(String[] args) {
        Map<String, String> properties = new HashMap<String, String>();
        properties.put("url", "jdbc:oracle:thin:@117.27.146.10:5211:jksj");
        properties.put("driverClassName", "oracle.jdbc.driver.OracleDriver");
        properties.put("username", "yzznx");
        properties.put("password", "yzznx_ver_123");
        ServiceManager sm = ServiceManagerFactory.getServiceManager(properties);
        // SessionFactoryManager.initSessionFactory(properties);
        System.out.println("init ok");
        List<Event> events = sm.getEventService().getEvents();
        for (Event evt : events) {
            System.out.println(evt.getName());
        }
        events = sm.getEventService().getEvents();
        for (Event evt : events) {
            System.out.println(evt.getName());
        }

    }

}
