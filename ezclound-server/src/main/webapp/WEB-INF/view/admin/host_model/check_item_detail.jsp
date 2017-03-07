<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>外设型号检查项详情</title>
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
                    <h3 class="box-title">外设型号检查项详情</h3>
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
                                <td>名称</td>
                                <td>${deviceModelCheckItem.name}</td>
                            </tr>
                            <tr>
                                <td>编码</td>
                                <td>${deviceModelCheckItem.code}</td>
                            </tr>
                            <tr>
                                <td>最大告警阈值</td>
                                <td>${deviceModelCheckItem.maxValue}</td>
                            </tr>
                            <tr>
                                <td>最小告警阈值</td>
                                <td>${deviceModelCheckItem.minValue}</td>
                            </tr>
                            <tr>
                                <td>值等于</td>
                                <td>${deviceModelCheckItem.eqValue}</td>
                            </tr>
                            <tr>
                                <td>值类型</td>
                                <td>${deviceModelCheckItem.valueType}</td>
                            </tr>
                            <tr>
                                <td>添加时间</td>
                                <td>${deviceModelCheckItem.createTime}</td>
                            </tr>
                            <tr>
                                <td>最近修改时间</td>
                                <td>${deviceModelCheckItem.updateTime}</td>
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
