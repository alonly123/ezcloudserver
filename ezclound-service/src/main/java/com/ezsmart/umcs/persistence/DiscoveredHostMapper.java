
package com.ezsmart.umcs.persistence;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.ezsmart.umcs.domain.DiscoveredHost;


public interface DiscoveredHostMapper {

    final String SELECT_BY_ID = "SELECT * FROM DiscoveredHost WHERE id=#{id}";

    final String INSERT = "INSERT INTO DiscoveredHost(id,ucode,pyhState,connstate,discoveryTime,lastCheck,model,createtime,updatetime)"
            + " VALUES(#{id},#{ucode},#{pyhState},#{connstate},#{discoveryTime},#{lastCheck},#{model},#{createtime},#{updatetime})";

    final String UPDATE = "update DiscoveredHost set " +
            "ucode=#{ucode},pyhState=#{pyhState},connstate=#{connstate},discoveryTime=#{discoveryTime},lastCheck=#{lastCheck},model=#{model},updatetime=#{updatetime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM DiscoveredHost where id=#{id}";
    final String DELETE_BY_CODE = "DELETE FROM DiscoveredHost where ucode=#{ucode}";
    final String SELECT_ALL = "SELECT * FROM DiscoveredHost";
    final String SEARCH_DISCOVEREDHOST = "SELECT * FROM (SELECT t.*, ROWNUM r FROM (SELECT * FROM DiscoveredHost) t WHERE ROWNUM <#{endIndex}) where r >=#{startIndex} ORDER BY updatetime desc";

    final String COUNT_DISCOVEREDHOST = "SELECT count(1) FROM DiscoveredHost";


    @Select(SELECT_BY_ID)
    DiscoveredHost selectById(@Param("id") int id);

    @Select(SELECT_ALL)
    List<DiscoveredHost> selectAll();

    @Options(useGeneratedKeys = false)
    @Insert(INSERT)
    void insert(DiscoveredHost discoveredHost);

    @Options(useGeneratedKeys = false)
    @Update(UPDATE)
    void update(DiscoveredHost discoveredHost);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    @Delete(DELETE_BY_CODE)
    void deleteByCode(@Param("ucode") String ucode);

    @Select(SEARCH_DISCOVEREDHOST)
    List<DiscoveredHost> selectListByKeyword(
            @Param("startIndex") int startIndex, @Param("endIndex") int endIndex);

    @Select(COUNT_DISCOVEREDHOST)
    int countByKeyword();

}
