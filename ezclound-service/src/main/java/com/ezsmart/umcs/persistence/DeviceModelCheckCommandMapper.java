
package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.condition.DeviceModelCheckCommandCondition;
import com.ezsmart.umcs.domain.DeviceModelCheckCommand;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface DeviceModelCheckCommandMapper {

    final String SELECT_BY_ID = "SELECT * FROM DEVICEMODEL_CHECKCOMMAND WHERE id=#{id}";
    final String SELECT_BY_MODEL = "SELECT * FROM DEVICEMODEL_CHECKCOMMAND WHERE targetDeviceModel=#{targetDeviceModel}";

    final String INSERT = "INSERT INTO DEVICEMODEL_CHECKCOMMAND(id,targetDeviceModel,value,name,valueType,createtime,updatetime)"
            + " VALUES(#{id},#{targetDeviceModel},#{value},#{name},#{valueType},#{createTime},#{updateTime})";

    final String UPDATE = "update DEVICEMODEL_CHECKCOMMAND set " +
            "targetDeviceModel=#{targetDeviceModel},value=#{value},name=#{name},valueType=#{valueType},updatetime=#{updateTime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM DEVICEMODEL_CHECKCOMMAND where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM DEVICEMODEL_CHECKCOMMAND";


    @Select(SELECT_BY_ID)
    DeviceModelCheckCommand selectById(@Param("id") int id);

    @Select(SELECT_ALL)
    List<DeviceModelCheckCommand> selectAll();

    @Select(SELECT_BY_MODEL)
    List<DeviceModelCheckCommand> selectByModel(@Param("targetDeviceModel") String targetDeviceModel);

    @Insert(INSERT)
    void insert(DeviceModelCheckCommand deviceModelCheckParameter);

    @Update(UPDATE)
    void update(DeviceModelCheckCommand deviceModelCheckParameter);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    List<DeviceModelCheckCommand> selectAllByCondition(DeviceModelCheckCommandCondition condition);

    int countByCondition(DeviceModelCheckCommandCondition condition);


}
