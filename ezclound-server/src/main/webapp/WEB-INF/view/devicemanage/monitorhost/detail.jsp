<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>设备详情</title>
    <link rel="stylesheet"
          href="/static/js/lib/datatables/dataTables.bootstrap.css?ver=${staticVersion}">
</head>
<body>
<section class="content">
    <div class="row">
        <div id="detail_port_device">
            <div class="col-md-5">
                <!-- Horizontal Form -->
                <div class="box box-solid box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">设备详情</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-horizontal">

                        <div class="box-body">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <input type="hidden" value="${monitorHost.id}" id="monitorHostId">
                                <tr>
                                    <th width="30%">属性</th>
                                    <th width="70%">内容</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>名称</td>
                                    <td>${monitorHost.name}</td>
                                </tr>
                                <tr>
                                    <td>编号</td>
                                    <td>${monitorHost.ucode}</td>
                                </tr>
                                <tr>
                                    <td>型号</td>
                                    <td>${monitorHost.modelname}</td>
                                </tr>
                                <tr>
                                    <td>上报IP</td>
                                    <td>${monitorHost.ipaddr}</td>
                                </tr>
                                <tr>
                                    <td>通讯卡imei号</td>
                                    <td>${monitorHost.imei}</td>
                                </tr>
                                <tr>
                                    <td>通讯卡手机号</td>
                                    <td>${monitorHost.phone}</td>
                                </tr>
                                <tr>
                                    <td>位置点</td>
                                    <td>${monitorHost.locationName}</td>
                                </tr>
                                <tr>
                                    <td>监控室</td>
                                    <td>${monitorHost.roomName}</td>
                                </tr>
                                <%--<tr>--%>
                                <%--<td>施工单位</td>--%>
                                <%--<td>${monitorHost.channelCompanyName}</td>--%>
                                <%--</tr>--%>
                                <%--<tr>--%>
                                <%--<td>使用客户</td>--%>
                                <%--<td>${monitorHost.customerName}</td>--%>
                                <%--</tr>--%>
                                <%--<tr>--%>
                                <%--<td>设备物理状态</td>--%>
                                <%--<td>正常</td>--%>
                                <%--</tr>--%>
                                <%--<tr>--%>
                                <%--<td>运行状态</td>--%>
                                <%--<td>在线</td>--%>
                                <%--</tr>--%>
                                <%--<tr>--%>
                                <%--<td>连接状态</td>--%>
                                <%--<td>正常</td>--%>
                                <%--</tr>--%>
                                <%--<tr>--%>
                                <%--<td>最近上报时间</td>--%>
                                <%--<td>${monitorHost.lastCheck}</td>--%>
                                <%--</tr>--%>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <!-- /.box-footer -->
                        <%--<div class="box-footer">--%>
                        <%--</div>--%>
                    </form>
                </div>
            </div>
            <!-- /.box -->
            <!-- general form elements disabled -->

            <div class="col-md-7">
                <div class="box box-solid box-info">
                    <div class="box-header">
                        <h3 class="box-title">设备端口列表</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-horizontal">
                        <div class="box-body">
                            <table id="js_table_port" class="table table-bordered table-hover table-condensed">
                                <thead>
                                <tr>
                                    <th width="20%">序号</th>
                                    <th width="20%">端口名称</th>
                                    <th width="20%">端口编号</th>
                                    <%--<th width="20%">端口类型</th>--%>
                                    <%--<th width="20%">最近修改时间</th>--%>
                                    <th width="20%">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="hostPort" varStatus="item" items="${hostPortList}">
                                    <tr>
                                        <td width="10%">${item.index + 1}</td>
                                        <td width="25%"><a
                                                href="/hostport/detail?id=${hostPort.id}">${hostPort.name}</a></td>
                                        <td width="10%">${hostPort.ucode}</td>
                                            <%--<td width="25%">${hostPort.spec}</td>--%>
                                            <%--<td width="10%">${hostPort.updatetime}</td>--%>
                                        <td width="20%">
                                            <a href="/targetdevice/add?id=0&portId=${hostPort.id}&fromView=mhdetail">
                                                <i class="fa fa-pencil-square-o"></i>新增外设
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <!-- /.box-footer -->
                        <%--<div class="box-footer">--%>
                        <%--</div>--%>
                    </form>
                </div>
            </div>
            <div class="col-xs-7">
                <div class="box box-solid box-info">
                    <div class="box-header">
                        <h3 class="box-title">监控设备外设列表</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="js_table_device" class="table table-bordered table-hover table-condensed">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>名称</th>
                                <th>编号</th>
                                <%--<th>端口编号</th>--%>
                                <%--<th>设备类型</th>--%>
                                <th>物理状态</th>
                                <%--<th>修改时间</th>--%>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="targetDevice" varStatus="item" items="${targetDeviceList}">
                                <tr>
                                    <td width="5%">${item.index + 1}</td>
                                    <td width="15%"><a
                                            href="/targetdevice/detail?id=${targetDevice.id}">${targetDevice.name}</a>
                                    </td>
                                    <td width="10%">${targetDevice.code}</td>
                                        <%--<td width="10%">${targetDevice.portUCode}</td>--%>
                                        <%--<td width="15%">${targetDevice.deviceType}</td>--%>
                                    <td width="10%">${targetDevice.phyState}</td>
                                        <%--<td width="15%">${targetDevice.updatetime}</td>--%>
                                    <td width="20%">
                                        <a href="/targetdevice/add?id=${targetDevice.id}&fromView=mhdetail">
                                            <i class="fa fa-pencil-square-o"></i>编辑
                                        </a>
                                        <a href="javascript:deleteTargetDevice('${targetDevice.id}');">
                                            <i class="fa fa-pencil-square-o"></i>删除
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer clearfix"></div>
                    <!-- /.box-footer -->
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div id="item_command">
            <div class="col-md-6">
                <div class="box box-solid box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">外设检查项</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-horizontal">

                        <div class="box-body">
                            <table id="js_table_device_item"
                                   class="table table-bordered table-hover js_table table-condensed">
                                <thead>
                                <tr>
                                    <th width="10%">序号</th>
                                    <th width="10%">名称</th>
                                    <th width="10%">编号</th>
                                    <th width="10%">最大告警阈值</th>
                                    <th width="10%">最小告警阈值</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="checkItem" varStatus="item" items="${checkItemList}">
                                    <tr>
                                        <td width="10%">${item.index + 1}</td>
                                        <td width="10%"><a
                                                href="javascript:toCheckItemDetail(${checkItem.id})">${checkItem.name}</a>
                                        </td>
                                        <td width="10%">${checkItem.code}</td>
                                        <td width="10%">${checkItem.maxValue}</td>
                                        <td width="10%">${checkItem.minValue}</td>
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


            <div class="col-md-6">
                <div class="box box-solid box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">外设检查命令</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-horizontal">

                        <div class="box-body">
                            <table id="js_table_device_command"
                                   class="table table-bordered table-hover js_table table-condensed">
                                <thead>
                                <tr>
                                    <th width="10%">序号</th>
                                    <th width="20%">参数名称</th>
                                    <th width="20%">参数值</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="checkCommand" varStatus="item" items="${checkCommandList}">
                                    <tr>
                                        <td width="10%">${item.index + 1}</td>
                                        <td width="20%"><a
                                                href="javascript:toCheckCommandDetail(${checkCommand.id})">${checkCommand.name}</a>
                                        </td>
                                        <td width="20%">${checkCommand.value}</td>
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
    </div>
</section>

<script src="/static/js/lib/datatables/jquery.dataTables.min.js?ver=${staticVersion}"></script>
<script src="/static/js/lib/datatables/dataTables.bootstrap.min.js?ver=${staticVersion}"></script>
<script>
    $(function () {
//        $('#js_table_port').DataTable({
//            "language": {
//                "emptyTable": "没有数据"
//            },
//            "paging": false,
//            "lengthChange": false,
//            "searching": false,
//            "ordering": true,
//            "info": false,
//            "autoWidth": false
//        });
//        $('#js_table_device').DataTable({
//            "language": {
//                "emptyTable": "没有数据"
//            },
//            "paging": false,
//            "lengthChange": false,
//            "searching": false,
//            "ordering": true,
//            "info": false,
//            "autoWidth": false
//        });
        $('#js_table_device_item').DataTable({
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
        $('#js_table_device_command').DataTable({
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
    function toMonitorHostDetail() {
        var monitorHostId = $('#monitorHostId').val();
    }
    function toHostPortDetail(hostPortId) {
    }
    function toTargetDeviceDetail(targetDeviceId) {
    }
    function toCheckItemDetail(checkItemId) {
    }
    function toCheckCommandDetail(checkCommandId) {
    }
</script>

</body>
</html>
