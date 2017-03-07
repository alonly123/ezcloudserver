package com.ezsmart.umcs.wapi.Response;

import com.ezsmart.umcs.wapi.view.CustomerView;

import java.io.Serializable;
import java.util.List;

/**
 * Created by luochunteng on 2016/4/13.
 */
public class CustomerListResponse implements Serializable {
    private static final long serialVersionUID = -1007323276047597924L;

    private List<CustomerView> customerViewList;

    private boolean showEditBtn;

    private boolean showDelBtn;

    private boolean showAddBtn;


    public boolean isShowAddBtn() {
        return showAddBtn;
    }

    public void setShowAddBtn(boolean showAddBtn) {
        this.showAddBtn = showAddBtn;
    }

    public boolean isShowDelBtn() {
        return showDelBtn;
    }

    public void setShowDelBtn(boolean showDelBtn) {
        this.showDelBtn = showDelBtn;
    }

    public boolean isShowEditBtn() {
        return showEditBtn;
    }

    public void setShowEditBtn(boolean showEditBtn) {
        this.showEditBtn = showEditBtn;
    }

    public List<CustomerView> getCustomerViewList() {
        return customerViewList;
    }

    public void setCustomerViewList(List<CustomerView> customerViewList) {
        this.customerViewList = customerViewList;
    }
}
