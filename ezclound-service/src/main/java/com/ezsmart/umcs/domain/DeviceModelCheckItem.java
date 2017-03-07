package com.ezsmart.umcs.domain;

import java.util.Date;

/**
 * Created by luochunteng on 2016/4/19.
 */
public class DeviceModelCheckItem {
    private int id;
    private String targetDeviceModel;
    private String name;
    private String code;
    private float maxValue;
    private float minValue;
    private float eqValue;
    private String valueType;
    private Date createTime;
    private Date updateTime;

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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
