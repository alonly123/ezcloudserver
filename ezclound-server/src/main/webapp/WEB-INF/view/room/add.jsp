<%--
  Created by IntelliJ IDEA.
  User: luochunteng
  Date: 2016/4/2
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>新增房间</title>
</head>
<body>
<section class="content">
    <div class="col-md-12">
        <!-- Horizontal Form -->
        <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title" id="title">新增房间</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal">
                <div class="box-body">
                    <div class="form-group">
                        <input type="hidden" value="${isAdd}" id="isAdd">
                        <input type="hidden" value="${room.id}" id="roomId">
                        <input type="hidden" value="${room.locationId}" id="locationId">
                        <label for="name" class="col-sm-2 control-label">房间名称</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="name" placeholder="房间名称"
                                   value="${room.name}">
                        </div>
                        <div class="col-sm-4 bg-yellow color-palette hidden js_error_msg">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="floorNumber" class="col-sm-2 control-label">楼层数</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="floorNumber"
                                   placeholder="楼层数" value="${room.floorNumber}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="height" class="col-sm-2 control-label">高度</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="height"
                                   placeholder="高度" value="${room.height}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="width" class="col-sm-2 control-label">宽度</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="width"
                                   placeholder="宽度" value="${room.width}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="picURL" class="col-sm-2 control-label">伪三维图地址</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="picURL"
                                   placeholder="伪三维图地址" value="${room.picURL}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="picWidth" class="col-sm-2 control-label">图宽</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="picWidth"
                                   placeholder="图宽" value="${room.picWidth}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="picHeight" class="col-sm-2 control-label">图高</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="picHeight"
                                   placeholder="图高" value="${room.picHeight}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="modelId" class="col-sm-2 control-label">所属三维建模</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="modelId"
                                   placeholder="所属三维建模" value="${room.modelId}">
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="button" class="btn btn-info pull-right" id="addRoom">保存
                    </button>
                    <button type="button" class="btn btn-info pull-right" id="cancelAdd">取消</button>
                </div>
                <!-- /.box-footer -->
            </form>
        </div>
        <!-- /.box -->
        <!-- general form elements disabled -->
    </div>
</section>
<script>
    $(function () {
        $('#addRoom').on("click", function () {
            var locationId = $('#locationId').val() * 1;
            var room = {
                "id": $('#roomId').val() * 1,
                "locationId": locationId,
                "name": $("#name").val(),
                "floorNumber": $("#floorNumber").val() * 1,
                "height": $("#height").val() == "" ? 0 : $("#height").val() * 1,
                "width": $("#width").val() == "" ? 0 : $("#width").val() * 1,
                "picURL": $('#picURL').val(),
                "picWidth": $("#picWidth").val() == "" ? 0 : $("#picWidth").val() * 1,
                "picHeight": $("#picHeight").val() == "" ? 0 : $("#picHeight").val() * 1,
                "modelId": $("#modelId").val() == "" ? 0 : $("#modelId").val() * 1
            };
            $.ajax({
                dataType: 'json',
                type: 'post',
                url: "/room/save",
                data: room,
                success: function (r) {
                    if (r) {
                        if (r.code == 0) {
                            _showPop({
                                type: "success",
                                title: "保存成功",
                                content: "保存成功!",
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
                }
            });
        });

        $('#cancelAdd').on("click", function () {
            var locationId = $('#locationId').val() * 1;
            window.location.href = "/location/detail?id=" + locationId;
        });
        var isAdd = $('#isAdd').val();
        if (isAdd == "false") {
            $('#title').html("编辑房间");
        }


    })
</script>
</body>
</html>