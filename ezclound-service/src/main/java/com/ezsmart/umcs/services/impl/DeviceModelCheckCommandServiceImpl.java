package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.condition.DeviceModelCheckCommandCondition;
import com.ezsmart.umcs.condition.DeviceModelCheckItemCondition;
import com.ezsmart.umcs.domain.DeviceModelCheckCommand;
import com.ezsmart.umcs.persistence.DeviceModelCheckCommandMapper;
import com.ezsmart.umcs.services.DeviceModelCheckCommandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author xiejiayong
 */
@Component
public class DeviceModelCheckCommandServiceImpl implements DeviceModelCheckCommandService {

    @Autowired
    private DeviceModelCheckCommandMapper deviceModelCheckCommandMapper;

    @Override
    public List<DeviceModelCheckCommand> getList(DeviceModelCheckCommandCondition condition) {
        condition = null == condition ? new DeviceModelCheckCommandCondition() : condition;

        return deviceModelCheckCommandMapper.selectAllByCondition(condition);
    }
}
