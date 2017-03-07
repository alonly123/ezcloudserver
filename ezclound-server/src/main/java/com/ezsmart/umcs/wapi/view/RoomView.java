package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.Room;
import com.ezsmart.umcs.wapi.util.Util;

import java.util.Date;

public class RoomView {

    private int id;
    private int locationId;
    private String name;
    private String state;
    private int floorNumber;
    private double height;
    private double width;
    private String picURL;
    private int picWidth;
    private int picHeight;
    private int modelId;
    private String stateName;
    private String createtime;
    private String updatetime;

    public RoomView(Room room) {
        this.id = room.getId();
        this.locationId = room.getLocationId();
        this.name = room.getName();
        this.state = room.getState();
        this.floorNumber = room.getFloorNumber();
        this.height = room.getHeight();
        this.width = room.getWidth();
        this.picURL = room.getPicURL();
        this.picWidth = room.getPicWidth();
        this.picHeight = room.getPicHeight();
        this.modelId = room.getModelId();
        this.createtime = Util.formatDate(room.getCreatetime());
        this.updatetime = Util.formatDate(room.getUpdatetime());
        if ("0".equals(this.state)) {
            this.stateName = "未知";
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLocationId() {
        return locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(int floorNumber) {
        this.floorNumber = floorNumber;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getWidth() {
        return width;
    }

    public void setWidth(double width) {
        this.width = width;
    }

    public String getPicURL() {
        return picURL;
    }

    public void setPicURL(String picURL) {
        this.picURL = picURL;
    }

    public int getPicWidth() {
        return picWidth;
    }

    public void setPicWidth(int picWidth) {
        this.picWidth = picWidth;
    }

    public int getPicHeight() {
        return picHeight;
    }

    public void setPicHeight(int picHeight) {
        this.picHeight = picHeight;
    }

    public int getModelId() {
        return modelId;
    }

    public void setModelId(int modelId) {
        this.modelId = modelId;
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

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }
}
