package com.ezsmart.umcs.wapi.Response;

import com.ezsmart.umcs.domain.ChannelCompany;

import java.io.Serializable;
import java.util.List;

/**
 * Created by luochunteng on 2016/4/13.
 */
public class ChannelCompanyListResponse implements Serializable {

    private List<ChannelCompany> channelCompanyList;

    public List<ChannelCompany> getChannelCompanyList() {
        return channelCompanyList;
    }

    public void setChannelCompanyList(List<ChannelCompany> channelCompanyList) {
        this.channelCompanyList = channelCompanyList;
    }
}
