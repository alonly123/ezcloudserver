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
    <title>新增设备</title>
</head>
<body>
<section class="content">
    <div class="col-md-12">
        <!-- Horizontal Form -->
        <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title" id="title">新增设备</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal">
                <div class="box-body">
                    <div class="form-group">
                        <input type="hidden" value="${monitorHost.id}" id="monitorHostId">
                        <input type="hidden" id="isAdd" value="${isAdd}">
                        <label for="name" class="col-sm-2 control-label">设备名称</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="name" placeholder="设备名称"
                                   value="${monitorHost.name}">
                        </div>
                        <div class="col-sm-4 bg-yellow color-palette hidden js_error_msg">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ucode" class="col-sm-2 control-label">设备编号</label>

                        <div class="col-sm-5">
                            <c:if test="${isAdd == false}">
                                <input type="text" class="form-control" id="ucode"
                                       placeholder="设备编号" value="${monitorHost.ucode}" disabled>
                            </c:if>
                            <c:if test="${isAdd == true}">
                                <input type="text" class="form-control" id="ucode"
                                       placeholder="设备编号" value="${monitorHost.ucode}">
                            </c:if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="js_model_id_box" id="js_owner_id_label" class="col-sm-2 control-label">设备型号</label>
                        <input type="hidden" id="model" value="${monitorHost.model}">
                        <input type="hidden" id="modelname" value="${monitorHost.modelname}">

                        <div class="col-sm-5">
                            <select class="form-control select2" id="js_model_id_box">
                                <option value="${hostModel.id}">${hostModel.name}</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="js_channel_id_box" class="col-sm-2 control-label">施工单位</label>
                        <input type="hidden" id="channelCompanyId" value="${monitorHost.channelCompanyId}">
                        <input type="hidden" id="channelCompanyName" value="${monitorHost.channelCompanyName}">

                        <div class="col-sm-5">
                            <select class="form-control select2" id="js_channel_id_box">
                                <option value="${channelCompany.id}">${channelCompany.name}</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="js_customer_id_box" class="col-sm-2 control-label">使用客户</label>
                        <input type="hidden" id="customerId" value="${monitorHost.customerId}">
                        <input type="hidden" id="customerName" value="${monitorHost.customerName}">

                        <div class="col-sm-5">
                            <select class="form-control select2" id="js_customer_id_box">
                                <option value="${customer.id}">${customer.name}</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="js_location_id_box" class="col-sm-2 control-label">所在建筑物地址</label>
                        <input type="hidden" id="locationId" value="${monitorHost.locationId}">
                        <input type="hidden" id="locationName" value="${monitorHost.locationName}">

                        <div class="col-sm-5">
                            <select class="form-control select2" id="js_location_id_box">
                                <option value="${location.id}">${location.name}</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="js_room_id_box" class="col-sm-2 control-label">房间号</label>
                        <input type="hidden" id="roomId" value="${monitorHost.roomId}">
                        <input type="hidden" id="roomName" value="${monitorHost.roomName}">

                        <div class="col-sm-5">
                            <select class="form-control select2" id="js_room_id_box">
                                <option value="${room.id}">${room.name}</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-4 bg-yellow color-palette hidden js_error_msg">
                    </div>
                </div>

        </div>
        <!-- /.box-body -->
        <div class="box-footer">
            <button type="button" class="btn btn-info pull-right" id="addMonitorHost">保存
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
<script src="/static/js/common/common-util.js?ver=${staticVersion}"></script>
<script src="/static/js/lib/select2/select2.full.min.js?ver=${staticVersion}"></script>
<script>
    $(function () {
        $('#addMonitorHost').on("click", function () {
            var modelId = $('#js_model_id_box').val();
            if (modelId == 0 || modelId == null) {
                _showPop({
                    type: "error",
                    title: "错误",
                    content: "请选择型号！"
                });
                return false;
            }
            var monitorHost = {
                "id": $('#monitorHostId').val() * 1,
                "ucode": $("#ucode").val(),
                "name": $("#name").val(),
                "customerId": $("#js_customer_id_box").val() * 1,
                "channelCompanyId": $("#js_channel_id_box").val() * 1,
                "roomId": $("#js_room_id_box").val() * 1,
                "locationId": $('#js_location_id_box').val() * 1,
                "modelId": $('#js_model_id_box').val() * 1,
                "phyState": "0",
                "state": "0",
                "connState": "0",
                "phone": "",
                "imei": "",
                "ipaddr": ""
            };
            $.ajax({
                dataType: 'json',
                type: 'post',
                url: "/monitorhost/save",
                data: monitorHost,
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
                                        window.location.href = "/monitorhost/list";
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
            window.location.href = "/monitorhost/list";
        });
        var isAdd = $('#isAdd').val();
        if (isAdd == "false") {
            $('#title').html("编辑监控设备");
        }

        //加载信息
        loadInfo("js_model_id_box", "/admin/hostmodel/searchHostModelSelect", "请选择设备型号");
        loadInfo("js_channel_id_box", "/channelCompany/searchChannelSelect", "请选择施工单位");
        loadInfo("js_customer_id_box", "/customer/searchCustomerSelect", "请选择客户", 0);
        loadInfo("js_location_id_box", "/location/searchLocationSelect", "请选择建筑物地址");
        loadInfo("js_room_id_box", "/room/searchRoomSelect", "请选择房间号", 0);
        var companyTag = $('#js_channel_id_box'),
                customerTag = $('#js_customer_id_box'),
                companyId = companyTag.find("option:selected").val(),
                locationTag = $('#js_location_id_box'),
                roomTag = $('#js_room_id_box'),
                locationId =locationTag.find("option:selected").val();
        if (companyId == "") {
            customerTag.empty().append($("<option>").val(0).text("请选择客户"));
            customerTag.select2();
            customerTag.attr("disabled", true);
        }
        if (locationId == "") {
            roomTag.empty().append($("<option>").val(0).text("请选择房间号"));
            roomTag.select2();
            roomTag.attr("disabled", true);
        }
        companyTag.change(companyTag, function () {
            var companyId = companyTag.find("option:selected").val();
            if (companyId == "" || companyId == 0) {
                customerTag.attr("disabled", true);
            } else {
                customerTag.empty().append($("<option>").val(0).text("请选择客户"));
                customerTag.select2();
                loadInfo("js_customer_id_box", "/customer/searchCustomerSelect", "请选择客户", companyId);
                customerTag.removeAttr("disabled");
            }
        });
        locationTag.change(locationTag, function () {
            var locationId = locationTag.find("option:selected").val();
            if (locationId == "" || locationId == 0) {
                roomTag.attr("disabled", true);
            } else {
                roomTag.empty().append($("<option>").val(0).text("请选择房间号"));
                roomTag.select2();
                loadInfo("js_room_id_box", "/room/searchRoomSelect", "请选择房间号", locationId);
                roomTag.removeAttr("disabled");
            }
        });
    });
    function loadInfo(id, url, holderText, pid) {
        var ownerIdSelectTag = $("#" + id),
                searchUrl = url;
        var select2Options = {
            placeholder: holderText,
            minimumInputLength: 1,
            ajax: {
                url: searchUrl,
                dataType: 'json',
                delay: 200,
                data: function (params) {
                    return {
                        key: params.term, // search term
                        page: params.page,
                        pid: pid
                    };
                },
                processResults: function (data, params) {
                    params.page = params.page || 1;

                    var totalCount = 0;
                    var pageSize = 1;
                    var result = new Array();

                    if (data) {
                        if (data.code == 0) {
                            var datas = data.data ? data.data.data : null;
                            pageSize = data.data.pageSize;
                            totalCount = data.data.total;
                            if (datas) {
                                for (var d in datas) {
                                    item = {};
                                    item["id"] = datas[d]['id'];
                                    item["text"] = datas[d]['name'];
                                    result.push(item);
                                }
                            }

                            var more = (params.page * pageSize) < totalCount;
                            return {
                                results: result,
                                pagination: {
                                    more: more
                                }
                            };
                        } else {
                            _showPop({
                                type: "error",
                                title: "错误",
                                content: data.msg
                            });
                        }

                    } else {
                        _showPop({
                            type: "error",
                            title: "错误",
                            content: "获取数据失败"
                        });
                    }

                },
                cache: true
            }
        }
        ownerIdSelectTag.select2(select2Options);
    }
</script>
</body>
</html>