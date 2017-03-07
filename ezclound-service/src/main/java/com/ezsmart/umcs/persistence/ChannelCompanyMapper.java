package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.condition.ChannelCondition;
import com.ezsmart.umcs.domain.ChannelCompany;
import com.ezsmart.umcs.domain.Customer;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ChannelCompanyMapper {

    final String SELECT_BY_ID = "SELECT * FROM ChannelCompany WHERE id=#{id}";

    final String SELECT_BY_NAME = "SELECT * FROM ChannelCompany WHERE name=#{name}";

    final String INSERT = "INSERT INTO ChannelCompany(id,name,contacts,saleVolume,mphone,phone,areaCode,createtime,updatetime)"
            + " VALUES(#{id},#{name},#{contacts},#{saleVolume},#{mphone},#{phone},#{areaCode},#{createtime},#{updatetime})";

    final String UPDATE = "update ChannelCompany set "
            + "name=#{name},contacts=#{contacts},saleVolume=#{saleVolume},mphone=#{mphone},phone=#{phone},areaCode=#{areaCode},updatetime=#{updatetime} "
            + "where id=#{id}";

    final String DELETE = "DELETE FROM ChannelCompany where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM ChannelCompany";
    final String SEARCH_CHANNEL_COMPANY = "SELECT * FROM (SELECT t.*, ROWNUM r FROM (SELECT * FROM ChannelCompany WHERE name like '%'||#{keyWord}||'%') t WHERE ROWNUM <#{endIndex}) where r >=#{startIndex} ORDER BY updatetime desc";
    final String COUNT_CHANNEL_COMPANYS = "SELECT   count(1) FROM ChannelCompany WHERE name like '%'||#{keyWord}||'%'";

    @Select(SELECT_BY_ID)
    ChannelCompany selectById(@Param("id") int id);

    @Select(SELECT_ALL)
    List<ChannelCompany> selectAll();

    @Options(useGeneratedKeys = false)
    @Insert(INSERT)
    int insert(ChannelCompany channelCompany);

    @Options(useGeneratedKeys = false)
    @Update(UPDATE)
    void update(ChannelCompany channelCompany);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    @Select(SELECT_BY_NAME)
    List<ChannelCompany> selectByName(@Param("name") String name);

    @Select(SEARCH_CHANNEL_COMPANY)
    List<ChannelCompany> searchChannelCompany(@Param("keyWord") String keyword, @Param("startIndex") int startIndex,
                                              @Param("endIndex") int endIndex);

    @Select(COUNT_CHANNEL_COMPANYS)
    int countByKeyword(@Param("keyWord") String keyword);

    List<Customer> selectChannelListByCondition(ChannelCondition condition);

    int countChannelByCondition(ChannelCondition condition);
}
