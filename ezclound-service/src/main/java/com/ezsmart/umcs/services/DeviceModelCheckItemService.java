package com.ezsmart.umcs.services;

import com.ezsmart.umcs.condition.DeviceModelCheckItemCondition;
import com.ezsmart.umcs.domain.DeviceModelCheckItem;

import java.util.List;

public interface DeviceModelCheckItemService {

    List<DeviceModelCheckItem> getList(DeviceModelCheckItemCondition condition);

    DeviceModelCheckItem getById(int id);
}