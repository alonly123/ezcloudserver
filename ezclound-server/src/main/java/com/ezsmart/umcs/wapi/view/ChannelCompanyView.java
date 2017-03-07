package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.ChannelCompany;
import com.ezsmart.umcs.util.ServiceUtil;

public class ChannelCompanyView {

    private int id;
    private String name;
    private String contacts;
    private String mphone;
    private String phone;
    private String saleVolume;
    private int areaCode;
    private String address;
    private String createTime;
    private String updateTime;
    private boolean showDeleteBtn;
    private boolean showEditBtn;

    public ChannelCompanyView(ChannelCompany channelCompany) {
        this.id = channelCompany.getId();
        this.name = channelCompany.getName();
        this.contacts = channelCompany.getContacts();
        this.mphone = channelCompany.getMphone();
        this.phone = channelCompany.getPhone();
        this.saleVolume = channelCompany.getSaleVolume();
        this.areaCode = channelCompany.getAreaCode();
        this.createTime = ServiceUtil.formatDate(channelCompany.getCreatetime());
        this.updateTime = ServiceUtil.formatDate(channelCompany.getUpdatetime());
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

    public String getSaleVolume() {
        return saleVolume;
    }

    public void setSaleVolume(String saleVolume) {
        this.saleVolume = saleVolume;
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
