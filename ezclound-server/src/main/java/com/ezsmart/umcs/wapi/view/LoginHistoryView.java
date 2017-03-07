package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.LoginHistory;
import com.ezsmart.umcs.util.ServiceUtil;

/**
 * Created by lixiangyang on 16/4/20.
 */
public class LoginHistoryView {
    private int id;
    private String ucode;
    private String ip;
    private String loginTime;

    public LoginHistoryView() {
    }

    public LoginHistoryView(LoginHistory loginHistory) {
        if (null == loginHistory)
            throw new NullPointerException("loginHistory is null");

        this.id = loginHistory.getId();
        this.ucode = loginHistory.getUserCode();
        this.ip = loginHistory.getUserIpAddr();
        this.loginTime = ServiceUtil.formatDate(loginHistory.getLoginTime());
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUcode() {
        return ucode;
    }

    public void setUcode(String ucode) {
        this.ucode = ucode;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(String loginTime) {
        this.loginTime = loginTime;
    }
}
