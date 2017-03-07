package com.ezsmart.umcs.wapi.web.controller;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.domain.DiscoveredHost;
import com.ezsmart.umcs.domain.HostModel;
import com.ezsmart.umcs.domain.MonitorHost;
import com.ezsmart.umcs.services.impl.DiscoveredHostServiceImpl;
import com.ezsmart.umcs.services.impl.HostModelServiceImpl;
import com.ezsmart.umcs.services.impl.MonitorHostServiceImpl;
import com.ezsmart.umcs.wapi.request.MonitorHostRequest;
import com.ezsmart.umcs.wapi.util.LoginUtil;
import com.ezsmart.umcs.wapi.util.ViewHelper;
import com.ezsmart.umcs.wapi.view.DiscoveredHostView;
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
import javax.swing.text.View;
import java.util.List;

/**
 * Created by luochunteng on 2016/5/11.
 */
@Controller
@RequestMapping(value = "discoveredhost")
public class DiscoveredHostController {
    private static final Logger LOGGER = LoggerFactory.getLogger(DiscoveredHostController.class);
    @Autowired
    private DiscoveredHostServiceImpl discoveredHostService;

    @Autowired
    private MonitorHostServiceImpl monitorHostService;

    @Autowired
    private HostModelServiceImpl hostModelService;

    @RequestMapping(value = "/list")
    public Object listHost(@RequestParam(value = "key", defaultValue = "") String key,
                           @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
                           HttpServletRequest request, Model model) {
        try {
            int total = discoveredHostService.count(key);
            List<DiscoveredHost> discoveredHostList = discoveredHostService.getDiscoveredHostByKeyword(key, pageNum, pageSize);
            List<DiscoveredHostView> discoveredHostViewList = ViewHelper.toDiscoveredHostViewList(discoveredHostList);
            PageView<DiscoveredHostView> page = new PageView<DiscoveredHostView>(pageSize, pageNum, total,
                    discoveredHostViewList);

            model.addAttribute("discoveredHostList", page);
            return "/discoveredhost/list";
        } catch (Exception e) {
            LOGGER.error("get discoveredhost list fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @RequestMapping(value = "/add")
    public Object add(@RequestParam(value = "id") int id, HttpServletRequest request, Model model) {
        try {
            Account currAccount = LoginUtil.getLoginAccount(request);
            if (!CommonConstants.RoleType.ADMIN.getType().equals(currAccount.getRoleType())) {
                return new BasicResult(false, ReturnConstants.ACCESS_DENIED.getCode(), ReturnConstants.ACCESS_DENIED.getMessage());
            }
            DiscoveredHost discoveredHost = discoveredHostService.getDiscoveredHostById(id);
            if (discoveredHost == null) {
                return new BasicResult(false, ReturnConstants.DISCOVEREDHOST_NOT_EXIST.getCode(), ReturnConstants.DISCOVEREDHOST_NOT_EXIST.getMessage());
            }
            String hostcode = discoveredHost.getUcode();
            String hostmodel = discoveredHost.getModel();
            MonitorHost monitorHost = new MonitorHost();
            monitorHost.setUcode(hostcode);
            monitorHost.setModel(hostmodel);
            HostModel hostModel = hostModelService.getByModel(hostmodel);
            if (hostModel != null) {
                SelectView selectView = ViewHelper.hostModelToSelectView(hostModel);
                model.addAttribute("hostModel", selectView);
            }
            model.addAttribute("monitorHost", ViewHelper.toMonitorHostView(monitorHost));
            return "/discoveredhost/add";
        } catch (Exception e) {
            LOGGER.error("get discoveredhost list fail;error:{}", e);
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
            String hostUcode = monitorHostRequest.getUcode();
            HostModel hostModel = hostModelService.getById(modelId);
            monitorHost.setModel(hostModel.getModel());
            if (monitorHost.getId() == 0) {
                //add
                //做一些其它的数据迁移处理 以及必要的校验
                MonitorHost oldHost = monitorHostService.getMonitorHostByUcode(monitorHost.getUcode());
                if (oldHost != null) {
                    return new BasicResult(false, ReturnConstants.MONITOR_HOST_UCODE_EXIST.getCode(), ReturnConstants.MONITOR_HOST_UCODE_EXIST.getMessage());
                }
                monitorHost.setUcode(hostModel.getModel() + monitorHost.getUcode());
                if (monitorHostService.addMonitorHost(monitorHost).isSuccess()) {
                    return discoveredHostService.deleteHost(hostUcode);
                } else {
                    return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
                }
            }
        } catch (Exception e) {
            LOGGER.error("save monitorhost fail; error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
        return null;
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
}
