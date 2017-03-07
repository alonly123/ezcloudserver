package com.ezsmart.umcs.condition;

/**
 * Created by luochunteng on 2016/5/11 0011.
 */
public class CheckCommandCondition extends Condition {
    private String keyWord;
    private String hostUCode;
    private int targetDeviceId;
    private int startIndex;
    private int endIndex;

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public int getTargetDeviceId() {
        return targetDeviceId;
    }

    public void setTargetDeviceId(int targetDeviceId) {
        this.targetDeviceId = targetDeviceId;
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

    public String getHostUCode() {
        return hostUCode;
    }

    public void setHostUCode(String hostUCode) {
        this.hostUCode = hostUCode;
    }
}
