package com.ezsmart.umcs.wapi.web.controller;

import com.alibaba.fastjson.JSON;
import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.DeviceModelCheckCommandCondition;
import com.ezsmart.umcs.condition.DeviceModelCheckItemCondition;
import com.ezsmart.umcs.condition.TargetDeviceModelCondition;
import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.DeviceModelCheckCommand;
import com.ezsmart.umcs.domain.DeviceModelCheckItem;
import com.ezsmart.umcs.domain.TargetDeviceModel;
import com.ezsmart.umcs.services.impl.DeviceModelCheckCommandServiceImpl;
import com.ezsmart.umcs.services.impl.DeviceModelCheckItemServiceImpl;
import com.ezsmart.umcs.services.impl.TargetDeviceModelServiceImpl;
import com.ezsmart.umcs.wapi.request.TargetDeviceModelRequest;
import com.ezsmart.umcs.wapi.util.ViewHelper;
import com.ezsmart.umcs.wapi.view.*;
import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class TargetDeviceModelController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(TargetDeviceModelController.class);


    @Autowired
    private TargetDeviceModelServiceImpl targetDeviceModelService;

    @Autowired
    private DeviceModelCheckItemServiceImpl deviceModelCheckItemService;

    @Autowired
    private DeviceModelCheckCommandServiceImpl deviceModelCheckCommandService;

    @RequestMapping("/admin/TargetDeviceModel/list")
    public String list(
            Model model,
            @RequestParam(value = "key", defaultValue = "") String keyword,
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", defaultValue = "20") int pageSize
    ) {
        pageNum = pageNum > 0 ? pageNum : 1;
        pageSize = pageSize > 0 ? pageSize : CommonConstants.COMMON_PAGE_SIZE;

        TargetDeviceModelCondition condition = new TargetDeviceModelCondition();
        condition.setKeyWord(keyword);

        int total = targetDeviceModelService.count(condition);
        List<TargetDeviceModel> targetDeviceModelList = Lists.newArrayList();
        if (total > 0) {
            targetDeviceModelList = targetDeviceModelService.getList(condition, pageNum, pageSize);
        }

        List<TargetDeviceModelView> targetDeviceModelViewList = ViewHelper.toTargetDeviceModelViewList(targetDeviceModelList);

        PageView<TargetDeviceModelView> pageView = new PageView<TargetDeviceModelView>(pageSize, pageNum, total, targetDeviceModelViewList);

        model.addAttribute("page", pageView);


        return "admin/target_device_model/list";
    }

    @RequestMapping("/admin/TargetDeviceModel/detail")
    public String list(
            Model model,
            @RequestParam(value = "id", defaultValue = "0") int id
    ) {
        // targetDeviceModel
        TargetDeviceModel targetDeviceModel = targetDeviceModelService.getById(id);
        if (targetDeviceModel != null) {
            TargetDeviceModelView targetDeviceModelView = new TargetDeviceModelView(targetDeviceModel);
            model.addAttribute("targetDeviceModel", targetDeviceModelView);

            String deviceModel = targetDeviceModel.getModel();

            // checkitem list
            DeviceModelCheckItemCondition checkItemCondition = new DeviceModelCheckItemCondition();
            checkItemCondition.setTargetDeviceModel(deviceModel);
            List<DeviceModelCheckItem> checkItemList = deviceModelCheckItemService.getList(checkItemCondition);
            List<DeviceModelCheckItemView> checkItemViewList = ViewHelper.toDeviceModelCheckItemViewList(checkItemList);
            model.addAttribute("checkItemList", checkItemViewList);

            // checkcommand list
            DeviceModelCheckCommandCondition checkCommandCondition = new DeviceModelCheckCommandCondition();
            checkCommandCondition.setTargetDeviceModel(deviceModel);
            List<DeviceModelCheckCommand> checkCommandList = deviceModelCheckCommandService.getList(checkCommandCondition);
            List<DeviceModelCheckCommandView> checkCommandViewList = ViewHelper.toDeviceModelCheckCommandViewList(checkCommandList);
            model.addAttribute("checkCommandList", checkCommandViewList);


        }

        return "admin/target_device_model/detail";
    }

    @RequestMapping(value = "/admin/TargetDeviceModel/save", method = RequestMethod.POST)
    @ResponseBody
    public Object save(TargetDeviceModelRequest targetDeviceModelRequest) {
        try {

            //TODO validate

            TargetDeviceModel targetDeviceModel = new TargetDeviceModel();
            targetDeviceModel.setId(targetDeviceModelRequest.getId());
            targetDeviceModel.setName(targetDeviceModelRequest.getName());
            targetDeviceModel.setLongModel(targetDeviceModelRequest.getLongModel());
            targetDeviceModel.setModel(targetDeviceModelRequest.getModel());
            targetDeviceModel.setVendor(targetDeviceModelRequest.getVendor());
            targetDeviceModel.setDescr(targetDeviceModelRequest.getDescr());

            return targetDeviceModelService.save(targetDeviceModel);
        } catch (Exception e) {
            LOGGER.error("save error targetDeviceModelRequest={}", JSON.toJSONString(targetDeviceModelRequest), e);
        }
        return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
    }

    @RequestMapping(value = "/admin/TargetDeviceModel/delete", method = RequestMethod.POST)
    @ResponseBody
    public Object delete(int id) {
        try {

            return targetDeviceModelService.delete(id);
        } catch (Exception e) {
            LOGGER.error("delete error id={}", id, e);
        }
        return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
    }

}
