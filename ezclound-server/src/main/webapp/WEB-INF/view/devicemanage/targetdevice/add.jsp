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
    <title>新增外设</title>
</head>
<body>
<section class="content">
    <div class="col-md-12">
        <!-- Horizontal Form -->
        <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title" id="title">新增外设</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal">
                <div class="box-body">
                    <div class="form-group">
                        <input type="hidden" value="${targetDevice.id}" id="targetDeviceId">
                        <input type="hidden" id="isAdd" value="${isAdd}">
                        <input type="hidden" id="fromView" value="${fromView}">
                        <input type="hidden" id="monitorhostid" value="${monitorhostid}">
                        <label for="name" class="col-sm-2 control-label">外设名称</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="name" placeholder="外设名称"
                                   value="${targetDevice.name}">
                        </div>
                        <div class="col-sm-4 bg-yellow color-palette hidden js_error_msg">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="code" class="col-sm-2 control-label">外设编号</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="code"
                                   placeholder="外设编号" value="${targetDevice.code}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="js_host_id_box" id="js_host_id_label" class="col-sm-2 control-label">监控设备编号</label>
                        <input type="hidden" id="hostucode" value="${targetDevice.hostucode}">
                        <input type="hidden" id="hostName" value="${targetDevice.hostName}">

                        <div class="col-sm-5">
                            <c:if test="${isAdd == true}">
                                <select class="form-control select2" id="js_host_id_box">
                                    <option value="${host.code}">${host.name}</option>
                                </select>
                            </c:if>
                            <c:if test="${isAdd == false}">
                                <select class="form-control select2" id="js_host_id_box" disabled>
                                    <option value="${host.code}">${host.name}</option>
                                </select>
                            </c:if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="js_port_id_box" class="col-sm-2 control-label">监控设备端口号</label>
                        <input type="hidden" id="portUCode" value="${targetDevice.portUCode}">
                        <input type="hidden" id="portName" value="${targetDevice.portName}">

                        <div class="col-sm-5">
                            <c:if test="${isAdd == true}">
                                <select class="form-control select2" id="js_port_id_box">
                                    <option value="0">请选择监控设备端口</option>
                                </select>
                            </c:if>
                            <c:if test="${isAdd == false}">
                                <select class="form-control select2" id="js_port_id_box" disabled>
                                    <option value="0">请选择监控设备端口</option>
                                </select>
                            </c:if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="js_model_id_box" class="col-sm-2 control-label">外设型号</label>
                        <input type="hidden" id="model" value="${targetDevice.model}">
                        <input type="hidden" id="modelName" value="${targetDevice.modelName}">

                        <div class="col-sm-5">
                            <c:if test="${isAdd == true}">
                                <select class="form-control select2" id="js_model_id_box">
                                    <option value="0">请选择外设型号</option>
                                </select>
                            </c:if>
                            <c:if test="${isAdd == false}">
                                <select class="form-control select2" id="js_model_id_box" disabled>
                                    <option value="0">请选择外设型号</option>
                                </select>
                            </c:if>

                        </div>
                    </div>

                    <div class="col-sm-4 bg-yellow color-palette hidden js_error_msg">
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="button" class="btn btn-info pull-right" id="addTargetDevice">保存
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
        var isAdd = $('#isAdd').val();
        if (isAdd == "false") {
            $('#title').html("编辑外设");
        }

        var hostTag = $('#js_host_id_box'),
                portTag = $('#js_port_id_box'),
                modelTag = $('#js_model_id_box');
        var host = $('#hostucode').val();
        var port = $('#portUCode').val();
        var model = $('#model').val();

        portTag.select2();
        modelTag.select2();

        if (host) {
            loadPortInfo(portTag, host, port);
            loadTargetDeviceModelInfo(modelTag, port, model);
        }
        //加载信息
        loadInfo("js_host_id_box", "/monitorhost/searchMonitorHostSelect", "请选择监控设备(按名称搜索)");
        hostTag.change(hostTag, function () {
            var hostCode = hostTag.find("option:selected").val();
            //加载端口信息
            portTag.removeAttr("disabled");
            loadPortInfo(portTag, hostCode, 0);
            portTag.empty().append($("<option>").val(0).text("请选择监控设备端口"));
            portTag.select2();
            modelTag.empty().append($("<option>").val(0).text("请选择外设型号"));
            modelTag.select2();
            modelTag.attr("disabled", true);
        });
        portTag.change(portTag, function () {
            var portCode = portTag.find("option:selected").val();
            modelTag.empty().append($("<option>").val(0).text("请选择外设型号"));
            if (portCode != "" && portCode != 0) {
                //加载外设型号信息
                modelTag.removeAttr("disabled");
                loadTargetDeviceModelInfo(modelTag, portCode, 0);
            } else {
//                modelTag.empty().append($("<option>").val(0).text("请选择外设型号"));
                modelTag.select2();
                modelTag.attr("disabled", true);
            }
        });

        $('#addTargetDevice').on("click", function () {
            var hostTag = $('#js_host_id_box'),
                    portTag = $('#js_port_id_box'),
                    modelTag = $('#js_model_id_box'),
                    hostCode = hostTag.val(),
                    portUcode = portTag.val(),
                    model = modelTag.val();
            if (hostCode == "" || hostCode == null) {
                _showPop({
                    type: "error",
                    title: "错误",
                    content: "请选择监控设备！"
                });
                return false;
            }
            if (portUcode == "" || portUcode == null) {
                _showPop({
                    type: "error",
                    title: "错误",
                    content: "请选择监控端口！"
                });
                return false;
            }
            if (model == "" || model == null) {
                _showPop({
                    type: "error",
                    title: "错误",
                    content: "请选择外设型号！"
                });
                return false;
            }
            var targetdevice = {
                "id": $('#targetDeviceId').val() * 1,
                "code": $("#code").val(),
                "name": $("#name").val(),
                "portUCode": portUcode,
                "isUse": 0,
                "hostucode": hostCode,
                "model": model
            };
            $.ajax({
                dataType: 'json',
                type: 'post',
                url: "/targetdevice/save",
                data: targetdevice,
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
                }
            });
        });

        $('#cancelAdd').on("click", function () {
            var fromView = $('#fromView').val();
            if (fromView == 'tdmanage') {
                window.location.href = "/targetdevice/list";
            } else {
                window.location.href = "/monitorhost/detail?id=" + $('#monitorhostid').val();
            }
        });
    });

    function loadPortInfo(portTag, hostCode, initId) {
        $.ajax({
            dataType: 'json',
            type: 'get',
            url: "/hostport/searchhostprot",
            data: {'hostCode': hostCode},
            success: function (r) {
                if (r) {
                    if (r.code == 0) {
                        var port = r.data ? r.data : null;
                        for (var i in port) {
                            if (port[i].code == initId) {
                                portTag.append("<option value=" + port[i].code + " title=" + port[i].name + " selected='selected'>" + port[i].name + "</option>");
                                continue;
                            }
                            portTag.append("<option value=" + port[i].code + " title=" + port[i].name + ">" + port[i].name + "</option>");
                        }
                        portTag.select2();
                    } else {
                        _showPop({
                            type: "error",
                            title: "错误",
                            content: "获取端口失败，" + r.msg
                        });
                    }
                } else {
                    _showPop({
                        type: "error",
                        title: "错误",
                        content: "获取端口失败"
                    });
                }
            },
            error: function (r) {
                _showPop({
                    type: "error",
                    title: "错误",
                    content: "获取端口失败"
                });
            }
        });
    }
    ;
    function loadTargetDeviceModelInfo(modelTag, portCode, initId) {
        $.ajax({
            dataType: 'json',
            type: 'get',
            url: "/admin/TargetDeviceModle/searchTargetDeviceModel",
            data: {'portCode': portCode},
            success: function (r) {
                if (r) {
                    if (r.code == 0) {
                        var model = r.data ? r.data : null;
                        for (var i in model) {
                            if (model[i].code == initId) {
                                modelTag.append("<option value=" + model[i].code + " title=" + model[i].name + " selected='selected'>" + model[i].name + "</option>");
                                continue;
                            }
                            modelTag.append("<option value=" + model[i].code + " title=" + model[i].name + ">" + model[i].name + "</option>");
                        }
                        modelTag.select2();
                    } else {
                        _showPop({
                            type: "error",
                            title: "错误",
                            content: "获取外设型号失败，" + r.msg
                        });
                    }
                } else {
                    _showPop({
                        type: "error",
                        title: "错误",
                        content: "获取外设型号失败"
                    });
                }
            },
            error: function (r) {
                _showPop({
                    type: "error",
                    title: "错误",
                    content: "获取外设型号失败"
                });
            }
        });
    }
    ;

    function loadInfo(id, url, holderText) {
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
                        page: params.page
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
                                    item["id"] = datas[d]['code'];
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