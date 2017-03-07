package com.ezsmart.umcs.services;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.RoomCondition;
import com.ezsmart.umcs.domain.Room;

import java.util.List;

/**
 * Created by luochunteng on 2016/4/25 0025.
 */
public interface RoomService {
    public List<Room> getRoomListByLocationId(int locationId);

    public BasicResult addRoom(Room room);

    public BasicResult updateRoom(Room room);

    public BasicResult deleteRoom(int id);

    public Room getRoomById(int roomId);

    public int count(String keyword);

    public List<Room> getRoomListByKeyword(String keyword, int pageNum, int pageSize);

    public int countByCondition(RoomCondition roomCondition);

    public List<Room> getRoomListByCondition(RoomCondition roomCondition, int pageNum, int pageSize);
}
