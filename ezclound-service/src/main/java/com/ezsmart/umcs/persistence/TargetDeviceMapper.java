
package com.ezsmart.umcs.persistence;

import java.util.Date;
import java.util.List;

import com.ezsmart.umcs.condition.TargetDeviceCondition;
import org.apache.ibatis.annotations.*;

import com.ezsmart.umcs.domain.TargetDevice;


public interface TargetDeviceMapper {

    final String SELECT_BY_ID = "SELECT * FROM TargetDevice WHERE id=#{id}";
    final String SELECT_BY_CODE = "SELECT * FROM TargetDevice WHERE code=#{code}";
    final String SELECT_BY_MODEL_PORT_UCODE = "SELECT * FROM TargetDevice WHERE portUCode = #{portUCode}";

    final String INSERT = "INSERT INTO TargetDevice(id,code,name,portUCode,addr,phyState,deviceType,state,lastCheck,graphX,graphY,checkInterval,isUse,model,hostucode,createtime,updatetime)"
            + " VALUES(#{id},#{code},#{name},#{portUCode},#{addr},#{phyState},#{deviceType},#{state},#{lastCheck},#{graphX},#{graphY},#{checkInterval},#{isUse},#{model},#{hostucode},#{createtime},#{updatetime})";

    final String UPDATE = "update TargetDevice set code=#{code},name=#{name},updatetime=#{updatetime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM TargetDevice where id=#{id}";
    final String DELETE_BY_HOSTCODE = "DELETE FROM TargetDevice where hostucode=#{hostucode}";
    final String SELECT_ALL = "SELECT * FROM TargetDevice";


    @Select(SELECT_BY_ID)
    TargetDevice selectById(@Param("id") int id);
    @Select(SELECT_BY_CODE)
    TargetDevice selectByCode(@Param("code") String code);

    @Select(SELECT_BY_MODEL_PORT_UCODE)
    List<TargetDevice> selectByPortUCode(@Param("portUCode") String portUCode);

    @Select(SELECT_ALL)
    List<TargetDevice> selectAll();

    @Options(useGeneratedKeys = false)
    @Insert(INSERT)
    void insert(TargetDevice targetDevice);

    @Options(useGeneratedKeys = false)
    @Update(UPDATE)
    void update(@Param("name") String name, @Param("code") String code, @Param("updatetime") Date updatetime, @Param("id") int id);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    @Delete(DELETE_BY_HOSTCODE)
    void deleteByHostCode(@Param("hostucode") String hostucode);

    List<TargetDevice> getTargetDeviceListByCondition(TargetDeviceCondition targetDeviceCondition);

    int countByCondition(TargetDeviceCondition targetDeviceCondition);

}
