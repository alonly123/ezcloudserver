package com.ezsmart.umcs.wapi.web.controller;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.CustomerCondition;
import com.ezsmart.umcs.condition.MonitorHostCondition;
import com.ezsmart.umcs.condition.TargetDeviceCondition;
import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.domain.TargetDevice;
import com.ezsmart.umcs.services.impl.*;
import com.ezsmart.umcs.wapi.util.LoginUtil;
import com.ezsmart.umcs.wapi.view.AdminIndexView;
import com.ezsmart.umcs.wapi.view.ChannelCompanyIndexView;
import com.ezsmart.umcs.wapi.view.CustomerIndexView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by lixiangyang on 16/3/26.
 */
@Controller
public class IndexController {
    private static Logger LOGGER = LoggerFactory.getLogger(IndexController.class);

    @Autowired
    private AccountServiceImpl accountService;
    @Autowired
    private CustomerServiceImpl customerService;
    @Autowired
    private ChannelCompanyServiceImpl channelCompanyService;
    @Autowired
    private MonitorHostServiceImpl monitorHostService;
    @Autowired
    private TargetDeviceServiceImpl targetDeviceService;


    @RequestMapping("/")
    public String index() {
        List<String> roles = LoginUtil.getLoginRoles();
        if (roles.contains(CommonConstants.SecurityRoleType.ADMIN.getValue())
                || roles.contains(CommonConstants.SecurityRoleType.ROOT.getValue())) {
            return "admin/index";
        } else if (roles.contains(CommonConstants.SecurityRoleType.CHANNEL.getValue())) {
            return "channelcompany/index";
        } else if (roles.contains(CommonConstants.SecurityRoleType.CUSTOMER.getValue())) {
            return "customer/index";
        }

        return "index";
    }

    @RequestMapping(value = "/admin/index")
    @ResponseBody
    public Object adminIndex() {
        BasicResult result = new BasicResult();
        try {
            AdminIndexView adminIndexView = new AdminIndexView();

            MonitorHostCondition monitorHostCondition = new MonitorHostCondition();

            //设备总数
            adminIndexView.setMonitorCount(monitorHostService.countMonitorHost(null));

            //设备下线数
            monitorHostCondition.setConnState(CommonConstants.MonitorHostConnState.OFFLINE.getType());
            adminIndexView.setMonitorOfflineCount(monitorHostService.countMonitorHost(monitorHostCondition));

            //客户告警数
            //设备告警数
            monitorHostCondition.setConnState(null);
            monitorHostCondition.setState(CommonConstants.MonitorHostState.WARN.getType());
            adminIndexView.setCustomerWarningCount(monitorHostService.countCustomer(monitorHostCondition));
            adminIndexView.setMonitorWarningCount(monitorHostService.countMonitorHost(monitorHostCondition));

            //客户严重数
            //设备严重数
            monitorHostCondition.setState(CommonConstants.MonitorHostState.DANGER.getType());
            adminIndexView.setCustomerDangerCount(monitorHostService.countCustomer(monitorHostCondition));
            adminIndexView.setMonitorDangerCount(monitorHostService.countMonitorHost(monitorHostCondition));


            //中间商数量
            //客户数量
            adminIndexView.setChannelCount(channelCompanyService.countChannerCompany(null));
            adminIndexView.setCustomerCount(customerService.countCustomers(null));

            //外设数量
            adminIndexView.setTargetDeviceCount(targetDeviceService.count(null));


            result = new BasicResult(true, ReturnConstants.SUCCESS_RESULT.getCode(), ReturnConstants.SUCCESS_RESULT.getMessage(), adminIndexView);
        } catch (Exception e) {
            LOGGER.error("adminIndex", e);
            result = new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }

        return result;
    }


    @RequestMapping(value = "/channelCompany/index")
    @ResponseBody
    public Object channelCompanyIndex(HttpServletRequest request) {
        BasicResult result = new BasicResult();
        try {
            ChannelCompanyIndexView channelCompanyIndexView = new ChannelCompanyIndexView();

            Account account = LoginUtil.getLoginAccount(request);
            int ownerId = account.getOwnerId();

            CustomerCondition customerCondition = new CustomerCondition();
            customerCondition.setPid(ownerId);

            //客户总数
            channelCompanyIndexView.setCustomerCount(customerService.countCustomers(customerCondition));

            MonitorHostCondition monitorHostCondition = new MonitorHostCondition();
            monitorHostCondition.setChannelCompanyId(ownerId);

            //设备总数
            channelCompanyIndexView.setMonitorCount(monitorHostService.countMonitorHost(monitorHostCondition));

            //设备下线数
            monitorHostCondition.setConnState(CommonConstants.MonitorHostConnState.OFFLINE.getType());
            channelCompanyIndexView.setMonitorOfflineCount(monitorHostService.countMonitorHost(monitorHostCondition));

            //客户告警数
            //设备告警数
            monitorHostCondition.setConnState(null);
            monitorHostCondition.setState(CommonConstants.MonitorHostState.WARN.getType());
            channelCompanyIndexView.setCustomerWarningCount(monitorHostService.countCustomer(monitorHostCondition));
            channelCompanyIndexView.setMonitorWarningCount(monitorHostService.countMonitorHost(monitorHostCondition));

            //客户严重数
            //设备严重数
            monitorHostCondition.setState(CommonConstants.MonitorHostState.DANGER.getType());
            channelCompanyIndexView.setCustomerDangerCount(monitorHostService.countCustomer(monitorHostCondition));
            channelCompanyIndexView.setMonitorDangerCount(monitorHostService.countMonitorHost(monitorHostCondition));

            //外设数量
            TargetDeviceCondition targetDeviceCondition = new TargetDeviceCondition();
            targetDeviceCondition.setChannelCompanyId(ownerId);
            channelCompanyIndexView.setTargetDeviceCount(targetDeviceService.count(targetDeviceCondition));

            result = new BasicResult(true, ReturnConstants.SUCCESS_RESULT.getCode(), ReturnConstants.SUCCESS_RESULT.getMessage(), channelCompanyIndexView);
        } catch (Exception e) {
            LOGGER.error("channelCompanyIndex", e);
            result = new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }

        return result;
    }

    @RequestMapping(value = "/customer/index")
    @ResponseBody
    public Object customerIndex(HttpServletRequest request) {
        BasicResult result = new BasicResult();
        try {
            CustomerIndexView customerIndexView = new CustomerIndexView();

            Account account = LoginUtil.getLoginAccount(request);
            int ownerId = account.getOwnerId();

            MonitorHostCondition monitorHostCondition = new MonitorHostCondition();
            monitorHostCondition.setCustomerId(ownerId);

            //设备总数
            customerIndexView.setMonitorCount(monitorHostService.countMonitorHost(monitorHostCondition));

            //设备下线数
            monitorHostCondition.setConnState(CommonConstants.MonitorHostConnState.OFFLINE.getType());
            customerIndexView.setMonitorOfflineCount(monitorHostService.countMonitorHost(monitorHostCondition));

            //设备告警数
            monitorHostCondition.setConnState(null);
            monitorHostCondition.setState(CommonConstants.MonitorHostState.WARN.getType());
            customerIndexView.setMonitorWarningCount(monitorHostService.countMonitorHost(monitorHostCondition));

            //设备严重数
            monitorHostCondition.setState(CommonConstants.MonitorHostState.DANGER.getType());
            customerIndexView.setMonitorDangerCount(monitorHostService.countMonitorHost(monitorHostCondition));

            TargetDeviceCondition targetDeviceCondition = new TargetDeviceCondition();
            targetDeviceCondition.setCustomerId(ownerId);
            customerIndexView.setTargetDeviceCount(targetDeviceService.count(targetDeviceCondition));

            result = new BasicResult(true, ReturnConstants.SUCCESS_RESULT.getCode(), ReturnConstants.SUCCESS_RESULT.getMessage(), customerIndexView);
        } catch (Exception e) {
            LOGGER.error("customerIndex", e);
            result = new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }

        return result;
    }
}
