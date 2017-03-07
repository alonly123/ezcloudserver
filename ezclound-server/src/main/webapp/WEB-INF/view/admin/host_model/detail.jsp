<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>设备型号详情</title>
    <link rel="stylesheet"
          href="/static/js/lib/datatables/dataTables.bootstrap.css?ver=${staticVersion}">
</head>
<body>
<section class="content">
    <div class="row">
        <div class="col-md-6">
            <!-- Horizontal Form -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">设备型号详情</h3>
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
                                <td>型号</td>
                                <td>${hostModel.model}</td>
                            </tr>
                            <tr>
                                <td>型号名称</td>
                                <td>${hostModel.name}</td>
                            </tr>
                            <tr>
                                <td>型号描述</td>
                                <td>${hostModel.descr}</td>
                            </tr>
                            <tr>
                                <td>添加时间</td>
                                <td>${hostModel.createTime}</td>
                            </tr>
                            <tr>
                                <td>最近修改时间</td>
                                <td>${hostModel.updateTime}</td>
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
                    <h3 class="box-title">设备型号端口列表</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal">

                    <div class="box-body">
                        <table class="table table-bordered table-hover js_table">
                            <thead>
                            <tr>
                                <th width="10%">序号</th>
                                <th width="20%">端口名称</th>
                                <th width="10%">端口</th>
                                <th width="20%">端口描述</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="hostModelPort" varStatus="item" items="${hostModelPortList}">
                                <tr>
                                    <td width="10%">${item.index + 1}</td>
                                    <td width="25%"><a href="/admin/HostModelPort/detail?id=${hostModelPort.id}">${hostModelPort.name}</a></td>
                                    <td width="10%">${hostModelPort.ucode}</td>
                                    <td width="25%">${hostModelPort.spec}</td>
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
            <!-- Horizontal Form -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">外设型号列表</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal">

                    <div class="box-body">
                        <table class="table table-bordered table-hover js_table">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>名称</th>
                                <th>内部型号编码</th>
                                <th>型号编码</th>
                                <th>供应商</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="targetDeviceModel" varStatus="item" items="${targetDeviceModels}">
                                <tr>
                                    <td width="5%">${item.index + 1}</td>
                                    <td width="15%"><a
                                            href="/admin/TargetDeviceModel/detail?id=${targetDeviceModel.id}">${targetDeviceModel.name}</a>
                                    </td>
                                    <td width="10%">${targetDeviceModel.model}</td>
                                    <td width="10%">${targetDeviceModel.longModel}</td>
                                    <td width="15%">${targetDeviceModel.vendor}</td>
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
            <!-- /.box -->
            <!-- general form elements disabled -->

            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">外设型号检查项列表</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal">

                    <div class="box-body">
                        <table class="table table-bordered table-hover js_table">
                            <thead>
                            <tr>
                                <th width="10%">序号</th>
                                <th width="10%">名称</th>
                                <th width="10%">code</th>
                                <th width="10%">最大告警阈值</th>
                                <th width="10%">最小告警阈值</th>
                                <th width="10%">值等于</th>
                                <th width="10%">值类型</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="checkItem" varStatus="item" items="${deviceModelCheckItems}">
                                <tr>
                                    <td width="10%">${item.index + 1}</td>
                                    <td width="10%"><a href="/admin/TargetDeviceModelCheckItem/detail?id=${checkItem.id}">${checkItem.name}</a></td>
                                    <td width="10%">${checkItem.code}</td>
                                    <td width="10%">${checkItem.maxValue}</td>
                                    <td width="10%">${checkItem.minValue}</td>
                                    <td width="10%">${checkItem.eqValue}</td>
                                    <td width="10%">${checkItem.valueType}</td>
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

        $('.js_table').DataTable({
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
