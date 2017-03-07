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
    <title>新增客户</title>
</head>
<body>
<c:set var="isAdd" value="${isAdd}"></c:set>
<section class="content">
    <div class="col-md-12">
        <!-- Horizontal Form -->
        <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title" id="title">新增客户</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal">
                <div class="box-body">
                    <div class="form-group">
                        <input type="hidden" value="${customerInfo.id}" id="customerId">
                        <label for="name" class="col-sm-2 control-label">客户名称</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="name" placeholder="客户名称"
                                   value="${customerInfo.name}">
                        </div>
                        <div class="col-sm-4 bg-yellow color-palette hidden js_error_msg">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="contacts" class="col-sm-2 control-label">联系人</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="contacts"
                                   placeholder="联系人,多个以半角逗号分隔" value="${customerInfo.contacts}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="maintianer" class="col-sm-2 control-label">设备维护人</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="maintianer"
                                   placeholder="设备维护人" value="${customerInfo.maintianer}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="mphone" class="col-sm-2 control-label">移动电话</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="mphone"
                                   placeholder="移动电话,多个以半角逗号分隔" value="${customerInfo.mphone}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-2 control-label">固定电话</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="phone"
                                   placeholder="固定电话,多个以半角逗号分隔" value="${customerInfo.phone}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="notifyPhone" class="col-sm-2 control-label">告警通知电话</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="notifyPhone"
                                   placeholder="告警通知电话" value="${customerInfo.notifyPhone}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="notifyEmail" class="col-sm-2 control-label">告警通知邮箱</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="notifyEmail"
                                   placeholder="告警通知邮箱" value="${customerInfo.notifyEmail}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="postcode" class="col-sm-2 control-label">邮编</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="postcode" placeholder="邮编"
                                   value="${customerInfo.postcode}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">公司地址</label>
                        <input type="hidden" id="isAdd" value="${isAdd}">
                        <input type="hidden" id="selectProvince" value="${province.id}">
                        <input type="hidden" id="selectCity" value="${city.id}">
                        <input type="hidden" id="selectCounty" value="${county.id}">

                        <div class="col-sm-6">
                            <select id="province" name="province" style="width:138px;float:left;" class="form-control">
                                <option value="0">请选择省份</option>
                            </select>  
                            <select id="city" name="city" style="width:138px;float:left;" class="form-control">
                                <option value="0">请选择市</option>
                            </select>  
                            <select id="county" name="county" style="width:138px;float:left;" class="form-control">
                                <option value="0">请选择区/县</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="js_owner_id_box" id="js_owner_id_label" class="col-sm-2 control-label">中间商</label>
                        <input type="hidden" id="companyId" value="${customerInfo.pid}">
                        <input type="hidden" id="companyName" value="${customerInfo.pname}">

                        <div class="col-sm-5">
                            <select class="form-control select2" id="js_owner_id_box">
                                <option value="${selectView.id}">${selectView.name}</option>
                            </select>
                        </div>
                        <div class="col-sm-4 bg-yellow color-palette hidden js_error_msg">
                        </div>
                    </div>

                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="button" class="btn btn-info pull-right" id="addCustomer">保存
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
        $('#addCustomer').on("click", function () {
            var areaCode = $('#county option:selected').val();
            if (areaCode == undefined || areaCode == '') {
                areaCode = 0;
            }
            var companyId = ownerIdSelectTag.val();
            if (companyId == 0 || companyId == null) {
                _showPop({
                    type: "error",
                    title: "错误",
                    content: "请选择中间商！"
                });
                return false;
            }
            var customer = {
                "id": $('#customerId').val(),
                "name": $("#name").val(),
                "contacts": $("#contacts").val(),
                "mphone": $("#mphone").val(),
                "phone": $("#phone").val(),
                "maintianer": $('#maintianer').val(),
                "notifyPhone": $('#notifyPhone').val(),
                "notifyEmail": $('#notifyEmail').val(),
                "postcode": $('#postcode').val(),
                "pid": companyId,
                "address": areaCode
            };
            $.ajax({
                dataType: 'json',
                type: 'post',
                url: "/customer/save",
                data: customer,
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
                                        window.location.href = "/customer/list";
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
            window.location.href = "/customer/list";
        });
        var isAdd = $('#isAdd').val();
        var ownerIdSelectTag = $("#js_owner_id_box");
        var searchUrl = "/channelCompany/searchChannelSelect";
        var select2Options;
        if (isAdd == "false") {
            $('#title').html("编辑客户");
        }
        select2Options = {
            placeholder: "请选择中间商",
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

        var provinceTag = $("#province");
        var cityTag = $("#city");
        var countyTag = $("#county");
        var provinceCode = $('#selectProvince').val();
        var cityCode = $('#selectCity').val();
        var countyCode = $('#selectCounty').val();


        provinceTag.select2();
        cityTag.select2();
        countyTag.select2();

        if (provinceCode) {
            appendProvince(provinceTag, provinceCode);
            getCityOrgCounty(cityTag, provinceCode, cityCode);
            getCityOrgCounty(countyTag, cityCode, countyCode);

        } else {
            appendProvince(provinceTag, provinceCode);
        }

        provinceTag.change(provinceTag, function () {
            var pid = provinceTag.find("option:selected").val();
            getCityOrgCounty(cityTag, pid, 0);
            cityTag.empty().append($("<option>").val(0).text("请选择市"));
            cityTag.select2();
            countyTag.empty().append($("<option>").val(0).text("请选择区/县"));
            countyTag.select2();
        });

        cityTag.change(function () {
            var pid = cityTag.find("option:selected").val();
            if (pid > 0) {
                getCityOrgCounty(countyTag, pid, 0);
            }
        });

        function appendProvince(tag, initId) {
            Area.getProvince(function (r) {
                if (r) {
                    if (r.code == 0) {
                        var areaData = r.data ? r.data : null;
                        for (var i in areaData) {
                            if (areaData[i].id == initId) {
                                tag.append("<option value=" + areaData[i].id + " selected='selected'>" + areaData[i].name + "</option>");
                                continue;
                            }
                            tag.append("<option value=" + areaData[i].id + ">" + areaData[i].name + "</option>");
                        }
                        tag.select2();
                    } else {
                        _showPop({
                            type: "error",
                            title: "错误",
                            content: "获取地址失败，" + r.msg
                        });
                    }
                } else {
                    _showPop({
                        type: "error",
                        title: "错误",
                        content: "获取地址失败"
                    });
                }
            });
        }

        function getCityOrgCounty(tag, pid, initId) {
            Area.getCityOrCounty(pid, function (r) {
                if (r) {
                    if (r.code == 0) {
                        var areaData = r.data ? r.data : null;
                        for (var i in areaData) {
                            if (areaData[i].id == initId) {
                                tag.append("<option value=" + areaData[i].id + " title=" + areaData[i].name + " selected='selected'>" + areaData[i].name + "</option>");
                                continue;
                            }
                            tag.append("<option value=" + areaData[i].id + " title=" + areaData[i].name + ">" + areaData[i].name + "</option>");
                        }
                        tag.select2();
                    } else {
                        _showPop({
                            type: "error",
                            title: "错误",
                            content: "获取地址失败，" + r.msg
                        });
                    }
                } else {
                    _showPop({
                        type: "error",
                        title: "错误",
                        content: "获取地址失败"
                    });
                }
            });
        }

    })
</script>
</body>
</html>