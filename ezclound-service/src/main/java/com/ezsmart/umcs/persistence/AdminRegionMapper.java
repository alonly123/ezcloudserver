
package com.ezsmart.umcs.persistence;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.ezsmart.umcs.domain.AdminRegion;


public interface AdminRegionMapper {

    final String SELECT_BY_ID = "SELECT * FROM AdminRegion WHERE id=#{id}";
    final String SELECT_BY_CODE = "SELECT * FROM AdminRegion WHERE code=#{code}";

    final String INSERT = "INSERT INTO AdminRegion(id,code,regionLevel,name,pcode,createtime,updatetime)"
            + " VALUES(#{id},#{code},#{regionLevel},#{name},#{pcode},#{createtime},#{updatetime})";

    final String UPDATE = "update AdminRegion set " +
            "code=#{code},regionLevel=#{regionLevel},name=#{name},pcode=#{pcode},updatetime=#{updatetime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM AdminRegion where code=#{code}";
    final String SELECT_ALL = "SELECT * FROM AdminRegion";
    final String SELECT_BY_PCODE = "SELECT * FROM AdminRegion WHERE pcode = #{pcode} ORDER BY code";
    final String SELECT_BY_LEVEL = "SELECT * FROM AdminRegion WHERE  regionLevel= #{regionLevel} ORDER BY code";
    final String SELECT_BY_TREE = "SELECT *  FROM AdminRegion start with code=#{code} connect by prior pcode=code";


    @Select(SELECT_BY_ID)
    AdminRegion selectById(@Param("id") int id);

    @Select(SELECT_ALL)
    List<AdminRegion> selectAll();

    @Options(useGeneratedKeys = false)
    @Insert(INSERT)
    void insert(AdminRegion adminRegion);

    @Options(useGeneratedKeys = false)
    @Update(UPDATE)
    void update(AdminRegion adminRegion);

    @Delete(DELETE)
    void delete(@Param("code") int code);

    @Select(SELECT_BY_CODE)
    AdminRegion selectByCode(@Param("code") int code);

    @Select(SELECT_BY_PCODE)
    List<AdminRegion> selectByPCode(@Param("pcode") int pcode);

    @Select(SELECT_BY_LEVEL)
    List<AdminRegion> selectByLevel(@Param("regionLevel") String regionLevel);

    @Select(SELECT_BY_TREE)
    List<AdminRegion> selectByTree(@Param("code") int code);


}
