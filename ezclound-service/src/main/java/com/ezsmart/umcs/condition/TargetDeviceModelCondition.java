package com.ezsmart.umcs.condition;

import java.util.List;

/**
 * Created by lixiangyang on 16/4/12.
 */
public class TargetDeviceModelCondition extends Condition {
    private String keyWord;
    private String model;
    private List<String> models;
    private String longModel;
    private int startIndex;
    private int endIndex;

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public List<String> getModels() {
        return models;
    }

    public void setModels(List<String> models) {
        this.models = models;
    }

    public String getLongModel() {
        return longModel;
    }

    public void setLongModel(String longModel) {
        this.longModel = longModel;
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
