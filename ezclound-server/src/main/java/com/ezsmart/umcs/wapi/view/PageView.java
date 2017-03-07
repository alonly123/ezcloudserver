package com.ezsmart.umcs.wapi.view;

import java.util.List;

/**
 * Created by lixiangyang on 16/4/2.
 */
public class PageView<T> {
    private int pageSize;
    private int pageNum;
    private int total;
    private List<T> data;

    public PageView() {
    }

    public PageView(int pageSize, int pageNum, int total, List<T> data) {
        this.pageSize = pageSize;
        this.pageNum = pageNum;
        this.total = total;
        this.data = data;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
