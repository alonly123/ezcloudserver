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
    <title>监控设备外设管理</title>
    <link rel="stylesheet"
          href="/static/js/lib/datatables/dataTables.bootstrap.css?ver=${staticVersion}">
</head>
<body>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">监控设备外设管理</h3>
                </div>
                <div class="">

                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form id="search" action="/targetdevice/list" method="post">
                        <div class="input-group " style="width:300px; float:left;">
                            <input type="text" name="key" placeholder="监控设备外设名称" class="form-control"
                                   value="${param.key}"/>
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-primary btn-flat" onclick="searchTargetDevice()">搜索
                                </button>
                            </span>
                        </div>
                        <c:if test="${isAdmin}">
                            <div class="col-sm-3">
                                <a href="/targetdevice/add" class="btn btn-success ">添加外设</a>
                            </div>
                        </c:if>
                    </form>

                    <table id="js_table" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>名称</th>
                            <th>编号</th>
                            <th>端口编号</th>
                            <th>设备类型</th>
                            <th>物理状态</th>
                            <th>修改时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="targetDevice" varStatus="item" items="${targetDeviceList.data}">
                            <tr>
                                <td width="5%">${item.index + 1}</td>
                                <td width="15%"><a
                                        href="/targetdevice/detail?id=${targetDevice.id}">${targetDevice.name}</a>
                                </td>
                                <td width="10%">${targetDevice.code}</td>
                                <td width="10%">${targetDevice.portUCode}</td>
                                <td width="15%">${targetDevice.deviceType}</td>
                                <td width="10%">${targetDevice.phyState}</td>
                                <td width="15%">${targetDevice.updatetime}</td>
                                <td width="20%">
                                    <c:if test="${isAdmin}">
                                        <a href="/targetdevice/add?id=${targetDevice.id}">
                                            <i class="fa fa-pencil-square-o"></i>编辑
                                        </a>
                                        <a href="javascript:deleteTargetDevice('${targetDevice.id}');">
                                            <i class="fa fa-pencil-square-o"></i>删除
                                        </a>
                                    </c:if>
                                    <c:if test="${!isAdmin}">
                                        <a href="/targetdevice/detail?id=${targetDevice.id}">
                                            <i class="fa fa-info-circle"></i>查看
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
                    <ez:page pageSize="${page.pageSize}" pageNum="${page.pageNum}"
                             total="${page.total}" uri="/targetdevice/list"></ez:page>
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


    function searchTargetDevice() {
        var form = document.forms[0];
        form.submit();
    }
    function deleteTargetDevice(targetDeviceId) {
        var param = {
            "id": targetDeviceId
        }
        _showPop({
            type: "success",
            title: "系统提示",
            content: "确认删除吗？",
            ok: {
                name: '确定',
                callback: function () {
                    $.get("/targetdevice/delete", $.param(param), function (r) {
                        if (r) {
                            if (r.code == 0) {
                                _showPop({
                                    type: "success",
                                    title: "删除成功",
                                    content: "删除成功!",
                                    ok: {
                                        name: '确定',
                                        callback: function () {
                                            window.location.href = "/targetdevice/list";
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
