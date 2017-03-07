W<%--
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
    <title>管理员账号列表</title>
    <link rel="stylesheet"
          href="/static/js/lib/datatables/dataTables.bootstrap.css?ver=${staticVersion}">
</head>
<body>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">管理员账号管理</h3>
                </div>
                <div class="">

                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form id="search" action="/account/manager/list" method="post">
                        <div class="input-group " style="width:300px; float:left;">
                            <input type="text" name="key" placeholder="姓名/账号" class="form-control" value="${keyword}"/>
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-primary btn-flat" onclick="searchAccounts()">搜索
                            </button>
                        </span>
                        </div>
                        <div class="col-xs-2">
                            <a href="/account/manager/add?fromView=list" class="btn btn-success ">添加管理员账号</a>
                        </div>
                    </form>

                    <table id="js_table" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>姓名</th>
                            <th>账号</th>
                            <th>EMAIL</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="account" varStatus="item" items="${accountPage.data}">
                            <tr>
                                <td width="10%">${item.index}</td>
                                <td width="20%">${account.name}</td>
                                <td width="25%">${account.ucode}</td>
                                <td width="25%">${account.email}</td>
                                <td width="20%">
                                    <a href="/account/manager/add?ucode=${account.ucode}&fromView=list">
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
                             total="${accountPage.total}" uri="/account/manager/list"></ez:page>
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
<script>
    $(function () {
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
    });

    function searchAccounts() {
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
                                            window.location.href = "/account/manager/list";
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
