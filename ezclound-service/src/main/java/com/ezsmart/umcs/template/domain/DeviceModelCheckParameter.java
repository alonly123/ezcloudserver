package com.ezsmart.umcs.template.domain;

public class DeviceModelCheckParameter {

    private int id;
    private String targetDeviceModel;
    private String name;
    private String value;
    private String valueType;

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

}
