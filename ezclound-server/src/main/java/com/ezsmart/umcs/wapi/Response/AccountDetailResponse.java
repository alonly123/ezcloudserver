package com.ezsmart.umcs.wapi.Response;

import com.ezsmart.umcs.wapi.view.AccountView;

import java.io.Serializable;

/**
 * Created by luochunteng on 2016/4/13.
 */
public class AccountDetailResponse implements Serializable {
    private AccountView accountView;
    // 标识页面跳转
    private String fromView;
    private boolean isAdd;

    public AccountView getAccountView() {
        return accountView;
    }

    public void setAccountView(AccountView accountView) {
        this.accountView = accountView;
    }

    public String getFromView() {
        return fromView;
    }

    public void setFromView(String fromView) {
        this.fromView = fromView;
    }

    public boolean isAdd() {
        return isAdd;
    }

    public void setAdd(boolean isAdd) {
        this.isAdd = isAdd;
    }
}
