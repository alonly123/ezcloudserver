package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.TargetDeviceCondition;
import com.ezsmart.umcs.domain.*;
import com.ezsmart.umcs.persistence.*;
import com.ezsmart.umcs.services.TargetDeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * Created by Administrator on 2016/5/9 0009.
 */
@Component
public class TargetDeviceServiceImpl implements TargetDeviceService {
    @Autowired
    private TargetDeviceMapper targetDeviceDao;

    @Autowired
    private PublicSequenceMapper publicSequenceDao;

    @Autowired
    private DeviceModelCheckItemMapper deviceModelCheckItemDao;

    @Autowired
    private DeviceModelCheckCommandMapper deviceModelCheckCommandDao;
    @Autowired
    private CheckCommandMapper checkCommandDao;
    @Autowired
    private CheckItemMapper checkItemDao;

    @Override
    public List<TargetDevice> getTargetDeviceListByCondition(TargetDeviceCondition targetDeviceCondition, int pageNum, int pageSize) {
        if (targetDeviceCondition == null) {
            targetDeviceCondition = new TargetDeviceCondition();
        }
        targetDeviceCondition.setStartIndex((pageNum - 1) * pageSize + 1);
        targetDeviceCondition.setEndIndex(pageNum * pageSize + 1);
        return targetDeviceDao.getTargetDeviceListByCondition(targetDeviceCondition);
    }

    @Override
    public int count(TargetDeviceCondition targetDeviceCondition) {
        targetDeviceCondition = null == targetDeviceCondition ? new TargetDeviceCondition() : targetDeviceCondition;
        return targetDeviceDao.countByCondition(targetDeviceCondition);
    }

    @Override
    public TargetDevice getTargetDeviceById(int id) {
        return targetDeviceDao.selectById(id);
    }

    @Override
    public TargetDevice getTargetDeviceByCode(String code) {
        return targetDeviceDao.selectByCode(code);
    }


    @Override
    public BasicResult addTargetDevice(TargetDevice targetDevice) {
        if (targetDevice == null) {

        }
        int targetDeviceId = publicSequenceDao.getSeq();
        targetDevice.setId(targetDeviceId);
        targetDeviceDao.insert(targetDevice);
        String targetDeviceModel = targetDevice.getModel();
        String hostUcode = targetDevice.getHostucode();
        List<DeviceModelCheckItem> deviceModelCheckItemList = deviceModelCheckItemDao.selectByModel(targetDeviceModel);
        List<DeviceModelCheckCommand> deviceModelCheckCommandList = deviceModelCheckCommandDao.selectByModel(targetDeviceModel);
        if (!CollectionUtils.isEmpty(deviceModelCheckItemList)) {
            for (DeviceModelCheckItem deviceModelCheckItem : deviceModelCheckItemList) {
                CheckItem checkItem = getCheckItem(deviceModelCheckItem.getName(), hostUcode, targetDevice.getId(), targetDevice.getModel(), deviceModelCheckItem.getValueType(), deviceModelCheckItem.getCode());
                checkItemDao.insert(checkItem);
            }
        }
        if (!CollectionUtils.isEmpty(deviceModelCheckCommandList)) {
            for (DeviceModelCheckCommand deviceModelCheckCommand : deviceModelCheckCommandList) {
                CheckCommand checkCommand = getCheckCommand(deviceModelCheckCommand.getName(), hostUcode, deviceModelCheckCommand.getValueType(), targetDevice.getId(), targetDevice.getModel());
                checkCommandDao.insert(checkCommand);
            }
        }
        return new BasicResult(true);
    }

    private CheckItem getCheckItem(String itemName, String hostCode, int deviceId, String deviceModel, String valueType, String code) {
        CheckItem checkItem = new CheckItem();
        checkItem.setCode(code);
        checkItem.setId(publicSequenceDao.getSeq());
        checkItem.setHostUCode(hostCode);
        checkItem.setTargetDeviceId(deviceId);
        checkItem.setTargetDeviceModel(deviceModel);
        checkItem.setName(itemName);
        checkItem.setValueType(valueType);

        return checkItem;
    }

    private CheckCommand getCheckCommand(String commandName, String hostCode, String valueType, int deviceId, String deviceModel) {
        CheckCommand checkCommand = new CheckCommand();
        checkCommand.setId(publicSequenceDao.getSeq());
        checkCommand.setName(commandName);
        checkCommand.setTargetDeviceId(deviceId);
        checkCommand.setTargetDeviceModel(deviceModel);
        checkCommand.setValueType(valueType);
        checkCommand.setHostucode(hostCode);
        return checkCommand;
    }

    @Override
    public BasicResult updateTargetDevice(TargetDevice targetDevice) {
        targetDeviceDao.update(targetDevice.getName(), targetDevice.getCode(),targetDevice.getUpdatetime(), targetDevice.getId());
        return new BasicResult(true);
    }

    @Override
    public BasicResult deleteTargetDevice(int id) {
        targetDeviceDao.delete(id);
        checkItemDao.deleteByTargetDeviceId(id);
        checkCommandDao.delete(id);
        return new BasicResult(true);
    }

    @Override
    public List<TargetDevice> getTargetDeviceListByPortUCode(String portCode) {
        return targetDeviceDao.selectByPortUCode(portCode);
    }
}
