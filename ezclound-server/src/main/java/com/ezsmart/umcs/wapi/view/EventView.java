package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.Event;
import com.ezsmart.umcs.util.ServiceUtil;

public class EventView {

    private int id;
    private String name;
    private String eventTime;
    private int sourceId;
    private String sourceType;
    private String content;
    private String createTime;
    private String updateTime;

    public EventView() {
    }

    public EventView(Event event) {
        this.id = event.getId();
        this.name = event.getName();
        this.eventTime = ServiceUtil.formatDate(event.getEventTime());
        this.sourceId = event.getSourceId();
        this.sourceType = event.getSourceType();
        this.content = event.getContent();
        this.createTime = ServiceUtil.formatDate(event.getCreateTime());
        this.updateTime = ServiceUtil.formatDate(event.getUpdateTime());
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

    public String getEventTime() {
        return eventTime;
    }

    public void setEventTime(String eventTime) {
        this.eventTime = eventTime;
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
