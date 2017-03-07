package com.ezsmart.umcs.wapi.web.controller;


import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.AdminRegion;
import com.ezsmart.umcs.services.impl.AdminRegionServiceImpl;
import com.ezsmart.umcs.wapi.constant.WapiConstDefine;
import com.ezsmart.umcs.wapi.util.ViewHelper;
import com.ezsmart.umcs.wapi.view.SelectView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by luochunteng on 2016/4/11 0011.
 */
@Controller
@RequestMapping(value = "adminregion")
public class AdminRegionController {
    private static final Logger LOGGER = LoggerFactory.getLogger(AccountController.class);

    @Autowired
    private AdminRegionServiceImpl adminRegionService;

    @ResponseBody
    @RequestMapping(value = "/get_provinceList")
    public Object getProvinceList(Model model) {
        //获取省、直辖市级别
        List<AdminRegion> adminRegionList = adminRegionService.getAdminRegionListByLevel(WapiConstDefine.ADMINREGION_FIREST_LEVEL);
        List<SelectView> provinceList = ViewHelper.getAreaList(adminRegionList);

        return new BasicResult(true, "ok", provinceList);
    }

    @ResponseBody
    @RequestMapping(value = "/get_city_county")
    public Object getCity(@RequestParam(value = "pcode", defaultValue = "0") int pcode, Model model) {
        //获取省、直辖市级别
        List<AdminRegion> adminRegionList = adminRegionService.getAdminRegionListByPCode(pcode);
        List<SelectView> cityOrCountyList = ViewHelper.getAreaList(adminRegionList);
        return new BasicResult(true, "ok", cityOrCountyList);
    }
}
