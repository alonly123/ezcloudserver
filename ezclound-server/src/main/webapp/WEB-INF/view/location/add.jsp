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
    <title>新增位置</title>
</head>
<body>
<section class="content">
    <div class="col-md-12">
        <!-- Horizontal Form -->
        <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title" id="title">新增位置</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal">
                <div class="box-body">
                    <div class="form-group">
                        <input type="hidden" value="${location.id}" id="locationId">
                        <label for="name" class="col-sm-2 control-label">位置名称</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="name" placeholder="位置名称"
                                   value="${location.name}">
                        </div>
                        <div class="col-sm-4 bg-yellow color-palette hidden js_error_msg">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lon" class="col-sm-2 control-label">经度</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="lon"
                                   placeholder="经度" value="${location.lon}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lat" class="col-sm-2 control-label">纬度</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="lat"
                                   placeholder="纬度" value="${location.lat}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="postcode" class="col-sm-2 control-label">邮编</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="postcode"
                                   placeholder="邮编" value="${location.postcode}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">地区</label>
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
                        <label for="address" class="col-sm-2 control-label">详细地址</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="address"
                                   placeholder="详细地址" value="${location.address}">
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="button" class="btn btn-info pull-right" id="addLocation">保存
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
        $('#addLocation').on("click", function () {
            var areaCode = $('#county option:selected').val();
            if (areaCode == undefined || areaCode == '') {
                areaCode = 0;
            }
            var location = {
                "id": $('#locationId').val() * 1,
                "name": $("#name").val(),
                "postcode": $("#postcode").val(),
                "lon": $("#lon").val() == "" ? 0 : $("#lon").val() * 1,
                "lat": $("#lat").val() == "" ? 0 : $("#lat").val() * 1,
                "address": $('#address').val(),
                "areacode": areaCode
            };
            $.ajax({
                dataType: 'json',
                type: 'post',
                url: "/location/save",
                data: location,
                success: function (r) {
                    if (r) {
                        console.info(r)
                        if (r.code == 0) {
                            _showPop({
                                type: "success",
                                title: "保存成功",
                                content: "保存成功!",
                                ok: {
                                    name: '确定',
                                    callback: function () {
                                        window.location.href = "/location/list";
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
            window.location.href = "/location/list";
        });
        var isAdd = $('#isAdd').val();
        if (isAdd == "false") {
            $('#title').html("编辑位置");
        }

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