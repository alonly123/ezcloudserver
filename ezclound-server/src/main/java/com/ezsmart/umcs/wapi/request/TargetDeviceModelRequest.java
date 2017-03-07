package com.ezsmart.umcs.wapi.request;

public class TargetDeviceModelRequest {
    private int id;
    private String model;
    private String name;
    private String vendor;
    private String descr;
    private String longModel;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public String getLongModel() {
        return longModel;
    }

    public void setLongModel(String longModel) {
        this.longModel = longModel;
    }
}
