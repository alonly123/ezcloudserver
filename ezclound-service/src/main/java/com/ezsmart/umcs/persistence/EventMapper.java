
package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.condition.EventCondition;
import com.ezsmart.umcs.domain.Event;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface EventMapper {

    final String SELECT_BY_ID = "SELECT * FROM Event WHERE id=#{id}";

    final String INSERT = "INSERT INTO Event(id,name,eventTime,sourceId,sourceType,content,createTime,updateTime)"
            + " VALUES(#{id},#{name},#{eventTime},#{sourceId},#{sourceType},#{content},#{createTime},#{updateTime})";

    final String UPDATE = "update Event set " +
            "name=#{name},eventTime=#{eventTime},sourceId=#{sourceId},sourceType=#{sourceType},content=#{content},updateTime=#{updateTime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM Event where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM Event";


    @Select(SELECT_BY_ID)
    Event selectById(@Param("id") int id);

    @Select(SELECT_ALL)
    List<Event> selectAll();

    @Insert(INSERT)
    void insert(Event event);

    @Update(UPDATE)
    void update(Event event);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    List<Event> selectListByCondition(EventCondition condition);

    int countByCondition(EventCondition condition);

}
