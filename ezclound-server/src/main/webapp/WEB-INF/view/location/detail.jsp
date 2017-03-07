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
    <title>位置详情</title>
</head>
<body>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <!-- Horizontal Form -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">位置详情</h3>
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
                                    <td>位置名称</td>
                                    <td>${locationDetail.name}</td>
                                </tr>
                                <tr>
                                    <td>经纬坐标</td>
                                    <td>${locationDetail.lon},${locationDetail.lat}</td>
                                </tr>
                                <tr>
                                    <td>邮编</td>
                                    <td> ${locationDetail.postcode}</td>
                                </tr>
                                <tr>
                                    <td>地区</td>
                                    <td>${locationDetail.areaName}</td>
                                </tr>
                                <tr>
                                    <td>详细地址</td>
                                    <td>${locationDetail.address}</td>
                                </tr>
                                </tbody>
                            </table>
                            <!-- /.box-body -->
                            <!-- /.box-footer -->
                            <%--<div class="box-footer">--%>
                            <%--</div>--%>
                        </div>
                    </div>
                </form>
            </div>

            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">房间管理</h3>
                    <a href="/room/add?lid=${locationDetail.id}&id=0" class="btn btn-success ">添加房间</a>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal">

                    <div class="box-body">
                        <table id="js_table" class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>房间名称</th>
                                <th>宽/高</th>
                                <th>楼层号</th>
                                <th>状态</th>
                                <th>更新时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="room" items="${roomList}" varStatus="item">
                                <tr>
                                    <td width="10%">${item.index +1}</td>
                                    <td width="20%"><a href="/room/detail?id=${room.id}">${room.name}</a></td>
                                    <td width="20%">${room.width}/${room.height}</td>
                                    <td width="10%">${room.floorNumber}</td>
                                    <td width="10%">${room.stateName}</td>
                                    <td width="10%">${room.updatetime}</td>
                                    <td width="20%">
                                        <a href="/room/add?lid=${locationDetail.id}&id=${room.id}">
                                            <i class="fa fa-pencil-square-o"></i>编辑
                                        </a>
                                        <a href="javascript:deleteRoom('${locationDetail.id}','${room.id}');">
                                            <i class="fa fa-pencil-square-o"></i>删除
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
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
    function deleteRoom(locationId, roomId) {
        var param = {
            "id": roomId
        }
        _showPop({
            type: "success",
            title: "系统提示",
            content: "确认删除吗？",
            ok: {
                name: '确定',
                callback: function () {
                    $.get("/room/delete", $.param(param), function (r) {
                        if (r) {
                            if (r.code == 0) {
                                _showPop({
                                    type: "success",
                                    title: "删除成功",
                                    content: "删除成功!",
                                    ok: {
                                        name: '确定',
                                        callback: function () {
                                            window.location.href = "/location/detail?id=" + locationId;
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