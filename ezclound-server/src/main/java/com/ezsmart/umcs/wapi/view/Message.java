package com.ezsmart.umcs.wapi.view;

import java.io.Serializable;

/**
 * Created by luochunteng
 */
public class Message implements Serializable {
    private static final long serialVersionUID = -1L;
    private String message = "";
    private boolean isSucess = true;
    private String exceptionCode = "";

    public Message(String message, boolean isSucess, String exceptionCode) {
        super();
        this.message = message;
        this.isSucess = isSucess;
        this.exceptionCode = exceptionCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isSucess() {
        return isSucess;
    }

    public void setSucess(boolean isSucess) {
        this.isSucess = isSucess;
    }

    public String getExceptionCode() {
        return exceptionCode;
    }

    public void setExceptionCode(String exceptionCode) {
        this.exceptionCode = exceptionCode;
    }
}
