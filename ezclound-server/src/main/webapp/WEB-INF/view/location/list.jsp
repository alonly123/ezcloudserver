<%--
  Created by IntelliJ IDEA.
  User: luochunteng
  Date: 2016/4/23
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>位置列表</title>
    <link rel="stylesheet" href="/static/js/lib/datatables/dataTables.bootstrap.css?ver=${staticVersion}">
</head>
<body>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">位置管理</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form id="searchLocation" action="/location/list" method="post">
                        <div class="col-sm-5">
                            <input id="selectProvince" hidden="hidden" value="${province}">
                            <input id="selectCity" hidden="hidden" value="${city}">
                            <input id="selectCounty" hidden="hidden" value="${county}">
                            <select id="province" name="province" style="width:120px;float:left;"
                                    class="form-control">
                                <option value="0">请选择省份</option>
                            </select>  
                            <select id="city" name="city" style="width:120px;float:left;" class="form-control">
                                <option value="0">请选择市</option>
                            </select>  
                            <select id="county" name="county" style="width:120px;float:left;"
                                    class="form-control">
                                <option value="0">请选择区/县</option>
                            </select>
                        </div>
                        <div class="input-group col-sm-3 " style=" float:left;">
                            <input type="text" name="key" placeholder="位置名称"
                                   class="col-sm-10 col-md-10 form-control"
                                   value="${keyword}" value="${param.key}"/>
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-primary btn-flat" onclick="searchLocation()">搜索
                            </button>
                        </span>
                        </div>
                        <div class="col-sm-3">
                            <a href="/location/add" class="btn btn-success ">添加位置</a>
                        </div>
                    </form>

                    <table id="js_table" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>位置名称</th>
                            <th>经纬坐标</th>
                            <th>邮编</th>
                            <th>更新时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="location" items="${locationList.data}" varStatus="item">
                            <tr>
                                <td width="10%">${item.index +1}</td>
                                <td width="20%"><a href="/location/detail?id=${location.id}">${location.name}</a></td>
                                <td width="30%">${location.lon},${location.lat}</td>
                                <td width="10%">${location.postcode}</td>
                                <td width="10%">${location.updatetime}</td>
                                <td width="20%">
                                    <a href="/location/add?id=${location.id}">
                                        <i class="fa fa-pencil-square-o"></i>编辑
                                    </a>
                                    <a href="javascript:deleteLocation('${location.id}');">
                                        <i class="fa fa-pencil-square-o"></i>删除
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
                <div class="box-footer clearfix">
                    <ez:page pageSize="${locationList.pageSize}" pageNum="${locationList.pageNum}"
                             total="${locationList.total}"
                             uri="/location/list">111</ez:page>
                </div>
                <!-- /.box-footer -->
            </div>
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>
<!-- /.content -->


<script src="/static/js/lib/datatables/jquery.dataTables.min.js?ver=${staticVersion}"></script>
<script src="/static/js/lib/datatables/dataTables.bootstrap.min.js?ver=${staticVersion}"></script>
<script src="/static/js/lib/select2/select2.full.min.js?ver=${staticVersion}"></script>
<script src="/static/js/common/common-util.js?ver=${staticVersion}"></script>
<script>
    $(function () {
        var ownerIdSelectTag = $("#js_channel_select");
        var searchUrl = "/channelCompany/searchChannelSelect";
        var select2Options;
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

        select2Options = {
            placeholder: "选择中间商,不选默认全部",
            minimumInputLength: 1,
            allowClear: true,
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
        if (ownerIdSelectTag) {
            ownerIdSelectTag.select2(select2Options);
        }

        //----------------------地址搜索---------------
        var provinceTag = $("#province");
        var cityTag = $("#city");
        var countyTag = $("#county");
        var provinceCode = $('#selectProvince').val();
        var cityCode = $('#selectCity').val();
        var countyCode = $('#selectCounty').val();

        console.info(provinceCode, cityCode, countyCode)
        provinceTag.select2();
        cityTag.select2();
        countyTag.select2();

        if (provinceCode) {
            appendProvince(provinceTag, provinceCode);
            getCityOrgCounty(cityTag, provinceCode, cityCode);
            getCityOrgCounty(countyTag, cityCode, countyCode);
            console.info("dd3")

        } else {
            appendProvince(provinceTag, provinceCode);
        }

        provinceTag.change(provinceTag, function () {
            var pid = provinceTag.find("option:selected").val();
            console.info("dd4")
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
            console.info(tag,pid,initId)
            Area.getCityOrCounty(pid, function (r) {
                console.info(r)
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

    });
    function searchLocation() {
        var form = document.forms[0];
        form.submit();
    }
    function deleteLocation(locationId) {
        var param = {
            "id": locationId
        }
        _showPop({
            type: "success",
            title: "系统提示",
            content: "确认删除吗？",
            ok: {
                name: '确定',
                callback: function () {
                    $.get("/location/delete", $.param(param), function (r) {
                        if (r) {
                            if (r.code == 0) {
                                _showPop({
                                    type: "success",
                                    title: "删除成功",
                                    content: "删除成功!",
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
                    });
                }
            }
        });
    }
</script>

</body>
</html>