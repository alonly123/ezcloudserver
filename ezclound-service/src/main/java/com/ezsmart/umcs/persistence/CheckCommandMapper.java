
package com.ezsmart.umcs.persistence;

import java.util.List;

import com.ezsmart.umcs.condition.CheckCommandCondition;
import org.apache.ibatis.annotations.*;
import com.ezsmart.umcs.domain.CheckCommand;


public interface CheckCommandMapper {

    final String SELECT_BY_ID = "SELECT * FROM CheckCommand WHERE id=#{id}";

    final String INSERT = "INSERT INTO CheckCommand(id,targetDeviceId,targetDeviceModel,name,value,valueType,hostucode,createtime,updatetime)"
            + " VALUES(#{id},#{targetDeviceId},#{targetDeviceModel},#{name},#{value},#{valueType},#{hostucode},#{createtime},#{updatetime})";

    final String UPDATE = "update CheckCommand set " +
            "targetDeviceId=#{targetDeviceId},targetDeviceModel=#{targetDeviceModel},name=#{name},value=#{value},valueType=#{valueType},updatetime=#{updatetime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM CheckCommand where id=#{id}";
    final String DELETE_BY_HOSTCODE = "DELETE FROM CheckCommand where hostucode=#{hostucode}";
    final String DELETE_BY_TARGETDEVICE_ID = "DELETE FROM CheckCommand where targetDeviceId=#{targetDeviceId}";
    final String SELECT_ALL = "SELECT * FROM CheckCommand";


    @Select(SELECT_BY_ID)
    CheckCommand selectById(@Param("id") int id);

    @Select(SELECT_ALL)
    List<CheckCommand> selectAll();

    @Options(useGeneratedKeys = false)
    @Insert(INSERT)
    void insert(CheckCommand checkCommand);

    @Options(useGeneratedKeys = false)
    @Update(UPDATE)
    void update(CheckCommand checkCommand);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    @Delete(DELETE_BY_HOSTCODE)
    void deleteByHostCode(@Param("hostucode") String hostucode);

    @Delete(DELETE_BY_TARGETDEVICE_ID)
    void deleteByTargetDeviceId(@Param("targetDeviceId") int targetDeviceId);

    List<CheckCommand> getCheckCommandByCondition(CheckCommandCondition checkCommandCondition);

    int countByCondition(CheckCommandCondition checkCommandCondition);

}
