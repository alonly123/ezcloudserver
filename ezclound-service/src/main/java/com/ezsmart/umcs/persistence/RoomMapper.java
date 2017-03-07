
package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.condition.RoomCondition;
import com.ezsmart.umcs.domain.Room;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface RoomMapper {

    final String SELECT_BY_ID = "SELECT * FROM Room WHERE id=#{id}";

    final String INSERT = "INSERT INTO Room(id,locationId,name,state,floorNumber,height,width,modelId,picURL,picWidth,picHeight,createtime,updatetime)"
            + " VALUES(#{id},#{locationId},#{name},#{state},#{floorNumber},#{height},#{width},#{modelId},#{picURL},#{picWidth},#{picHeight},#{createtime},#{updatetime})";

    final String UPDATE = "update Room set " +
            "locationId=#{locationId},name=#{name},state=#{state},floorNumber=#{floorNumber},height=#{height},width=#{width},modelId=#{modelId},picURL=#{picURL},picWidth=#{picWidth},picHeight=#{picHeight},updatetime=#{updatetime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM Room where id=#{id}";
    final String SELECT_BY_LOCATION = "SELECT * FROM Room WHERE locationId=#{locationId} ORDER BY updatetime desc";
    final String SEARCH_ROOM = "SELECT * FROM (SELECT t.*, ROWNUM r FROM (SELECT * FROM ROOM WHERE lower(name) like lower('%'||#{keyWord}||'%') ) t WHERE ROWNUM <#{endIndex}) where r >=#{startIndex} ORDER BY updatetime desc";
    final String COUNT_ROOM = "SELECT   count(1) FROM ROOM WHERE lower(name) like lower('%'||#{keyWord}||'%') ";


    @Select(SELECT_BY_ID)
    Room selectById(@Param("id") int id);

    @Select(SELECT_BY_LOCATION)
    List<Room> selectRoomListByLocationID(@Param(value = "locationId") int locationId);

    @Options(useGeneratedKeys = false)
    @Insert(INSERT)
    void insert(Room room);

    @Options(useGeneratedKeys = false)
    @Update(UPDATE)
    void update(Room room);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    @Select(SEARCH_ROOM)
    List<Room> searchRoomList(@Param("keyWord") String keyWord, @Param("startIndex") int startIndex,
                              @Param("endIndex") int endIndex);

    @Select(COUNT_ROOM)
    int count(@Param("keyWord") String keyword);

    List<Room> searchRoomByCondition(RoomCondition roomCondition);

    int countRoomByCondition(RoomCondition roomCondition);


}
