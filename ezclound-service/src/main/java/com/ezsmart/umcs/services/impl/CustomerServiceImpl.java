package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.Condition;
import com.ezsmart.umcs.condition.CustomerCondition;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.domain.Customer;
import com.ezsmart.umcs.domain.MonitorHost;
import com.ezsmart.umcs.persistence.AccountMapper;
import com.ezsmart.umcs.persistence.CustomerMapper;
import com.ezsmart.umcs.persistence.MonitorHostMapper;
import com.ezsmart.umcs.persistence.PublicSequenceMapper;
import com.ezsmart.umcs.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * Created by luochunteng.
 */
@Component
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper customerDao;

    @Autowired
    private PublicSequenceMapper publicSequenceMapper;
    @Autowired
    private AccountMapper accountDao;

    @Autowired
    private MonitorHostMapper monitorHostDao;

    @Override
    public List<Customer> getCustomerByKeywords(String keywords, int pageNum, int pageSize) {
        return customerDao.searchCustomerList(keywords, (pageNum - 1) * pageSize + 1,
                pageNum * pageSize + 1);
    }

    @Override
    public Customer getCustomerById(int customerId) {
        if (customerId == 0) {
            //异常
        }
        return customerDao.selectById(customerId);
    }

    @Override
    public BasicResult createCustomer(Customer customer) {
        int customerId = customer.getId();
        List<Customer> customers = customerDao.selectByName(customer.getName());
        if (!CollectionUtils.isEmpty(customers)) {
            return new BasicResult(false, ReturnConstants.CUSTOMER_NAME_EXIST.getCode(), ReturnConstants.CUSTOMER_NAME_EXIST.getMessage());
        }

        if (customerId != 0) {
            return new BasicResult(false, ReturnConstants.CUSTOMER_IS_EXIST.getCode(), ReturnConstants.CUSTOMER_IS_EXIST.getMessage());
        }
        customerId = publicSequenceMapper.getSeq().intValue();
        customer.setId(customerId);
        customerDao.insert(customer);
        return new BasicResult(true);
    }

    @Override
    public BasicResult updateCustomer(Customer customer) {
        Customer oldCustomer = customerDao.selectById(customer.getId());
        if (oldCustomer == null) {
            return new BasicResult(false, ReturnConstants.CUSTOMER_IS_DELETE.getCode(), ReturnConstants.CUSTOMER_IS_DELETE.getMessage());
        }

        List<Customer> customers = customerDao.selectByName(customer.getName());
        if (!CollectionUtils.isEmpty(customers)) {
            for (Customer c : customers) {
                if (c.getId() != customer.getId()) {
                    return new BasicResult(false, ReturnConstants.CUSTOMER_NAME_EXIST.getCode(), ReturnConstants.CUSTOMER_NAME_EXIST.getMessage());
                }
            }
        }

        customerDao.update(customer);
        return new BasicResult(true);
    }

    @Override
    public BasicResult deleteCustomer(int customerId) {
        if (customerDao.selectById(customerId) == null) {
            return new BasicResult(false, ReturnConstants.CUSTOMER_IS_DELETE.getCode(), ReturnConstants.CUSTOMER_IS_DELETE.getMessage());
        }
        List<MonitorHost> monitorHostList = monitorHostDao.selectByCustomerId(customerId);
        if (!CollectionUtils.isEmpty(monitorHostList)) {
            return new BasicResult(false, ReturnConstants.CUSTOMER_HAS_MONITORHOST.getCode(), ReturnConstants.CUSTOMER_HAS_MONITORHOST.getMessage());
        }
        customerDao.delete(customerId);
        Account account = accountDao.selectByOwnId(customerId);
        if (account != null) {
            accountDao.delete(account.getUcode());
        }
        return new BasicResult(true);
    }

    @Override
    public int count(String keyword, int pid) {
        if (pid == 0) {
            return customerDao.count(keyword);
        } else {
            return customerDao.countByCompanyId(keyword, pid);
        }
    }


    @Override
    public List<Customer> getCustomers(CustomerCondition condition, int pageNum, int pageSize) {
        if (null == condition) {
            condition = new CustomerCondition();
        }
        condition.setStartIndex((pageNum - 1) * pageSize + 1);
        condition.setEndIndex(pageNum * pageSize + 1);
        return customerDao.selectCustomerListByCondition(condition);
    }

    @Override
    public int countCustomers(CustomerCondition condition) {
        if (null == condition) {
            condition = new CustomerCondition();
        }
        return customerDao.countCustomerByCondition(condition);
    }

    @Override
    public List<Customer> getCustomerByCompanyId(int companyId, String keywords, int pageNum, int pageSize) {
        return customerDao.selectCustomerListByCompanyId(companyId, keywords, pageNum, pageSize);
    }


}
