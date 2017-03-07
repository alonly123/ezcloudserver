package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.TargetDevice;
import com.ezsmart.umcs.wapi.util.Util;

public class TargetDeviceView {

    private int id;
    private String code;
    private String name;
    private String portUCode;
    private String portName;
    private int addr;
    private String addrDetail;
    private String phyState;
    private String deviceType;
    private String state;
    private String lastCheck;
    private int graphX;
    private int graphY;
    private int checkInterval;
    private int isUse;
    private String useState;
    private String hostucode;
    private String hostName;
    private String model;
    private String modelName;
    private String createtime;
    private String updatetime;

    public TargetDeviceView(TargetDevice targetDevice) {
        this.id = targetDevice.getId();
        this.code = targetDevice.getCode();
        this.name = targetDevice.getName();
        this.portUCode = targetDevice.getPortUCode();
        this.addr = targetDevice.getAddr();
        this.phyState = targetDevice.getPhyState();
        this.deviceType = targetDevice.getDeviceType();
        this.state = targetDevice.getState();
        this.lastCheck = Util.formatDate(targetDevice.getLastCheck());
        this.graphX = targetDevice.getGraphX();
        this.graphY = targetDevice.getGraphY();
        this.checkInterval = targetDevice.getCheckInterval();
        this.isUse = targetDevice.isUse();
        this.useState = "使用";
        this.hostucode = targetDevice.getHostucode();
        this.model = targetDevice.getModel();
        this.createtime = Util.formatDate(targetDevice.getCreatetime());
        this.updatetime = Util.formatDate((targetDevice.getUpdatetime()));
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

    public String getLastCheck() {
        return lastCheck;
    }

    public void setLastCheck(String lastCheck) {
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

    public String getHostucode() {
        return hostucode;
    }

    public void setHostucode(String hostucode) {
        this.hostucode = hostucode;
    }

    public String getAddrDetail() {
        return addrDetail;
    }

    public void setAddrDetail(String addrDetail) {
        this.addrDetail = addrDetail;
    }

    public String getUseState() {
        return useState;
    }

    public void setUseState(String useState) {
        this.useState = useState;
    }

    public String getHostName() {
        return hostName;
    }

    public void setHostName(String hostName) {
        this.hostName = hostName;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public String getPortName() {
        return portName;
    }

    public void setPortName(String portName) {
        this.portName = portName;
    }
}
