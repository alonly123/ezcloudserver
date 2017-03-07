package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.Alarm;
import com.ezsmart.umcs.util.ServiceUtil;


public class AlarmView {
    private int id;
    private String name;
    private String alarmTime;
    private String alarmLevel;
    private String alarmType;
    private int sourceId;
    private String sourceType;
    private String content;
    private String ackTime;
    private String ackUser;
    private String hostUcode;
    private String createTime;
    private String updateTime;

    public AlarmView() {
    }

    public AlarmView(Alarm alarm) {
        if (null == alarm) {
            throw new NullPointerException("alarm is null");
        }

        this.id = alarm.getId();
        this.name = alarm.getName();
        this.alarmTime = ServiceUtil.formatDate(alarm.getAlarmTime());
        this.alarmLevel = alarm.getAlarmLevel();
        this.alarmType = alarm.getAlarmType();
        this.sourceId = alarm.getSourceId();
        this.sourceType = alarm.getSourceType();
        this.content = alarm.getContent();
        this.ackTime = ServiceUtil.formatDate(alarm.getAckTime());
        this.ackUser = alarm.getAckUser();
        this.hostUcode = alarm.getHostUcode();
        this.createTime = ServiceUtil.formatDate(alarm.getCreateTime());
        this.updateTime = ServiceUtil.formatDate(alarm.getUpdateTime());
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAlarmTime() {
        return alarmTime;
    }

    public void setAlarmTime(String alarmTime) {
        this.alarmTime = alarmTime;
    }

    public String getAlarmLevel() {
        return alarmLevel;
    }

    public void setAlarmLevel(String alarmLevel) {
        this.alarmLevel = alarmLevel;
    }

    public String getAlarmType() {
        return alarmType;
    }

    public void setAlarmType(String alarmType) {
        this.alarmType = alarmType;
    }

    public int getSourceId() {
        return sourceId;
    }

    public void setSourceId(int sourceId) {
        this.sourceId = sourceId;
    }

    public String getSourceType() {
        return sourceType;
    }

    public void setSourceType(String sourceType) {
        this.sourceType = sourceType;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAckTime() {
        return ackTime;
    }

    public void setAckTime(String ackTime) {
        this.ackTime = ackTime;
    }

    public String getAckUser() {
        return ackUser;
    }

    public void setAckUser(String ackUser) {
        this.ackUser = ackUser;
    }

    public String getHostUcode() {
        return hostUcode;
    }

    public void setHostUcode(String hostUcode) {
        this.hostUcode = hostUcode;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
}
