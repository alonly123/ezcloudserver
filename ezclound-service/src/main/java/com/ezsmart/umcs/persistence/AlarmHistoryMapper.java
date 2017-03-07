
package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.domain.AlarmHistory;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface AlarmHistoryMapper {

    final String SELECT_BY_ID = "SELECT * FROM AlarmHistory WHERE id=#{id}";

    final String INSERT = "INSERT INTO AlarmHistory(id,name,alarmTime,alarmLevel,alarmType,sourceId,sourceType,content,ackTime,ackUser,hostUcode,createTime,updateTime)"
            + " VALUES(#{id},#{name},#{alarmTime},#{alarmLevel},#{alarmType},#{sourceId},#{sourceType},#{content},#{ackTime},#{ackUser},#{hostUcode},#{createTime},#{updateTime})";

//	final String INSERT = "INSERT INTO AlarmHistory(id,name,alarmTime,alarmLevel,alarmType,sourceId,sourceType)"
//			+ " VALUES(#{id},#{name},#{alarmTime},#{alarmLevel},#{alarmType},#{sourceId},#{sourceType})";

    final String UPDATE = "update AlarmHistory set " +
            "name=#{name},alarmTime=#{alarmTime},alarmLevel=#{alarmLevel},alarmType=#{alarmType},sourceId=#{sourceId},sourceType=#{sourceType},content=#{content},ackTime=#{ackTime},ackUser=#{ackUser},updateTime=#{updateTime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM AlarmHistory where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM AlarmHistory";


    @Select(SELECT_BY_ID)
    AlarmHistory selectById(@Param("id") int id);

    @Select(SELECT_ALL)
    List<AlarmHistory> selectAll();

    @Insert(INSERT)
    @Options(useGeneratedKeys = false)
    void insert(AlarmHistory alarmHistory);

    @Update(UPDATE)
    void update(AlarmHistory alarmHistory);

    @Delete(DELETE)
    void delete(@Param("id") int id);

}
