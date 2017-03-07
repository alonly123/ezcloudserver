package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.domain.DiscoveredHost;
import com.ezsmart.umcs.persistence.DiscoveredHostMapper;
import com.ezsmart.umcs.services.DiscoveredHostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by luochunteng on 2016/5/11.
 */
@Component
public class DiscoveredHostServiceImpl implements DiscoveredHostService {

    @Autowired
    private DiscoveredHostMapper discoveredHostDao;

    @Override
    public BasicResult addHost(DiscoveredHost discoveredHost) {
        return new BasicResult(true);
    }

    @Override
    public BasicResult deleteHost(String  hostcode) {
        discoveredHostDao.deleteByCode(hostcode);
        return new BasicResult(true);
    }

    @Override
    public List<DiscoveredHost> getDiscoveredHostByKeyword(String key, int pageNum, int pageSize) {
        return discoveredHostDao.selectListByKeyword( (pageNum - 1) * pageSize + 1,
                pageNum * pageSize + 1);
    }

    @Override
    public DiscoveredHost getDiscoveredHostById(int id) {
        return discoveredHostDao.selectById(id);
    }

    @Override
    public int count(String key) {
        return discoveredHostDao.countByKeyword();
    }
}
