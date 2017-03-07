package com.ezsmart.umcs.services;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.MonitorHostCondition;
import com.ezsmart.umcs.domain.MonitorHost;

import java.util.List;

/**
 * Created by luochunteng on 2016/4/15.
 */
public interface MonitorHostService {

    public int countMonitorHost(MonitorHostCondition condition);

    public int countChannelCompany(MonitorHostCondition condition);

    public int countCustomer(MonitorHostCondition condition);

    public List<MonitorHost> getMonitorHostListByCondition(MonitorHostCondition condition, int pageNum, int pageSize);

    public BasicResult deleteMonitor(int id);

    public BasicResult addMonitorHost(MonitorHost monitorHost);

    public BasicResult updateMonitorHost(MonitorHost monitorHost);

    public MonitorHost getMonitorHostById(int id);

    public MonitorHost getMonitorHostByUcode(String ucode);
}
