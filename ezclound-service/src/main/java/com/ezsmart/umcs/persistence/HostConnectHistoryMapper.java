
package com.ezsmart.umcs.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ezsmart.umcs.domain.HostConnectHistory;


public interface HostConnectHistoryMapper {

    final String SELECT_BY_ID = "SELECT * FROM HostConnectHistory WHERE id=#{id}";

    final String INSERT = "INSERT INTO HostConnectHistory(id,hostUCode,lastOnline,lastOffline,createtime,updatetime)"
            + " VALUES(#{id},#{hostUCode},#{lastOnline},#{lastOffline},#{createtime},#{updatetime})";

    final String UPDATE = "update HostConnectHistory set " +
            "hostUCode=#{hostUCode},lastOnline=#{lastOnline},lastOffline=#{lastOffline},updatetime=#{updatetime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM HostConnectHistory where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM HostConnectHistory";


    @Select(SELECT_BY_ID)
    HostConnectHistory selectById(@Param("id") int id);

    @Select(SELECT_ALL)
    List<HostConnectHistory> selectAll();

    @Insert(INSERT)
    void insert(HostConnectHistory hostConnectHistory);

    @Update(UPDATE)
    void update(HostConnectHistory hostConnectHistory);

    @Delete(DELETE)
    void delete(@Param("id") int id);

}
