package com.ezsmart.umcs.wapi.web.controller;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.CheckCommandCondition;
import com.ezsmart.umcs.condition.CheckItemCondition;
import com.ezsmart.umcs.condition.MonitorHostCondition;
import com.ezsmart.umcs.condition.TargetDeviceCondition;
import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.*;
import com.ezsmart.umcs.services.CheckCommandService;
import com.ezsmart.umcs.services.CheckItemService;
import com.ezsmart.umcs.services.impl.*;
import com.ezsmart.umcs.wapi.request.TargetDeviceRequest;
import com.ezsmart.umcs.wapi.util.LoginUtil;
import com.ezsmart.umcs.wapi.util.ViewHelper;
import com.ezsmart.umcs.wapi.view.PageView;
import com.ezsmart.umcs.wapi.view.SelectView;
import com.ezsmart.umcs.wapi.view.TargetDeviceView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.java2d.pipe.ValidatePipe;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * Created by luochunteng on 2016/5/9 0009.
 */
@Controller
@RequestMapping(value = "targetdevice")
public class TargetDeviceController {
    private static final Logger LOGGER = LoggerFactory.getLogger(TargetDeviceController.class);

    @Autowired
    private TargetDeviceServiceImpl targetDeviceService;

    @Autowired
    private AdminRegionServiceImpl adminRegionService;

    @Autowired
    private CheckItemServiceImpl checkItemService;

    @Autowired
    private CheckCommandServiceImpl checkCommandService;

    @Autowired
    private HostModelTargetDeviceServiceImpl hostModelTargetDeviceService;
    @Autowired
    private HostPortServiceImpl hostPortService;
    @Autowired
    private MonitorHostServiceImpl monitorHostService;
    @Autowired
    private TargetDeviceModelServiceImpl targetDeviceModelService;
    @Autowired
    private CustomerServiceImpl customerService;


    @RequestMapping(value = "/list")
    public Object list(@RequestParam(value = "key", defaultValue = "") String key,
                       @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
                       HttpServletRequest request, Model model) {
        try {
            boolean isAdmin = false;
            Account currentAccount = LoginUtil.getLoginAccount(request);
            MonitorHostCondition monitorHostCondition = new MonitorHostCondition();
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
            List<MonitorHost> monitorHostList = monitorHostService.getMonitorHostListByCondition(monitorHostCondition, pageNum, 10000);
            if (!CollectionUtils.isEmpty(monitorHostList)) {
                TargetDeviceCondition targetDeviceCondition = new TargetDeviceCondition();
                List<String> hostCodeList = new ArrayList<String>();
                for (MonitorHost monitorHost : monitorHostList) {
                    hostCodeList.add(monitorHost.getUcode());
                }
                targetDeviceCondition.setHostUcodeList(hostCodeList);
                targetDeviceCondition.setKeyWord(key);
                int total = targetDeviceService.count(targetDeviceCondition);
                List<TargetDevice> targetDeviceList = targetDeviceService.getTargetDeviceListByCondition(targetDeviceCondition, pageNum, pageSize);

                List<TargetDeviceView> targetDeviceViewList = ViewHelper.toTargetDeviceViewList(targetDeviceList);
                PageView<TargetDeviceView> page = new PageView<TargetDeviceView>(pageSize, pageNum, total,
                        targetDeviceViewList);

                model.addAttribute("targetDeviceList", page);
                model.addAttribute("isAdmin", isAdmin);
            }

            return "/devicemanage/targetdevice/list";
        } catch (Exception e) {
            LOGGER.error("list targetdevice fail; error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @RequestMapping(value = "/add")
    public Object add(@RequestParam(value = "id", defaultValue = "0") int id, @RequestParam(value = "portId", defaultValue = "0") int portId,
                      @RequestParam(value = "fromView", defaultValue = "tdmanage") String fromView, HttpServletRequest request, Model model) {
        try {
            Account currAccount = LoginUtil.getLoginAccount(request);
            if (!CommonConstants.RoleType.ADMIN.getType().equals(currAccount.getRoleType())) {
                return new BasicResult(false, ReturnConstants.ACCESS_DENIED.getCode(), ReturnConstants.ACCESS_DENIED.getMessage());
            }
            boolean isAdd = false;
            TargetDevice targetDevice;
            TargetDeviceView targetDeviceView;
            if (id == 0) {
                isAdd = true;
                targetDevice = new TargetDevice();
                targetDeviceView = ViewHelper.toTargetDeviceView(targetDevice);

                //从设备详情的端口列表点进来add
                HostPort hostPort = hostPortService.getHostPortById(portId);
                targetDeviceView.setPortName(hostPort.getName());
                targetDeviceView.setPortUCode(hostPort.getUcode());

                MonitorHost monitorHost = monitorHostService.getMonitorHostByUcode(hostPort.getHostUCode());
                targetDeviceView.setHostName(monitorHost.getName());
                targetDeviceView.setHostucode(monitorHost.getUcode());
                SelectView selectView = new SelectView(monitorHost.getUcode(), monitorHost.getName());
                model.addAttribute("host", selectView);
                model.addAttribute("monitorhostid", monitorHost.getId());

            } else {
                targetDevice = targetDeviceService.getTargetDeviceById(id);
                targetDeviceView = ViewHelper.toTargetDeviceView(targetDevice);
                HostPort hostPort = hostPortService.getHostPortByUCode(targetDeviceView.getPortUCode());
                targetDeviceView.setPortName(hostPort.getName());

                MonitorHost monitorHost = monitorHostService.getMonitorHostByUcode(targetDeviceView.getHostucode());
                targetDeviceView.setHostName(monitorHost.getName());
                SelectView selectView = new SelectView(monitorHost.getUcode(), monitorHost.getName());
                model.addAttribute("host", selectView);
                model.addAttribute("monitorhostid", monitorHost.getId());

                TargetDeviceModel targetDeviceModel = targetDeviceModelService.getByModel(targetDeviceView.getModel());
                String modelNmae = targetDeviceModel == null ? "" : targetDeviceModel.getName();
                targetDeviceView.setModelName(modelNmae);
            }
            int addr = targetDevice.getAddr();
            if (addr == 0) {
                addr = 110101;//默认北京东城区
            }
            StringBuffer sb = new StringBuffer();
            List<AdminRegion> adminRegionList = adminRegionService.getAdminRegionListByTree(addr);
            for (AdminRegion address : adminRegionList) {
                sb.append(address.getName());
                sb.append(" ");
            }
            targetDeviceView.setAddrDetail(sb.toString());

            model.addAttribute("fromView", fromView);// portId == 0 ? "tdmanage" : "mhdetail"
            model.addAttribute("isAdd", isAdd);
            model.addAttribute("targetDevice", targetDeviceView);
            return "/devicemanage/targetdevice/add";
        } catch (Exception e) {
            LOGGER.error("add targetdevice fail; error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping(value = "/save")
    public Object save(TargetDeviceRequest targetDeviceRequest, HttpServletRequest request) {
        try {
            Account currAccount = LoginUtil.getLoginAccount(request);
            if (!CommonConstants.RoleType.ADMIN.getType().equals(currAccount.getRoleType())) {
                return new BasicResult(false, ReturnConstants.ACCESS_DENIED.getCode(), ReturnConstants.ACCESS_DENIED.getMessage());
            }
            TargetDevice targetDevice = targetDeviceService.getTargetDeviceByCode(targetDeviceRequest.getCode());
            if (targetDevice != null) {
                return new BasicResult(false, ReturnConstants.TARGET_DEVICE_CODE_EXIST.getCode(), ReturnConstants.TARGET_DEVICE_CODE_EXIST.getMessage());
            }
            String portCode = targetDeviceRequest.getPortUCode();
            String hostPortCode = StringUtils.isEmpty(portCode) ? "" : portCode.split("\\.")[1];
            String deviceModel = targetDeviceRequest.getModel();
            HostModelTargetDevice hostModelTargetDevice = hostModelTargetDeviceService.getByPortCodeTDModel(hostPortCode, deviceModel);
            if (hostModelTargetDevice == null) {
                return new BasicResult(false, ReturnConstants.TARGET_DEVICE_MODEL_NOT_EXIST.getCode(), ReturnConstants.TARGET_DEVICE_MODEL_NOT_EXIST.getMessage());
            }
            targetDevice = getTargetDevice(targetDeviceRequest, hostModelTargetDevice);
            if (targetDevice.getId() == 0) {
                return targetDeviceService.addTargetDevice(targetDevice);
            } else {
                return targetDeviceService.updateTargetDevice(targetDevice);
            }
        } catch (Exception e) {
            LOGGER.error("save targetdevice fail; error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    private TargetDevice getTargetDevice(TargetDeviceRequest targetDeviceRequest, HostModelTargetDevice hostModelTargetDevice) {
        TargetDevice targetDevice = new TargetDevice();
        targetDevice.setId(targetDeviceRequest.getId());
        targetDevice.setName(targetDeviceRequest.getName());
        targetDevice.setCode(targetDeviceRequest.getCode());
        targetDevice.setPortUCode(targetDeviceRequest.getPortUCode());
        targetDevice.setAddr(hostModelTargetDevice.getAddr());
        targetDevice.setPhyState("正常");
        targetDevice.setDeviceType(hostModelTargetDevice.getDeviceType());
        targetDevice.setState("正常");
        targetDevice.setLastCheck(new Date());
        targetDevice.setGraphX(0);
        targetDevice.setGraphY(0);
        targetDevice.setCheckInterval(0);
        targetDevice.setUse(0);
        targetDevice.setHostucode(targetDeviceRequest.getHostucode());
        targetDevice.setModel(hostModelTargetDevice.getDeviceModel());

        return targetDevice;
    }

    @ResponseBody
    @RequestMapping(value = "/delete")
    public Object delete(@RequestParam(value = "id") int targetDeviceId, HttpServletRequest request) {
        try {
            Account currAccount = LoginUtil.getLoginAccount(request);
            if (!CommonConstants.RoleType.ADMIN.getType().equals(currAccount.getRoleType())) {
                return new BasicResult(false, ReturnConstants.ACCESS_DENIED.getCode(), ReturnConstants.ACCESS_DENIED.getMessage());
            }
            TargetDevice targetDevice = targetDeviceService.getTargetDeviceById(targetDeviceId);
            if (targetDevice == null) {
                return new BasicResult(false, ReturnConstants.TARGET_DEVICE_NOT_EXIST.getCode(), ReturnConstants.TARGET_DEVICE_NOT_EXIST.getMessage());
            }
            return targetDeviceService.deleteTargetDevice(targetDeviceId);
        } catch (Exception e) {
            LOGGER.error("save targetdevice fail; error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @RequestMapping(value = "/detail")
    public Object getTargetDevice(@RequestParam(value = "id") int targetDeviceId, HttpServletRequest request, Model model) {
        try {
            TargetDevice targetDevice = targetDeviceService.getTargetDeviceById(targetDeviceId);
            if (targetDevice == null) {
                return new BasicResult(false, ReturnConstants.TARGET_DEVICE_NOT_EXIST.getCode(), ReturnConstants.TARGET_DEVICE_NOT_EXIST.getMessage());
            }
            CheckItemCondition checkItemCondition = new CheckItemCondition();
            CheckCommandCondition checkCommandCondition = new CheckCommandCondition();
            checkItemCondition.setTargetDeviceId(targetDeviceId);
            checkCommandCondition.setTargetDeviceId(targetDeviceId);
            List<CheckItem> checkItemList = checkItemService.getCheckItemListByCondition(checkItemCondition, 1, 10);
            List<CheckCommand> checkCommandList = checkCommandService.getCheckCommandListByCondition(checkCommandCondition, 1, 10);
            model.addAttribute("targetDevice", ViewHelper.toTargetDeviceView(targetDevice));
            model.addAttribute("checkItemList", ViewHelper.toCheckItemViewList(checkItemList));
            model.addAttribute("checkCommandList", ViewHelper.toCheckCommandViewList(checkCommandList));
            return "/devicemanage/targetdevice/detail";
        } catch (Exception e) {
            LOGGER.error("save targetdevice fail; error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }
}
