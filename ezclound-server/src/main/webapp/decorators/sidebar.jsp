<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<aside class="main-sidebar">
    <section class="sidebar" style="height: auto;">
        <ul class="sidebar-menu">
            <c:forEach var="m1" items="${_menu_list}">
                <c:if test="${m1.type == 1}">
                    <li class="treeview <c:if test="${m1.active}"> active </c:if>">
                        <a href="javascript:;"><i class='${m1.style}'></i><span>${m1.title}</span><i
                                class="fa fa-angle-left pull-right"></i></a>
                        <ul class="treeview-menu">
                            <c:forEach var="m11" items="${m1.menus}">
                                <li class="<c:if test="${m11.active}"> active </c:if>">
                                    <a href="${m11.url}" <c:if test="${m11.openType == 2}"> target="_blank" </c:if>><i
                                            class='${m11.style}'></i><span>${m11.title}</span></a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                </c:if>
                <c:if test="${m1.type == 2}">
                    <li class="<c:if test="${m1.active}"> active </c:if>">
                        <a href="${m1.url}" <c:if test="${m1.openType == 2}"> target="_blank" </c:if>><i
                                class='${m1.style}'></i><span>${m1.title}</span></a>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </section>

    <%--<!-- sidebar: style can be found in sidebar.less -->--%>
    <%--<section class="sidebar">--%>
    <%--<ul class="sidebar-menu">--%>
    <%--<sec:authorize ifAnyGranted="ROLE_ADMIN">--%>
    <%--<li class="treeview">--%>
    <%--<a href="javascript:;">--%>
    <%--<i class='fa fa-user'></i>--%>
    <%--<span>账号管理</span>--%>
    <%--<i class="fa fa-angle-left pull-right"></i>--%>
    <%--</a>--%>
    <%--<ul class="treeview-menu">--%>
    <%--<li><a href="/account/manager/list"><i class='fa fa-user'></i>管理员账号管理</a></li>--%>
    <%--<li><a href="/account/simple/list"><i class='fa fa-user'></i>普通账号管理</a></li>--%>
    <%--<li><a href="/channelCompany/list"><i class='fa fa-user'></i>中间商管理</a></li>--%>
    <%--<li><a href="/customer/list"><i class='fa fa-user'></i>客户管理</a></li>--%>
    <%--</ul>--%>
    <%--</li>--%>
    <%--<li><a href="/account/detail"><i class='fa fa-link'></i> <span>账号详情</span></a></li>--%>
    <%--<li><a href="/account/change_password"><i class='fa fa-link'></i> <span>修改密码</span></a></li>--%>
    <%--</sec:authorize>--%>


    <%--<sec:authorize ifAnyGranted="ROLE_ROOT">--%>
    <%--<li class="treeview">--%>
    <%--<a href="javascript:;">--%>
    <%--<i class='fa fa-user'></i>--%>
    <%--<span>账号管理</span>--%>
    <%--<i class="fa fa-angle-left pull-right"></i>--%>
    <%--</a>--%>
    <%--<ul class="treeview-menu">--%>
    <%--<li><a href="/account/simple/list"><i class='fa fa-user'></i>普通账号管理</a></li>--%>
    <%--<li><a href="/channelCompany/list"><i class='fa fa-user'></i>中间商管理</a></li>--%>
    <%--<li><a href="/customer/list"><i class='fa fa-user'></i>客户管理</a></li>--%>
    <%--</ul>--%>
    <%--</li>--%>
    <%--<li><a href="/account/detail"><i class='fa fa-link'></i> <span>账号详情</span></a></li>--%>
    <%--<li><a href="/account/change_password"><i class='fa fa-link'></i> <span>修改密码</span></a></li>--%>
    <%--</sec:authorize>--%>

    <%--<sec:authorize ifAnyGranted="ROLE_CHANNEL">--%>
    <%--<li class="treeview">--%>
    <%--<a href="javascript:;">--%>
    <%--<i class='fa fa-user'></i>--%>
    <%--<span>账号管理</span>--%>
    <%--<i class="fa fa-angle-left pull-right"></i>--%>
    <%--</a>--%>
    <%--<ul class="treeview-menu">--%>
    <%--<li><a href="/account/simple/list"><i class='fa fa-user'></i>普通账号管理</a></li>--%>
    <%--<li><a href="/customer/list"><i class='fa fa-user'></i>客户管理</a></li>--%>
    <%--</ul>--%>
    <%--</li>--%>
    <%--<li><a href="/account/detail"><i class='fa fa-link'></i> <span>账号详情</span></a></li>--%>
    <%--<li><a href="/channelCompany/detail"><i class='fa fa-link'></i> <span>中间商详情</span></a></li>--%>
    <%--<li><a href="/account/change_password"><i class='fa fa-link'></i> <span>修改密码</span></a></li>--%>
    <%--</sec:authorize>--%>

    <%--<sec:authorize ifAnyGranted="ROLE_CUSTOMER">--%>
    <%--<li class="treeview">--%>
    <%--<a href="javascript:;">--%>
    <%--<i class='fa fa-user'></i>--%>
    <%--<span>账号管理</span>--%>
    <%--<i class="fa fa-angle-left pull-right"></i>--%>
    <%--</a>--%>
    <%--<ul class="treeview-menu">--%>
    <%--&lt;%&ndash;<li><a href="/account/simple/list"><i class='fa fa-user'></i>普通账号管理</a></li>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<li><a href="/customer/list"><i class='fa fa-user'></i>客户管理</a></li>&ndash;%&gt;--%>
    <%--</ul>--%>
    <%--</li>--%>
    <%--<li><a href="/account/detail"><i class='fa fa-link'></i> <span>账号详情</span></a></li>--%>
    <%--<li><a href="/customer/detail"><i class='fa fa-link'></i> <span>客户详情</span></a></li>--%>
    <%--<li><a href="/account/change_password"><i class='fa fa-link'></i> <span>修改密码</span></a></li>--%>
    <%--</sec:authorize>--%>
    <%--</ul>--%>
    <%--</section>--%>
    <!-- /.sidebar -->
</aside>