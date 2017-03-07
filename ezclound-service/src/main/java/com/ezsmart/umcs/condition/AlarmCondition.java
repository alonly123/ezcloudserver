package com.ezsmart.umcs.condition;

import java.util.Date;

/**
 * Created by lixiangyang on 16/4/12.
 */
public class AlarmCondition extends Condition {
    private String hostUcode;
    private int customerId;
    private int channelCompanyId;
    private Date alarmTimeStart;
    private Date alarmTimeEnd;
    private int startIndex;
    private int endIndex;

    public String getHostUcode() {
        return hostUcode;
    }

    public void setHostUcode(String hostUcode) {
        this.hostUcode = hostUcode;
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

    public Date getAlarmTimeStart() {
        return alarmTimeStart;
    }

    public void setAlarmTimeStart(Date alarmTimeStart) {
        this.alarmTimeStart = alarmTimeStart;
    }

    public Date getAlarmTimeEnd() {
        return alarmTimeEnd;
    }

    public void setAlarmTimeEnd(Date alarmTimeEnd) {
        this.alarmTimeEnd = alarmTimeEnd;
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
