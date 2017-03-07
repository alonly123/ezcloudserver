<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>设备型号端口详情</title>
    <link rel="stylesheet"
          href="/static/js/lib/datatables/dataTables.bootstrap.css?ver=${staticVersion}">
</head>
<body>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <!-- Horizontal Form -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">设备型号端口详情</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal">

                    <div class="box-body">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th width="20%">属性</th>
                                <th width="80%">内容</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>端口编码</td>
                                <td>${hostModelPort.ucode}</td>
                            </tr>
                            <tr>
                                <td>端口名称</td>
                                <td>${hostModelPort.name}</td>
                            </tr>
                            <tr>
                                <td>端口外设类型</td>
                                <td>${hostModelPort.hostModel}</td>
                            </tr>
                            <tr>
                                <td>描述</td>
                                <td>${hostModelPort.spec}</td>
                            </tr>
                            <tr>
                                <td>添加时间</td>
                                <td>${hostModelPort.createTime}</td>
                            </tr>
                            <tr>
                                <td>最近修改时间</td>
                                <td>${hostModelPort.updateTime}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <!-- /.box-footer -->
                    <div class="box-footer">
                    </div>
                </form>
            </div>
            <!-- /.box -->
            <!-- general form elements disabled -->

            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">设备型号端口所连外设表列表</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal">

                    <div class="box-body">
                        <table id="js_table" class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th width="10%">序号</th>
                                <th width="10%">外设编码</th>
                                <th width="20%">外设名称</th>
                                <th width="10%">外设类型</th>
                                <th width="20%">地址</th>
                                <th width="10%">最近修改时间</th>
                                <th width="20%">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="hostModelTargetDevice" varStatus="item"
                                       items="${hostModelTargetDeviceList}">
                                <tr>
                                    <td width="10%">${item.index + 1}</td>
                                    <td width="10%">${hostModelTargetDevice.deviceModel}</td>
                                    <td width="20%">${hostModelTargetDevice.name}</td>
                                    <td width="10%">${hostModelTargetDevice.deviceType}</td>
                                    <td width="20%">${hostModelTargetDevice.addr}</td>
                                    <td width="10%">${hostModelTargetDevice.updateTime}</td>
                                    <td width="20%">
                                            <%--<a href="/admin/HostModelPort/detail?id=${hostModelTargetDevice.id}">--%>
                                            <%--<i class="fa fa-info-circle"></i>查看--%>
                                            <%--</a>--%>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <!-- /.box-footer -->
                    <div class="box-footer">
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

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

    })
</script>

</body>
</html>
