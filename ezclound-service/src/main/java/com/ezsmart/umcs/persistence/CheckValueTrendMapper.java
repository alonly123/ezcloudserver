
package com.ezsmart.umcs.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ezsmart.umcs.domain.CheckValueTrend;


public interface CheckValueTrendMapper {

    final String SELECT_BY_ID = "SELECT * FROM CheckValueTrend WHERE id=#{id}";

    final String INSERT = "INSERT INTO CheckValueTrend(id,itemId,valueMin,valueMax,valueAvg,time,createtime,updatetime)"
            + " VALUES(#{id},#{itemId},#{valueMin},#{valueMax},#{valueAvg},#{time},#{createtime},#{updatetime})";

    final String UPDATE = "update CheckValueTrend set " +
            "itemId=#{itemId},valueMin=#{valueMin},valueMax=#{valueMax},valueAvg=#{valueAvg},time=#{time},updatetime=#{updatetime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM CheckValueTrend where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM CheckValueTrend";


    @Select(SELECT_BY_ID)
    CheckValueTrend selectById(@Param("id") int id);

    @Select(SELECT_ALL)
    List<CheckValueTrend> selectAll();

    @Insert(INSERT)
    void insert(CheckValueTrend checkValueTrend);

    @Update(UPDATE)
    void update(CheckValueTrend checkValueTrend);

    @Delete(DELETE)
    void delete(@Param("id") int id);

}
