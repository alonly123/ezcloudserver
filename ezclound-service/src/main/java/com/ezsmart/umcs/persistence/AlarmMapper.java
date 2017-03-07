
package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.condition.AlarmCondition;
import com.ezsmart.umcs.domain.Alarm;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface AlarmMapper {

    final String SELECT_BY_ID = "SELECT * FROM Alarm WHERE id=#{id}";

    final String INSERT = "INSERT INTO Alarm(id,name,alarmTime,alarmLevel,alarmType,sourceId,sourceType,content,ackTime,ackUser,hostUcode,createTime,updateTime)"
            + " VALUES(#{id},#{name},#{alarmTime},#{alarmLevel},#{alarmType},#{sourceId},#{sourceType},#{content},#{ackTime},#{ackUser},#{hostUcode},#{createTime},#{updateTime})";

    final String UPDATE = "update Alarm set " +
            "name=#{name},alarmTime=#{alarmTime},alarmLevel=#{alarmLevel},alarmType=#{alarmType},sourceId=#{sourceId},sourceType=#{sourceType},content=#{content},ackTime=#{ackTime},ackUser=#{ackUser},hostUcode=#{hostUcode},updateTime=#{updateTime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM Alarm where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM Alarm";


    @Select(SELECT_BY_ID)
    Alarm selectById(@Param("id") int id);

    @Select(SELECT_ALL)
    List<Alarm> selectAll();

    @Insert(INSERT)
    void insert(Alarm alarm);

    @Update(UPDATE)
    void update(Alarm alarm);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    List<Alarm> selectListByCondition(AlarmCondition condition);

    int countByCondition(AlarmCondition condition);

}
