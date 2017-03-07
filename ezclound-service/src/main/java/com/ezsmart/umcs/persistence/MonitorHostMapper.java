
package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.condition.MonitorHostCondition;
import com.ezsmart.umcs.domain.MonitorHost;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 设备表
 */
public interface MonitorHostMapper {

    final String SELECT_BY_ID = "SELECT * FROM MonitorHost WHERE id=#{id}";
    final String SELECT_BY_UCODE = "SELECT * FROM MonitorHost WHERE ucode=#{ucode}";
    final String SELECT_BY_CUSTOMERID = "SELECT * FROM MonitorHost WHERE customerId=#{customerId}";
    final String SELECT_BY_COMPANYID = "SELECT * FROM MonitorHost WHERE channelCompanyId=#{channelCompanyId}";

    final String INSERT = "INSERT INTO MonitorHost(id,ucode,name,customerId,channelCompanyId,roomId,locationId,phyState,state,connState,model,phone,lastCheck,ipaddr,imei,createtime,updatetime)"
            + " VALUES(#{id},#{ucode},#{name},#{customerId},#{channelCompanyId},#{roomId},#{locationId},#{phyState},#{state},#{connState},#{model},#{phone},#{lastCheck},#{ipaddr},#{imei},#{createtime},#{updatetime})";

    final String UPDATE = "update MonitorHost set " +
            "ucode=#{ucode},name=#{name},customerId=#{customerId},channelCompanyId=#{channelCompanyId},roomId=#{roomId},locationId=#{locationId},phyState=#{phyState},state=#{state},connState=#{connState},model=#{model},phone=#{phone},lastCheck=#{lastCheck},ipaddr=#{ipaddr},imei=#{imei},updatetime=#{updatetime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM MonitorHost where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM MonitorHost";


    @Select(SELECT_BY_ID)
    MonitorHost selectById(@Param("id") int id);

    @Select(SELECT_BY_CUSTOMERID)
    List<MonitorHost> selectByCustomerId(@Param("customerId") int customerId);

    @Select(SELECT_BY_COMPANYID)
    List<MonitorHost> selectByChannelCompanyId(@Param("channelCompanyId") int channelCompanyId);

    @Select(SELECT_BY_UCODE)
    MonitorHost selectByUcode(@Param("ucode") String ucode);

    @Select(SELECT_ALL)
    List<MonitorHost> selectAll();

    @Options(useGeneratedKeys = false)
    @Insert(INSERT)
    void insert(MonitorHost monitorHost);

    @Options(useGeneratedKeys = false)
    @Update(UPDATE)
    void update(MonitorHost monitorHost);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    int countByCondition(MonitorHostCondition condition);

    int countChannelByCondition(MonitorHostCondition condition);

    int countCustomerByCondition(MonitorHostCondition condition);

    List<MonitorHost> selectListByCondition(MonitorHostCondition condition);
}
