package com.ezsmart.umcs.wapi.web.controller;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.LocationCondition;
import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.domain.AdminRegion;
import com.ezsmart.umcs.domain.GeoLocation;
import com.ezsmart.umcs.domain.Room;
import com.ezsmart.umcs.services.impl.AdminRegionServiceImpl;
import com.ezsmart.umcs.services.impl.LocationServiceImpl;
import com.ezsmart.umcs.services.impl.RoomServiceImpl;
import com.ezsmart.umcs.wapi.request.LocationRequest;
import com.ezsmart.umcs.wapi.util.LoginUtil;
import com.ezsmart.umcs.wapi.util.ViewHelper;
import com.ezsmart.umcs.wapi.view.LocationView;
import com.ezsmart.umcs.wapi.view.PageView;
import com.ezsmart.umcs.wapi.view.RoomView;
import com.ezsmart.umcs.wapi.view.SelectView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.swing.text.View;
import java.util.List;

@Controller
@RequestMapping(value = "location")
public class LocationController {
    private static final Logger LOGGER = LoggerFactory.getLogger(LocationController.class);

    @Autowired
    private LocationServiceImpl locationService;

    @Autowired
    private AdminRegionServiceImpl adminRegionService;

    @Autowired
    private RoomServiceImpl roomService;

    @RequestMapping(value = "/list")
    public Object getLocationList(
            @RequestParam(value = "province", defaultValue = "") String province,
            @RequestParam(value = "city", defaultValue = "") String city,
            @RequestParam(value = "county", defaultValue = "") String county,
            @RequestParam(value = "key", defaultValue = "") String key,
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
            Model model, HttpServletRequest request) {
        try {
            Account currAccount = LoginUtil.getLoginAccount(request);
            if (!CommonConstants.RoleType.ADMIN.getType().equals(currAccount.getRoleType())) {
                return new BasicResult(false, ReturnConstants.ACCESS_DENIED.getCode(), ReturnConstants.ACCESS_DENIED.getMessage());
            }
            LocationCondition locationCondition = new LocationCondition();
            locationCondition.setKey(key);
            locationCondition.setProvince(province.equals("0") ? "" : province);
            locationCondition.setCity(city.equals("0") ? "" : city);
            locationCondition.setCounty(county.equals("0") ? "" : county);

            int total = locationService.count(locationCondition);
            List<GeoLocation> locationList = locationService.getLocationListByCondition(locationCondition, pageNum, pageSize);
            List<LocationView> locationViewList = ViewHelper.toLocationViewList(locationList);
            PageView<LocationView> page = new PageView<LocationView>(pageSize, pageNum, total,
                    locationViewList);

            model.addAttribute("locationList", page);
            model.addAttribute("keyword", key);
            model.addAttribute("province", province.equals("0") ? "" : province);
            model.addAttribute("city", city.equals("0") ? "" : city);
            model.addAttribute("county", county.equals("0") ? "" : county);
            return "/location/list";
        } catch (Exception e) {
            LOGGER.error("get location list fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping(value = "/save")
    public BasicResult save(LocationRequest locationRequest, HttpServletRequest request) {
        try {
            Account currAccount = LoginUtil.getLoginAccount(request);
            if (!CommonConstants.RoleType.ADMIN.getType().equals(currAccount.getRoleType())) {
                return new BasicResult(false, ReturnConstants.ACCESS_DENIED.getCode(), ReturnConstants.ACCESS_DENIED.getMessage());
            }
            int locationId = locationRequest.getId();
            GeoLocation location = getLocation(locationRequest);
            if (locationId == 0) {
                //add
                return locationService.createLocation(location);
            } else {
                //update
                return locationService.updateLocation(location);
            }
        } catch (Exception e) {
            LOGGER.error("save location fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    private GeoLocation getLocation(LocationRequest locationRequest) {
        GeoLocation location = new GeoLocation();
        location.setId(locationRequest.getId());
        location.setName(locationRequest.getName());
        location.setLon(locationRequest.getLon());
        location.setLat(locationRequest.getLat());
        location.setPostcode(locationRequest.getPostcode());
        location.setAddress(locationRequest.getAddress());
        location.setAreacode(locationRequest.getAreacode());
        return location;
    }


    @RequestMapping(value = "/add")
    public Object addLocation(@RequestParam(value = "id", defaultValue = "0") int id,
                              HttpServletRequest request, Model model) {
        try {
            Account currAccount = LoginUtil.getLoginAccount(request);
            if (!CommonConstants.RoleType.ADMIN.getType().equals(currAccount.getRoleType())) {
                return new BasicResult(false, ReturnConstants.ACCESS_DENIED.getCode(), ReturnConstants.ACCESS_DENIED.getMessage());
            }
            boolean isAdd = false;
            GeoLocation location;
            if (id == 0) {
                //add
                isAdd = true;
                location = new GeoLocation();
            } else {
                //update
                location = locationService.getLocationBy(id);
                String code = location.getAreacode();
                int areaCode = "0".equals(code) ? 0 : Integer.parseInt(code);
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
            model.addAttribute("isAdd", isAdd);
            model.addAttribute("location", ViewHelper.toLocationView(location));
            return "/location/add";
        } catch (Exception e) {
            LOGGER.error("add location fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping(value = "/delete")
    public BasicResult deleteLocation(@RequestParam(value = "id", defaultValue = "0") int id, HttpServletRequest request) {
        try {
            Account currAccount = LoginUtil.getLoginAccount(request);
            if (!CommonConstants.RoleType.ADMIN.getType().equals(currAccount.getRoleType())) {
                return new BasicResult(false, ReturnConstants.ACCESS_DENIED.getCode(), ReturnConstants.ACCESS_DENIED.getMessage());
            }
            GeoLocation location = locationService.getLocationBy(id);
            if (location == null) {
                return new BasicResult(false, ReturnConstants.LOCATION_NOT_EXIST.getCode(), ReturnConstants.LOCATION_NOT_EXIST.getMessage());
            }
            locationService.deleteLocation(id);
            return new BasicResult(true);
        } catch (Exception e) {
            LOGGER.error("delete location fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @RequestMapping(value = "/detail")
    public Object getLocationDetail(@RequestParam(value = "id", defaultValue = "0") int id, HttpServletRequest request, Model model) {
        try {
            Account currAccount = LoginUtil.getLoginAccount(request);
            if (!CommonConstants.RoleType.ADMIN.getType().equals(currAccount.getRoleType())) {
                return new BasicResult(false, ReturnConstants.ACCESS_DENIED.getCode(), ReturnConstants.ACCESS_DENIED.getMessage());
            }
            GeoLocation location = locationService.getLocationBy(id);
            if (location == null) {
                return new BasicResult(false, ReturnConstants.LOCATION_NOT_EXIST.getCode(), ReturnConstants.LOCATION_NOT_EXIST.getMessage());
            }
            String code = location.getAreacode();
            int areaCode = "0".equals(code) ? 0 : Integer.parseInt(code);
            if (areaCode == 0) {
                areaCode = 110101;//默认北京东城区
            }
            StringBuffer sb = new StringBuffer();
            List<AdminRegion> addressList = adminRegionService.getAdminRegionListByTree(areaCode);
            for (AdminRegion adminRegion : addressList) {
                sb.append(adminRegion.getName()).append(" ");
            }
            LocationView locationView = ViewHelper.toLocationView(location);
            locationView.setAreaName(sb.toString());

            List<Room> roomList = roomService.getRoomListByLocationId(id);
            List<RoomView> roomViewList = ViewHelper.toRoomViewList(roomList);

            model.addAttribute("locationDetail", locationView);
            model.addAttribute("roomList", roomViewList);
            return "/location/detail";
        } catch (Exception e) {
            LOGGER.error("get location fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @RequestMapping(value = "/searchLocationSelect", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public Object searchLocationSelectView(
            @RequestParam(value = "key", defaultValue = "") String key,
            @RequestParam(value = "page", defaultValue = "1") int pageNum
    ) {
        try {
            int pageSize = CommonConstants.COMMON_PAGE_SIZE;
            LocationCondition locationCondition = new LocationCondition();
            locationCondition.setKey(key);
            int total = locationService.count(locationCondition);
            List<GeoLocation> geoLocationList = locationService.getLocationListByCondition(locationCondition, pageNum, pageSize);

            List<SelectView> selectViews = ViewHelper.locationToSelectViewList(geoLocationList);

            PageView<SelectView> page = new PageView<SelectView>(pageSize, pageNum, total,
                    selectViews);

            return new BasicResult(true, ReturnConstants.SUCCESS_RESULT.getMessage(), page);
        } catch (Exception e) {
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

}
