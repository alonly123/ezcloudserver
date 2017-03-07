package com.ezsmart.umcs.util;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.constant.ReturnConstants;
import org.springframework.util.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public abstract class ServiceUtil {

    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


    public static BasicResult checkPassword(String password) {
        if (StringUtils.isEmpty(password)) {
            return new BasicResult(false, ReturnConstants.PASSWORD_ERROR.getCode(), ReturnConstants.PASSWORD_ERROR.getMessage());
        }
        if (password.length() < CommonConstants.PASSWORD_MIN_LENGTH) {
            return new BasicResult(false, ReturnConstants.PASSWORD_LENGTH_ERROR.getCode(), ReturnConstants.PASSWORD_LENGTH_ERROR.getMessage());
        }

        return new BasicResult(true);
    }

    public static String formatDate(Date date) {
        if (date == null) {
            return "";
        }
        return sdf.format(date);
    }

    public static String formatDate(Date date, String format) {
        if (date == null) {
            return "";
        }

        if (null == format || "".equals(format)) {
            return formatDate(date);
        }

        SimpleDateFormat sdf1 = new SimpleDateFormat(format);
        return sdf1.format(date);
    }

    public static Date stringToDate(String source) throws ParseException {
        if (null == source || "".equals(source)) {
            return null;
        }

        return sdf.parse(source);
    }

    public static Date stringToDate(String source, String format) throws ParseException {
        if (null == source || "".equals(source)) {
            return null;
        }

        if (null == format || "".equals(format)) {
            return stringToDate(source);
        }

        SimpleDateFormat sdf1 = new SimpleDateFormat(format);

        return sdf1.parse(source);
    }

    public static Date getTodayStartTime() {
        Calendar todayStart = Calendar.getInstance();
        todayStart.set(Calendar.HOUR_OF_DAY, 0);
        todayStart.set(Calendar.MINUTE, 0);
        todayStart.set(Calendar.SECOND, 0);
        todayStart.set(Calendar.MILLISECOND, 0);
        return todayStart.getTime();
    }

    public static Date getTodayEndTime() {
        Calendar todayEnd = Calendar.getInstance();
        todayEnd.set(Calendar.HOUR_OF_DAY, 23);
        todayEnd.set(Calendar.MINUTE, 59);
        todayEnd.set(Calendar.SECOND, 59);
        todayEnd.set(Calendar.MILLISECOND, 999);
        return todayEnd.getTime();
    }

    public static void main(String[] args) throws ParseException {
        System.out.println(getTodayStartTime().toLocaleString());
    }
}
