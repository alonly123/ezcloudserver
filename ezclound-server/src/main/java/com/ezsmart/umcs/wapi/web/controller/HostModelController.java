package com.ezsmart.umcs.wapi.web.controller;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.*;
import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.*;
import com.ezsmart.umcs.services.DeviceModelCheckItemService;
import com.ezsmart.umcs.services.impl.*;
import com.ezsmart.umcs.wapi.util.ViewHelper;
import com.ezsmart.umcs.wapi.view.*;
import com.google.common.base.Function;
import com.google.common.collect.Collections2;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;
import java.util.List;

/**
 * Created by lixiangyang on 16/4/23.
 */
@Controller
public class HostModelController {
    @Autowired
    private HostModelServiceImpl hostModelService;

    @Autowired
    private HostModelPortServiceImpl hostModelPortService;

    @Autowired
    private HostModelTargetDeviceServiceImpl hostModelTargetDeviceService;

    @Autowired
    private TargetDeviceModelServiceImpl targetDeviceModelService;

    @Autowired
    private DeviceModelCheckItemServiceImpl deviceModelCheckItemService;

    @Autowired
    private DeviceModelCheckCommandServiceImpl deviceModelCheckCommandService;


    @RequestMapping("/admin/HostModel/list")
    public String hostModelList(
            Model model,
            @RequestParam(value = "keyword", defaultValue = "") String keyword,
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", defaultValue = "20") int pageSize
    ) {
        pageNum = pageNum > 0 ? pageNum : 1;
        pageSize = pageSize > 0 ? pageSize : CommonConstants.COMMON_PAGE_SIZE;

        HostModelCondition hostModelCondition = new HostModelCondition();
        hostModelCondition.setKeyWord(keyword);

        int total = hostModelService.count(hostModelCondition);

        List<HostModel> hostModelList = Lists.newArrayList();
        if (total > 0) {
            hostModelList = hostModelService.getList(hostModelCondition, pageNum, pageSize);
        }

        List<HostModelView> hostModelViewList = ViewHelper.toHostModelViewList(hostModelList);

        PageView<HostModelView> pageView = new PageView<HostModelView>(pageSize, pageNum, total, hostModelViewList);

        model.addAttribute("page", pageView);

        return "admin/host_model/list";
    }


    @RequestMapping("/admin/HostModel/detail")
    public String hostModelDetail(
            Model model,
            @RequestParam(value = "id", defaultValue = "0") int id
    ) {

        HostModel hostModel = hostModelService.getById(id);
        if (hostModel != null) {
            HostModelView hostModelView = new HostModelView(hostModel);
            model.addAttribute("hostModel", hostModelView);

            //端口列表
            String modelCode = hostModel.getModel();
            HostModelPortCondition condition = new HostModelPortCondition();
            condition.setHostModel(hostModel.getModel());
            List<HostModelPort> hostModelPorts = hostModelPortService.getList(condition);
            List<HostModelPortView> hostModelPortViews = ViewHelper.toHostModelPortViewList(hostModelPorts);

            model.addAttribute("hostModelPortList", hostModelPortViews);

//            //外设列表
//            List<String> portUcodes = Lists.newArrayList(Collections2.transform(hostModelPorts, new Function<HostModelPort, String>() {
//                @Override
//                public String apply(HostModelPort hostModelPort) {
//                    return hostModelPort.getUcode();
//                }
//            }));
//            List<HostModelTargetDevice> hostModelTargetDevices = null;
//            if (CollectionUtils.isEmpty(portUcodes)) {
//                hostModelTargetDevices = Collections.EMPTY_LIST;
//            } else {
//                HostModelTargetDeviceCondition hostModelTargetDeviceCondition = new HostModelTargetDeviceCondition();
//                hostModelTargetDeviceCondition.setPortUcodes(portUcodes);
//                hostModelTargetDevices = hostModelTargetDeviceService.getList(hostModelTargetDeviceCondition);
//            }
//            model.addAttribute("hostModelTargetDevices", hostModelTargetDevices);


            //外设型号
            TargetDeviceModelCondition targetDeviceModelCondition = new TargetDeviceModelCondition();
            targetDeviceModelCondition.setModel(hostModel.getModel());
            List<TargetDeviceModel> targetDeviceModels = targetDeviceModelService.getList(targetDeviceModelCondition);
            model.addAttribute("targetDeviceModels", targetDeviceModels);


            //外设检查项
            List<String> deviceModels = Lists.newArrayList(Collections2.transform(targetDeviceModels, new Function<TargetDeviceModel, String>() {
                @Override
                public String apply(TargetDeviceModel targetDeviceModel) {
                    return targetDeviceModel.getModel();
                }
            }));
            List<DeviceModelCheckItem> deviceModelCheckItems = null;
            if (CollectionUtils.isEmpty(deviceModels)) {
                deviceModelCheckItems = Collections.EMPTY_LIST;
            } else {

                DeviceModelCheckItemCondition deviceModelCheckItemCondition = new DeviceModelCheckItemCondition();
                deviceModelCheckItemCondition.setTargetDeviceModels(deviceModels);
                deviceModelCheckItems = deviceModelCheckItemService.getList(deviceModelCheckItemCondition);
            }
            model.addAttribute("deviceModelCheckItems", deviceModelCheckItems);



            //外设检查命令


        }

        return "admin/host_model/detail";
    }

    @RequestMapping("/admin/HostModelPort/detail")
    public String hostModelPortDetail(
            Model model,
            @RequestParam(value = "id", defaultValue = "0") int id
    ) {

        HostModelPort hostModelPort = hostModelPortService.getById(id);
        if (hostModelPort != null) {
            HostModelPortView hostModelPortView = new HostModelPortView(hostModelPort);
            model.addAttribute("hostModelPort", hostModelPortView);

            String portUcode = hostModelPort.getUcode();
            HostModelTargetDeviceCondition condition = new HostModelTargetDeviceCondition();
            condition.setPortUcode(portUcode);
            List<HostModelTargetDevice> hostModelTargetDevices = hostModelTargetDeviceService.getList(condition);
            List<HostModelTargetDeviceView> hostModelTargetDeviceViews = ViewHelper.toHostModelTargetViewList(hostModelTargetDevices);

            model.addAttribute("hostModelTargetDeviceList", hostModelTargetDeviceViews);
        }

        return "admin/host_model/port_detail";
    }

    @RequestMapping(value = "/admin/hostmodel/searchHostModelSelect", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public Object searchHostModelSelectView(
            @RequestParam(value = "key", defaultValue = "") String key,
            @RequestParam(value = "page", defaultValue = "1") int pageNum
    ) {
        try {
            int pageSize = CommonConstants.COMMON_PAGE_SIZE;
            HostModelCondition hostModelCondition = new HostModelCondition();
            hostModelCondition.setKeyWord(key);

            int total = hostModelService.count(hostModelCondition);

            List<HostModel> hostModelList = Lists.newArrayList();
            if (total > 0) {
                hostModelList = hostModelService.getList(hostModelCondition, pageNum, pageSize);
            }

            List<SelectView> selectViews = ViewHelper.hostModelToSelectViewList(hostModelList);
            PageView<SelectView> page = new PageView<SelectView>(pageSize, pageNum, total,
                    selectViews);

            return new BasicResult(true, ReturnConstants.SUCCESS_RESULT.getMessage(), page);
        } catch (Exception e) {
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping(value = "/admin/TargetDeviceModle/searchTargetDeviceModel")
    public Object searchTargetDeviceModel(@RequestParam(value = "portCode", defaultValue = "0") String portCode, Model model) {
        HostModelTargetDeviceCondition condition = new HostModelTargetDeviceCondition();
        if (!StringUtils.isEmpty(portCode)) {
            portCode = portCode.split("\\.")[1];
        }
        condition.setPortUcode(portCode);
        List<HostModelTargetDevice> hostModelTargetDevices = hostModelTargetDeviceService.getList(condition);
        List<SelectView> hostPorts = ViewHelper.hostModelTDToSelectViewList(hostModelTargetDevices);
        return new BasicResult(true, "ok", hostPorts);
    }

    @RequestMapping(value = "/admin/TargetDeviceModelCheckItem/detail")
    public String deviceModelCheckItemDetail(
            Model model,
            int id
    ) {
        DeviceModelCheckItem deviceModelCheckItem = deviceModelCheckItemService.getById(id);
        if (deviceModelCheckItem != null) {
            DeviceModelCheckItemView deviceModelCheckItemView = new DeviceModelCheckItemView(deviceModelCheckItem);
            model.addAttribute("deviceModelCheckItem", deviceModelCheckItemView);
        }
        return "admin/host_model/check_item_detail";
    }


}
