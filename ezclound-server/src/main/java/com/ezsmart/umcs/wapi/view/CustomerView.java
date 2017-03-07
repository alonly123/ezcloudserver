package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.Customer;
import com.ezsmart.umcs.util.ServiceUtil;

public class CustomerView {

    private int id;
    private String name;
    private String contacts;
    private String maintianer;
    private String mphone;
    private String phone;
    private String notifyPhone;
    private String notifyEmail;
    private String postcode;
    private int pid;
    private String pname;
    private int areaCode;
    private String address;
    private String createTime;
    private String updateTime;
    private boolean showDeleteBtn;
    private boolean showEditBtn;

    public CustomerView(Customer customer) {
        this.id = customer.getId();
        this.name = customer.getName();
        this.contacts = customer.getContacts();
        this.maintianer = customer.getMaintianer();
        this.mphone = customer.getMphone();
        this.phone = customer.getPhone();
        this.notifyEmail = customer.getNotifyEmail();
        this.notifyPhone = customer.getNotifyPhone();
        this.postcode = customer.getPostcode();
        this.pid = customer.getPid();
        this.areaCode = customer.getAreaCode();
        this.createTime = ServiceUtil.formatDate(customer.getCreatetime());
        this.updateTime = ServiceUtil.formatDate(customer.getUpdatetime());
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public String getMaintianer() {
        return maintianer;
    }

    public void setMaintianer(String maintianer) {
        this.maintianer = maintianer;
    }

    public String getMphone() {
        return mphone;
    }

    public void setMphone(String mphone) {
        this.mphone = mphone;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNotifyPhone() {
        return notifyPhone;
    }

    public void setNotifyPhone(String notifyPhone) {
        this.notifyPhone = notifyPhone;
    }

    public String getNotifyEmail() {
        return notifyEmail;
    }

    public void setNotifyEmail(String notifyEmail) {
        this.notifyEmail = notifyEmail;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public boolean isShowDeleteBtn() {
        return showDeleteBtn;
    }

    public void setShowDeleteBtn(boolean showDeleteBtn) {
        this.showDeleteBtn = showDeleteBtn;
    }

    public boolean isShowEditBtn() {
        return showEditBtn;
    }

    public void setShowEditBtn(boolean showEditBtn) {
        this.showEditBtn = showEditBtn;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public int getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(int areaCode) {
        this.areaCode = areaCode;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
