package com.ezsmart.umcs.domain;

import java.util.Date;

public class DiscoveredHost {

    private int id;
    private String ucode;
    private String model;
    private String pyhState;
    private String connstate;
    private Date discoveryTime;
    private Date lastCheck;
    private Date createtime = new Date();
    private Date updatetime = new Date();


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

    public String getPyhState() {
        return pyhState;
    }

    public void setPyhState(String pyhState) {
        this.pyhState = pyhState;
    }

    public String getConnstate() {
        return connstate;
    }

    public void setConnstate(String connstate) {
        this.connstate = connstate;
    }

    public Date getDiscoveryTime() {
        return discoveryTime;
    }

    public void setDiscoveryTime(Date discoveryTime) {
        this.discoveryTime = discoveryTime;
    }

    public Date getLastCheck() {
        return lastCheck;
    }

    public void setLastCheck(Date lastCheck) {
        this.lastCheck = lastCheck;
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

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }
}
