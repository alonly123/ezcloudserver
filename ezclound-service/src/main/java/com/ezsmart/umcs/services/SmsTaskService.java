package com.ezsmart.umcs.services;

import com.ezsmart.umcs.condition.SmsTaskCondition;
import com.ezsmart.umcs.domain.SmsTask;

import java.util.List;

public interface SmsTaskService {

    public int count(SmsTaskCondition condition);

    public List<SmsTask> getSmsTaskList(SmsTaskCondition condition, int pageNum, int pageSize);

    public SmsTask getById(int id);
}
