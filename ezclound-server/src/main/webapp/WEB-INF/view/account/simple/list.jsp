<%--
  Created by IntelliJ IDEA.
  User: chunteng
  Date: 2016/3/28
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>账号管理</title>
    <link rel="stylesheet" href="/static/js/lib/datatables/dataTables.bootstrap.css?ver=${staticVersion}">
</head>
<body>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">普通账号管理</h3>
                </div>
                <div class="">

                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form action="/account/simple/list" method="post" id="searchSimpleAccount">
                        <select class="form-control col-xs-2" id="js_owner_type" style="width:100px; float:left;"
                                name="ownertype">
                            <option value="0"
                                    <c:if test="${ownertype == '0'}">selected="selected" </c:if>>中间商
                            </option>
                            <option value="1"
                                    <c:if test="${ownertype == '1'}">selected="selected" </c:if>>客户
                            </option>
                        </select>

                        <div class="col-sm-5" style="width:300px; float:left;">
                            <select class="form-control select2" id="js_owner_id_box" name="ownerId">
                                <option value="${selectView.id}">${selectView.name}</option>
                            </select>
                        </div>
                        <div class="input-group " style="width:300px; float:left;">
                            <input type="text" name="key" placeholder="姓名/账号" class="form-control" value="${keyword}"/>
                        </div>
                        <div style="float:left;">
                            <button onclick="searchSimpleAccount()" class="btn btn-success ">查询</button>
                        </div>
                        <div class="col-xs-2">
                            <a href="/account/simple/add" class="btn btn-success">添加账号</a>
                        </div>
                    </form>

                    <table id="js_table" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>账号</th>
                            <th>姓名</th>
                            <th>账号类型</th>
                            <th>EMAIL</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="account" varStatus="item" items="${accountPage.data}">
                            <tr>
                                <td width="10%">${item.index + 1}</td>
                                <td width="25%"><a href="/account/detail?ucode=${account.ucode}">${account.ucode}</a>
                                </td>
                                <td width="20%">${account.name}</td>
                                <td width="10%">${account.ownerTypeName}</td>
                                <td width="20%">${account.email}</td>
                                <td width="20%">
                                    <a href="/account/simple/add?ucode=${account.ucode}&fromView=list">
                                        <i class="fa fa-pencil-square-o"></i>编辑
                                    </a>
                                    <c:if test="${account.showDeleteBtn == true}">
                                        <a href="javascript:deleteAccount('${account.ucode}')">
                                            <i class="fa fa-pencil-square-o"></i>删除
                                        </a>
                                        <a href="javascript:resetPwd('${account.ucode}', '${account.name}')">
                                            <i class="fa fa-mail-reply"></i>重置密码
                                        </a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
                <div class="box-footer clearfix">
                    <ez:page pageSize="${accountPage.pageSize}" pageNum="${accountPage.pageNum}"
                             total="${accountPage.total}" uri="/account/simple/list"></ez:page>
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

        var ownerIdSelectTag = $("#js_owner_id_box");
        var searchUrl = "/channelCompany/searchChannelSelect";

        var select2Options = {
            placeholder: "请选择中间商",
            minimumInputLength: 1,
            ajax: {
                url: searchUrl,
                dataType: 'json',
                delay: 200,
                data: function (params) {
                    return {
                        key: params.term, // search term
                        page: params.page,
                        pid: 0
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
                                content: data.msg
                            });
                        }

                    } else {
                        _showPop({
                            type: "error",
                            content: "获取数据失败"
                        });
                    }

                },
                cache: true
            }
        }

        $("#js_owner_type").change(function () {
            //$("#js_owner_id_box").val();
            var ownerTypeDes = $("#js_owner_type  option:selected").text();
            var ownerType = $(this).val();


            $("#js_owner_type_des").val(ownerTypeDes);
            $("#js_owner_id_label").html(ownerTypeDes);

            if (0 == ownerType) {
                searchUrl = "/channelCompany/searchChannelSelect";
            } else if (1 == ownerType) {
                searchUrl = "/customer/searchCustomerSelect";
            }
            ownerIdSelectTag.val("");

            select2Options.ajax.url = searchUrl;

            select2Options.placeholder = "请选择" + ownerTypeDes;

            ownerIdSelectTag.select2(select2Options);
        });
        var ownerType = $('#js_owner_type').val();
        if (ownerType == 1) {
            select2Options.placeholder = "请选择客户";
        } else {
            select2Options.placeholder = "请选择中间商";
        }
        ownerIdSelectTag.select2(select2Options);

    });
    function searchSimpleAccount() {
        var form = document.forms[0];
        form.submit();
    }
    function deleteAccount(ucode) {
        var param = {
            "ucode": ucode
        };
        _showPop({
            type: "success",
            title: "系统提示",
            content: "确认删除吗？",
            ok: {
                name: '确定',
                callback: function () {
                    $.get("/account/delete_account", $.param(param), function (r) {
                        if (r) {
                            if (r.code == 0) {
                                _showPop({
                                    type: "success",
                                    title: "删除成功",
                                    content: "删除成功!",
                                    ok: {
                                        name: '确定',
                                        callback: function () {
                                            window.location.href = "/account/simple/list";
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

    function resetPwd(ucode, uname) {
        var param = {
            "ucode": ucode
        };
        _showPop({
            type: "success",
            title: "系统提示",
            content: "确认重置" + uname + "的密码吗？",
            ok: {
                name: '确定',
                callback: function () {
                    $.get("/account/reset_pwd", $.param(param), function (r) {
                        if (r) {
                            if (r.code == 0) {
                                _showPop({
                                    type: "success",
                                    title: "密码重置成功",
                                    content: "密码重置成功！新密码为今天日期（例如20160101)",
                                    ok: {
                                        name: '确定',
                                        callback: function () {
                                            window.location.reload();
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
