
package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.condition.HostModelPortCondition;
import com.ezsmart.umcs.domain.HostModelPort;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface HostModelPortMapper {

    final String SELECT_BY_ID = "SELECT * FROM HostModel_Port WHERE id=#{id}";
    final String SELECT_BY_MODEL = "SELECT * FROM HostModel_Port WHERE hostModel=#{hostModel}";

    final String INSERT = "INSERT INTO HostModel_Port(id,ucode,name,hostModel,spec,createtime,updatetime)"
            + " VALUES(#{id},#{ucode},#{name},#{hostModel},#{spec},#{createtime},#{updatetime})";

    final String UPDATE = "update HostModel_Port set " +
            "ucode=#{ucode},name=#{name},hostModel=#{hostModel},spec=#{spec},updatetime=#{updatetime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM HostModel_Port where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM HostModel_Port";


    @Select(SELECT_BY_ID)
    HostModelPort selectById(@Param("id") int id);

    @Select(SELECT_BY_MODEL)
    List<HostModelPort> selectByHostModel(@Param("hostModel") String hostModel);

    @Select(SELECT_ALL)
    List<HostModelPort> selectAll();

    @Insert(INSERT)
    void insert(HostModelPort hostModelPort);

    @Update(UPDATE)
    void update(HostModelPort hostModelPort);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    List<HostModelPort> selectAllByCondtion(HostModelPortCondition condition);

}
