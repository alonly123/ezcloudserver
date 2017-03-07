<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>监控端口详情</title>
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
                    <h3 class="box-title">监控端口详情</h3>
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
                                <td>端口编号</td>
                                <td>${hostport.ucode}</td>
                            </tr>
                            <tr>
                                <td>端口名称</td>
                                <td>${hostport.name}</td>
                            </tr>
                            <tr>
                                <td>端口类型</td>
                                <td>${hostport.spec}</td>
                            </tr>
                            <tr>
                                <td>端口参数</td>
                                <td>${hostport.param}</td>
                            </tr>
                            <tr>
                                <td>最近修改时间</td>
                                <td>${hostport.updatetime}</td>
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
</body>
</html>
