package com.ezsmart.umcs.services;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.TargetDeviceModelCondition;
import com.ezsmart.umcs.domain.TargetDeviceModel;

import java.util.List;

public interface TargetDeviceModelService {
    List<TargetDeviceModel> getList(TargetDeviceModelCondition condition, int pageNum, int pageSize);

    int count(TargetDeviceModelCondition condition);

    BasicResult save(TargetDeviceModel targetDeviceModel);

    BasicResult delete(int id);

    TargetDeviceModel getById(int id);

    TargetDeviceModel getByModel(String model);

    List<TargetDeviceModel> getList(TargetDeviceModelCondition targetDeviceModelCondition);
}