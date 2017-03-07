
package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.condition.TargetDeviceModelCondition;
import com.ezsmart.umcs.domain.TargetDeviceModel;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface TargetDeviceModelMapper {

    final String SELECT_BY_ID = "SELECT * FROM TargetDeviceModel WHERE id=#{id}";
    final String SELECT_BY_MODEL = "SELECT * FROM TargetDeviceModel WHERE model=#{model}";

    final String INSERT = "INSERT INTO TargetDeviceModel(id,model,vendor,name,descr,longmodel,createtime,updatetime)"
            + " VALUES(#{id},#{model},#{vendor},#{name},#{descr},#{longModel},#{createTime},#{updateTime})";

    final String UPDATE = "update TargetDeviceModel set " +
            "model=#{model},vendor=#{vendor},name=#{name},descr=#{descr},longModel=#{longModel},updatetime=#{updateTime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM TargetDeviceModel where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM TargetDeviceModel";


    @Select(SELECT_BY_ID)
    TargetDeviceModel selectById(@Param("id") int id);

    @Select(SELECT_BY_MODEL)
    TargetDeviceModel selectByModel(@Param("model") String model);

    @Select(SELECT_ALL)
    List<TargetDeviceModel> selectAll();

    @Options(useGeneratedKeys = false)
    @Insert(INSERT)
    void insert(TargetDeviceModel targetDeviceModel);

    @Options(useGeneratedKeys = false)
    @Update(UPDATE)
    void update(TargetDeviceModel targetDeviceModel);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    List<TargetDeviceModel> selectListByCondition(TargetDeviceModelCondition condition);

    List<TargetDeviceModel> selectAllListByCondition(TargetDeviceModelCondition condition);

    int countByCondition(TargetDeviceModelCondition condition);

}
