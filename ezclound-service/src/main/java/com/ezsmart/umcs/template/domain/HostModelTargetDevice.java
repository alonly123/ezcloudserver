package com.ezsmart.umcs.template.domain;

public class HostModelTargetDevice {

    private int id;
    private String portUCode;
    private String deviceModel;
    private String name;
    private String deviceType;
    private int addr;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPortUCode() {
        return portUCode;
    }

    public void setPortUCode(String portUCode) {
        this.portUCode = portUCode;
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

}
