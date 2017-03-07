package com.ezsmart.umcs.wapi.web.tag;

import javax.servlet.http.HttpServletRequest;
import java.util.*;


public class Page {
    private int pageNo;  //*
    private int pageSize;  //*
    private int total;  //*
    private int cellNum = 6; //一个值，决定分页显示多少
    private int pageCount;
    private HttpServletRequest request;
    private Map<String, Object> params;
    private String uri;

    public Page(int pageNo, int pageSize, int total, String uri, HttpServletRequest request) {

        init(pageNo, pageSize, total, uri, request);
    }

    private void init(int pageNo, int pageSize, int total, String uri, HttpServletRequest request) {
        this.pageNo = pageNo < 1 ? 1 : pageNo;
        this.pageSize = pageSize < 1 ? 20 : pageSize;
        this.total = total;
        this.uri = uri;
        this.pageCount = (int) (Math.ceil(total / (double) pageSize));
        this.params = new HashMap<String, Object>();
        this.request = request;
        buildParamsByRequest();
    }

    /**
     * 构造分页html代码
     *
     * @return
     */
    public String buildPageHtml() {
        StringBuffer pageHtml = new StringBuffer();
        if (total > 0) {
            params.put("pageNum", 1);
            pageHtml.append("<ul class=\"pagination pagination-sm no-margin pull-right\">");
            pageHtml.append("<li ").append("class='paginate_button ").append(pageNo == 1 ? " disabled'" : "'").append("><a href='").append(this.buildUrlWithParam(params)).append("'>首页</a></li>");

            if (pageNo > cellNum + 1) {
                pageHtml.append("<li class='paginate_button'><a href='javascript:;'>...</a></li>");
            }
            if (pageNo <= cellNum) {
                if (pageCount - pageNo > cellNum) {
                    for (int i = 1; i <= pageNo + cellNum; i++) {
                        params.put("pageNum", i);
                        pageHtml.append("<li ").append("class='paginate_button ").append(pageNo == i ? "active'" : "'").append("><a href='").append(this.buildUrlWithParam(params)).append("'>").append(i).append("</a></li>");
                    }
                } else {
                    for (int i = 1; i <= pageCount; i++) {
                        params.put("pageNum", i);
                        pageHtml.append("<li ").append("class='paginate_button ").append(pageNo == i ? "active'" : "'").append("><a href='").append(this.buildUrlWithParam(params)).append("'>").append(i).append("</a></li>");
                    }
                }
            } else {
                if (pageCount - pageNo > cellNum) {
                    for (int i = pageNo - cellNum; i <= pageNo + cellNum; i++) {
                        params.put("pageNum", i);
                        pageHtml.append("<li ").append("class='paginate_button ").append(pageNo == i ? "active'" : "'").append("><a href='").append(this.buildUrlWithParam(params)).append("'>").append(i).append("</a></li>");
                    }
                } else {
                    for (int i = pageNo - cellNum; i <= pageCount; i++) {
                        params.put("pageNum", i);
                        pageHtml.append("<li ").append("class='paginate_button ").append(pageNo == i ? "active'" : "'").append("><a href='").append(this.buildUrlWithParam(params)).append("'>").append(i).append("</a></li>");
                    }
                }
            }

            if (pageCount - pageNo > cellNum) {
                pageHtml.append("<li class='paginate_button'><a href='javascript:;'>...</a></li>");
            }

            params.put("pageNum", pageCount);
            pageHtml.append("<li ").append("class='paginate_button ").append(pageNo == pageCount ? "disabled'" : "'").append("><a href='").append(this.buildUrlWithParam(params)).append("'>尾页</a></li>&nbsp;&nbsp;&nbsp;");

            pageHtml.append("</ul>");

            pageHtml.append("<span style='display: inline-block; line-height: 28px;'>共").append(total).append("条</span>");
        }


        return pageHtml.toString();
    }


    public void buildParamsByRequest() {
        Map properties = this.request.getParameterMap();
        Iterator entries = properties.entrySet().iterator();
        Map.Entry entry;
        String name = "";
        String value = "";
        while (entries.hasNext()) {
            entry = (Map.Entry) entries.next();
            name = (String) entry.getKey();
            Object valueObj = entry.getValue();
            if (null == valueObj) {
                value = "";
            } else if (valueObj instanceof String[]) {
                String[] values = (String[]) valueObj;
                for (int i = 0; i < values.length; i++) {
                    value = values[i] + ",";
                }
                value = value.substring(0, value.length() - 1);
            } else {
                value = valueObj.toString();
            }
            params.put(name, value);
        }
    }


    public String buildUrl() {
        StringBuffer paramBuffer = new StringBuffer();
        if (this.params != null && this.params.size() > 0) {
            int i = 0;
            for (String key : this.params.keySet()) {
                paramBuffer.append(i == 0 ? "?" : "&").append(key).append("=").append(this.params.get(key));
                i++;
            }
        }

        return uri + paramBuffer.toString();
    }

    public String buildUrlWithParam(Map<String, Object> params) {

        StringBuffer paramBuffer = new StringBuffer();
        if (params != null && params.size() > 0) {
            int i = 0;
            for (String key : params.keySet()) {
                paramBuffer.append(i == 0 ? "?" : "&").append(key).append("=").append(params.get(key));
                i++;
            }
        }

        return uri + paramBuffer.toString();
    }

    /**
     * 构造url，过滤掉参数所对应的参数
     *
     * @param keys
     * @return
     */
    public String buildUrlExcludeKeys(String... keys) {
        Set<String> excludeKeySet = new HashSet<String>();
        for (String key : keys) {
            excludeKeySet.add(key);
        }

        StringBuffer paramBuffer = new StringBuffer();
        if (params != null && params.size() > 0) {
            int i = 0;
            for (String key : params.keySet()) {
                if (excludeKeySet.contains(key)) {
                    continue;
                }
                paramBuffer.append(i == 0 ? "?" : "&").append(key).append("=").append(params.get(key));
                i++;
            }
        }

        return uri + paramBuffer.toString();
    }


    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public Map<String, Object> getParams() {
        return params;
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }
}
