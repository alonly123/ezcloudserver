<%--
  Created by IntelliJ IDEA.
  User: luochunteng
  Date: 2016/4/2
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>房间详情</title>
</head>
<body>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <!-- Horizontal Form -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">房间详情</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal">
                    <div class="box-body">
                        <div class="form-group">
                            <table id="js_table2" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th width="20%">属性</th>
                                    <th width="80%">内容</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>房间名称</td>
                                    <td>${roomDetail.name}</td>
                                </tr>
                                <tr>
                                    <td>楼层号</td>
                                    <td>${roomDetail.floorNumber}</td>
                                </tr>
                                <tr>
                                    <td>宽/高</td>
                                    <td>${roomDetail.width}/${roomDetail.height}</td>
                                </tr>
                                <tr>
                                    <td>伪三维图地址</td>
                                    <td>${roomDetail.picURL}</td>
                                </tr>
                                <tr>
                                    <td>图宽/图高</td>
                                    <td>${roomDetail.picWidth}/${roomDetail.picHeight}</td>
                                </tr>
                                <tr>
                                    <td>所属三维建模</td>
                                    <td>${roomDetail.modelId}</td>
                                </tr>
                                <tr>
                                    <td>房间状态</td>
                                    <td>${roomDetail.stateName}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <!-- /.box-footer -->
                </form>
            </div>
            <!-- /.box -->
            <!-- general form elements disabled -->
        </div>
    </div>
</section>
<script src="/static/js/lib/datatables/jquery.dataTables.min.js?ver=${staticVersion}"></script>
<script src="/static/js/lib/datatables/dataTables.bootstrap.min.js?ver=${staticVersion}"></script>
</body>
</html>