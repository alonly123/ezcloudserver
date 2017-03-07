package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.DeviceModelCheckCommand;
import com.ezsmart.umcs.util.ServiceUtil;

/**
 * Created by luochunteng on 2016/4/19.
 */
public class DeviceModelCheckCommandView {
    private int id;
    private String code;
    private String targetDeviceModel;
    private String name;
    private String value;
    private String valueType;
    private String param;
    private String createTime;
    private String updateTime;

    public DeviceModelCheckCommandView() {
    }

    public DeviceModelCheckCommandView(DeviceModelCheckCommand deviceModelCheckCommand) {
        this.id = deviceModelCheckCommand.getId();
        this.code = deviceModelCheckCommand.getCode();
        this.targetDeviceModel = deviceModelCheckCommand.getTargetDeviceModel();
        this.name = deviceModelCheckCommand.getName();
        this.value = deviceModelCheckCommand.getValue();
        this.valueType = deviceModelCheckCommand.getValueType();
        this.param = deviceModelCheckCommand.getParam();
        this.createTime = ServiceUtil.formatDate(deviceModelCheckCommand.getCreateTime());
        this.updateTime = ServiceUtil.formatDate(deviceModelCheckCommand.getUpdateTime());
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTargetDeviceModel() {
        return targetDeviceModel;
    }

    public void setTargetDeviceModel(String targetDeviceModel) {
        this.targetDeviceModel = targetDeviceModel;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getValueType() {
        return valueType;
    }

    public void setValueType(String valueType) {
        this.valueType = valueType;
    }

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
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
