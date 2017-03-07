package com.ezsmart.umcs.services;

import com.ezsmart.umcs.condition.LoginHistoryCondition;
import com.ezsmart.umcs.domain.LoginHistory;

import java.util.List;

/**
 * Created by luochunteng on 2016/4/19.
 */
public interface LoginHistoryService {
    public List<LoginHistory> getLoginHistoryList(String keyword, int pageNum, int pageSize);

    public void addLoginHistory(LoginHistory loginHistory);

    public void addLoginHistory(String ucode, String ip);

    public int count(String keyword);

    public int count(LoginHistoryCondition condition);

    public List<LoginHistory> getLoginHistoryList(LoginHistoryCondition condition, int pageNum, int pageSize);

}
