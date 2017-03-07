package com.ezsmart.umcs.services;

import com.ezsmart.umcs.condition.DeviceModelCheckCommandCondition;
import com.ezsmart.umcs.domain.DeviceModelCheckCommand;

import java.util.List;

public interface DeviceModelCheckCommandService {

    List<DeviceModelCheckCommand> getList(DeviceModelCheckCommandCondition condition);
}