package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.condition.DeviceModelCheckItemCondition;
import com.ezsmart.umcs.domain.DeviceModelCheckItem;
import com.ezsmart.umcs.persistence.DeviceModelCheckItemMapper;
import com.ezsmart.umcs.services.DeviceModelCheckItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author xiejiayong
 */
@Component
public class DeviceModelCheckItemServiceImpl implements DeviceModelCheckItemService {

    @Autowired
    private DeviceModelCheckItemMapper deviceModelCheckItemMapper;

    @Override
    public List<DeviceModelCheckItem> getList(DeviceModelCheckItemCondition condition) {
        condition = null == condition ? new DeviceModelCheckItemCondition() : condition;

        return deviceModelCheckItemMapper.selectAllByCondition(condition);
    }

    @Override
    public DeviceModelCheckItem getById(int id) {
        return deviceModelCheckItemMapper.selectById(id);
    }
}
