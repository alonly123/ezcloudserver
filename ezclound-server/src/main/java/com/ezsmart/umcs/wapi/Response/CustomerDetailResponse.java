package com.ezsmart.umcs.wapi.Response;

import com.ezsmart.umcs.wapi.view.CustomerView;

import java.io.Serializable;

/**
 * Created by luochunteng on 2016/4/13.
 */
public class CustomerDetailResponse implements Serializable {

    private CustomerView customerView;
    private boolean isAdd;
    private String fromView;

    public CustomerView getCustomerView() {
        return customerView;
    }

    public void setCustomerView(CustomerView customerView) {
        this.customerView = customerView;
    }

    public boolean isAdd() {
        return isAdd;
    }

    public void setAdd(boolean isAdd) {
        this.isAdd = isAdd;
    }

    public String getFromView() {
        return fromView;
    }

    public void setFromView(String fromView) {
        this.fromView = fromView;
    }
}
