package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.condition.CustomerCondition;
import com.ezsmart.umcs.domain.Customer;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface CustomerMapper {

    final String SELECT_BY_ID = "SELECT * FROM Customer WHERE id=#{id}";

    final String SELECT_BY_NAME = "SELECT * FROM Customer WHERE name=#{name}";

    final String INSERT = "INSERT INTO Customer(id,name,contacts,maintianer,mphone,phone,notifyPhone,notifyEmail,postcode,pid,areaCode,createtime,updatetime)"
            + " VALUES(#{id},#{name},#{contacts},#{maintianer},#{mphone},#{phone},#{notifyPhone},#{notifyEmail},#{postcode},#{pid},#{areaCode},#{createtime},#{updatetime})";

    final String UPDATE = "update Customer set "
            + "name=#{name},contacts=#{contacts},maintianer=#{maintianer},mphone=#{mphone},phone=#{phone},notifyPhone=#{notifyPhone},notifyEmail=#{notifyEmail},postcode=#{postcode},pid=#{pid},areaCode=#{areaCode},updatetime=#{updatetime}"
            + "where id=#{id}";

    final String DELETE = "DELETE FROM Customer where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM Customer";
    final String SEARCH_CUSTOMER = "SELECT * FROM (SELECT t.*, ROWNUM r FROM (SELECT * FROM CUSTOMER WHERE name like '%'||#{keyWord}||'%' or contacts like '%'||#{keyWord}||'%'  or MAINTIANER like '%'||#{keyWord}||'%' ) t WHERE ROWNUM <#{endIndex}) where r >=#{startIndex} ORDER BY updatetime desc";
    final String COUNT_CUSTOMER = "SELECT   count(1) FROM CUSTOMER WHERE name like '%'||#{keyWord}||'%' or contacts like '%'||#{keyWord}||'%' or MAINTIANER like '%'||#{keyWord}||'%'";
    final String COUNT_CUSTOMER_BY_COMPANYID = "SELECT   count(1) FROM CUSTOMER WHERE pid=#{pid} AND (name like '%'||#{keyWord}||'%' or contacts like '%'||#{keyWord}||'%' or MAINTIANER like '%'||#{keyWord}||'%')";
    final String SELECT_BY_CHANNEL_COMPANY = "SELECT * FROM (SELECT t.*, ROWNUM r FROM (SELECT * FROM CUSTOMER WHERE pid=#{campanyId} AND (name like '%'||#{keyWord}||'%' or contacts like '%'||#{keyWord}||'%'  or MAINTIANER like '%'||#{keyWord}||'%' )) t WHERE ROWNUM <#{endIndex}) where r >=#{startIndex} ORDER BY updatetime desc";

    @Select(SELECT_BY_ID)
    Customer selectById(@Param("id") int id);

    @Select(SELECT_BY_NAME)
    List<Customer> selectByName(@Param("name") String name);

    @Select(SELECT_ALL)
    List<Customer> selectAll();

    @Options(useGeneratedKeys = false)
    @Insert(INSERT)
    int insert(Customer customer);

    @Options(useGeneratedKeys = false)
    @Update(UPDATE)
    void update(Customer customer);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    @Select(SEARCH_CUSTOMER)
    List<Customer> searchCustomerList(@Param("keyWord") String keyWord, @Param("startIndex") int startIndex,
                                      @Param("endIndex") int endIndex);

    @Select(COUNT_CUSTOMER)
    int count(@Param("keyWord") String keyword);

    @Select(COUNT_CUSTOMER_BY_COMPANYID)
    int countByCompanyId(@Param("keyWord") String keyword, @Param("pid") int pid);

    @Select(SELECT_BY_CHANNEL_COMPANY)
    List<Customer> selectCustomerListByCompanyId(@Param("campanyId") int campanyId,
                                                 @Param("keyWord") String keyWord,
                                                 @Param("startIndex") int startIndex,
                                                 @Param("endIndex") int endIndex);


    List<Customer> selectCustomerListByCondition(CustomerCondition condition);

    int countCustomerByCondition(CustomerCondition condition);
}
