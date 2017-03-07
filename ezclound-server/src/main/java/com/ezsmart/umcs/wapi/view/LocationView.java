package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.GeoLocation;
import com.ezsmart.umcs.wapi.util.Util;

import java.util.Date;

public class LocationView {

    private int id;
    private String name;
    private String postcode;
    private double lon;
    private double lat;
    private String address;
    private String areacode;
    private String areaname;
    private String createtime;
    private String updatetime;

    public LocationView() {
    }

    public LocationView(GeoLocation geoLocation) {
        this.id = geoLocation.getId();
        this.name = geoLocation.getName();
        this.postcode = geoLocation.getPostcode();
        this.lon = geoLocation.getLon();
        this.lat = geoLocation.getLat();
        this.address = geoLocation.getAddress();
        this.areacode = geoLocation.getAreacode();
        this.createtime = Util.formatDate(geoLocation.getCreatetime());
        this.updatetime = Util.formatDate(geoLocation.getUpdatetime());
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

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public double getLon() {
        return lon;
    }

    public void setLon(double lon) {
        this.lon = lon;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public String getAreacode() {
        return areacode;
    }

    public void setAreacode(String areacode) {
        this.areacode = areacode;
    }

    public String getAreaName() {
        return areaname;
    }

    public void setAreaName(String areaName) {
        this.areaname = areaName;
    }
}
