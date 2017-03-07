package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.AlarmCondition;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.domain.Alarm;
import com.ezsmart.umcs.domain.AlarmHistory;
import com.ezsmart.umcs.persistence.AlarmHistoryMapper;
import com.ezsmart.umcs.persistence.AlarmMapper;
import com.ezsmart.umcs.services.AlarmService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;


@Component
public class AlarmServiceImpl implements AlarmService {
    private static final Logger LOGGER = LoggerFactory.getLogger(AlarmServiceImpl.class);

    @Autowired
    private AlarmMapper alarmMapper;

    @Autowired
    private AlarmHistoryMapper alarmHistoryMapper;

    @Override
    public int count(AlarmCondition condition) {
        condition = null == condition ? new AlarmCondition() : condition;

        return alarmMapper.countByCondition(condition);
    }

    @Override
    public List<Alarm> getAlarmList(AlarmCondition condition, int pageNum, int pageSize) {
        condition = null == condition ? new AlarmCondition() : condition;

        condition.setStartIndex((pageNum - 1) * pageSize + 1);
        condition.setEndIndex(pageNum * pageSize + 1);

        return alarmMapper.selectListByCondition(condition);
    }


    @Override
    public BasicResult ack(int id, Account ackAccount) {
        Alarm alarm = alarmMapper.selectById(id);
        if (null == alarm) {
            return new BasicResult(false, ReturnConstants.ALARM_NOT_EXIST.getCode(), ReturnConstants.ALARM_NOT_EXIST.getMessage());
        }

        //ack
        String ackUser = ackAccount != null ? ackAccount.getUcode() : "";
        Date date = new Date();

        alarm.setAckUser(ackUser);
        alarm.setAckTime(date);
        alarm.setUpdateTime(date);

//        alarmMapper.update(alarm);
        alarmMapper.delete(id);  //直接删除

        //告警转存history
        AlarmHistory alarmHistory = getAlarmHistory(alarm);

        alarmHistory.setUpdateTime(date);
        alarmHistory.setCreateTime(date);
        try {
            alarmHistoryMapper.insert(alarmHistory);
        } catch (Exception e) {
            LOGGER.error("ack save history error id={}", id, e);
        }

        return new BasicResult(true, "OK");
    }

    @Override
    public Alarm getById(int id) {
        return alarmMapper.selectById(id);
    }

    private AlarmHistory getAlarmHistory(Alarm alarm) {
        AlarmHistory alarmHistory = new AlarmHistory();

        alarmHistory.setId(alarm.getId());
        alarmHistory.setName(alarm.getName());
        alarmHistory.setAlarmTime(alarm.getAlarmTime());
        alarmHistory.setAlarmLevel(alarm.getAlarmLevel());
        alarmHistory.setAlarmType(alarm.getAlarmType());
        alarmHistory.setSourceId(alarm.getSourceId());
        alarmHistory.setSourceType(alarm.getSourceType());
        alarmHistory.setContent(alarm.getContent());
        alarmHistory.setAckTime(alarm.getAckTime());
        alarmHistory.setAckUser(alarm.getAckUser());
        alarmHistory.setHostUcode(alarm.getHostUcode());
        alarmHistory.setCreateTime(alarm.getCreateTime());
        alarmHistory.setUpdateTime(alarm.getUpdateTime());

        return alarmHistory;
    }


}
