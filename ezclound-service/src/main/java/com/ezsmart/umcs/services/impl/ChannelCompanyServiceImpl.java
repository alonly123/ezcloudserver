package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.ChannelCondition;
import com.ezsmart.umcs.condition.CustomerCondition;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.domain.ChannelCompany;
import com.ezsmart.umcs.domain.Customer;
import com.ezsmart.umcs.domain.MonitorHost;
import com.ezsmart.umcs.persistence.*;
import com.ezsmart.umcs.services.ChannelCompanyService;
import com.ezsmart.umcs.util.ServiceUtil;
import org.apache.ibatis.session.ResultContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * @author luochunteng
 */
@Component
public class ChannelCompanyServiceImpl implements ChannelCompanyService {

    @Autowired
    private ChannelCompanyMapper channelCompanyDao;

    @Autowired
    private CustomerMapper customerDao;

    @Autowired
    private PublicSequenceMapper publicSequenceMapper;

    @Autowired
    private AccountMapper accountDao;

    @Autowired
    private MonitorHostMapper monitorHostDao;

    @Override
    public List<ChannelCompany> getChannelComopanyByKeywords(String keywords, int pageNum,
                                                             int pageSize) {
        return channelCompanyDao.searchChannelCompany(keywords, (pageNum - 1) * pageSize + 1,
                pageNum * pageSize + 1);
    }

    @Override
    public ChannelCompany getChannelComopanyById(int id) {
        if (id == 0) {
            return null;
        }
        return channelCompanyDao.selectById(id);
    }

    @Override
    public BasicResult createChannelComopany(ChannelCompany channelCompany) {
        int id = channelCompany.getId();
        List<ChannelCompany> channels = channelCompanyDao.selectByName(channelCompany.getName());
        if (!CollectionUtils.isEmpty(channels)) {
            return new BasicResult(false, ReturnConstants.CHANNELCOMPANY_NAME_EXIST.getCode(), ReturnConstants.CHANNELCOMPANY_NAME_EXIST.getMessage());
        }
        if (id != 0) {
            ChannelCompany old = channelCompanyDao.selectById(channelCompany.getId());
            if (old != null) {
                return new BasicResult(false, ReturnConstants.CHANNELCOMPANY_IS_EXIST.getCode(), ReturnConstants.CHANNELCOMPANY_IS_EXIST.getMessage());
            }
        }
        id = publicSequenceMapper.getSeq().intValue();
        channelCompany.setId(id);
        channelCompanyDao.insert(channelCompany);
        return new BasicResult(true);
    }

    @Override
    public BasicResult updateChannelComopany(ChannelCompany channelCompany) {
        if (channelCompany == null || channelCompanyDao.selectById(channelCompany.getId()) == null) {
            return new BasicResult(false, ReturnConstants.CHANNELCOMPANY_IS_DELETED.getCode(), ReturnConstants.CHANNELCOMPANY_IS_DELETED.getMessage());
        }

        List<ChannelCompany> channels = channelCompanyDao.selectByName(channelCompany.getName());
        if (!CollectionUtils.isEmpty(channels)) {
            for (ChannelCompany cc : channels) {
                if (cc.getId() != channelCompany.getId()) {
                    return new BasicResult(false, ReturnConstants.CHANNELCOMPANY_NAME_EXIST.getCode(), ReturnConstants.CHANNELCOMPANY_NAME_EXIST.getMessage());
                }
            }
        }

        channelCompanyDao.update(channelCompany);
        return new BasicResult(true);
    }

    @Override
    public BasicResult deleteChannelComopany(int id) {
        if (channelCompanyDao.selectById(id) == null) {
            return new BasicResult(false, ReturnConstants.CHANNELCOMPANY_IS_DELETED.getCode(), ReturnConstants.CHANNELCOMPANY_IS_DELETED.getMessage());
        }
        List<Customer> customerList = customerDao.selectCustomerListByCompanyId(id, "", 1, 10);
        if (customerList != null && customerList.size() > 0) {
            return new BasicResult(false, ReturnConstants.CHANNELCOMPANY_HAS_CUSTOMER.getCode(), ReturnConstants.CHANNELCOMPANY_HAS_CUSTOMER.getMessage());
        }
        List<MonitorHost> monitorHostList = monitorHostDao.selectByChannelCompanyId(id);
        if (!CollectionUtils.isEmpty(monitorHostList)) {
            return new BasicResult(false, ReturnConstants.CHANNELCOMPANY_HAS_MONITORHOST.getCode(), ReturnConstants.CHANNELCOMPANY_HAS_MONITORHOST.getMessage());
        }
        channelCompanyDao.delete(id);
        Account account = accountDao.selectByOwnId(id);
        if (account != null) {
            accountDao.delete(account.getUcode());
        }
        return new BasicResult(true);
    }

    @Override
    public int count(String keyword) {
        return channelCompanyDao.countByKeyword(keyword);
    }


    @Override
    public List<Customer> getChannerCompany(ChannelCondition condition, int pageNum, int pageSize) {
        if (null == condition) {
            condition = new ChannelCondition();
        }
        condition.setStartIndex((pageNum - 1) * pageSize + 1);
        condition.setEndIndex(pageNum * pageSize + 1);
        return channelCompanyDao.selectChannelListByCondition(condition);
    }

    @Override
    public int countChannerCompany(ChannelCondition condition) {
        if (null == condition) {
            condition = new ChannelCondition();
        }
        return channelCompanyDao.countChannelByCondition(condition);
    }
}
