package com.ezsmart.umcs.wapi.view;

/**
 * Created by lixiangyang on 16/4/16.
 */
public class AdminIndexView {
    private int channelCount;
    private int customerCount;
    private int customerWarningCount;
    private int customerDangerCount;

    private int monitorCount;
    private int monitorOfflineCount;
    private int monitorWarningCount;
    private int monitorDangerCount;

    private int targetDeviceCount;

    public int getChannelCount() {
        return channelCount;
    }

    public void setChannelCount(int channelCount) {
        this.channelCount = channelCount;
    }

    public int getCustomerCount() {
        return customerCount;
    }

    public void setCustomerCount(int customerCount) {
        this.customerCount = customerCount;
    }

    public int getCustomerWarningCount() {
        return customerWarningCount;
    }

    public void setCustomerWarningCount(int customerWarningCount) {
        this.customerWarningCount = customerWarningCount;
    }

    public int getCustomerDangerCount() {
        return customerDangerCount;
    }

    public void setCustomerDangerCount(int customerDangerCount) {
        this.customerDangerCount = customerDangerCount;
    }

    public int getMonitorCount() {
        return monitorCount;
    }

    public void setMonitorCount(int monitorCount) {
        this.monitorCount = monitorCount;
    }

    public int getMonitorOfflineCount() {
        return monitorOfflineCount;
    }

    public void setMonitorOfflineCount(int monitorOfflineCount) {
        this.monitorOfflineCount = monitorOfflineCount;
    }

    public int getMonitorWarningCount() {
        return monitorWarningCount;
    }

    public void setMonitorWarningCount(int monitorWarningCount) {
        this.monitorWarningCount = monitorWarningCount;
    }

    public int getMonitorDangerCount() {
        return monitorDangerCount;
    }

    public void setMonitorDangerCount(int monitorDangerCount) {
        this.monitorDangerCount = monitorDangerCount;
    }

    public int getTargetDeviceCount() {
        return targetDeviceCount;
    }

    public void setTargetDeviceCount(int targetDeviceCount) {
        this.targetDeviceCount = targetDeviceCount;
    }
}
