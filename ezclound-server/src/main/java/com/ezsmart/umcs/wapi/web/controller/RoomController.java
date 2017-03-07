package com.ezsmart.umcs.wapi.web.controller;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.RoomCondition;
import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.domain.Room;
import com.ezsmart.umcs.services.impl.RoomServiceImpl;
import com.ezsmart.umcs.wapi.request.RoomRequest;
import com.ezsmart.umcs.wapi.util.LoginUtil;
import com.ezsmart.umcs.wapi.util.ViewHelper;
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
import java.util.List;

/**
 * Created by luochunteng on 2016/4/25 0025.
 */
@Controller
@RequestMapping(value = "room")
public class RoomController {
    private static final Logger LOGGER = LoggerFactory.getLogger(RoomController.class);

    @Autowired
    private RoomServiceImpl roomService;

    @RequestMapping(value = "/add")
    public Object addRoom(@RequestParam(value = "lid") int locationId,
                          @RequestParam(value = "id") int roomId,
                          HttpServletRequest request, Model model) {
        try {
            Account currAccount = LoginUtil.getLoginAccount(request);
            if (!CommonConstants.RoleType.ADMIN.getType().equals(currAccount.getRoleType())) {
                return new BasicResult(false, ReturnConstants.ACCESS_DENIED.getCode(), ReturnConstants.ACCESS_DENIED.getMessage());
            }
            Room room;
            boolean isAdd = false;
            if (roomId == 0) {
                isAdd = true;
                room = new Room();
            } else {
                room = roomService.getRoomById(roomId);
            }
            room.setLocationId(locationId);
            model.addAttribute("isAdd", isAdd);
            model.addAttribute("room", ViewHelper.toRoomView(room));
            return "/room/add";
        } catch (Exception e) {
            LOGGER.error("add room fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    private Room getRoom(RoomRequest roomRequest) {
        Room room = new Room();
        room.setId(roomRequest.getId());
        room.setName(roomRequest.getName());
        room.setState("0");
        room.setLocationId(roomRequest.getLocationId());
        room.setFloorNumber(roomRequest.getFloorNumber());
        room.setHeight(roomRequest.getHeight());
        room.setWidth(roomRequest.getWidth());
        room.setPicURL(roomRequest.getPicURL());
        room.setPicWidth(roomRequest.getPicWidth());
        room.setPicHeight(roomRequest.getPicHeight());
        room.setModelId(roomRequest.getModelId());
        return room;
    }

    @ResponseBody
    @RequestMapping(value = "/save")
    public BasicResult save(RoomRequest roomRequest, HttpServletRequest request) {
        try {
            Account currAccount = LoginUtil.getLoginAccount(request);
            if (!CommonConstants.RoleType.ADMIN.getType().equals(currAccount.getRoleType())) {
                return new BasicResult(false, ReturnConstants.ACCESS_DENIED.getCode(), ReturnConstants.ACCESS_DENIED.getMessage());
            }
            Room room = getRoom(roomRequest);
            if (room.getId() == 0) {
                //add
                return roomService.addRoom(room);
            } else {
                return roomService.updateRoom(room);
            }
        } catch (Exception e) {
            LOGGER.error("add room fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @RequestMapping(value = "/detail")
    public Object getRoom(@RequestParam(value = "id") int roomId, HttpServletRequest request, Model model) {
        try {
            Account currAccount = LoginUtil.getLoginAccount(request);
            if (!CommonConstants.RoleType.ADMIN.getType().equals(currAccount.getRoleType())) {
                return new BasicResult(false, ReturnConstants.ACCESS_DENIED.getCode(), ReturnConstants.ACCESS_DENIED.getMessage());
            }
            Room room = roomService.getRoomById(roomId);
            if (room == null) {
                return new BasicResult(false, ReturnConstants.ROOM_NOT_EXIST.getCode(), ReturnConstants.ROOM_NOT_EXIST.getMessage());
            }

            model.addAttribute("roomDetail", ViewHelper.toRoomView(room));
            return "/room/detail";
        } catch (Exception e) {
            LOGGER.error("add room fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping(value = "/delete")
    public BasicResult deleteRoom(@RequestParam(value = "id") int roomId, HttpServletRequest request) {
        try {
            Account currAccount = LoginUtil.getLoginAccount(request);
            if (!CommonConstants.RoleType.ADMIN.getType().equals(currAccount.getRoleType())) {
                return new BasicResult(false, ReturnConstants.ACCESS_DENIED.getCode(), ReturnConstants.ACCESS_DENIED.getMessage());
            }
            Room room = roomService.getRoomById(roomId);
            if (room == null) {
                return new BasicResult(false, ReturnConstants.ROOM_NOT_EXIST.getCode(), ReturnConstants.ROOM_NOT_EXIST.getMessage());
            }
            return roomService.deleteRoom(roomId);
        } catch (Exception e) {
            LOGGER.error("add room fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @RequestMapping(value = "/searchRoomSelect", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public Object searchRoomSelectView(
            @RequestParam(value = "key", defaultValue = "") String key,
            @RequestParam(value = "pid", defaultValue = "") int locationId,
            @RequestParam(value = "page", defaultValue = "1") int pageNum
    ) {
        try {
            int pageSize = CommonConstants.COMMON_PAGE_SIZE;
            RoomCondition roomCondition = new RoomCondition();
            roomCondition.setKeyWord(key);
            roomCondition.setLocationId(locationId);
            int total = roomService.countByCondition(roomCondition);
            PageView<SelectView> page = null;
            if (total > 0) {
                List<Room> roomList = roomService.getRoomListByCondition(roomCondition, pageNum, pageSize);
                List<SelectView> selectViews = ViewHelper.roomToSelectViewList(roomList);

                page = new PageView<SelectView>(pageSize, pageNum, total,
                        selectViews);
            }

            return new BasicResult(true, ReturnConstants.SUCCESS_RESULT.getMessage(), page);
        } catch (Exception e) {
            LOGGER.error("get roomList fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

}
