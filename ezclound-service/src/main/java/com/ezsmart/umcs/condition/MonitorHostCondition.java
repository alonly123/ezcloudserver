package com.ezsmart.umcs.condition;

import java.util.List;

/**
 * Created by lixiangyang on 16/4/16.
 */
public class MonitorHostCondition extends Condition {
    private String keyWord;
    private String code;
    private int startIndex;
    private int endIndex;

    private int customerId;
    private int channelCompanyId;
    //用于搜索客户、渠道商下的monitorhost
    private List<Integer> customerIdList;

    private String pyhState;
    private String state;
    private String connState;

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

    public String getPyhState() {
        return pyhState;
    }

    public void setPyhState(String pyhState) {
        this.pyhState = pyhState;
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

    public List<Integer> getCustomerIdList() {
        return customerIdList;
    }

    public void setCustomerIdList(List<Integer> customerIdList) {
        this.customerIdList = customerIdList;
    }
}
