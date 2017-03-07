
package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.condition.DeviceModelCheckItemCondition;
import com.ezsmart.umcs.domain.DeviceModelCheckItem;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface DeviceModelCheckItemMapper {

    final String SELECT_BY_ID = "SELECT * FROM DeviceModel_CheckItem WHERE id=#{id}";
    final String SELECT_BY_MODEL = "SELECT * FROM DeviceModel_CheckItem WHERE targetDeviceModel=#{targetDeviceModel}";

    final String INSERT = "INSERT INTO DeviceModel_CheckItem(id,targetDeviceModel,code,name,maxValue,minValue,eqValue,valueType,createtime,updatetime)"
            + " VALUES(#{id},#{targetDeviceModel},#{code},#{name},#{maxValue},#{minValue},#{eqValue},#{valueType},#{createTime},#{updateTime})";

    final String UPDATE = "update DeviceModel_CheckItem set " +
            "targetDeviceModel=#{targetDeviceModel},code=#{code},name=#{name},maxValue=#{maxValue},minValue=#{minValue},eqValue=#{eqValue},valueType=#{valueType},updatetime=#{updateTime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM DeviceModel_CheckItem where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM DeviceModel_CheckItem";


    @Select(SELECT_BY_ID)
    DeviceModelCheckItem selectById(@Param("id") int id);

    @Select(SELECT_ALL)
    List<DeviceModelCheckItem> selectAll();

    @Select(SELECT_BY_MODEL)
    List<DeviceModelCheckItem> selectByModel(@Param("targetDeviceModel") String targetDeviceModel);

    @Insert(INSERT)
    void insert(DeviceModelCheckItem deviceModelCheckItem);

    @Update(UPDATE)
    void update(DeviceModelCheckItem deviceModelCheckItem);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    List<DeviceModelCheckItem> selectAllByCondition(DeviceModelCheckItemCondition condition);

    int countByCondition(DeviceModelCheckItemCondition condition);

}
