package com.ezsmart.umcs.constant;

/**
 * Created by lixiangyang on 16/4/5.
 */
public enum ReturnConstants {

    SUCCESS_RESULT(0, "OK"),
    LOGIN_AUTHORIZATION_FAIL(401, "您未登录，请先登录"),
    ACCESS_DENIED(403, "没有操作权限"),
    PARAM_ERROR(1001, "参数错误"),
    UCODE_ERROR(2001, "登录账号不正确"),
    ACCOUNT_NOT_EXIST(2002, "账号不存在"),
    ACCOUNT_IS_EXIST(2003, "账号已存在"),
    PASSWORD_ERROR(2011, "密码错误"),
    PASSWORD_LENGTH_ERROR(2012, "密码长度不能少于6"),
    OLD_PASSWORD_ERROR(2013, "旧密码不正确"),
    PASSWORD_REPEAT_ERROR(2014, "新密码与旧密码不允许相同"),
    DEFAULT_ERROR(9999, "系统错误"),

    //==========================中间商 Begin=================================
    CHANNELCOMPANY_SAVE_FAIL(3001, "中间商保存失败"),
    CHANNELCOMPANY_DELETE_FAIL(3002, "中间商删除失败"),
    CHANNELCOMPANY_IS_DELETED(3003, "中间商已被删除"),
    CHANNELCOMPANY_IS_EXIST(3004, "中间商已存在"),
    CHANNELCOMPANY_HAS_CUSTOMER(3005, "该中间商存在关联客户，不允许删除！"),
    CHANNELCOMPANY_HAS_MONITORHOST(3006, "该中间商存在关联设备，请先清除设备！"),
    CHANNELCOMPANY_NAME_EXIST(3007, "中间商名称已经存在，请更换中间商名称！"),
    //==========================中间商 End===================================

    //==========================客户 Begin===================================
    CUSTOMER_SAVE_FAIL(4001, "客户保存失败"),
    CUSTOMER_IS_DELETE(4002, "客户已删除！"),
    CUSTOMER_IS_EXIST(4003, "客户已存在！"),
    CUSTOMER_NAME_EXIST(4004, "客户名称已经存在，请更换客户名称！"),
    CUSTOMER_HAS_MONITORHOST(6006, "该客户存在关联设备，请先清除设备！"),
    //==========================客户 End=====================================

    //==========================地区 Begin===================================
    ADMINREGION_NODE_NOT_EXIST(5001, "获取地区数据失败！"),
    LOCATION_ADD_FAIL(5002, "保存地址失败！"),
    LOCATION_NOT_EXIST(5003, "地址不存在！"),
    ROOM_ADD_FAIL(5004, "所填地址内容有误，请检查！"),
    ROOM_NOT_EXIST(5005, "房间不存在！"),
    ROOM_IS_NONE(5006, "该房间号不存在！"),
    //==========================地区 End=====================================
    //==========================设备 Begin===================================
    MONITOR_HOST_ADD_FAIL(6001, "新增设备失败！"),
    MONITOR_HOST_NOT_EXIST(6002, "设备不存在！"),
    MONITOR_HOST_UCODE_EXIST(6003, "设备编号重复！"),
    //==========================设备 End=====================================
    //==========================外设 Begin===================================
    TARGET_DEVICE_MODEL_ADD_FAIL(7001, "新增外设型号失败！"),
    TARGET_DEVICE_MODEL_UPDATE_FAIL(7002, "修改外设型号失败！"),
    TARGET_DEVICE_MODEL_DELETE_FAIL(7003, "删除外设型号失败！"),
    HOST_MODEL_PORT_NOT_EXIST(7004, "设备型号端口不存在！"),
    TARGET_DEVICE_MODEL_NOT_EXIST(7005, "外设型号不存在！"),
    TARGET_DEVICE_CHECKITEM_NOT_EXIST(7006, "外设检查项不存在！"),
    TARGET_DEVICE_NOT_EXIST(7007, "外设不存在！"),
    TARGET_DEVICE_CODE_EXIST(7008, "外设编号重复！"),
    DISCOVEREDHOST_NOT_EXIST(7009, "设备不存在！"),
    //==========================外设 End=====================================
    //==========================告警 Begin===================================
    ALARM_NOT_EXIST(8001, "告警不存在!"),
    ALARM_ACK_FAIL(8010, "告警确认失败!"),;
    //==========================告警 Begin===================================


    private int code;
    private String message;

    private ReturnConstants(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

    public static String getMsg(int code) {
        String message = "";
        for (ReturnConstants returnConstants : ReturnConstants.values()) {
            if (code == returnConstants.getCode()) {
                message = returnConstants.getMessage();
            }
        }
        return message;
    }
}
