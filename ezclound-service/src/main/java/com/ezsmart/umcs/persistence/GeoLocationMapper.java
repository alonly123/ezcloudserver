
package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.condition.LocationCondition;
import com.ezsmart.umcs.domain.GeoLocation;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface GeoLocationMapper {

    final String SELECT_BY_ID = "SELECT * FROM GeoLocation WHERE id=#{id}";

    final String INSERT = "INSERT INTO GeoLocation(id,name,postcode,lon,lat,address,areacode,createtime,updatetime)"
            + " VALUES(#{id},#{name},#{postcode},#{lon},#{lat},#{address},#{areacode},#{createtime},#{updatetime})";

    final String UPDATE = "update GeoLocation set " +
            "name=#{name},postcode=#{postcode},lon=#{lon},lat=#{lat},address=#{address},areacode=#{areacode},updatetime=#{updatetime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM GeoLocation where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM GeoLocation";
    final String SELECT_LOCATION_BY_KEYWORD = "SELECT * FROM (SELECT t.*, ROWNUM r FROM (SELECT * FROM GeoLocation WHERE lower(areacode) like lower('%'||#{keyword}||'%')) t WHERE ROWNUM <#{endIndex}) where r >=#{startIndex} ORDER BY updatetime desc";
    final String COUNT_LOCATION = "SELECT count(1) FROM GeoLocation WHERE lower(areacode) like lower('%'||#{keyword}||'%') ";


    @Select(SELECT_BY_ID)
    GeoLocation selectById(@Param("id") int id);

    @Select(SELECT_ALL)
    List<GeoLocation> selectAll();

    @Options(useGeneratedKeys = false)
    @Insert(INSERT)
    void insert(GeoLocation geoLocation);

    @Options(useGeneratedKeys = false)
    @Update(UPDATE)
    void update(GeoLocation geoLocation);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    List<GeoLocation> selectLocationListByCondition(LocationCondition condition);

    int countLocationByCondition(LocationCondition condition);

}
