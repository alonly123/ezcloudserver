package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.CheckItemCondition;
import com.ezsmart.umcs.condition.TargetDeviceCondition;
import com.ezsmart.umcs.domain.CheckItem;
import com.ezsmart.umcs.persistence.CheckItemMapper;
import com.ezsmart.umcs.persistence.PublicSequenceMapper;
import com.ezsmart.umcs.services.CheckItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Administrator on 2016/5/11 0011.
 */
@Component
public class CheckItemServiceImpl implements CheckItemService {

    @Autowired
    private CheckItemMapper checkItemDao;

    @Autowired
    private PublicSequenceMapper publicSequenceDao;

    @Override
    public BasicResult addCheckItem(CheckItem checkItem) {
        checkItem.setId(publicSequenceDao.getSeq());
        checkItemDao.insert(checkItem);
        return new BasicResult(true);
    }

    @Override
    public BasicResult deleteCheckItem(int id) {
        checkItemDao.delete(id);
        return new BasicResult(true);
    }

    @Override
    public BasicResult deleteCheckItemByTargetDeviceId(int targetDeviceId) {
        checkItemDao.deleteByTargetDeviceId(targetDeviceId);
        return new BasicResult(true);
    }

    @Override
    public List<CheckItem> getCheckItemListByCondition(CheckItemCondition checkItemCondition, int pageNum, int pageSize) {
        if (checkItemCondition == null) {
            checkItemCondition = new CheckItemCondition();
        }
        checkItemCondition.setStartIndex((pageNum - 1) * pageSize + 1);
        checkItemCondition.setEndIndex(pageNum * pageSize + 1);
        return checkItemDao.getCheckItemByCondition(checkItemCondition);
    }

    @Override
    public int count(CheckItemCondition checkItemCondition) {
        return checkItemDao.countByCondition(checkItemCondition);
    }
}
