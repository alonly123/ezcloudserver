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
    <title>发现设备列表</title>
    <link rel="stylesheet" href="/static/js/lib/datatables/dataTables.bootstrap.css?ver=${staticVersion}">
</head>
<body>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">发现设备列表</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">

                    <table id="js_table" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>设备编号</th>
                            <th>设备型号</th>
                            <th>物理状态</th>
                            <th>连接状态</th>
                            <th>发现时间</th>
                            <th>最近上报时间</th>
                            <th>更新时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="discoveredHost" items="${discoveredHostList.data}" varStatus="item">
                            <tr>
                                <td width="10%">${item.index +1}</td>
                                <td width="10%">${discoveredHost.ucode}</td>
                                <td width="10%">${discoveredHost.model}</td>
                                <td width="10%">${discoveredHost.pyhState}</td>
                                <td width="10%">${discoveredHost.connstate}</td>
                                <td width="10%">${discoveredHost.discoveryTime}</td>
                                <td width="10%">${discoveredHost.lastCheck}</td>
                                <td width="10%">${discoveredHost.updatetime}</td>
                                <td width="20%">
                                    <a href="/discoveredhost/add?id=${discoveredHost.id}">
                                        <i class="fa fa-pencil-square-o"></i>同步
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
                <div class="box-footer clearfix">
                    <ez:page pageSize="${discoveredHostList.pageSize}" pageNum="${discoveredHostList.pageNum}"
                             total="${discoveredHostList.total}"
                             uri="/discoveredhost/list">111</ez:page>
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

</script>

</body>
</html>