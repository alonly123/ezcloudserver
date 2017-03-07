package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.DiscoveredHost;
import com.ezsmart.umcs.wapi.util.Util;

public class DiscoveredHostView {

    private int id;
    private String ucode;
    private String model;
    private String pyhState;
    private String connstate;
    private String discoveryTime;
    private String lastCheck;
    private String createtime;
    private String updatetime;

    public DiscoveredHostView(DiscoveredHost discoveredHost) {
        this.id = discoveredHost.getId();
        this.ucode = discoveredHost.getUcode();
        this.model = discoveredHost.getModel();
        this.pyhState = discoveredHost.getPyhState();
        this.connstate = discoveredHost.getConnstate();
        this.discoveryTime = Util.formatDate(discoveredHost.getDiscoveryTime());
        this.lastCheck = Util.formatDate(discoveredHost.getLastCheck());
        this.createtime = Util.formatDate(discoveredHost.getCreatetime());
        this.updatetime = Util.formatDate(discoveredHost.getUpdatetime());
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

    public String getDiscoveryTime() {
        return discoveryTime;
    }

    public void setDiscoveryTime(String discoveryTime) {
        this.discoveryTime = discoveryTime;
    }

    public String getLastCheck() {
        return lastCheck;
    }

    public void setLastCheck(String lastCheck) {
        this.lastCheck = lastCheck;
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

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }
}
