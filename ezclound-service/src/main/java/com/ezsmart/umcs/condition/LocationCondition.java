package com.ezsmart.umcs.condition;

/**
 * Created by luochunteng on 2016/4/24.
 */
public class LocationCondition extends Condition {
    private String key;
    private String province;
    private String city;
    private String county;
    private int startIndex;
    private int endIndex;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }


    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public int getEndIndex() {
        return endIndex;
    }

    public void setEndIndex(int endIndex) {
        this.endIndex = endIndex;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }
}
