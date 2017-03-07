package com.ezsmart.umcs.exception;

/**
 * 业务异常
 *
 * @author luochunteng
 */
public class BusException extends RuntimeException {
    private static final long serialVersionUID = 1L;
    private int code;
    private String message;

    public BusException(Throwable ex) {
        super(ex);
    }

    public BusException(int code) {
        this.code = code;
    }

    public BusException(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
