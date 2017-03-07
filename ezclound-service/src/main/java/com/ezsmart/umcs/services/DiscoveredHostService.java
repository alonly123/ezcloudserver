package com.ezsmart.umcs.services;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.domain.DiscoveredHost;

import java.util.List;

/**
 * Created by luochunteng on 2016/5/11.
 */
public interface DiscoveredHostService {
    public BasicResult addHost(DiscoveredHost discoveredHost);

    public BasicResult deleteHost(String id);

    public List<DiscoveredHost> getDiscoveredHostByKeyword(String key, int pageNum, int pageSize);

    public DiscoveredHost getDiscoveredHostById(int id);

    public int count(String key);

}
