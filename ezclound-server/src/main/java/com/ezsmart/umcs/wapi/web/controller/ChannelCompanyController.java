package com.ezsmart.umcs.wapi.web.controller;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.domain.AdminRegion;
import com.ezsmart.umcs.domain.ChannelCompany;
import com.ezsmart.umcs.services.impl.AdminRegionServiceImpl;
import com.ezsmart.umcs.services.impl.ChannelCompanyServiceImpl;
import com.ezsmart.umcs.wapi.request.ChannelCompanyRequest;
import com.ezsmart.umcs.wapi.util.LoginUtil;
import com.ezsmart.umcs.wapi.util.ViewHelper;
import com.ezsmart.umcs.wapi.view.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by luochunteng
 */
@Controller
@RequestMapping(value = "channelCompany")
public class ChannelCompanyController {
    private static final Logger LOGGER = LoggerFactory.getLogger(ChannelCompanyController.class);

    @Autowired
    private ChannelCompanyServiceImpl channelCompanyService;

    @Autowired
    private AdminRegionServiceImpl adminRegionService;

    /**
     * 渠道商列表/搜索列表
     *
     * @return
     */
    @RequestMapping(value = "/list")
    public String getChannelList(Model model,
                                 @RequestParam(value = "key", defaultValue = "") String keywords,
                                 @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                 @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
                                 HttpServletRequest request) {
        Account curAccount = LoginUtil.getLoginAccount(request);
        int total = channelCompanyService.count(keywords);
        List<ChannelCompany> channelCompanyList = channelCompanyService
                .getChannelComopanyByKeywords(keywords, pageNum, pageSize);
        List<ChannelCompanyView> channelCompanyViewList = ViewHelper.toChannelCompanyViewList(channelCompanyList, curAccount);
        PageView<ChannelCompanyView> page = new PageView<ChannelCompanyView>(pageSize, pageNum,
                total, channelCompanyViewList);

        model.addAttribute("channelCompanyPage", page);
        model.addAttribute("keyword", keywords);
        return "channelcompany/list";
    }

    /**
     * 新增/编辑渠道商
     *
     * @return
     */
    @RequestMapping(value = "/add")
    public Object editChannel(
            @RequestParam(value = "id", defaultValue = "0") int id, Model model) {
        ChannelCompany channelCompany = null;
        try {
            boolean isAdd = false;
            if (id == 0) {
                //add
                isAdd = true;
                channelCompany = new ChannelCompany();
            } else {
                //update
                channelCompany = channelCompanyService.getChannelComopanyById(id);
                int areaCode = channelCompany.getAreaCode();
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
            model.addAttribute("channelCompanyInfo", channelCompany);
            model.addAttribute("isAdd", isAdd);
            return "channelcompany/add";
        } catch (Exception e) {
            LOGGER.error("to add channelCompany fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }

    }

    @ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Object save(ChannelCompanyRequest channelCompanyRequest) {
        ChannelCompany channelCompany = getChannelCompany(channelCompanyRequest);
        int companyId = channelCompany.getId();
        try {
            if (companyId == 0) {
                return channelCompanyService.createChannelComopany(channelCompany);
            } else {
                return channelCompanyService.updateChannelComopany(channelCompany);
            }
        } catch (Exception e) {
            LOGGER.error("add channelComopany fail, error: {}", e);
            return new BasicResult(false, ReturnConstants.CHANNELCOMPANY_SAVE_FAIL.getCode(), ReturnConstants.CHANNELCOMPANY_SAVE_FAIL.getMessage());
        }
    }

    private ChannelCompany getChannelCompany(ChannelCompanyRequest channelCompanyRequest) {
        ChannelCompany channelCompany = new ChannelCompany();
        channelCompany.setId(channelCompanyRequest.getId());
        channelCompany.setName(channelCompanyRequest.getName());
        channelCompany.setContacts(channelCompanyRequest.getContacts());
        channelCompany.setMphone(channelCompanyRequest.getMphone());
        channelCompany.setPhone(channelCompanyRequest.getPhone());
        channelCompany.setSaleVolume(channelCompanyRequest.getSaleVolume());
        channelCompany.setAreaCode(channelCompanyRequest.getAddress());
        return channelCompany;
    }

    /**
     * 查看渠道商
     *
     * @return
     */
    @RequestMapping(value = "/detail")
    public Object getChannelInfo(@RequestParam(value = "id", defaultValue = "0") int id, HttpServletRequest request, Model model) {
        try {
            Account loginAccount = LoginUtil.getLoginAccount(request);
            if (id <= 0) {
                id = loginAccount.getOwnerId();
            }

            ChannelCompany channelCompany = channelCompanyService.getChannelComopanyById(id);
            int areaCode = channelCompany.getAreaCode();
            if (areaCode == 0) {
                areaCode = 110101;//默认北京东城区
            }
            StringBuffer sb = new StringBuffer();
            List<AdminRegion> addressList = adminRegionService.getAdminRegionListByTree(areaCode);
            for (AdminRegion address : addressList) {
                sb.append(address.getName());
                sb.append(" ");
            }
            ChannelCompanyView channelCompanyView = ViewHelper.toChannelCompanyView(channelCompany);
            channelCompanyView.setAddress(sb.toString());

            model.addAttribute("channelCompanyInfo", channelCompanyView);
            return "channelcompany/detail";
        } catch (Exception e) {
            LOGGER.error("get channelComopany fail, error: {}", e);
            return new BasicResult(false, ReturnConstants.CHANNELCOMPANY_IS_DELETED.getCode(), ReturnConstants.CHANNELCOMPANY_IS_DELETED.getMessage());
        }
    }

    /**
     * 删除渠道商
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/delete")
    public Object deleteChannel(@RequestParam(value = "id") int id) {
        try {
            return channelCompanyService.deleteChannelComopany(id);
        } catch (Exception e) {
            LOGGER.error("delete channelComopany fail, error: {}", e);
            return new BasicResult(false, ReturnConstants.CHANNELCOMPANY_DELETE_FAIL.getCode(), ReturnConstants.CHANNELCOMPANY_DELETE_FAIL.getMessage());
        }
    }


    @RequestMapping(value = "/searchChannelSelect", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public Object searchChannelSelectView(
            @RequestParam(value = "key", defaultValue = "") String key,
            @RequestParam(value = "page", defaultValue = "1") int pageNum
    ) {
        try {
            int pageSize = CommonConstants.COMMON_PAGE_SIZE;
            int total = channelCompanyService.count(key);
            List<ChannelCompany> channelList = channelCompanyService.getChannelComopanyByKeywords(key, pageNum, pageSize);

            List<SelectView> selectViews = ViewHelper.channelToSelectViewList(channelList);

            PageView<SelectView> page = new PageView<SelectView>(pageSize, pageNum, total,
                    selectViews);

            return new BasicResult(true, ReturnConstants.SUCCESS_RESULT.getMessage(), page);
        } catch (Exception e) {
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

}
