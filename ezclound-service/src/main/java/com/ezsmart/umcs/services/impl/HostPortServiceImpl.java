package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.domain.HostPort;
import com.ezsmart.umcs.persistence.HostPortMapper;
import com.ezsmart.umcs.services.HostPortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by luochunteng on 2016/5/9 0009.
 */
@Component
public class HostPortServiceImpl implements HostPortService {
    @Autowired
    private HostPortMapper hostPortDao;

    @Override
    public HostPort getHostPortById(int id) {
        return hostPortDao.selectById(id);
    }

    @Override
    public HostPort getHostPortByUCode(String code) {
        return hostPortDao.selectByUcode(code);
    }

    @Override
    public List<HostPort> getHostPortListByHostCode(String hostUcode) {
        return hostPortDao.selectByHostUcode(hostUcode);
    }
}
