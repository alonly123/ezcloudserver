
package com.ezsmart.umcs.persistence;

import java.util.List;

import com.ezsmart.umcs.condition.CheckItemCondition;
import org.apache.ibatis.annotations.*;

import com.ezsmart.umcs.domain.CheckItem;


public interface CheckItemMapper {

    final String SELECT_BY_ID = "SELECT * FROM CheckItem WHERE id=#{id}";

    final String SELECT_BY_DEVICE_ID = "SELECT * FROM CheckItem WHERE targetDeviceId=#{targetDeviceId}";

    final String INSERT = "INSERT INTO CheckItem(id,targetDeviceId,hostUCode,targetDeviceModel,name,code,eqValue,maxValue,minValue,valueType,createtime,updatetime)"
            + " VALUES(#{id},#{targetDeviceId},#{hostUCode},#{targetDeviceModel},#{name},#{code},#{eqValue},#{maxValue},#{minValue},#{valueType},#{createtime},#{updatetime})";

    final String UPDATE = "update CheckItem set " +
            "targetDeviceId=#{targetDeviceId},hostUCode=#{hostUCode},targetDeviceModel=#{targetDeviceModel},name=#{name},code=#{code},eqValue=#{eqValue},maxValue=#{maxValue},minValue=#{minValue},valueType=#{valueType},updatetime=#{updatetime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM CheckItem where id=#{id}";
    final String DELETE_BY_HOSTCODE = "DELETE FROM CheckItem where hostUCode=#{hostUCode}";
    final String DELETE_BY_TARGETDEVICE_ID = "DELETE FROM CheckItem where targetDeviceId=#{targetDeviceId}";
    final String SELECT_ALL = "SELECT * FROM CheckItem";


    @Select(SELECT_BY_ID)
    CheckItem selectById(@Param("id") int id);

    @Select(SELECT_ALL)
    List<CheckItem> selectAll();

    @Select(SELECT_BY_DEVICE_ID)
    List<CheckItem> selectByDeviceId(@Param("targetDeviceId") int targetDeviceId);

    @Options(useGeneratedKeys = false)
    @Insert(INSERT)
    void insert(CheckItem checkItem);

    @Options(useGeneratedKeys = false)
    @Update(UPDATE)
    void update(CheckItem checkItem);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    @Delete(DELETE_BY_HOSTCODE)
    void deleteByHostCode(@Param("hostUCode") String hostUCode);

    @Delete(DELETE_BY_TARGETDEVICE_ID)
    void deleteByTargetDeviceId(@Param("targetDeviceId") int targetDeviceId);

    List<CheckItem> getCheckItemByCondition(CheckItemCondition checkItemCondition);

    int countByCondition(CheckItemCondition checkItemCondition);

}
