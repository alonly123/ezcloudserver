package com.ezsmart.umcs.services;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.TargetDeviceCondition;
import com.ezsmart.umcs.domain.TargetDevice;

import java.util.List;

/**
 * Created by luochunteng on 2016/5/9 0009.
 */
public interface TargetDeviceService {

    public List<TargetDevice> getTargetDeviceListByCondition(TargetDeviceCondition targetDeviceCondition, int pageNum, int pageSize);

    public int count(TargetDeviceCondition targetDeviceCondition);

    public TargetDevice getTargetDeviceById(int id);

    public TargetDevice getTargetDeviceByCode(String code);

    public BasicResult addTargetDevice(TargetDevice targetDevice);

    public BasicResult updateTargetDevice(TargetDevice targetDevice);

    public BasicResult deleteTargetDevice(int id);

    public List<TargetDevice> getTargetDeviceListByPortUCode(String portCode);

}
