package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.HostModelCondition;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.domain.HostModel;
import com.ezsmart.umcs.persistence.AccountMapper;
import com.ezsmart.umcs.persistence.HostModelMapper;
import com.ezsmart.umcs.persistence.PublicSequenceMapper;
import com.ezsmart.umcs.services.AccountService;
import com.ezsmart.umcs.services.HostModelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * @author xiejiayong
 */
@Component
public class HostModelServiceImpl implements HostModelService {

    @Autowired
    private HostModelMapper hostModelMapper;

    @Override
    public HostModel getById(int id) {
        return hostModelMapper.selectById(id);
    }

    @Override
    public List<HostModel> getList(HostModelCondition condition, int pageNum, int pageSize) {
        if (null == condition) {
            condition = new HostModelCondition();
        }

        condition.setStartIndex((pageNum - 1) * pageSize + 1);
        condition.setEndIndex(pageNum * pageSize + 1);

        return hostModelMapper.selectListByCondition(condition);
    }

    @Override
    public int count(HostModelCondition condition) {
        if (null == condition) {
            condition = new HostModelCondition();
        }

        return hostModelMapper.countByCondition(condition);
    }

    @Override
    public HostModel getByModel(String model) {
        return hostModelMapper.selectByModel(model);
    }
}
