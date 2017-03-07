
package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.condition.HostModelCondition;
import com.ezsmart.umcs.domain.HostModel;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface HostModelMapper {

    final String SELECT_BY_ID = "SELECT * FROM HostModel WHERE id=#{id}";

    final String SELECT_BY_MODEL = "SELECT * FROM HostModel WHERE model=#{model}";

    final String INSERT = "INSERT INTO HostModel(id,model,name,descr,createtime,updatetime)"
            + " VALUES(#{id},#{model},#{name},#{descr},#{createtime},#{updatetime})";

    final String UPDATE = "update HostModel set " +
            "model=#{model},name=#{name},descr=#{descr},updatetime=#{updatetime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM HostModel where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM HostModel";


    @Select(SELECT_BY_ID)
    HostModel selectById(@Param("id") int id);

    @Select(SELECT_BY_MODEL)
    HostModel selectByModel(@Param("model") String model);

    @Select(SELECT_ALL)
    List<HostModel> selectAll();

    @Insert(INSERT)
    void insert(HostModel hostModel);

    @Update(UPDATE)
    void update(HostModel hostModel);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    List<HostModel> selectListByCondition(HostModelCondition condition);

    int countByCondition(HostModelCondition condition);

}
