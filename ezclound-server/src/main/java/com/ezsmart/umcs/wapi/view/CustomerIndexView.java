package com.ezsmart.umcs.wapi.view;

/**
 * Created by lixiangyang on 16/4/16.
 */
public class CustomerIndexView {
    private int monitorCount;
    private int monitorOfflineCount;
    private int monitorWarningCount;
    private int monitorDangerCount;
    private int targetDeviceCount;


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
