
package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.condition.SmsTaskCondition;
import com.ezsmart.umcs.domain.SmsTask;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface SmsTaskMapper {

    final String SELECT_BY_ID = "SELECT * FROM SmsTask WHERE id=#{id}";

    final String INSERT = "INSERT INTO SmsTask(id,eventTime,keyId,eventId,content,sendTime,phone,createTime,updateTime)"
            + " VALUES(#{id},#{eventTime},#{keyId},#{eventId},#{content},#{sendTime},#{phone},#{createTime},#{updateTime})";

    final String UPDATE = "update SmsTask set "
            + "eventTime=#{eventTime},keyId=#{keyId},eventId=#{eventId},content=#{content},sendTime=#{sendTime},phone=#{phone},updateTime=#{updateTime} "
            + "where id=#{id}";

    final String DELETE = "DELETE FROM SmsTask where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM SmsTask";

    @Select(SELECT_BY_ID)
    SmsTask selectById(@Param("id") int id);

    @Select(SELECT_ALL)
    List<SmsTask> selectAll();

    @Insert(INSERT)
    void insert(SmsTask SmsTask);

    @Update(UPDATE)
    void update(SmsTask SmsTask);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    List<SmsTask> selectListByCondition(SmsTaskCondition condition);

    int countByCondition(SmsTaskCondition condition);

}
