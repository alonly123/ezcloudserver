
package com.ezsmart.umcs.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ezsmart.umcs.domain.CheckValueHistory;


public interface CheckValueHistoryMapper {

    final String SELECT_BY_ID = "SELECT * FROM CheckValueHistory WHERE id=#{id}";

    final String INSERT = "INSERT INTO CheckValueHistory(id,itemId,numberValue,stringValue,time,createtime,updatetime)"
            + " VALUES(#{id},#{itemId},#{numberValue},#{stringValue},#{time},#{createtime},#{updatetime})";

    final String UPDATE = "update CheckValueHistory set " +
            "itemId=#{itemId},numberValue=#{numberValue},stringValue=#{stringValue},time=#{time},updatetime=#{updatetime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM CheckValueHistory where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM CheckValueHistory";


    @Select(SELECT_BY_ID)
    CheckValueHistory selectById(@Param("id") int id);

    @Select(SELECT_ALL)
    List<CheckValueHistory> selectAll();

    @Insert(INSERT)
    void insert(CheckValueHistory checkValueHistory);

    @Update(UPDATE)
    void update(CheckValueHistory checkValueHistory);

    @Delete(DELETE)
    void delete(@Param("id") int id);

}
