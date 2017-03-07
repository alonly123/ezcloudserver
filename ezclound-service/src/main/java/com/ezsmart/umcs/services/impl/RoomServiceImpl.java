package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.RoomCondition;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.Room;
import com.ezsmart.umcs.persistence.PublicSequenceMapper;
import com.ezsmart.umcs.persistence.RoomMapper;
import com.ezsmart.umcs.services.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by luochunteng on 2016/4/25 0025.
 */
@Component
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomMapper roomDao;

    @Autowired
    private PublicSequenceMapper publicSequenceDao;

    @Override
    public List<Room> getRoomListByLocationId(int locationId) {
        return roomDao.selectRoomListByLocationID(locationId);
    }

    @Override
    public BasicResult addRoom(Room room) {
        if (room == null) {
            return new BasicResult(false, ReturnConstants.ROOM_ADD_FAIL.getCode(), ReturnConstants.ROOM_ADD_FAIL.getMessage());
        }
        room.setId(publicSequenceDao.getSeq());
        roomDao.insert(room);
        return new BasicResult(true);
    }

    @Override
    public BasicResult updateRoom(Room room) {
        if (room == null) {
            return new BasicResult(false, ReturnConstants.ROOM_ADD_FAIL.getCode(), ReturnConstants.ROOM_ADD_FAIL.getMessage());
        }
        roomDao.update(room);
        return new BasicResult(true);
    }

    @Override
    public BasicResult deleteRoom(int id) {
        Room room = roomDao.selectById(id);
        if (room == null) {
            return new BasicResult(false, ReturnConstants.ROOM_NOT_EXIST.getCode(), ReturnConstants.ROOM_NOT_EXIST.getMessage());
        }
        roomDao.delete(id);
        return new BasicResult(true);
    }

    @Override
    public Room getRoomById(int roomId) {
        return roomDao.selectById(roomId);
    }

    @Override
    public int count(String keyword) {
        return roomDao.count(keyword);
    }

    @Override
    public List<Room> getRoomListByKeyword(String keyword, int pageNum, int pageSize) {
        return roomDao.searchRoomList(keyword, (pageNum - 1) * pageSize + 1,
                pageNum * pageSize + 1);
    }

    @Override
    public int countByCondition(RoomCondition roomCondition) {
        return roomDao.countRoomByCondition(roomCondition);
    }

    @Override
    public List<Room> getRoomListByCondition(RoomCondition roomCondition, int pageNum, int pageSize) {
        if (roomCondition == null) {
            roomCondition = new RoomCondition();
        }
        roomCondition.setStartIndex((pageNum - 1) * pageSize + 1);
        roomCondition.setEndIndex(pageNum * pageSize + 1);
        return roomDao.searchRoomByCondition(roomCondition);
    }
}
