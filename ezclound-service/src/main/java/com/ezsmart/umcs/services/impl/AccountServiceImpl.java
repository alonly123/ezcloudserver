package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.AccountCondition;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.persistence.AccountMapper;
import com.ezsmart.umcs.persistence.PublicSequenceMapper;
import com.ezsmart.umcs.services.AccountService;
import com.ezsmart.umcs.util.ServiceUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
 * @author xiejiayong
 */
@Component
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountMapper accountDao;
    @Autowired
    private PublicSequenceMapper pubSequenceMapper;

    @Override
    public Account getAccountByUCode(String ucode) {
        return accountDao.selectByUCode(ucode);
    }

    @Override
    public List<Account> getAccountListByUCode(String ucode) {
        List<Account> accountList = null;
        if ("admin".equals(ucode)) {
            accountList = accountDao.selectAll();
        }
        return accountList;
    }

    @Override
    public BasicResult createAccount(Account account) {
        if (account == null) {
            return new BasicResult(false, ReturnConstants.ACCOUNT_NOT_EXIST.getCode(), ReturnConstants.ACCOUNT_NOT_EXIST.getMessage());
        }
        if (accountDao.selectByUCode(account.getUcode()) != null) {
            return new BasicResult(false, ReturnConstants.ACCOUNT_IS_EXIST.getCode(), ReturnConstants.ACCOUNT_IS_EXIST.getMessage());
        }
        account.setId(pubSequenceMapper.getSeq().intValue());
        accountDao.insert(account);

        return new BasicResult(true);
    }

    /**
     *
     */
    @Override
    public BasicResult updatePassword(int id, String password) {
        if (id == 0 || StringUtils.isEmpty(password)) {
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
        accountDao.updatePassword(id, password);
        return new BasicResult(true);
    }

    /**
     * @param ucode
     */
    @Override
    public BasicResult deleteAccount(String ucode) {
        if (accountDao.selectByUCode(ucode) == null) {
            return new BasicResult(false, ReturnConstants.ACCOUNT_NOT_EXIST.getCode(), ReturnConstants.ACCOUNT_NOT_EXIST.getMessage());
        }
        accountDao.delete(ucode);

        return new BasicResult(true);
    }

    @Override
    public BasicResult updateAccount(Account account) {
        if (account == null) {
            return new BasicResult(false, ReturnConstants.ACCOUNT_NOT_EXIST.getCode(), ReturnConstants.ACCOUNT_NOT_EXIST.getMessage());
        }
        Account oldAccount = accountDao.selectByUCode(account.getUcode());
        if (oldAccount != null && oldAccount.getId() != account.getId()) {
            return new BasicResult(false, ReturnConstants.ACCOUNT_IS_EXIST.getCode(), ReturnConstants.ACCOUNT_IS_EXIST.getMessage());
        }
        accountDao.update(account);

        return new BasicResult(true);
    }

    @Override
    public Account getAccountById(int id) {
        return accountDao.selectById(id);
    }

    @Override
    public List<Account> getAccountListByOwner(int ownerId, String ownerType) {
        return accountDao.selectAccountByOwner(ownerId, ownerType);
    }

    @Override
    public List<Account> getList(String accountType, String keywords, int pageNum,
                                 int pageSize) {
        return accountDao.selectListByKeyword(accountType, keywords, (pageNum - 1) * pageSize + 1,
                pageNum * pageSize + 1);
    }

    public int getCount(String keywords, String accountType) {
        return accountDao.countByKeyword(keywords, accountType);
    }

    @Override
    public List<Account> getList(AccountCondition accountCondition, int pageNum, int pageSize) {
        if (accountCondition == null) {
            accountCondition = new AccountCondition();
        }
        accountCondition.setStartIndex((pageNum - 1) * pageSize + 1);
        accountCondition.setEndIndex(pageNum * pageSize + 1);
        return accountDao.selectListByCondition(accountCondition);
    }

    @Override
    public int getCount(AccountCondition accountCondition) {
        return accountDao.countByCondition(accountCondition);
    }
}
