package com.ezsmart.umcs.exception;

import com.ezsmart.umcs.constant.ExceptionMessage;

/**
 * 参数异常
 *
 * @author luochunteng
 */
public class ArgException extends AException {

    public ArgException(Throwable ex) {
        super(ex);
    }

    public ArgException(int code) {
        this.code = code;
    }

    public ArgException(String message) {
        super(ExceptionMessage.PARAM_ERROR.getCode(), message);
    }

    public ArgException(String message, Throwable ex) {
        super(message, ex);

    }

}
