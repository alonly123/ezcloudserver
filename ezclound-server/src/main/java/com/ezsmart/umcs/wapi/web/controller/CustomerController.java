package com.ezsmart.umcs.wapi.web.controller;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.CustomerCondition;
import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.domain.AdminRegion;
import com.ezsmart.umcs.domain.ChannelCompany;
import com.ezsmart.umcs.domain.Customer;
import com.ezsmart.umcs.exception.BusException;
import com.ezsmart.umcs.services.impl.AdminRegionServiceImpl;
import com.ezsmart.umcs.services.impl.ChannelCompanyServiceImpl;
import com.ezsmart.umcs.services.impl.CustomerServiceImpl;
import com.ezsmart.umcs.wapi.request.CustomerRequest;
import com.ezsmart.umcs.wapi.util.LoginUtil;
import com.ezsmart.umcs.wapi.util.ViewHelper;
import com.ezsmart.umcs.wapi.view.CustomerView;
import com.ezsmart.umcs.wapi.view.PageView;
import com.ezsmart.umcs.wapi.view.SelectView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by luochunteng
 */
@Controller
@RequestMapping(value = "customer")
public class CustomerController {
    private static final Logger LOGGER = LoggerFactory.getLogger(CustomerController.class);

    @Autowired
    private CustomerServiceImpl customerService;

    @Autowired
    private ChannelCompanyServiceImpl channelCompanyService;

    @Autowired
    private AdminRegionServiceImpl adminRegionService;

    /**
     * 客户列表/搜索列表
     *
     * @return
     */
    @RequestMapping(value = "/list")
    public String getCustomerList(Model model,
                                  @RequestParam(value = "key", defaultValue = "") String keywords,
                                  @RequestParam(value = "cid", defaultValue = "0") int channelId,
                                  @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                  @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
                                  HttpServletRequest request) {
        Account curAccount = LoginUtil.getLoginAccount(request);
        boolean isAdmin = false;
        if (curAccount.getRoleType().equals(CommonConstants.RoleType.ADMIN.getType())) {
            isAdmin = true;
        }

        if (!isAdmin) {
            channelId = curAccount.getOwnerId();
        }


        CustomerCondition condition = new CustomerCondition();
        condition.setKeyWord(keywords);
        condition.setPid(channelId);

        int total = customerService.countCustomers(condition);
        List<Customer> customerList = customerService.getCustomers(condition, pageNum, pageSize);

        List<CustomerView> customerViewList = ViewHelper.toCustomerViewList(customerList, curAccount);
        PageView<CustomerView> page = new PageView<CustomerView>(pageSize, pageNum, total,
                customerViewList);

        ChannelCompany channelCompany = channelCompanyService.getChannelComopanyById(channelId);
        model.addAttribute("channelCompany", channelCompany);

        model.addAttribute("customerPage", page);
        model.addAttribute("keyword", keywords);
        model.addAttribute("isAdmin", isAdmin);

        return "customer/list";
    }

    /**
     * 新增/编辑客户
     *
     * @return
     */
    @RequestMapping(value = "/add")
    public Object editCustomer(@RequestParam(value = "id", defaultValue = "0") int id, Model model) {
        Customer customer;
        boolean isAdd = false;
        try {
            if (id == 0) {
                isAdd = true;
                customer = new Customer();
            } else {
                customer = customerService.getCustomerById(id);
                int areaCode = customer.getAreaCode();
                if (areaCode == 0) {
                    areaCode = 110101;//默认北京东城区
                }
                List<AdminRegion> addressList = adminRegionService.getAdminRegionListByTree(areaCode);
                if (addressList == null || addressList.size() < 3) {
                    return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
                }
                model.addAttribute("province", ViewHelper.getArea(addressList.get(0)));
                model.addAttribute("city", ViewHelper.getArea(addressList.get(1)));
                model.addAttribute("county", ViewHelper.getArea(addressList.get(2)));
            }
            CustomerView customerView = ViewHelper.toCustomerView(customer);
            if (customerView.getPid() != 0) {
                ChannelCompany channelCompany = channelCompanyService.getChannelComopanyById(customerView.getPid());
                if (channelCompany != null) {
                    SelectView selectView = ViewHelper.channelToSelectView(channelCompany);
                    model.addAttribute("selectView", selectView);
                }
                customerView.setPname(channelCompany.getName());
            }
            model.addAttribute("customerInfo", customerView);
            model.addAttribute("isAdd", isAdd);
            return "customer/add";
        } catch (Exception e) {
            LOGGER.error("to add customer fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping(value = "/save")
    public BasicResult save(CustomerRequest customerRequest) {
        try {
            Customer customer = getCustomer(customerRequest);
            if (customer.getId() == 0) {
                return customerService.createCustomer(customer);
            } else {
                return customerService.updateCustomer(customer);
            }
        } catch (Exception e) {
            LOGGER.error(" save customer fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.CUSTOMER_SAVE_FAIL.getCode(), ReturnConstants.CUSTOMER_SAVE_FAIL.getMessage());
        }
    }

    private Customer getCustomer(CustomerRequest customerRequest) {
        Customer customer = new Customer();
        customer.setId(customerRequest.getId());
        customer.setName(customerRequest.getName());
        customer.setPhone(customerRequest.getPhone());
        customer.setMphone(customerRequest.getMphone());
        customer.setContacts(customerRequest.getContacts());
        customer.setMaintianer(customerRequest.getMaintianer());
        customer.setNotifyEmail(customerRequest.getNotifyEmail());
        customer.setNotifyPhone(customerRequest.getNotifyPhone());
        customer.setPid(customerRequest.getPid());
        customer.setPostcode(customerRequest.getPostcode());
        customer.setAreaCode(customerRequest.getAddress());
        return customer;
    }

    /**
     * 查看客户
     *
     * @return
     */
    @RequestMapping(value = "/detail")
    public Object getCustomerInfo(@RequestParam(value = "id", defaultValue = "0") int id,
                                  HttpServletRequest request, Model model) {
        try {
            Account loginAccount = LoginUtil.getLoginAccount(request);
            if (id <= 0) {
                id = loginAccount.getOwnerId();
            }
            Customer customer = customerService.getCustomerById(id);
            if (customer == null) {
                return new BasicResult(false, ReturnConstants.CUSTOMER_IS_DELETE.getCode(), ReturnConstants.CUSTOMER_IS_DELETE.getMessage());
            }
            int areaCode = customer.getAreaCode();
            if (areaCode == 0) {
                areaCode = 110101;//默认北京东城区
            }
            StringBuffer sb = new StringBuffer();
            List<AdminRegion> addressList = adminRegionService.getAdminRegionListByTree(areaCode);
            for (AdminRegion address : addressList) {
                sb.append(address.getName());
                sb.append(" ");
            }
            CustomerView customerView = ViewHelper.toCustomerView(customer);
            customerView.setAddress(sb.toString());

            model.addAttribute("customerInfo", customerView);
            return "customer/detail";
        } catch (Exception e) {
            LOGGER.error("delete customer fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    /**
     * 删除客户
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/delete")
    public BasicResult deleteCustomer(@RequestParam(value = "id") int id, Model model) {
        try {
            return customerService.deleteCustomer(id);
        } catch (Exception e) {
            LOGGER.error("delete customer fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @RequestMapping(value = "/searchCustomerSelect", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public Object searchCustomerSelectView(
            @RequestParam(value = "key", defaultValue = "") String key,
            @RequestParam(value = "pid", defaultValue = "0") int companyId,
            @RequestParam(value = "page", defaultValue = "1") int pageNum
    ) {
        try {
            int pageSize = CommonConstants.COMMON_PAGE_SIZE;
            CustomerCondition condition = new CustomerCondition();
            condition.setKeyWord(key);
            condition.setPid(companyId);

            int total = customerService.countCustomers(condition);
            List<Customer> customerList = customerService.getCustomers(condition, pageNum, pageSize);

            List<SelectView> selectViews = ViewHelper.customerToSelectViewList(customerList);

            PageView<SelectView> page = new PageView<SelectView>(pageSize, pageNum, total,
                    selectViews);

            return new BasicResult(true, ReturnConstants.SUCCESS_RESULT.getMessage(), page);
        } catch (Exception e) {
            LOGGER.error("search customer fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }
}
