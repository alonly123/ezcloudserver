
package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.condition.LoginHistoryCondition;
import com.ezsmart.umcs.domain.LoginHistory;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface LoginHistoryMapper {

    final String SELECT_BY_ID = "SELECT * FROM LoginHistory WHERE id=#{id}";

    final String INSERT = "INSERT INTO LoginHistory(id,userCode,loginTime,userIpAddr,createtime,updatetime)"
            + " VALUES(#{id},#{userCode},#{loginTime},#{userIpAddr},#{createtime},#{updatetime})";

    final String UPDATE = "update LoginHistory set " +
            "userCode=#{userCode},loginTime=#{loginTime},userIpAddr=#{userIpAddr},updatetime=#{updatetime} " +
            "where id=#{id}";

    final String DELETE = "DELETE FROM LoginHistory where id=#{id}";
    final String SELECT_ALL = "SELECT * FROM LoginHistory";

    final String SELECT_HISTORY_BY_KEYWORD = "SELECT * FROM (SELECT t.*, ROWNUM r FROM (SELECT * FROM LOGINHISTORY WHERE lower(usercode) like lower('%'||#{keyword}||'%') or lower(userIpAddr) like lower('%'||#{keyword}||'%')) t WHERE ROWNUM <#{endIndex}) where r >=#{startIndex} ORDER BY logintime desc";
    final String COUNT_HISTORY = "SELECT count(1) FROM LOGINHISTORY WHERE lower(usercode) like lower('%'||#{keyword}||'%') or lower(userIpAddr) like lower('%'||#{keyword}||'%')";


    @Select(SELECT_BY_ID)
    LoginHistory selectById(@Param("id") int id);

    @Select(SELECT_ALL)
    List<LoginHistory> selectAll();

    @Options(useGeneratedKeys = false)
    @Insert(INSERT)
    void insert(LoginHistory loginHistory);

    @Update(UPDATE)
    void update(LoginHistory loginHistory);

    @Delete(DELETE)
    void delete(@Param("id") int id);

    @Select(SELECT_HISTORY_BY_KEYWORD)
    List<LoginHistory> selectLoginHistoryByKeyword(@Param("keyword") String keyword,
                                                   @Param("startIndex") int startIndex, @Param("endIndex") int endIndex);

    @Select(COUNT_HISTORY)
    int count(@Param("keyword") String keyword);

    List<LoginHistory> selectListByCondition(LoginHistoryCondition condition);

    int countByCondition(LoginHistoryCondition condition);

}
