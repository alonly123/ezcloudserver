package com.ezsmart.umcs.wapi.view;

/**
 * Created by lixiangyang on 16/4/9.
 */
public class SelectView {
    private int id;
    private String code;
    private String name;

    public SelectView() {
    }

    public SelectView(int id, String name) {
        this.id = id;
        this.name = name;
    }


    public SelectView(String code, String name) {
        this.code = code;
        this.name = name;
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
