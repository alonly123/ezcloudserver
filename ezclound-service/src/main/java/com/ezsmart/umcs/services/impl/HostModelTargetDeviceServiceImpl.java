package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.condition.HostModelTargetDeviceCondition;
import com.ezsmart.umcs.domain.HostModelTargetDevice;
import com.ezsmart.umcs.persistence.HostModelTargetDeviceMapper;
import com.ezsmart.umcs.services.HostModelTargetDeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author xiejiayong
 */
@Component
public class HostModelTargetDeviceServiceImpl implements HostModelTargetDeviceService {

    @Autowired
    private HostModelTargetDeviceMapper hostModelTargetDeviceMapper;

    @Override
    public HostModelTargetDevice getById(int id) {
        return hostModelTargetDeviceMapper.selectById(id);
    }

    @Override
    public List<HostModelTargetDevice> getList(HostModelTargetDeviceCondition condition) {
        return hostModelTargetDeviceMapper.selectAllByCondtion(condition);
    }

    @Override
    public HostModelTargetDevice getByPortCodeTDModel(String portCode, String targetDeviceModel) {
        return hostModelTargetDeviceMapper.selectByPortUcodeTDModel(portCode, targetDeviceModel);
    }


}
