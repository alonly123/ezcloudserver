package com.ezsmart.umcs.condition;

import java.util.List;

/**
 * Created by luochunteng on 16/4/12.
 */
public class TargetDeviceCondition extends Condition {
    private String keyWord;
    private int customerId;
    private int channelCompanyId;
    private String hostUCode;
    private String portUCode;
    private List<String> hostUcodeList;
    private int startIndex;
    private int endIndex;

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
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

    public List<String> getHostUcodeList() {
        return hostUcodeList;
    }

    public void setHostUcodeList(List<String> hostUcodeList) {
        this.hostUcodeList = hostUcodeList;
    }

    public String getHostUCode() {
        return hostUCode;
    }

    public void setHostUCode(String hostUCode) {
        this.hostUCode = hostUCode;
    }

    public String getPortUCode() {
        return portUCode;
    }

    public void setPortUCode(String portUCode) {
        this.portUCode = portUCode;
    }
}
