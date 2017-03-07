<%--
  Created by IntelliJ IDEA.
  User: luochunteng
  Date: 2016/4/2
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>客户列表</title>
    <link rel="stylesheet" href="/static/js/lib/datatables/dataTables.bootstrap.css?ver=${staticVersion}">
</head>
<body>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">客户管理</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form id="searchCustomer" action="/customer/list" method="post">
                        <c:if test="${isAdmin == true}">
                            <div class="input-group col-sm-3 col-md-3" style="float:left;">
                                <select id="js_channel_select" class="col-md-11 control-label" placeholder="请选择中间商"
                                        name="cid">
                                    <option value="${channelCompany.id}">${channelCompany.name}</option>
                                </select>
                            </div>
                        </c:if>
                        <div class="input-group col-sm-3 " style=" float:left;">
                            <input type="text" name="key" placeholder="客户名称/联系人/设备联系人"
                                   class="col-sm-10 col-md-10 form-control"
                                   value="${keyword}" value="${param.key}"/>
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-primary btn-flat" onclick="searchCustomer()">搜索
                            </button>
                        </span>
                        </div>
                        <c:if test="${isAdmin == true}">
                            <div class="col-sm-3">
                                <a href="/customer/add" class="btn btn-success ">添加客户</a>
                            </div>
                        </c:if>
                    </form>

                    <table id="js_table" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>客户名称</th>
                            <th>联系人</th>
                            <th>设备维护人</th>
                            <th>移动电话</th>
                            <th>固定电话</th>
                            <%--<th>告警通知电话</th>--%>
                            <%--<th>告警通知邮箱</th>--%>
                            <%--<th>邮编</th>--%>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="customer" items="${customerPage.data}" varStatus="item">
                            <tr>
                                <td width="6%">${item.index +1}</td>
                                <td width="10%"><a href="/customer/detail?id=${customer.id}">${customer.name}</a></td>
                                <td width="10%">${customer.contacts}</td>
                                <td width="10%">${customer.maintianer}</td>
                                <td width="10%">${customer.mphone}</td>
                                <td width="12%">${customer.phone}</td>
                                    <%--<td width="8%">${customer.notifyPhone}</td>--%>
                                    <%--<td width="10%">${customer.notifyEmail}</td>--%>
                                    <%--<td width="10%">${customer.postcode}</td>--%>
                                <td width="10%">
                                    <c:if test="${customer.showEditBtn == true}">
                                        <a href="/customer/add?id=${customer.id}">
                                            <i class="fa fa-pencil-square-o"></i>编辑
                                        </a>
                                    </c:if>
                                    <c:if test="${customer.showDeleteBtn == true}">
                                        <a href="javascript:deleteCustomer('${customer.id}');"
                                           data-customerId="${customer.id}">
                                            <i class="fa fa-pencil-square-o"></i>删除
                                        </a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
                <div class="box-footer clearfix">
                    <ez:page pageSize="${customerPage.pageSize}" pageNum="${customerPage.pageNum}"
                             total="${customerPage.total}"
                             uri="/customer/list">111</ez:page>
                </div>
                <!-- /.box-footer -->
            </div>
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>
<!-- /.content -->


<script src="/static/js/lib/datatables/jquery.dataTables.min.js?ver=${staticVersion}"></script>
<script src="/static/js/lib/datatables/dataTables.bootstrap.min.js?ver=${staticVersion}"></script>
<script src="/static/js/lib/select2/select2.full.min.js?ver=${staticVersion}"></script>
<script>
    $(function () {
        var ownerIdSelectTag = $("#js_channel_select");
        var searchUrl = "/channelCompany/searchChannelSelect";
        var select2Options;
        $('#js_table').DataTable({
            "language": {
                "emptyTable": "没有数据"
            },
            "paging": false,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": false,
            "autoWidth": false
        });

        select2Options = {
            placeholder: "选择中间商,不选默认全部",
            minimumInputLength: 1,
            allowClear: true,
            ajax: {
                url: searchUrl,
                dataType: 'json',
                delay: 200,
                data: function (params) {
                    return {
                        key: params.term, // search term
                        page: params.page
                    };
                },
                processResults: function (data, params) {
                    params.page = params.page || 1;

                    var totalCount = 0;
                    var pageSize = 1;
                    var result = new Array();

                    if (data) {
                        if (data.code == 0) {
                            var datas = data.data ? data.data.data : null;
                            pageSize = data.data.pageSize;
                            totalCount = data.data.total;
                            if (datas) {
                                for (var d in datas) {
                                    item = {};
                                    item["id"] = datas[d]['id'];
                                    item["text"] = datas[d]['name'];
                                    result.push(item);
                                }
                            }

                            var more = (params.page * pageSize) < totalCount;
                            return {
                                results: result,
                                pagination: {
                                    more: more
                                }
                            };
                        } else {
                            _showPop({
                                type: "error",
                                title: "错误",
                                content: data.msg
                            });
                        }

                    } else {
                        _showPop({
                            type: "error",
                            title: "错误",
                            content: "获取数据失败"
                        });
                    }

                },
                cache: true
            }
        }
        if (ownerIdSelectTag) {
            ownerIdSelectTag.select2(select2Options);
        }
    });
    function searchCustomer() {
        var form = document.forms[0];
        form.submit();
    }
    function deleteCustomer(customerId) {
        var param = {
            "id": customerId
        }
        _showPop({
            type: "success",
            title: "系统提示",
            content: "确认删除吗？",
            ok: {
                name: '确定',
                callback: function () {
                    $.get("/customer/delete", $.param(param), function (r) {
                        if (r) {
                            if (r.code == 0) {
                                _showPop({
                                    type: "success",
                                    title: "删除成功",
                                    content: "删除成功!",
                                    ok: {
                                        name: '确定',
                                        callback: function () {
                                            window.location.href = "/customer/list";
                                        }
                                    }
                                });
                            } else {
                                _showPop({
                                    type: "error",
                                    title: "错误",
                                    content: r.msg
                                });
                            }
                        }
                    });
                }
            }
        });
    }
</script>

</body>
</html>