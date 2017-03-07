package com.ezsmart.umcs.persistence;

import com.ezsmart.umcs.condition.AccountCondition;
import com.ezsmart.umcs.domain.Account;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface AccountMapper {

    final String SELECT_BY_ID = "SELECT * FROM Account WHERE id=#{id}";
    final String SELECT_BY_UCODE = "SELECT * FROM Account WHERE ucode=#{ucode}";
    final String SELECT_BY_OWNERID = "SELECT * FROM Account WHERE ownerId=#{ownerId}";

    final String INSERT =
            "INSERT INTO Account(id,ucode,name,password,ownerType,ownerId,roleType,email,descr,createtime,updatetime)"
                    + " VALUES(#{id},#{ucode},#{name},#{password},#{ownerType},#{ownerId},#{roleType},#{email},#{descr},#{createtime},#{updatetime})";

    final String UPDATE = "update Account set "
            + "ucode=#{ucode},name=#{name},ownerType=#{ownerType},ownerId=#{ownerId},roleType=#{roleType},email=#{email},descr=#{descr}, updatetime=#{updatetime} "
            + "where id=#{id}";

    final String DELETE = "DELETE FROM Account where ucode=#{ucode}";
    final String SELECT_ALL = "SELECT * FROM Account";

    final String SELECT_BY_OWNER = "SELECT * FROM Account WHERE ownerId=#{ownerId} AND ownerType=#{ownerType}";

    final String SEARCH_ACCOUNTS = "SELECT t.* FROM Account t WHERE t.name like CONCAT('%',#{keyWord}) or t.name like CONCAT(#{keyWord},'%')";

    final String SEARCH_ACCOUNTS_V2 = "SELECT * FROM (SELECT t.*, ROWNUM r FROM (SELECT * FROM ACCOUNT WHERE name like '%'||#{keyWord}||'%' or ucode like '%'||#{keyWord}||'%' ) t WHERE roleType=#{accountType} and ROWNUM <#{endIndex}) where r >=#{startIndex} ORDER BY updatetime desc";

    final String COUNT_ACCOUNTS = "SELECT   count(1) FROM ACCOUNT WHERE (name like '%'||#{keyWord}||'%' or ucode like '%'||#{keyWord}||'%') and roleType = #{accountType}";

    @Select(SELECT_BY_ID)
    Account selectById(@Param("id") int id);

    @Select(SELECT_BY_OWNERID)
    Account selectByOwnId(@Param("ownerId") int ownerId);

    @Select(SELECT_BY_UCODE)
    Account selectByUCode(@Param("ucode") String ucode);

    @Select(SELECT_ALL)
    List<Account> selectAll();

    @Options(useGeneratedKeys = false)
    @Insert(INSERT)
    void insert(Account account);

    @Options(useGeneratedKeys = false)
    @Update(UPDATE)
    void update(Account account);

    @Delete(DELETE)
    void delete(@Param("ucode") String ucode);

    @Options(useGeneratedKeys = false)
    @Update("UPDATE Account SET password=#{password} WHERE id=#{id}")
    void updatePassword(
            @Param("id") int id, @Param("password") String password);

    @Select(SELECT_BY_OWNER)
    List<Account> selectAccountByOwner(@Param("ownerId") int ownerId,
                                       @Param("ownerType") String ownerType);

    @Select(SEARCH_ACCOUNTS)
    List<Account> selectAccountListByKeyword(
            @Param("keyWord") String keyWord);

    @Select(SEARCH_ACCOUNTS_V2)
    List<Account> selectListByKeyword(
            @Param("accountType") String accountType, @Param("keyWord") String keyord,
            @Param("startIndex") int startIndex, @Param("endIndex") int endIndex);

    @Select(COUNT_ACCOUNTS)
    int countByKeyword(@Param("keyWord") String keyword, @Param("accountType") String accountType);

    List<Account> selectListByCondition(AccountCondition accountCondition);

    int countByCondition(AccountCondition accountCondition);

}
