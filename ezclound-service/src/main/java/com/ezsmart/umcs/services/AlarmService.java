package com.ezsmart.umcs.services;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.AlarmCondition;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.domain.Alarm;

import java.util.List;


public interface AlarmService {

    public int count(AlarmCondition condition);

    public List<Alarm> getAlarmList(AlarmCondition condition, int pageNum, int pageSize);

    public BasicResult ack(int id, Account ackAccount);

    public Alarm getById(int id);

}
