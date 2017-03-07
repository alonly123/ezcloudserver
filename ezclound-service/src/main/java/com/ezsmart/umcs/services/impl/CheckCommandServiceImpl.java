package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.CheckCommandCondition;
import com.ezsmart.umcs.condition.CheckItemCondition;
import com.ezsmart.umcs.domain.CheckCommand;
import com.ezsmart.umcs.domain.CheckItem;
import com.ezsmart.umcs.persistence.CheckCommandMapper;
import com.ezsmart.umcs.persistence.CheckItemMapper;
import com.ezsmart.umcs.persistence.PublicSequenceMapper;
import com.ezsmart.umcs.services.CheckCommandService;
import com.ezsmart.umcs.services.CheckItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Administrator on 2016/5/11 0011.
 */
@Component
public class CheckCommandServiceImpl implements CheckCommandService {

    @Autowired
    private CheckCommandMapper checkCommandMapper;

    @Autowired
    private PublicSequenceMapper publicSequenceDao;

    @Override
    public BasicResult addCheckCommand(CheckCommand checkCommand) {
        checkCommand.setId(publicSequenceDao.getSeq());
        checkCommandMapper.insert(checkCommand);
        return new BasicResult(true);
    }

    @Override
    public BasicResult deleteCheckCommand(int id) {
        checkCommandMapper.delete(id);
        return new BasicResult(true);
    }

    @Override
    public BasicResult deleteCheckCommandByTargetDeviceId(int targetDeviceId) {
        checkCommandMapper.deleteByTargetDeviceId(targetDeviceId);
        return new BasicResult(true);
    }

    @Override
    public List<CheckCommand> getCheckCommandListByCondition(CheckCommandCondition checkCommandCondition, int pageNum, int pageSize) {
        if (checkCommandCondition == null) {
            checkCommandCondition = new CheckCommandCondition();
        }
        checkCommandCondition.setStartIndex((pageNum - 1) * pageSize + 1);
        checkCommandCondition.setEndIndex(pageNum * pageSize + 1);
        return checkCommandMapper.getCheckCommandByCondition(checkCommandCondition);
    }

    @Override
    public int count(CheckCommandCondition checkCommandCondition) {
        return checkCommandMapper.countByCondition(checkCommandCondition);
    }
}
