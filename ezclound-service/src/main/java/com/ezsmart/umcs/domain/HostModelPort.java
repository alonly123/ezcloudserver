package com.ezsmart.umcs.domain;

import java.util.Date;

/**
 * Created by luochunteng on 2016/4/19.
 */
public class HostModelPort {
    private int id;
    private String ucode;
    private String name;
    private String hostmodel;
    private String spec;
    private Date createtime;
    private Date updatetime;

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

    public String getHostmodel() {
        return hostmodel;
    }

    public void setHostmodel(String hostmodel) {
        this.hostmodel = hostmodel;
    }

    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
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
