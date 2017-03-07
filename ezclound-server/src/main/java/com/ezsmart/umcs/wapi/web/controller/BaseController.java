package com.ezsmart.umcs.wapi.web.controller;

import com.ezsmart.umcs.constant.ExceptionMessage;
import com.ezsmart.umcs.exception.BusException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;

public class BaseController {
    private static final Logger logger = LoggerFactory.getLogger(BaseController.class);

    @ExceptionHandler(RuntimeException.class)
    public String HandleModuleException(RuntimeException exception, Model model) {
        int errorCode = 0;
        String errorMsg = "ok";
        if (exception instanceof BusException) {
            errorCode = ((BusException) exception).getCode();
            errorMsg = getResultMessage(errorCode);
        } else {
            errorCode = 9999;
            errorMsg = "系统错误！";
            logger.error("BaseController catch module error: ", exception);
        }
        model.addAttribute("errorCode", errorCode);
        model.addAttribute("errorMsg", errorMsg);
        return "/message";
    }

    private String getResultMessage(int code) {
        return ExceptionMessage.getExceptionMessage(code);
    }

}
