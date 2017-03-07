package com.ezsmart.umcs.common;

/**
 * Created by lixiangyang on 16/4/1.
 * 通用返回值
 */
public class BasicResult {
    private boolean success;
    private int code;
    private String msg = "OK";
    private Object data;

    public BasicResult() {

    }

    public BasicResult(boolean success) {
        this.success = success;
    }

    public BasicResult(boolean success, int code, String msg) {
        this.success = success;
        this.code = code;
        this.msg = msg;
    }

    public BasicResult(boolean success, String msg) {
        this.success = success;
        this.msg = msg;
    }

    public BasicResult(boolean success, String msg, Object data) {
        this.success = success;
        this.msg = msg;
        this.data = data;
    }

    public BasicResult(boolean success, int code, String msg, Object data) {
        this.success = success;
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
