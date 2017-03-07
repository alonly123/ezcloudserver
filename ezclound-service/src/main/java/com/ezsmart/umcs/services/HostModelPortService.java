package com.ezsmart.umcs.services;

import com.ezsmart.umcs.condition.HostModelPortCondition;
import com.ezsmart.umcs.domain.HostModelPort;

import java.util.List;

public interface HostModelPortService {

    public HostModelPort getById(int id);

    public List<HostModelPort> getList(HostModelPortCondition condition);

    public List<HostModelPort> getList(HostModelPortCondition condition, int pageNum, int pageSize);

    public int count(HostModelPortCondition condition);

}