package com.ezsmart.umcs.exception;

import com.ezsmart.umcs.constant.ExceptionMessage;

/**
 * 异常封装
 *
 * @author luochunteng
 */
public abstract class AException extends RuntimeException {

    protected int code = ExceptionMessage.RESULT_ERROR.getCode();

    public AException() {
        super();
    }

    public AException(Throwable ex) {
        super(ex);
    }

    public AException(int code) {
        this.code = code;
    }

    public AException(String message) {
        super(message);
    }

    public AException(int code, String message) {
        super(message);
        this.code = code;
    }

    public AException(String message, Throwable ex) {
        super(message, ex);
    }

    public int getCode() {
        return code;
    }

    @Override
    public String toString() {
        return "AException [code=" + code + ", toString()=" + super.getMessage() + "]";
    }

}
