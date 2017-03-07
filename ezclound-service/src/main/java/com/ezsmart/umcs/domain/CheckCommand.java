package com.ezsmart.umcs.domain;

import java.util.Date;

public class CheckCommand {

    private int id;
    private int targetDeviceId;
    private String targetDeviceModel;
    private String name;
    private String value = "";
    private String valueType;
    private String param = "";
    private String hostucode = "";
    private Date createtime = new Date();
    private Date updatetime = new Date();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTargetDeviceId() {
        return targetDeviceId;
    }

    public void setTargetDeviceId(int targetDeviceId) {
        this.targetDeviceId = targetDeviceId;
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

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }

    public String getHostucode() {
        return hostucode;
    }

    public void setHostucode(String hostucode) {
        this.hostucode = hostucode;
    }
}
