package com.ezsmart.umcs.constant;

/**
 * @author luochunteng
 */
public enum ExceptionMessage {
    //==========================Common code begin================
    COMMON_ERROR_ACCOUNT_IS_NOT_EXIST(100001, "账号不存在！"),
    COMMON_ERROR_ACCOUNT_IS_EXIST(100002, "账号已存在"),
    COMMON_ERROR_NO_RIGHT(100003, "无权作此操作!"),
    //==========================Common code end==================

    //==========================ServiceException code begin================
    SERVICE_ERROR_CUSTOMER_HAS_BEEN_DELETE(500001, "客户已被删除!"),

    //==========================ServiceException code end==================

    //==========================ArgException code begin================

    PARAM_ERROR(300001, "参数错误"),
    PARAM_ERROR_UCODE_NOT_EXIST(300002, "账号为空!"),
    PARAM_ERROR_PASSWORD_NOT_EXIST(300003, "密码为空！"),
    PARAM_ERROR_NAME_NOT_EXIST(300004, "名称为空！"),
    PARAM_ERROR_USER_IS_EXIST(300005, "user_is_exist"),
    PARAM_ERROR_PASSWORD_ILLEGAL(300006, "密码格式不对！"),
    //==========================ArgException code end==================

    //==========================BusException code begin================
    RESULT_ERROR(200001, "result_error"),
    RESULT_ERROR_SESSION_TIMEOUT(200002, "session_timeout"),
    RESULT_ERROR_LOGIN(200003, "login_error"),
    RESULT_ERROR_REGISTE(200004, "regist_error"),
    RESULT_ERROR_USERE_NOT_EXIST(200005, "user_not_exist"),

    BUSSINESS_ERROR(400001, "business_error"),
    BUS_ERROR_PASSWORD_MD5_FAIL(400002, "密码加密失败!"),
    BUS_ERROR_EDIT_ACCOUNT_FAIL(400003, "保存账号失败!"),
    BUS_ERROR_PASSWORD_ERROR(400004, "密码错误!"),;
    //==========================BusException code end==================
    private int code;
    private String message;

    private ExceptionMessage(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

    public static String getExceptionMessage(int code) {
        String message = "";
        for (ExceptionMessage exception : ExceptionMessage.values()) {
            if (code == exception.getCode()) {
                message = exception.getMessage();
            }
        }
        return message;
    }
}
