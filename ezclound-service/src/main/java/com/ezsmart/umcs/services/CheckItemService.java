package com.ezsmart.umcs.services;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.CheckItemCondition;
import com.ezsmart.umcs.domain.CheckItem;

import java.util.List;

/**
 * Created by luochunteng on 2016/5/11 0011.
 */
public interface CheckItemService {

    public BasicResult addCheckItem(CheckItem checkItem);

    public BasicResult deleteCheckItem(int id);

    public BasicResult deleteCheckItemByTargetDeviceId(int targetDeviceId);

    public List<CheckItem> getCheckItemListByCondition(CheckItemCondition checkItemCondition, int pageNum, int pageSize);

    public int count(CheckItemCondition checkItemCondition);
}
