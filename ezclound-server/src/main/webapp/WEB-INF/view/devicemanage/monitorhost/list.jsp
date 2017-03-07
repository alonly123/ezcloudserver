<%--
  Created by IntelliJ IDEA.
  User: luochunteng
  Date: 2016/4/23
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>监控设备列表</title>
    <link rel="stylesheet" href="/static/js/lib/datatables/dataTables.bootstrap.css?ver=${staticVersion}">
</head>
<body>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">监控设备管理</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form id="searchMonitorHost" action="/monitorhost/list" method="post">
                        <div class="input-group col-sm-3 " style=" float:left;">
                            <input type="text" name="key" placeholder="设备名称"
                                   class="col-sm-10 col-md-10 form-control" value="${key}"/>
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-primary btn-flat" onclick="searchMonitorHost()">搜索
                            </button>
                        </span>
                        </div>
                        <c:if test="${isAdmin}">
                            <div class="col-sm-3">
                                <a href="/monitorhost/add" class="btn btn-success ">添加设备</a>
                            </div>
                        </c:if>
                    </form>

                    <table id="js_table" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>设备名称</th>
                            <th>设备编号</th>
                            <th>状态</th>
                            <th>更新时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="monitorHost" items="${monitorHostList.data}" varStatus="item">
                            <tr>
                                <td width="10%">${item.index +1}</td>
                                <td width="20%"><a
                                        href="/monitorhost/detail?id=${monitorHost.id}">${monitorHost.name}</a></td>
                                <td width="30%">${monitorHost.ucode}</td>
                                <td width="10%">正常</td>
                                    <%--${monitorHost.state}--%>
                                <td width="10%">${monitorHost.updatetime}</td>
                                <td width="20%">
                                    <c:if test="${isAdmin}">
                                        <a href="/monitorhost/add?id=${monitorHost.id}">
                                            <i class="fa fa-pencil-square-o"></i>编辑
                                        </a>
                                        <a href="javascript:deleteMonitorHost('${monitorHost.id}');">
                                            <i class="fa fa-pencil-square-o"></i>删除
                                        </a>
                                    </c:if>
                                    <c:if test="${!isAdmin}">
                                    <a href="/monitorhost/detail?id=${monitorHost.id}">
                                        <i class="fa fa-info-circle"></i>查看
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
                <div class="box-footer clearfix">
                    <ez:page pageSize="${monitorHostList.pageSize}" pageNum="${monitorHostList.pageNum}"
                             total="${monitorHostList.total}"
                             uri="/monitorhost/list">111</ez:page>
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
<script src="/static/js/common/common-util.js?ver=${staticVersion}"></script>
<script>
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


    function searchMonitorHost() {
        var form = document.forms[0];
        console.info(form)
        form.submit();
    }
    function deleteMonitorHost(monitorHostId) {
        var param = {
            "id": monitorHostId
        }
        _showPop({
            type: "success",
            title: "系统提示",
            content: "确认删除吗？",
            ok: {
                name: '确定',
                callback: function () {
                    $.get("/monitorhost/delete", $.param(param), function (r) {
                        if (r) {
                            if (r.code == 0) {
                                _showPop({
                                    type: "success",
                                    title: "删除成功",
                                    content: "删除成功!",
                                    ok: {
                                        name: '确定',
                                        callback: function () {
                                            window.location.href = "/monitorhost/list";
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