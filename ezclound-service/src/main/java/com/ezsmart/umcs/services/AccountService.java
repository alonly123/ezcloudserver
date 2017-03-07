package com.ezsmart.umcs.services;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.AccountCondition;
import com.ezsmart.umcs.domain.Account;

import java.util.List;

public interface AccountService {

    public Account getAccountByUCode(String ucode);

    public List<Account> getAccountListByUCode(String ucode);

    public BasicResult createAccount(Account account);

    public BasicResult updateAccount(Account account);

    public Account getAccountById(int id);

    public List<Account> getAccountListByOwner(int OwnerId, String OwnerType);

    /**
     * 修改密码，对密码就行合法性检查
     *
     * @param password
     */
    public BasicResult updatePassword(int id, String password);

    public BasicResult deleteAccount(String ucode);

    public List<Account> getList(String accountType, String keywords, int pageNum, int pageSize);

    public int getCount(String keywords, String accountType);

    public List<Account> getList(AccountCondition accountCondition, int pageNum, int pageSize);

    public int getCount(AccountCondition accountCondition);
}