
package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.condition.HostModelTargetDeviceCondition;
import com.ezsmart.umcs.domain.HostModelTargetDevice;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface HostModelTargetDeviceMapper {

    final String SELECT_BY_ID = "SELECT * FROM HostModel_TargetDevice WHERE id=#{id}";
    final String SELECT_BY_PORTUCODE = "SELECT * FROM HostModel_TargetDevice WHERE portUCode=#{portUCode}";

    final String INSERT = "INSERT INTO HostModel_TargetDevice(id,portUCode,deviceModel,name,deviceType,addr,createtime,updatetime)"
            + " VALUES(#{id},#{portUCode},#{deviceModel},#{name},#{deviceType},#{addr},#{createtime},#{updatetime})";

    final String UPDATE = "update HostModel_TargetDevice set " +
            "portUCode=#{portUCode},deviceModel=#{deviceModel},name=#{name},deviceType=#{deviceType},addr=#{addr},updatetime=#{updatetime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM HostModel_TargetDevice where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM HostModel_TargetDevice";


    @Select(SELECT_BY_ID)
    HostModelTargetDevice selectById(@Param("id") int id);

    @Select(SELECT_BY_PORTUCODE)
    List<HostModelTargetDevice> selectByPortUcode(@Param("portUCode") String portUCode);

    @Select(SELECT_BY_PORTUCODE)
    HostModelTargetDevice selectByPortUcodeTDModel(@Param("portUCode") String portUCode,@Param("deviceModel") String deviceModel);

    @Select(SELECT_ALL)
    List<HostModelTargetDevice> selectAll();

    @Insert(INSERT)
    void insert(HostModelTargetDevice hostModelTargetDevice);

    @Update(UPDATE)
    void update(HostModelTargetDevice hostModelTargetDevice);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    List<HostModelTargetDevice> selectAllByCondtion(HostModelTargetDeviceCondition condition);


}
