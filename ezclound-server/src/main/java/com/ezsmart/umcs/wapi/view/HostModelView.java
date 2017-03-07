package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.HostModel;
import com.ezsmart.umcs.util.ServiceUtil;

/**
 * Created by lixiangyang on 16/4/23.
 */
public class HostModelView {
    private int id;
    private String model;
    private String name;
    private String descr;
    private String createTime;
    private String updateTime;

    public HostModelView() {
    }

    public HostModelView(HostModel hostModel) {
        if (null == hostModel)
            throw new NullPointerException("hostModel is null");

        this.id = hostModel.getId();
        this.model = hostModel.getModel();
        this.name = hostModel.getName();
        this.descr = hostModel.getDescr();
        this.createTime = ServiceUtil.formatDate(hostModel.getCreatetime());
        this.updateTime = ServiceUtil.formatDate(hostModel.getUpdatetime());
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

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
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
