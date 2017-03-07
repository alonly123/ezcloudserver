package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.MonitorHost;
import com.ezsmart.umcs.wapi.util.Util;

import java.util.Date;

/**
 * 设备表
 */
public class MonitorHostView {

    private int id;
    private String ucode;
    private String name;
    private int customerId;
    private String customerName;
    private int channelCompanyId;
    private String channelCompanyName;
    private int roomId;
    private String roomName;
    private int locationId;
    private String locationName;
    private String phyState;
    private String state;
    private String connState;
    private String model;
    private String modelname;
    private String phone;
    private String lastCheck;
    private String ipaddr;
    private String imei;
    private String createtime;
    private String updatetime;

    public MonitorHostView(MonitorHost monitorHost) {
        this.id = monitorHost.getId();
        this.ucode = monitorHost.getUcode();
        this.name = monitorHost.getName();
        this.customerId = monitorHost.getCustomerId();
        this.channelCompanyId = monitorHost.getChannelCompanyId();
        this.roomId = monitorHost.getRoomId();
        this.locationId = monitorHost.getLocationId();
        this.phyState = monitorHost.getPhyState();
        this.state = monitorHost.getState();
        this.connState = monitorHost.getConnState();
        this.model = monitorHost.getModel();
        this.phone = monitorHost.getPhone();
        this.lastCheck = Util.formatDate(monitorHost.getLastCheck());
        this.ipaddr = monitorHost.getIpaddr();
        this.imei = monitorHost.getImei();
        this.createtime = Util.formatDate(monitorHost.getCreatetime());
        this.updatetime = Util.formatDate(monitorHost.getUpdatetime());
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUcode() {
        return ucode;
    }

    public void setUcode(String ucode) {
        this.ucode = ucode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getChannelCompanyId() {
        return channelCompanyId;
    }

    public void setChannelCompanyId(int channelCompanyId) {
        this.channelCompanyId = channelCompanyId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getLocationId() {
        return locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
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

    public String getConnState() {
        return connState;
    }

    public void setConnState(String connState) {
        this.connState = connState;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLastCheck() {
        return lastCheck;
    }

    public void setLastCheck(String lastCheck) {
        this.lastCheck = lastCheck;
    }

    public String getIpaddr() {
        return ipaddr;
    }

    public void setIpaddr(String ipaddr) {
        this.ipaddr = ipaddr;
    }

    public String getImei() {
        return imei;
    }

    public void setImei(String imei) {
        this.imei = imei;
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

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getChannelCompanyName() {
        return channelCompanyName;
    }

    public void setChannelCompanyName(String channelCompanyName) {
        this.channelCompanyName = channelCompanyName;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getLocationName() {
        return locationName;
    }

    public void setLocationName(String locationName) {
        this.locationName = locationName;
    }

    public String getModelname() {
        return modelname;
    }

    public void setModelname(String modelname) {
        this.modelname = modelname;
    }
}
