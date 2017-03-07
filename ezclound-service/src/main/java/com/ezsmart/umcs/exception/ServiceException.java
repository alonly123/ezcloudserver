package com.ezsmart.umcs.exception;

public class ServiceException extends AException {

    public ServiceException() {
        super();
    }

    public ServiceException(String message) {
        super(message);
    }

    public ServiceException(int code) {
        super(code);
    }

    public ServiceException(String message, Throwable cause) {
        super(message, cause);
    }
}
