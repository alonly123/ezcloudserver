package com.ezsmart.umcs.condition;

import java.util.Date;

/**
 * Created by lixiangyang on 16/4/12.
 */
public class EventCondition extends Condition {
    private String keyWord;
    private Date eventTimeStart;
    private Date eventTimeEnd;
    private int startIndex;
    private int endIndex;

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public Date getEventTimeStart() {
        return eventTimeStart;
    }

    public void setEventTimeStart(Date eventTimeStart) {
        this.eventTimeStart = eventTimeStart;
    }

    public Date getEventTimeEnd() {
        return eventTimeEnd;
    }

    public void setEventTimeEnd(Date eventTimeEnd) {
        this.eventTimeEnd = eventTimeEnd;
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
