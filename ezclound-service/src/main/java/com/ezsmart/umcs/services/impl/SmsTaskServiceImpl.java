package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.condition.EventCondition;
import com.ezsmart.umcs.condition.SmsTaskCondition;
import com.ezsmart.umcs.domain.Event;
import com.ezsmart.umcs.domain.SmsTask;
import com.ezsmart.umcs.persistence.EventMapper;
import com.ezsmart.umcs.persistence.SmsTaskMapper;
import com.ezsmart.umcs.services.EventService;
import com.ezsmart.umcs.services.SmsTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class SmsTaskServiceImpl implements SmsTaskService {

    @Autowired
    private SmsTaskMapper smsTaskMapper;


    @Override
    public int count(SmsTaskCondition condition) {
        condition = null == condition ? new SmsTaskCondition() : condition;

        return smsTaskMapper.countByCondition(condition);
    }

    @Override
    public List<SmsTask> getSmsTaskList(SmsTaskCondition condition, int pageNum, int pageSize) {
        condition = null == condition ? new SmsTaskCondition() : condition;

        condition.setStartIndex((pageNum - 1) * pageSize + 1);
        condition.setEndIndex(pageNum * pageSize + 1);

        return smsTaskMapper.selectListByCondition(condition);
    }

    @Override
    public SmsTask getById(int id) {
        return smsTaskMapper.selectById(id);
    }
}
