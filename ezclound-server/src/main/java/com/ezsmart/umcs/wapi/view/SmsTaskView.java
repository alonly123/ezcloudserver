package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.SmsTask;
import com.ezsmart.umcs.util.ServiceUtil;

public class SmsTaskView {
    private int id;
    private String eventTime;
    private int keyId;
    private int eventId;
    private String content;
    private String sendTime;
    private String phone;
    private String createTime;
    private String updateTime;

    public SmsTaskView() {
    }

    public SmsTaskView(SmsTask smsTask) {
        if (null == smsTask) {
            throw new NullPointerException("smsTask is null");
        }

        this.id = smsTask.getId();
        this.eventTime = ServiceUtil.formatDate(smsTask.getEventTime());
        this.keyId = smsTask.getKeyId();
        this.eventId = smsTask.getEventId();
        this.content = smsTask.getContent();
        this.sendTime = ServiceUtil.formatDate(smsTask.getSendTime());
        this.phone = smsTask.getPhone();
        this.createTime = ServiceUtil.formatDate(smsTask.getCreateTime());
        this.updateTime = ServiceUtil.formatDate(smsTask.getUpdateTime());
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEventTime() {
        return eventTime;
    }

    public void setEventTime(String eventTime) {
        this.eventTime = eventTime;
    }

    public int getKeyId() {
        return keyId;
    }

    public void setKeyId(int keyId) {
        this.keyId = keyId;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSendTime() {
        return sendTime;
    }

    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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
