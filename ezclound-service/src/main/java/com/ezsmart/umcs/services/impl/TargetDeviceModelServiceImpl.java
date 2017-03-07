package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.TargetDeviceModelCondition;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.TargetDeviceModel;
import com.ezsmart.umcs.persistence.PublicSequenceMapper;
import com.ezsmart.umcs.persistence.TargetDeviceModelMapper;
import com.ezsmart.umcs.services.TargetDeviceModelService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * @author xiejiayong
 */
@Component
public class TargetDeviceModelServiceImpl implements TargetDeviceModelService {
    private static final Logger LOGGER = LoggerFactory.getLogger(TargetDeviceModelServiceImpl.class);

    @Autowired
    private TargetDeviceModelMapper targetDeviceModelMapper;

    @Autowired
    private PublicSequenceMapper publicSequenceMapper;

    @Override
    public List<TargetDeviceModel> getList(TargetDeviceModelCondition condition, int pageNum, int pageSize) {
        condition = null == condition ? new TargetDeviceModelCondition() : condition;

        condition.setStartIndex((pageNum - 1) * pageSize + 1);
        condition.setEndIndex(pageNum * pageSize + 1);

        return targetDeviceModelMapper.selectListByCondition(condition);
    }

    @Override
    public List<TargetDeviceModel> getList(TargetDeviceModelCondition condition) {
        condition = null == condition ? new TargetDeviceModelCondition() : condition;

        return targetDeviceModelMapper.selectAllListByCondition(condition);
    }

    @Override
    public int count(TargetDeviceModelCondition condition) {
        condition = null == condition ? new TargetDeviceModelCondition() : condition;

        return targetDeviceModelMapper.countByCondition(condition);
    }

    @Override
    public BasicResult save(TargetDeviceModel targetDeviceModel) {
        if (targetDeviceModel.getId() > 0) {
            TargetDeviceModel temp = targetDeviceModelMapper.selectById(targetDeviceModel.getId());
            if (null == temp) {  //add
                LOGGER.info("save add targetDeviceModel={}", targetDeviceModel);
                return this.insert(targetDeviceModel);
            } else {//update
                targetDeviceModel.setCreateTime(temp.getCreateTime());
                LOGGER.info("save update targetDeviceModel={}", targetDeviceModel);
                return this.update(targetDeviceModel);
            }
        } else {  //add
            LOGGER.info("save add targetDeviceModel={}", targetDeviceModel);
            return this.update(targetDeviceModel);
        }
    }

    @Override
    public BasicResult delete(int id) {
        try {
            targetDeviceModelMapper.delete(id);

            return new BasicResult(true, "OK");
        } catch (Exception e) {
            LOGGER.error("delete error id={}", id, e);
        }
        return new BasicResult(false, ReturnConstants.TARGET_DEVICE_MODEL_DELETE_FAIL.getCode(), ReturnConstants.TARGET_DEVICE_MODEL_DELETE_FAIL.getMessage());
    }

    @Override
    public TargetDeviceModel getById(int id) {
        if (id < 1) {
            return null;
        }
        return targetDeviceModelMapper.selectById(id);
    }

    @Override
    public TargetDeviceModel getByModel(String model) {
        return targetDeviceModelMapper.selectByModel(model);
    }

    private BasicResult insert(TargetDeviceModel targetDeviceModel) {
        try {
            targetDeviceModel.setCreateTime(new Date());
            targetDeviceModel.setUpdateTime(new Date());
            targetDeviceModel.setId(publicSequenceMapper.getSeq().intValue());
            targetDeviceModelMapper.insert(targetDeviceModel);

            return new BasicResult(true, "OK", targetDeviceModel);
        } catch (Exception e) {
            LOGGER.error("insert error targetDeviceModel={}", targetDeviceModel, e);
        }
        return new BasicResult(false, ReturnConstants.TARGET_DEVICE_MODEL_ADD_FAIL.getCode(), ReturnConstants.TARGET_DEVICE_MODEL_ADD_FAIL.getMessage());
    }

    private BasicResult update(TargetDeviceModel targetDeviceModel) {
        try {
            targetDeviceModel.setUpdateTime(new Date());
            targetDeviceModelMapper.insert(targetDeviceModel);

            return new BasicResult(true, "OK", targetDeviceModel);
        } catch (Exception e) {
            LOGGER.error("update error targetDeviceModel={}", targetDeviceModel, e);
        }

        return new BasicResult(false, ReturnConstants.TARGET_DEVICE_MODEL_UPDATE_FAIL.getCode(), ReturnConstants.TARGET_DEVICE_MODEL_UPDATE_FAIL.getMessage());
    }
}
