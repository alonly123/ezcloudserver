package com.ezsmart.umcs.domain;

import java.util.Date;

public class CheckValueTrend {

    private int id;
    private int itemId;
    private double valueMin;
    private double valueMax;
    private double valueAvg;
    private Date time;
    private Date createtime = new Date();
    private Date updatetime = new Date();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public double getValueMin() {
        return valueMin;
    }

    public void setValueMin(double valueMin) {
        this.valueMin = valueMin;
    }

    public double getValueMax() {
        return valueMax;
    }

    public void setValueMax(double valueMax) {
        this.valueMax = valueMax;
    }

    public double getValueAvg() {
        return valueAvg;
    }

    public void setValueAvg(double valueAvg) {
        this.valueAvg = valueAvg;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }
}
