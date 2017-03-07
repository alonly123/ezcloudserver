package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.HostModelTargetDevice;
import com.ezsmart.umcs.util.ServiceUtil;

/**
 * Created by luochunteng on 2016/4/19.
 */
public class HostModelTargetDeviceView {
    private int id;
    private String portUcode;
    private String deviceModel;
    private String name;
    private String deviceType;
    private int addr;
    private String createTime;
    private String updateTime;

    public HostModelTargetDeviceView() {
    }

    public HostModelTargetDeviceView(HostModelTargetDevice hostModelTargetDevice) {
        if (null == hostModelTargetDevice) {
            throw new NullPointerException("hostModelTargetDevice is null");
        }

        this.id = hostModelTargetDevice.getId();
        this.portUcode = hostModelTargetDevice.getPortUcode();
        this.deviceModel = hostModelTargetDevice.getDeviceModel();
        this.name = hostModelTargetDevice.getName();
        this.deviceType = hostModelTargetDevice.getDeviceType();
        this.addr = hostModelTargetDevice.getAddr();
        this.createTime = ServiceUtil.formatDate(hostModelTargetDevice.getCreateTime());
        this.updateTime = ServiceUtil.formatDate(hostModelTargetDevice.getUpdateTime());
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPortUcode() {
        return portUcode;
    }

    public void setPortUcode(String portUcode) {
        this.portUcode = portUcode;
    }

    public String getDeviceModel() {
        return deviceModel;
    }

    public void setDeviceModel(String deviceModel) {
        this.deviceModel = deviceModel;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    public int getAddr() {
        return addr;
    }

    public void setAddr(int addr) {
        this.addr = addr;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
}
