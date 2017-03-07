package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.MonitorHostCondition;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.*;
import com.ezsmart.umcs.persistence.*;
import com.ezsmart.umcs.services.MonitorHostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.*;

/**
 * 设备服务
 */
@Component
public class MonitorHostServiceImpl implements MonitorHostService {

    @Autowired
    private MonitorHostMapper monitorHostDao;

    @Autowired
    private PublicSequenceMapper publicSequenceDao;

    @Autowired
    private HostModelPortMapper hostModelPortDao;
    @Autowired
    private HostPortMapper hostPortDao;
    @Autowired
    private HostModelTargetDeviceMapper hostModelTargetDeviceDao;
    @Autowired
    private TargetDeviceMapper targetDeviceDao;
    @Autowired
    private DeviceModelCheckItemMapper deviceModelCheckItemDao;
    @Autowired
    private CheckItemMapper checkItemDao;
    @Autowired
    private DeviceModelCheckCommandMapper deviceModelCheckCommandDao;
    @Autowired
    private CheckCommandMapper checkCommandDao;


    @Override
    public int countMonitorHost(MonitorHostCondition condition) {
        condition = null == condition ? new MonitorHostCondition() : condition;

        return monitorHostDao.countByCondition(condition);
    }

    @Override
    public int countChannelCompany(MonitorHostCondition condition) {
        condition = null == condition ? new MonitorHostCondition() : condition;

        return monitorHostDao.countChannelByCondition(condition);
    }

    @Override
    public int countCustomer(MonitorHostCondition condition) {
        condition = null == condition ? new MonitorHostCondition() : condition;

        return monitorHostDao.countCustomerByCondition(condition);
    }

    @Override
    public List<MonitorHost> getMonitorHostListByCondition(MonitorHostCondition condition, int pageNum, int pageSize) {
        if (condition == null) {
            condition = new MonitorHostCondition();
        }
        condition.setStartIndex((pageNum - 1) * pageSize + 1);
        condition.setEndIndex(pageNum * pageSize + 1);
        return monitorHostDao.selectListByCondition(condition);
    }

    @Override
    public BasicResult deleteMonitor(int id) {
        MonitorHost monitorHost = monitorHostDao.selectById(id);
        if (monitorHost == null) {
            return new BasicResult(false, ReturnConstants.MONITOR_HOST_NOT_EXIST.getCode(), ReturnConstants.MONITOR_HOST_NOT_EXIST.getMessage());
        }
        monitorHostDao.delete(id);
        String hostUcode = monitorHost.getUcode();
        hostPortDao.deleteByHostCode(hostUcode);
        targetDeviceDao.deleteByHostCode(hostUcode);
        checkItemDao.deleteByHostCode(hostUcode);
        checkCommandDao.deleteByHostCode(hostUcode);
        return new BasicResult(true);
    }

    @Override
    public BasicResult addMonitorHost(MonitorHost monitorHost) {
        monitorHost.setId(publicSequenceDao.getSeq());
        monitorHostDao.insert(monitorHost);
        copyRelativeInfo(monitorHost);
        return new BasicResult(true);
    }

    private void copyRelativeInfo(MonitorHost monitorHost) {
        String hostModel = monitorHost.getModel();
        String hostUcode = monitorHost.getUcode();
        List<HostModelPort> hostModelPortList = hostModelPortDao.selectByHostModel(hostModel);
        if (!CollectionUtils.isEmpty(hostModelPortList)) {
            List<HostPort> hostPortList = new ArrayList<HostPort>();
            HostPort hostPort;
            List<HostModelTargetDevice> hostModelTargetDevices;
            for (HostModelPort hostModelPort : hostModelPortList) {
                HostPort hostPort_old = hostPortDao.selectByUcode(hostUcode + "." + hostModelPort.getUcode());
                if (hostPort_old != null) {
                    continue;
                }
                hostPort = getHostPort(hostUcode, hostModelPort);
                //加 port
                hostPortDao.insert(hostPort);
                hostPortList.add(hostPort);
                // 加 device
                List<TargetDevice> targetDeviceList = targetDeviceDao.selectByPortUCode(hostPort.getUcode());
                if (!CollectionUtils.isEmpty(targetDeviceList)) {
                    continue;
                }
                hostModelTargetDevices = hostModelTargetDeviceDao.selectByPortUcode(hostModelPort.getUcode());
                if (CollectionUtils.isEmpty(hostModelPortList)) {
                    continue;
                }
                targetDeviceList = new ArrayList<TargetDevice>();
                for (HostModelTargetDevice hostModelTargetDevice : hostModelTargetDevices) {
                    TargetDevice targetDevice = getTargetDevice(hostModelTargetDevice, hostUcode, hostPort.getUcode());
                    targetDeviceDao.insert(targetDevice);
                    targetDeviceList.add(targetDevice);

                    List<DeviceModelCheckItem> deviceModelCheckItemList = deviceModelCheckItemDao.selectByModel(hostModelTargetDevice.getDeviceModel());
                    if (CollectionUtils.isEmpty(deviceModelCheckItemList)) {
                        continue;
                    }
                    for (DeviceModelCheckItem deviceModelCheckItem : deviceModelCheckItemList) {
                        CheckItem checkItem = getCheckItem(deviceModelCheckItem.getName(), hostUcode, targetDevice.getId(), targetDevice.getModel(),deviceModelCheckItem.getValueType(),deviceModelCheckItem.getCode());
                        checkItemDao.insert(checkItem);
                    }

                    List<DeviceModelCheckCommand> deviceModelCheckCommandList = deviceModelCheckCommandDao.selectByModel(hostModelTargetDevice.getDeviceModel());
                    if (CollectionUtils.isEmpty(deviceModelCheckCommandList)) {
                        continue;
                    }
                    for (DeviceModelCheckCommand deviceModelCheckCommand : deviceModelCheckCommandList) {
                        CheckCommand checkCommand = getCheckCommand(deviceModelCheckCommand.getName(), hostUcode, deviceModelCheckCommand.getValueType(), targetDevice.getId(), targetDevice.getModel());
                        checkCommandDao.insert(checkCommand);
                    }
                }
            }
        }
    }

    private HostPort getHostPort(String hostCode, HostModelPort hostModelPort) {
        HostPort hostPort = new HostPort();
        hostPort.setId(publicSequenceDao.getSeq());
        hostPort.setHostUCode(hostCode);
        hostPort.setName(hostModelPort.getName());
        hostPort.setUcode(hostCode + "." + hostModelPort.getUcode());
        hostPort.setSpec(hostModelPort.getSpec());
        return hostPort;
    }

    private TargetDevice getTargetDevice(HostModelTargetDevice hostModelTargetDevice, String hostUcode, String portUcode) {
        TargetDevice targetDevice = new TargetDevice();
        targetDevice.setId(publicSequenceDao.getSeq());
        targetDevice.setHostucode(hostUcode);
        targetDevice.setName(hostModelTargetDevice.getName());
        targetDevice.setAddr(hostModelTargetDevice.getAddr());
        targetDevice.setPortUCode(portUcode);
        targetDevice.setModel(hostModelTargetDevice.getDeviceModel());
        targetDevice.setDeviceType(hostModelTargetDevice.getDeviceType());
        targetDevice.setCheckInterval(3);
        targetDevice.setCode("");
        targetDevice.setGraphX(0);
        targetDevice.setGraphY(0);
        targetDevice.setLastCheck(new Date());
        targetDevice.setPhyState("0");
        targetDevice.setState("0");
        targetDevice.setUse(0);

        return targetDevice;
    }

    private CheckItem getCheckItem(String itemName, String hostCode, int deviceId, String deviceModel,String  valueType,String code) {
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
    public BasicResult updateMonitorHost(MonitorHost monitorHost) {
        monitorHostDao.update(monitorHost);
        return new BasicResult(true);
    }

    @Override
    public MonitorHost getMonitorHostById(int id) {
        return monitorHostDao.selectById(id);
    }

    @Override
    public MonitorHost getMonitorHostByUcode(String ucode) {
        return monitorHostDao.selectByUcode(ucode);
    }
}
