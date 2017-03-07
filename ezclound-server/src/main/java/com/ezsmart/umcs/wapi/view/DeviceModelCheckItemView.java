package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.DeviceModelCheckItem;
import com.ezsmart.umcs.util.ServiceUtil;

/**
 * Created by luochunteng on 2016/4/19.
 */
public class DeviceModelCheckItemView {
    private int id;
    private String targetDeviceModel;
    private String name;
    private String code;
    private float maxValue;
    private float minValue;
    private float eqValue;
    private String valueType;
    private String createTime;
    private String updateTime;

    public DeviceModelCheckItemView() {
    }

    public DeviceModelCheckItemView(DeviceModelCheckItem deviceModelCheckItem) {
        if (null == deviceModelCheckItem) {
            throw new NullPointerException("deviceModelCheckItem is null");
        }
        this.id = deviceModelCheckItem.getId();
        this.targetDeviceModel = deviceModelCheckItem.getTargetDeviceModel();
        this.name = deviceModelCheckItem.getName();
        this.code = deviceModelCheckItem.getCode();
        this.maxValue = deviceModelCheckItem.getMaxValue();
        this.minValue = deviceModelCheckItem.getMinValue();
        this.eqValue = deviceModelCheckItem.getEqValue();
        this.valueType = deviceModelCheckItem.getValueType();
        this.createTime = ServiceUtil.formatDate(deviceModelCheckItem.getCreateTime());
        this.updateTime = ServiceUtil.formatDate(deviceModelCheckItem.getUpdateTime());
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public float getMaxValue() {
        return maxValue;
    }

    public void setMaxValue(float maxValue) {
        this.maxValue = maxValue;
    }

    public float getMinValue() {
        return minValue;
    }

    public void setMinValue(float minValue) {
        this.minValue = minValue;
    }

    public float getEqValue() {
        return eqValue;
    }

    public void setEqValue(float eqValue) {
        this.eqValue = eqValue;
    }

    public String getValueType() {
        return valueType;
    }

    public void setValueType(String valueType) {
        this.valueType = valueType;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
