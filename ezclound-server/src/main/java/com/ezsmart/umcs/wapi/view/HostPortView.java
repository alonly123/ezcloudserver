package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.HostPort;
import com.ezsmart.umcs.wapi.util.Util;

import java.util.Date;

public class HostPortView {

    private int id;
    private String hostUCode;
    private String ucode;
    private String name;
    private String spec;
    private String param;
    private String createtime;
    private String updatetime;

    public HostPortView(HostPort hostPort) {
        this.id = hostPort.getId();
        this.hostUCode = hostPort.getHostUCode();
        this.ucode = hostPort.getUcode();
        this.name = hostPort.getName();
        this.spec = hostPort.getSpec();
        this.param = hostPort.getParam();
        this.createtime = Util.formatDate(hostPort.getCreatetime());
        this.updatetime = Util.formatDate((hostPort.getUpdatetime()));
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHostUCode() {
        return hostUCode;
    }

    public void setHostUCode(String hostUCode) {
        this.hostUCode = hostUCode;
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

    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
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

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }
}
