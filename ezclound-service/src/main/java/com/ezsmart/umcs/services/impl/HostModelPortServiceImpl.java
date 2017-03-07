package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.condition.HostModelCondition;
import com.ezsmart.umcs.condition.HostModelPortCondition;
import com.ezsmart.umcs.domain.HostModel;
import com.ezsmart.umcs.domain.HostModelPort;
import com.ezsmart.umcs.persistence.HostModelMapper;
import com.ezsmart.umcs.persistence.HostModelPortMapper;
import com.ezsmart.umcs.services.HostModelPortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author xiejiayong
 */
@Component
public class HostModelPortServiceImpl implements HostModelPortService {

    @Autowired
    private HostModelPortMapper hostModelPortMapper;

    @Override
    public HostModelPort getById(int id) {
        return hostModelPortMapper.selectById(id);
    }

    @Override
    public List<HostModelPort> getList(HostModelPortCondition condition) {
        return hostModelPortMapper.selectAllByCondtion(condition);
    }

    @Override
    public List<HostModelPort> getList(HostModelPortCondition condition, int pageNum, int pageSize) {
        return null;
    }

    @Override
    public int count(HostModelPortCondition condition) {
        return 0;
    }

}
