package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.CheckItem;
import com.ezsmart.umcs.wapi.util.Util;

import java.util.Date;

/**
 * @author luochunteng
 */

public class CheckItemView {

    private int id;
    private int targetDeviceId;
    private String hostUCode;
    private String targetDeviceModel;
    private String name;
    private String code ;
    private int eqValue = 0;
    private double maxValue = 0;
    private double minValue = 0;
    private String valueType;
    private String createtime;
    private String updatetime;

    public CheckItemView(CheckItem checkItem) {
        this.id = checkItem.getId();
        this.targetDeviceId = checkItem.getTargetDeviceId();
        this.targetDeviceModel = checkItem.getTargetDeviceModel();
        this.hostUCode = checkItem.getHostUCode();
        this.name = checkItem.getName();
        this.code = checkItem.getCode();
        this.eqValue = checkItem.getEqValue();
        this.maxValue = checkItem.getMaxValue();
        this.minValue = checkItem.getMinValue();
        this.valueType = checkItem.getValueType();
        this.createtime = Util.formatDate(checkItem.getCreatetime());
        this.updatetime = Util.formatDate(checkItem.getUpdatetime());
    }

    public int getTargetDeviceId() {
        return targetDeviceId;
    }

    public void setTargetDeviceId(int targetDeviceId) {
        this.targetDeviceId = targetDeviceId;
    }

    public String getHostUCode() {
        return hostUCode;
    }

    public void setHostUCode(String hostUCode) {
        this.hostUCode = hostUCode;
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

    public int getEqValue() {
        return eqValue;
    }

    public void setEqValue(int eqValue) {
        this.eqValue = eqValue;
    }

    public double getMaxValue() {
        return maxValue;
    }

    public void setMaxValue(double maxValue) {
        this.maxValue = maxValue;
    }

    public double getMinValue() {
        return minValue;
    }

    public void setMinValue(double minValue) {
        this.minValue = minValue;
    }

    public String getValueType() {
        return valueType;
    }

    public void setValueType(String valueType) {
        this.valueType = valueType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }
}
