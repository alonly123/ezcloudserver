package com.ezsmart.umcs.wapi.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

/**
 * Created by lixiangyang on 16/4/9.
 */
public class Menu implements Serializable {
    /**
     * 菜单名
     */
    private String title;

    /**
     * url
     */
    private String url;

    /**
     * 顺序
     */
    private int sort;
    /**
     * 打开方式 1为本页面  2为新页面
     */
    private int openType;

    /**
     * 类型 1为文件夹  2为菜单
     */
    private int type;

    /**
     * 是否激活
     */
    private boolean active;

    private Set<String> roles;

    private List<Menu> menus;

    /**
     * 样式
     */
    private String style;

    public Menu() {
    }

    public Menu(String title, String url, int sort, int openType, int type, boolean active, String style, Set<String> roles) {
        this.title = title;
        this.url = url;
        this.sort = sort;
        this.openType = openType;
        this.type = type;
        this.active = active;
        this.style = style;
        this.roles = roles;
    }

    public Menu(String title, String url, int sort, int openType, int type, boolean active, String style, List<Menu> menus) {
        this.title = title;
        this.url = url;
        this.sort = sort;
        this.openType = openType;
        this.type = type;
        this.active = active;
        this.style = style;
        this.menus = menus;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public int getOpenType() {
        return openType;
    }

    public void setOpenType(int openType) {
        this.openType = openType;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public List<Menu> getMenus() {
        return menus;
    }

    public void setMenus(List<Menu> menus) {
        this.menus = menus;
    }

    public Set<String> getRoles() {
        return roles;
    }

    public void setRoles(Set<String> roles) {
        this.roles = roles;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }
}
