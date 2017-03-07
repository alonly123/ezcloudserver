package com.ezsmart.umcs.services;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.ChannelCondition;
import com.ezsmart.umcs.domain.ChannelCompany;
import com.ezsmart.umcs.domain.Customer;

import java.util.List;

/**
 * @author luochunteng
 */
public interface ChannelCompanyService {
    /**
     * 关键字模糊搜索渠道商
     *
     * @param keywords
     * @return
     */
    public List<ChannelCompany> getChannelComopanyByKeywords(String keywords, int pageNum, int pageSize);

    public ChannelCompany getChannelComopanyById(int id);

    public BasicResult createChannelComopany(ChannelCompany channelCompany);

    public BasicResult updateChannelComopany(ChannelCompany channelCompany);

    public BasicResult deleteChannelComopany(int id);

    public int count(String keyword);

    public List<Customer> getChannerCompany(ChannelCondition condition, int pageNum, int pageSize);

    public int countChannerCompany(ChannelCondition condition);

}