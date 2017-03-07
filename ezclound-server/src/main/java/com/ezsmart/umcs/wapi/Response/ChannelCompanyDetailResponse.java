package com.ezsmart.umcs.wapi.Response;

import com.ezsmart.umcs.domain.ChannelCompany;

import java.io.Serializable;

/**
 * Created by luochunteng on 2016/4/13.
 */
public class ChannelCompanyDetailResponse implements Serializable {

    private ChannelCompany channelCompany;
    private boolean isAdd;
    //目的跳转页面标识
    private String fromView;

    public ChannelCompany getChannelCompany() {
        return channelCompany;
    }

    public void setChannelCompany(ChannelCompany channelCompany) {
        this.channelCompany = channelCompany;
    }

    public boolean isAdd() {
        return isAdd;
    }

    public void setAdd(boolean isAdd) {
        this.isAdd = isAdd;
    }

    public String getFromView() {
        return fromView;
    }

    public void setFromView(String fromView) {
        this.fromView = fromView;
    }
}
