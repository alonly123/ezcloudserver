package com.ezsmart.umcs.condition;

import java.util.List;

/**
 * Created by lixiangyang on 16/4/12.
 */
public class DeviceModelCheckCommandCondition extends Condition {
    private String keyWord;
    private String targetDeviceModel;
    private List<String> targetDeviceModels;
    private int startIndex;
    private int endIndex;

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public String getTargetDeviceModel() {
        return targetDeviceModel;
    }

    public void setTargetDeviceModel(String targetDeviceModel) {
        this.targetDeviceModel = targetDeviceModel;
    }

    public List<String> getTargetDeviceModels() {
        return targetDeviceModels;
    }

    public void setTargetDeviceModels(List<String> targetDeviceModels) {
        this.targetDeviceModels = targetDeviceModels;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public int getEndIndex() {
        return endIndex;
    }

    public void setEndIndex(int endIndex) {
        this.endIndex = endIndex;
    }
}
