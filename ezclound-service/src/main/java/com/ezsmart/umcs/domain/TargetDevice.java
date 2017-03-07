package com.ezsmart.umcs.domain;

import java.util.Date;

public class TargetDevice {

    private int id;
    private String code;
    private String name;
    private String portUCode;
    private int addr;
    private String phyState;
    private String deviceType;
    private String state;
    private Date lastCheck;
    private int graphX;
    private int graphY;
    private int checkInterval;
    private int isUse;
    private String hostucode;
    private String model;
    private Date createtime = new Date();
    private Date updatetime = new Date();

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

    public int getAddr() {
        return addr;
    }

    public void setAddr(int addr) {
        this.addr = addr;
    }

    public String getPhyState() {
        return phyState;
    }

    public void setPhyState(String phyState) {
        this.phyState = phyState;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Date getLastCheck() {
        return lastCheck;
    }

    public void setLastCheck(Date lastCheck) {
        this.lastCheck = lastCheck;
    }

    public int getGraphX() {
        return graphX;
    }

    public void setGraphX(int graphX) {
        this.graphX = graphX;
    }

    public int getGraphY() {
        return graphY;
    }

    public void setGraphY(int graphY) {
        this.graphY = graphY;
    }

    public int getCheckInterval() {
        return checkInterval;
    }

    public void setCheckInterval(int checkInterval) {
        this.checkInterval = checkInterval;
    }

    public int isUse() {
        return isUse;
    }

    public void setUse(int isUse) {
        this.isUse = isUse;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPortUCode() {
        return portUCode;
    }

    public void setPortUCode(String portUCode) {
        this.portUCode = portUCode;
    }

    public String getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
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

    public String getHostucode() {
        return hostucode;
    }

    public void setHostucode(String hostucode) {
        this.hostucode = hostucode;
    }
}
