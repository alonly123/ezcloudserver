package com.ezsmart.umcs.services;

import com.ezsmart.umcs.condition.HostModelCondition;
import com.ezsmart.umcs.domain.HostModel;

import java.util.List;

public interface HostModelService {

    public HostModel getById(int id);

    public List<HostModel> getList(HostModelCondition hostModelCondition, int pageNum, int pageSize);

    public int count(HostModelCondition condition);

    public HostModel getByModel(String model);

}