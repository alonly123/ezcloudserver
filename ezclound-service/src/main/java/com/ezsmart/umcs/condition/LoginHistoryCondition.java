package com.ezsmart.umcs.condition;

import java.util.Date;

/**
 * Created by lixiangyang on 16/4/12.
 */
public class LoginHistoryCondition extends Condition {
    private String keyWord;
    private Date loginTimeStart;
    private Date loginTimeEnd;
    private int startIndex;
    private int endIndex;

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public Date getLoginTimeStart() {
        return loginTimeStart;
    }

    public void setLoginTimeStart(Date loginTimeStart) {
        this.loginTimeStart = loginTimeStart;
    }

    public Date getLoginTimeEnd() {
        return loginTimeEnd;
    }

    public void setLoginTimeEnd(Date loginTimeEnd) {
        this.loginTimeEnd = loginTimeEnd;
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
