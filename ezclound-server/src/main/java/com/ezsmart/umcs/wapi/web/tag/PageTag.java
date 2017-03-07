package com.ezsmart.umcs.wapi.web.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * Created by lixiangyang on 16/4/2.
 */
public class PageTag extends BodyTagSupport {
    private int pageSize;
    private int pageNum;
    private int total;
    private String uri;

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

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    @Override
    public int doStartTag() throws JspException {
        Page page = new Page(pageNum, pageSize, total, uri, (HttpServletRequest) pageContext.getRequest());
        try {
            pageContext.getOut().println(page.buildPageHtml());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return TagSupport.SKIP_BODY;
    }
}
