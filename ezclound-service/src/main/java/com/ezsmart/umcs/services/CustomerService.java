package com.ezsmart.umcs.services;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.CustomerCondition;
import com.ezsmart.umcs.domain.Customer;

import java.util.List;

public interface CustomerService {

    /**
     * 关键字模糊搜索客户
     *
     * @param keywords
     * @return
     */
    public List<Customer> getCustomerByKeywords(String keywords, int pageNum, int pageSize);

    public Customer getCustomerById(int customerId);

    public BasicResult createCustomer(Customer customer);

    public BasicResult updateCustomer(Customer customer);

    public BasicResult deleteCustomer(int customerId);

    public int count(String keyword, int pid);

    public List<Customer> getCustomerByCompanyId(int companyId, String keywords, int pageNum, int pageSize);

    public List<Customer> getCustomers(CustomerCondition condition, int pageNum, int pageSize);

    public int countCustomers(CustomerCondition condition);

}