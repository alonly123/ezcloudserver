package com.ezsmart.umcs.services;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.CheckCommandCondition;
import com.ezsmart.umcs.domain.CheckCommand;

import java.util.List;

/**
 * Created by luochunteng on 2016/5/11 0011.
 */
public interface CheckCommandService {

    public BasicResult addCheckCommand(CheckCommand checkCommand);

    public BasicResult deleteCheckCommand(int id);

    public BasicResult deleteCheckCommandByTargetDeviceId(int targetDeviceId);

    public List<CheckCommand> getCheckCommandListByCondition(CheckCommandCondition checkCommandCondition, int pageNum, int pageSize);

    public int count(CheckCommandCondition checkCommandCondition);
}
