package com.ezsmart.umcs.wapi.request;

import java.io.Serializable;

public class ChannelCompanyRequest implements Serializable {
    private static final long serialVersionUID = 8688586292354984922L;
    private int id = 0;
    private String name = "";
    private String contacts = "";
    private String mphone = "";
    private String phone = "";
    private String saleVolume = "";
    private int address = 0;

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

    public int getAddress() {
        return address;
    }

    public void setAddress(int address) {
        this.address = address;
    }
}
