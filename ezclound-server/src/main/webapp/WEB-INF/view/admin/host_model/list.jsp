W<%--
  Created by IntelliJ IDEA.
  User: chunteng
  Date: 2016/3/28
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>设备型号管理</title>
    <link rel="stylesheet"
          href="/static/js/lib/datatables/dataTables.bootstrap.css?ver=${staticVersion}">
</head>
<body>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">设备型号管理</h3>
                </div>
                <div class="">

                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form id="search" action="/admin/HostModel/list" method="post">
                        <div class="input-group " style="width:300px; float:left;">
                            <input type="text" name="keyword" placeholder="设备型号名称" class="form-control"
                                   value="${param.keyword}"/>
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-primary btn-flat" onclick="searchAccounts()">搜索
                                </button>
                            </span>
                        </div>
                        <%--<div class="col-xs-2">--%>
                        <%--<a href="/account/manager/add?fromView=list" class="btn btn-success ">添加管理员账号</a>--%>
                        <%--</div>--%>
                    </form>

                    <table id="js_table" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>型号编码</th>
                            <th>名称</th>
                            <th>描述</th>
                            <th>修改时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="hostModel" varStatus="item" items="${page.data}">
                            <tr>
                                <td width="10%">${item.index + 1}</td>
                                <td width="10%">${hostModel.model}</td>
                                <td width="25%"><a href="/admin/HostModel/detail?id=${hostModel.id}">${hostModel.name}</a></td>
                                <td width="25%">${hostModel.descr}</td>
                                <td width="10%">${hostModel.updateTime}</td>
                                <td width="20%">
                                    <a href="/admin/HostModel/detail?id=${hostModel.id}">
                                        <i class="fa fa-info-circle"></i>查看
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
                <div class="box-footer clearfix">
                    <ez:page pageSize="${page.pageSize}" pageNum="${page.pageNum}"
                             total="${page.total}" uri="/admin/HostModel/list"></ez:page>
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
<script>
    $(function () {
        $(function () {
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
        });
    });

    function searchAccounts() {
        var form = document.forms[0];
        form.submit();
    }
    function deleteAccount(ucode) {
        var param = {
            "ucode": ucode
        };
        _showPop({
            type: "success",
            title: "系统提示",
            content: "确认删除吗？",
            ok: {
                name: '确定',
                callback: function () {
                    $.get("/account/delete_account", $.param(param), function (r) {
                        if (r) {
                            if (r.code == 0) {
                                _showPop({
                                    type: "success",
                                    title: "删除成功",
                                    content: "删除成功!",
                                    ok: {
                                        name: '确定',
                                        callback: function () {
                                            window.location.href = "/account/manager/list";
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
