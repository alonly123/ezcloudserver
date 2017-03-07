package com.ezsmart.umcs.condition;

import java.util.List;

/**
 * Created by lixiangyang on 16/4/12.
 */
public class HostModelTargetDeviceCondition extends Condition {
    private String portUcode;
    private String deviceModel;
    private List<String> portUcodes;
    private int startIndex;
    private int endIndex;

    public String getPortUcode() {
        return portUcode;
    }

    public void setPortUcode(String portUcode) {
        this.portUcode = portUcode;
    }

    public String getDeviceModel() {
        return deviceModel;
    }

    public void setDeviceModel(String deviceModel) {
        this.deviceModel = deviceModel;
    }

    public List<String> getPortUcodes() {
        return portUcodes;
    }

    public void setPortUcodes(List<String> portUcodes) {
        this.portUcodes = portUcodes;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public int getEndIndex() {
        return endIndex;
    }

    public void setEndIndex(int endIndex) {
        this.endIndex = endIndex;
    }
}
