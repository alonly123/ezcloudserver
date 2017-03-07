package com.ezsmart.umcs.wapi.web.controller;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.CheckCommandCondition;
import com.ezsmart.umcs.condition.CheckItemCondition;
import com.ezsmart.umcs.condition.MonitorHostCondition;
import com.ezsmart.umcs.condition.TargetDeviceCondition;
import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.*;
import com.ezsmart.umcs.services.impl.*;
import com.ezsmart.umcs.wapi.request.MonitorHostRequest;
import com.ezsmart.umcs.wapi.util.LoginUtil;
import com.ezsmart.umcs.wapi.util.ViewHelper;
import com.ezsmart.umcs.wapi.view.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.swing.text.View;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "monitorhost")
public class MonitorHostController {
    private static final Logger LOGGER = LoggerFactory.getLogger(MonitorHostController.class);

    @Autowired
    private MonitorHostServiceImpl monitorHostService;

    @Autowired
    private HostModelServiceImpl hostModelService;

    @Autowired
    private ChannelCompanyServiceImpl channelCompanyService;

    @Autowired
    private CustomerServiceImpl customerService;

    @Autowired
    private LocationServiceImpl locationService;

    @Autowired
    private RoomServiceImpl roomService;

    @Autowired
    private HostPortServiceImpl hostPortService;

    @Autowired
    private TargetDeviceServiceImpl targetDeviceService;

    @Autowired
    private CheckItemServiceImpl checkItemService;

    @Autowired
    private CheckCommandServiceImpl checkCommandService;


    @RequestMapping(value = "/add")
    public Object addMonitorHost(@RequestParam(value = "id", defaultValue = "0") int id, HttpServletRequest request, Model model) {
        try {
            Account currAccount = LoginUtil.getLoginAccount(request);
            if (!CommonConstants.RoleType.ADMIN.getType().equals(currAccount.getRoleType())) {
                return new BasicResult(false, ReturnConstants.ACCESS_DENIED.getCode(), ReturnConstants.ACCESS_DENIED.getMessage());
            }
            boolean isAdd = false;
            MonitorHost monitorHost;
            if (id == 0) {
                isAdd = true;
                monitorHost = new MonitorHost();
            } else {
                monitorHost = monitorHostService.getMonitorHostById(id);
                HostModel hostModel = hostModelService.getByModel(monitorHost.getModel());
                if (hostModel != null) {
                    SelectView selectView = ViewHelper.hostModelToSelectView(hostModel);
                    model.addAttribute("hostModel", selectView);
                }
                ChannelCompany channelCompany = channelCompanyService.getChannelComopanyById(monitorHost.getChannelCompanyId());
                if (channelCompany != null) {
                    SelectView selectView = ViewHelper.channelToSelectView(channelCompany);
                    model.addAttribute("channelCompany", selectView);
                }
                Customer customer = customerService.getCustomerById(monitorHost.getCustomerId());
                if (customer != null) {
                    SelectView selectView = ViewHelper.customerToSelectView(customer);
                    model.addAttribute("customer", selectView);
                }
                GeoLocation location = locationService.getLocationBy(monitorHost.getLocationId());
                if (location != null) {
                    SelectView selectView = ViewHelper.locationToSelectView(location);
                    model.addAttribute("location", selectView);
                }
                Room room = roomService.getRoomById(monitorHost.getRoomId());
                if (room != null) {
                    SelectView selectView = ViewHelper.roomToSelectView(room);
                    model.addAttribute("room", selectView);
                }
            }

            model.addAttribute("isAdd", isAdd);
            model.addAttribute("monitorHost", ViewHelper.toMonitorHostView(monitorHost));
            return "/devicemanage/monitorhost/add";
        } catch (Exception e) {
            LOGGER.error("add monitorhost fail; error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping(value = "/save")
    public BasicResult saveMonitorHost(MonitorHostRequest monitorHostRequest, HttpServletRequest request) {
        try {
            Account currAccount = LoginUtil.getLoginAccount(request);
            if (!CommonConstants.RoleType.ADMIN.getType().equals(currAccount.getRoleType())) {
                return new BasicResult(false, ReturnConstants.ACCESS_DENIED.getCode(), ReturnConstants.ACCESS_DENIED.getMessage());
            }
            MonitorHost monitorHost = getMonitorHost(monitorHostRequest);
            int modelId = monitorHostRequest.getModelId();
            HostModel hostModel = hostModelService.getById(modelId);
            monitorHost.setModel(hostModel.getModel());
            if (monitorHost.getId() == 0) {
                String hostUcode = hostModel.getModel() + monitorHost.getUcode();
                //add
                //做一些其它的数据迁移处理 以及必要的校验
                MonitorHost oldHost = monitorHostService.getMonitorHostByUcode(hostUcode);
                if (oldHost != null) {
                    return new BasicResult(false, ReturnConstants.MONITOR_HOST_UCODE_EXIST.getCode(), ReturnConstants.MONITOR_HOST_UCODE_EXIST.getMessage());
                }
                monitorHost.setUcode(hostUcode);
                return monitorHostService.addMonitorHost(monitorHost);
            } else {
                //update
                return monitorHostService.updateMonitorHost(monitorHost);
            }
        } catch (Exception e) {
            LOGGER.error("save monitorhost fail; error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    private MonitorHost getMonitorHost(MonitorHostRequest monitorHostRequest) {
        MonitorHost monitorHost = new MonitorHost();
        monitorHost.setId(monitorHostRequest.getId());
        monitorHost.setName(monitorHostRequest.getName());
        monitorHost.setUcode(monitorHostRequest.getUcode());
        monitorHost.setCustomerId(monitorHostRequest.getCustomerId());
        monitorHost.setChannelCompanyId(monitorHostRequest.getChannelCompanyId());
        monitorHost.setLocationId(monitorHostRequest.getLocationId());
        monitorHost.setRoomId(monitorHostRequest.getRoomId());
        monitorHost.setPhone(monitorHostRequest.getPhone());
        monitorHost.setPhyState(monitorHostRequest.getPhyState());
        monitorHost.setState(monitorHostRequest.getState());
        monitorHost.setConnState(monitorHostRequest.getConnState());
        monitorHost.setIpaddr(monitorHostRequest.getIpaddr());
        monitorHost.setImei(monitorHostRequest.getImei());
        monitorHost.setLastCheck(monitorHostRequest.getLastCheck());

        return monitorHost;
    }

    @RequestMapping(value = "/list")
    public Object getMonitorList(@RequestParam(value = "key", defaultValue = "") String key,
                                 @RequestParam(value = "ucode", defaultValue = "") String ucode,
                                 @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                 @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
                                 HttpServletRequest request, Model model) {
        try {
            boolean isAdmin = false;
            Account currentAccount = LoginUtil.getLoginAccount(request);
            MonitorHostCondition monitorHostCondition = new MonitorHostCondition();
            monitorHostCondition.setKeyWord(key);
            monitorHostCondition.setCode(ucode);
            if (CommonConstants.AccountType.ROOT.getType().equals(currentAccount.getOwnerType())) {
                monitorHostCondition.setCustomerId(0);
                monitorHostCondition.setChannelCompanyId(0);
                isAdmin = true;
            } else if (CommonConstants.AccountType.CHANNELCOMPANY.getType().equals(currentAccount.getOwnerType())) {
                monitorHostCondition.setChannelCompanyId(currentAccount.getOwnerId());
                monitorHostCondition.setCustomerId(0);
                List<Customer> customerList = customerService.getCustomerByCompanyId(currentAccount.getOwnerId(), "", 1, 10000);
                List<Integer> customerIdList = new ArrayList<Integer>();
                for (Customer customer : customerList) {
                    customerIdList.add(customer.getId());
                }
                monitorHostCondition.setCustomerIdList(customerIdList);
            } else if (CommonConstants.AccountType.CUSTOMER.getType().equals(currentAccount.getOwnerType())) {
                monitorHostCondition.setCustomerId(currentAccount.getOwnerId());
                monitorHostCondition.setChannelCompanyId(0);
            }
            int total = monitorHostService.countMonitorHost(monitorHostCondition);
            List<MonitorHost> monitorHostList = monitorHostService.getMonitorHostListByCondition(monitorHostCondition, pageNum, pageSize);
            List<MonitorHostView> monitorHostViewList = ViewHelper.toMonitorHostViewList(monitorHostList);
            //一些其它处理，比如 customername or channelName
            PageView<MonitorHostView> page = new PageView<MonitorHostView>(pageSize, pageNum, total,
                    monitorHostViewList);
            model.addAttribute("isAdmin", isAdmin);
            model.addAttribute("key", key);
            model.addAttribute("monitorHostList", page);

            return "/devicemanage/monitorhost/list";
        } catch (Exception e) {
            LOGGER.error("add monitorhost fail; error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping(value = "/delete")
    public BasicResult deleteMonitorHost(@RequestParam(value = "id") int id, HttpServletRequest request) {
        try {
            Account currAccount = LoginUtil.getLoginAccount(request);
            if (!CommonConstants.RoleType.ADMIN.getType().equals(currAccount.getRoleType())) {
                return new BasicResult(false, ReturnConstants.ACCESS_DENIED.getCode(), ReturnConstants.ACCESS_DENIED.getMessage());
            }
            MonitorHost monitorHost = monitorHostService.getMonitorHostById(id);
            if (monitorHost == null) {
                return new BasicResult(false, ReturnConstants.MONITOR_HOST_NOT_EXIST.getCode(), ReturnConstants.MONITOR_HOST_NOT_EXIST.getMessage());
            }
            return monitorHostService.deleteMonitor(id);
        } catch (Exception e) {
            LOGGER.error("save monitorhost fail; error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @RequestMapping(value = "/detail")
    public Object detail(@RequestParam(value = "id", defaultValue = "0") int id, HttpServletRequest request, Model model) {
        try {
            MonitorHost monitorHost = monitorHostService.getMonitorHostById(id);
            MonitorHostView monitorHostView = ViewHelper.toMonitorHostView(monitorHost);
            HostModel hostModel = hostModelService.getByModel(monitorHost.getModel());
            if (hostModel != null) {
                monitorHostView.setModelname(hostModel.getName());
            }
            ChannelCompany channelCompany = channelCompanyService.getChannelComopanyById(monitorHost.getChannelCompanyId());
            if (channelCompany != null) {
                monitorHostView.setChannelCompanyName(channelCompany.getName());
            }
            Customer customer = customerService.getCustomerById(monitorHost.getCustomerId());
            if (customer != null) {
                monitorHostView.setCustomerName(customer.getName());
            }
            GeoLocation location = locationService.getLocationBy(monitorHost.getLocationId());
            if (location != null) {
                monitorHostView.setLocationName(location.getName());
            }
            Room room = roomService.getRoomById(monitorHost.getRoomId());
            if (room != null) {
                monitorHostView.setRoomName(room.getName());
            }

            //get hostportlist
            List<HostPort> hostPortList = hostPortService.getHostPortListByHostCode(monitorHost.getUcode());
            List<HostPortView> hostPortViewList = ViewHelper.toHostPortViewList(hostPortList);
            model.addAttribute("hostPortList", hostPortViewList);

            // get devicelist先按hostucode 查询总的。。后面再考虑通过hostcode 与portcode 联合查询实现联动 ps：此时需要考虑局部刷新
            TargetDeviceCondition targetDeviceCondition = new TargetDeviceCondition();
            targetDeviceCondition.setHostUCode(monitorHost.getUcode());
            List<TargetDevice> targetDeviceList = targetDeviceService.getTargetDeviceListByCondition(targetDeviceCondition, 1, 100);
            List<TargetDeviceView> targetDeviceViewList = ViewHelper.toTargetDeviceViewList(targetDeviceList);
            model.addAttribute("targetDeviceList", targetDeviceViewList);

            // get checkitem
            CheckItemCondition checkItemCondition = new CheckItemCondition();
            checkItemCondition.setHostUCode(monitorHost.getUcode());
            List<CheckItem> checkItemList = checkItemService.getCheckItemListByCondition(checkItemCondition, 1, 200);
            List<CheckItemView> checkItemViewList = ViewHelper.toCheckItemViewList(checkItemList);
            model.addAttribute("checkItemList", checkItemViewList);

            //get checkcommand
            CheckCommandCondition checkCommandCondition = new CheckCommandCondition();
            checkCommandCondition.setHostUCode(monitorHost.getUcode());
            List<CheckCommand> checkCommandList = checkCommandService.getCheckCommandListByCondition(checkCommandCondition, 1, 200);
            List<CheckCommandView> checkCommandViewList = ViewHelper.toCheckCommandViewList(checkCommandList);
            model.addAttribute("checkCommandList", checkCommandViewList);

            model.addAttribute("monitorHost", monitorHostView);
            return "/devicemanage/monitorhost/detail";
        } catch (Exception e) {
            LOGGER.error("add monitorhost fail; error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @RequestMapping(value = "/searchMonitorHostSelect", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public Object searchChannelSelectView(
            @RequestParam(value = "key", defaultValue = "") String key,
            @RequestParam(value = "page", defaultValue = "1") int pageNum
    ) {
        try {
            int pageSize = CommonConstants.COMMON_PAGE_SIZE;
            MonitorHostCondition monitorHostCondition = new MonitorHostCondition();
            monitorHostCondition.setKeyWord(key);
            int total = monitorHostService.countMonitorHost(monitorHostCondition);
            List<MonitorHost> monitorHostList = monitorHostService.getMonitorHostListByCondition(monitorHostCondition, pageNum, pageSize);

            List<SelectView> selectViews = ViewHelper.monitorHostToSelectViewList(monitorHostList);

            PageView<SelectView> page = new PageView<SelectView>(pageSize, pageNum, total,
                    selectViews);

            return new BasicResult(true, ReturnConstants.SUCCESS_RESULT.getMessage(), page);
        } catch (Exception e) {
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }


}
