package com.ezsmart.umcs.condition;

/**
 * Created by lixiangyang on 16/4/12.
 */
public class HostModelPortCondition extends Condition {
    private String hostModel;
    private int startIndex;
    private int endIndex;

    public String getHostModel() {
        return hostModel;
    }

    public void setHostModel(String hostModel) {
        this.hostModel = hostModel;
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
