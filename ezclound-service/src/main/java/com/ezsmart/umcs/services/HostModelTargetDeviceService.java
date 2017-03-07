package com.ezsmart.umcs.services;

import com.ezsmart.umcs.condition.HostModelTargetDeviceCondition;
import com.ezsmart.umcs.domain.HostModelTargetDevice;

import java.util.List;

public interface HostModelTargetDeviceService {

    public HostModelTargetDevice getById(int id);

    public List<HostModelTargetDevice> getList(HostModelTargetDeviceCondition condition);

    public HostModelTargetDevice getByPortCodeTDModel(String portCode, String targetDeviceModel);
}