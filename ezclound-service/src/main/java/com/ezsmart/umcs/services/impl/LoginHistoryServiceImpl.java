package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.condition.AlarmCondition;
import com.ezsmart.umcs.condition.LoginHistoryCondition;
import com.ezsmart.umcs.domain.Alarm;
import com.ezsmart.umcs.domain.LoginHistory;
import com.ezsmart.umcs.persistence.LoginHistoryMapper;
import com.ezsmart.umcs.persistence.PublicSequenceMapper;
import com.ezsmart.umcs.services.LoginHistoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * Created by luochunteng on 2016/4/19.
 */
@Component
public class LoginHistoryServiceImpl implements LoginHistoryService {
    private static final Logger LOGGER = LoggerFactory.getLogger(LoginHistoryServiceImpl.class);

    @Autowired
    private LoginHistoryMapper loginHistoryDao;

    @Autowired
    private PublicSequenceMapper publicSequenceDao;

    @Override
    public List<LoginHistory> getLoginHistoryList(String keyword, int pageNum, int pageSize) {
        return loginHistoryDao.selectLoginHistoryByKeyword(keyword, (pageNum - 1) * pageSize + 1,
                pageNum * pageSize + 1);
    }

    @Override
    public void addLoginHistory(LoginHistory loginHistory) {
        loginHistory.setId(publicSequenceDao.getSeq());
        loginHistoryDao.insert(loginHistory);
    }

    @Override
    public void addLoginHistory(String ucode, String ip) {
        LoginHistory loginHistory = new LoginHistory();
        loginHistory.setUserCode(ucode);
        loginHistory.setUserIpAddr(ip);

        Date date = new Date();

        loginHistory.setLoginTime(date);
        loginHistory.setCreatetime(date);
        loginHistory.setUpdatetime(date);

        try {
            this.addLoginHistory(loginHistory);
        } catch (Exception e) {
            LOGGER.error("addLoginHistory", e);
        }
    }

    @Override
    public int count(String keyword) {
        return loginHistoryDao.count(keyword);
    }

    @Override
    public int count(LoginHistoryCondition condition) {
        condition = null == condition ? new LoginHistoryCondition() : condition;

        return loginHistoryDao.countByCondition(condition);
    }

    @Override
    public List<LoginHistory> getLoginHistoryList(LoginHistoryCondition condition, int pageNum, int pageSize) {
        condition = null == condition ? new LoginHistoryCondition() : condition;

        condition.setStartIndex((pageNum - 1) * pageSize + 1);
        condition.setEndIndex(pageNum * pageSize + 1);

        return loginHistoryDao.selectListByCondition(condition);
    }
}
