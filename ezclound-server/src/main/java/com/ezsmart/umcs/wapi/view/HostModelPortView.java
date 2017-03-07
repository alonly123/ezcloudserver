package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.HostModelPort;
import com.ezsmart.umcs.util.ServiceUtil;

/**
 * Created by luochunteng on 2016/4/19.
 */
public class HostModelPortView {
    private int id;
    private String ucode;
    private String name;
    private String hostModel;
    private String spec;
    private String createTime;
    private String updateTime;

    public HostModelPortView() {
    }

    public HostModelPortView(HostModelPort hostModelPort) {
        if (null == hostModelPort) {
            throw new NullPointerException("hostModelPort is null");
        }

        this.id = hostModelPort.getId();
        this.ucode = hostModelPort.getUcode();
        this.name = hostModelPort.getName();
        this.hostModel = hostModelPort.getHostmodel();
        this.spec = hostModelPort.getSpec();
        this.createTime = ServiceUtil.formatDate(hostModelPort.getCreatetime());
        this.updateTime = ServiceUtil.formatDate(hostModelPort.getUpdatetime());
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUcode() {
        return ucode;
    }

    public void setUcode(String ucode) {
        this.ucode = ucode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHostModel() {
        return hostModel;
    }

    public void setHostModel(String hostModel) {
        this.hostModel = hostModel;
    }

    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
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
