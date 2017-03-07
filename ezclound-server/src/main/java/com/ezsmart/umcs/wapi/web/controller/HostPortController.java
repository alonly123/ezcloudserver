package com.ezsmart.umcs.wapi.web.controller;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.HostPort;
import com.ezsmart.umcs.services.impl.HostPortServiceImpl;
import com.ezsmart.umcs.wapi.util.ViewHelper;
import com.ezsmart.umcs.wapi.view.HostPortView;
import com.ezsmart.umcs.wapi.view.SelectView;
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
import java.util.List;

/**
 * Created by luochunteng on 2016/5/9 0009.
 */
@Controller
@RequestMapping("hostport")
public class HostPortController {
    private static final Logger LOGGER = LoggerFactory.getLogger(HostPortController.class);

    @Autowired
    private HostPortServiceImpl hostPortService;

    @RequestMapping(value = "/detail")
    public Object getHostPortDetail(@RequestParam(value = "id", defaultValue = "0") int id, HttpServletRequest request, Model model) {
        try {
            HostPort hostPort = hostPortService.getHostPortById(id);
            HostPortView hostPortView = ViewHelper.toHostPortView(hostPort);

            model.addAttribute("hostport", hostPortView);
            return "/devicemanage/hostport/detail";
        } catch (Exception e) {
            LOGGER.error("add monitorhost fail; error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping(value = "/searchhostprot")
    public Object searchhostprot(@RequestParam(value = "hostCode", defaultValue = "0") String hostCode, Model model) {
        List<HostPort> hostPortList = hostPortService.getHostPortListByHostCode(hostCode);
        List<SelectView> hostPorts = ViewHelper.getHostPortList(hostPortList);
        return new BasicResult(true, "ok", hostPorts);
    }
}
