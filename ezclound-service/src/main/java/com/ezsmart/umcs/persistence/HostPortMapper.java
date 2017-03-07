
package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.domain.HostPort;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface HostPortMapper {

    final String SELECT_BY_ID = "SELECT * FROM HostPort WHERE id=#{id}";
    final String SELECT_BY_UCODE = "SELECT * FROM HostPort WHERE ucode=#{ucode}";

    final String SELECT_BY_HOSTUCODE = "SELECT * FROM HostPort WHERE hostUCode=#{hostUCode}";

    final String INSERT = "INSERT INTO HostPort(id,hostUCode,ucode,name,spec,createtime,updatetime)"
            + " VALUES(#{id},#{hostUCode},#{ucode},#{name},#{spec},#{createtime},#{updatetime})";

    final String UPDATE = "update HostPort set " +
            "hostUCode=#{hostUCode},ucode=#{ucode},name=#{name},spec=#{spec},updatetime=#{updatetime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM HostPort where id=#{id}";
    final String DELETE_BY_HOSTCODE = "DELETE FROM HostPort where hostUCode=#{hostUCode}";
    final String SELECT_ALL = "SELECT * FROM HostPort";


    @Select(SELECT_BY_ID)
    HostPort selectById(@Param("id") int id);

    @Select(SELECT_BY_UCODE)
    HostPort selectByUcode(@Param("ucode") String ucode);

    @Select(SELECT_BY_HOSTUCODE)
    List<HostPort> selectByHostUcode(@Param("hostUCode") String hostUCode);

    @Select(SELECT_ALL)
    List<HostPort> selectAll();

    @Options(useGeneratedKeys = false)
    @Insert(INSERT)
    void insert(HostPort hostPort);

    @Options(useGeneratedKeys = false)
    @Update(UPDATE)
    void update(HostPort hostPort);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    @Delete(DELETE_BY_HOSTCODE)
    void deleteByHostCode(@Param("hostUCode") String hostUCode);


}
