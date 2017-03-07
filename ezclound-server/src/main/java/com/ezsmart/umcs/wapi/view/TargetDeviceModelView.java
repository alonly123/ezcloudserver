package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.TargetDeviceModel;
import com.ezsmart.umcs.util.ServiceUtil;

/**
 * Created by luochunteng on 2016/4/19.
 */
public class TargetDeviceModelView {
    private int id;
    private String model;
    private String name;
    private String vendor;
    private String descr;
    private String longModel;
    private String createTime;
    private String updateTime;

    public TargetDeviceModelView() {
    }

    public TargetDeviceModelView(TargetDeviceModel targetDeviceModel) {
        if (null == targetDeviceModel) {
            throw new NullPointerException("targetDeviceModel is null");
        }
        this.id = targetDeviceModel.getId();
        this.model = targetDeviceModel.getModel();
        this.name = targetDeviceModel.getName();
        this.vendor = targetDeviceModel.getVendor();
        this.descr = targetDeviceModel.getDescr();
        this.longModel = targetDeviceModel.getLongModel();
        this.createTime = ServiceUtil.formatDate(targetDeviceModel.getCreateTime());
        this.updateTime = ServiceUtil.formatDate(targetDeviceModel.getUpdateTime());
    }

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
