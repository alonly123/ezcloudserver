package com.ezsmart.umcs.wapi.Response;

import com.ezsmart.umcs.wapi.view.AccountView;

import java.io.Serializable;
import java.util.List;

/**
 * Created by luochunteng on 2016/4/13.
 */
public class AccountListlResponse implements Serializable {
    private List<AccountView> accountViewList;

    public List<AccountView> getAccountViewList() {
        return accountViewList;
    }

    public void setAccountViewList(List<AccountView> accountViewList) {
        this.accountViewList = accountViewList;
    }
}
