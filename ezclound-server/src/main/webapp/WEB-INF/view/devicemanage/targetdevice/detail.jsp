<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>外设详情</title>
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
                    <h3 class="box-title">外设详情</h3>
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
                                <td>编号</td>
                                <td>${targetDevice.code}</td>
                            </tr>
                            <tr>
                                <td>名称</td>
                                <td>${targetDevice.name}</td>
                            </tr>
                            <tr>
                                <td>设备编号</td>
                                <td>${targetDevice.hostucode}</td>
                            </tr>
                            <tr>
                                <td>设备端口号</td>
                                <td>${targetDevice.portUCode}</td>
                            </tr>
                            <tr>
                                <td>型号编号</td>
                                <td>${targetDevice.model}</td>
                            </tr>
                            <tr>
                                <td>设备类型</td>
                                <td>${targetDevice.deviceType}</td>
                            </tr>
                            <tr>
                                <td>地址</td>
                                <td>${targetDevice.addrDetail}</td>
                            </tr>
                            <tr>
                                <td>物理状态</td>
                                <td>${targetDevice.phyState}</td>
                            </tr>
                            <tr>
                                <td>状态</td>
                                <td>${targetDevice.state}</td>
                            </tr>
                            <tr>
                                <td>机房图坐标</td>
                                <td>${targetDevice.graphX},${targetDevice.graphY}</td>
                            </tr>
                            <tr>
                                <td>检查频率</td>
                                <td>${targetDevice.checkInterval}</td>
                            </tr>
                            <tr>
                                <td>最近上报时间</td>
                                <td>${targetDevice.lastCheck}</td>
                            </tr>
                            <tr>
                                <td>使用状态</td>
                                <td>${targetDevice.useState}</td>
                            </tr>  
                             <tr>
                                <td>更新时间</td>
                                <td>${targetDevice.updatetime}</td>
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
                    <h3 class="box-title">外设检查项</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal">

                    <div class="box-body">
                        <table id="js_table" class="table table-bordered table-hover js_table">
                            <thead>
                            <tr>
                                <th width="10%">序号</th>
                                <th width="10%">名称</th>
                                <th width="10%">编号</th>
                                <th width="10%">最大告警阈值</th>
                                <th width="10%">最小告警阈值</th>
                                <th width="10%">值等于</th>
                                <th width="10%">值类型</th>
                                <th width="10%">修改时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="checkItem" varStatus="item" items="${checkItemList}">
                                <tr>
                                    <td width="10%">${item.index + 1}</td>
                                    <td width="10%">${checkItem.name}</td>
                                    <td width="10%">${checkItem.code}</td>
                                    <td width="10%">${checkItem.maxValue}</td>
                                    <td width="10%">${checkItem.minValue}</td>
                                    <td width="10%">${checkItem.eqValue}</td>
                                    <td width="10%">${checkItem.valueType}</td>
                                    <td width="10%">${checkItem.updatetime}</td>
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


            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">外设检查命令</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal">

                    <div class="box-body">
                        <table id="js_table1" class="table table-bordered table-hover js_table">
                            <thead>
                            <tr>
                                <th width="10%">序号</th>
                                <th width="20%">参数名称</th>
                                <th width="20%">参数值</th>
                                <th width="10%">参数值类型</th>
                                <th width="20%">参数</th>
                                <th width="20%">修改时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="checkCommand" varStatus="item" items="${checkCommandList}">
                                <tr>
                                    <td width="10%">${item.index + 1}</td>
                                    <td width="20%">${checkCommand.name}</td>
                                    <td width="20%">${checkCommand.value}</td>
                                    <td width="10%">${checkCommand.valueType}</td>
                                    <td width="20%">${checkCommand.param}</td>
                                    <td width="20%">${checkCommand.updatetime}</td>
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
            $('.js_table1').DataTable({
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
