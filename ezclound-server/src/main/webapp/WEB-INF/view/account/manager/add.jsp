W<%--
  Created by IntelliJ IDEA.
  User: chunteng
  Date: 2016/3/28
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>新增管理员账号</title>
</head>
<body>
<section class="content">
    <div class="col-md-12">
        <!-- Horizontal Form -->
        <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title" id="pageTitle">编辑管理员账号</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <input type="hidden" value="${isAdd}" id="isAdd">
            <input type="hidden" value="${fromView}" id="fromView">

            <form class="form-horizontal">
                <div class="box-body">
                    <div class="form-group">
                        <label for="ucode" class="col-sm-2 control-label">账号</label>

                        <div class="col-sm-5">
                            <c:if test="${isAdd || (!isAdd && isCanEdit)}">
                                <input type="text" class="form-control" id="ucode" placeholder="账号"
                                       value="${accountInfo.ucode}">
                            </c:if>

                            <c:if test="${!isAdd && !isCanEdit}">
                                <input type="text" class="form-control" id="ucode" placeholder="账号"
                                       value="${accountInfo.ucode}" disabled>
                            </c:if>
                        </div>
                        <div class="col-sm-4 bg-yellow color-palette hidden js_error_msg">
                        </div>
                    </div>
                    <c:if test="${isAdd}">
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">密码</label>

                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="password"
                                       placeholder="密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="repeat_password" class="col-sm-2 control-label">重复密码</label>

                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="repeat_password"
                                       placeholder="重复密码">
                            </div>
                        </div>
                    </c:if>
                    <div class="form-group">
                        <label for="uname" class="col-sm-2 control-label">姓名</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="uname" placeholder="姓名"
                                   value="${accountInfo.name}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">邮箱</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="email" placeholder="邮箱"
                                   value="${accountInfo.email}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="descr" class="col-sm-2 control-label">说明</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="descr" placeholder="说明"
                                   value="${accountInfo.descr}">
                        </div>
                    </div>

                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="button" class="btn btn-info pull-right" id="addManagerAccount" data-isAdd="${isAdd}"
                            data-id="${accountInfo.id}">
                        保存
                    </button>
                    <button type="button" class="btn btn-info pull-right" id="cancelAdd">
                        取消
                    </button>
                </div>
                <!-- /.box-footer -->
            </form>
        </div>
        <!-- /.box -->
        <!-- general form elements disabled -->
    </div>
</section>
<script>
    var isAdd = $('#isAdd').val(),
            fromView = $('#fromView').val();
    console.info(fromView)
    $(function () {
        if (isAdd == "true") {
            $('#pageTitle').html("新增管理员账号");
        }
        $('#addManagerAccount').on("click", function () {
            var ucode = $('#ucode').val(),
                    password = $('#password').val(),
                    repeatPassword = $('#repeat_password').val(),
                    isAdd = $(this).attr("data-isAdd"),
                    accountInfo = {
                        "id": $(this).attr("data-id"),
                        "ucode": ucode,
                        "password": password,
                        "name": $('#uname').val(),
                        "email": $('#email').val(),
                        "descr": $('#descr').val()
                    };
            if (!ucode || $.trim(ucode) == '') {
                _showPop({
                    type: "error",
                    title: "错误",
                    content: "请输入账号"
                });
                return false;
            }
            if (isAdd == "true") {
                if (!password || $.trim(password) == '') {
                    _showPop({
                        type: "error",
                        title: "错误",
                        content: "请输入初始密码"
                    });
                    return false;
                }
                if (password.length < 6) {
                    _showPop({
                        type: "error",
                        title: "错误",
                        content: "密码长度必须不小于6位！"
                    });
                    return false;
                }
                if (password != repeatPassword || $.trim(repeatPassword) != $.trim(password)) {
                    _showPop({
                        type: "error",
                        title: "错误",
                        content: "两次密码不一致"
                    });
                    return false;
                }
            }
            $.ajax({
                dataType: 'json',
                type: 'post',
                url: "/account/manager/save",
                data: accountInfo,
                success: function (r) {
                    if (r) {
                        if (r.code == 0) {
                            _showPop({
                                type: "success",
                                title: "success",
                                content: "保存成功!",
                                ok: {
                                    name: '确定',
                                    callback: function () {
                                        if (fromView == "list") {
                                            window.location.href = "/account/manager/list";
                                        } else {
                                            window.location.href = "/account/detail?ucode=" + ucode;
                                        }
                                    }
                                }
                            });
                        } else {
                            _showPop({
                                type: "error",
                                title: "错误",
                                content: "保存失败，" + r.msg
                            });
                        }
                    } else {
                        _showPop({
                            type: "error",
                            title: "错误",
                            content: "保存失败"
                        });
                    }
                },
                error: function (r) {
                    _showPop({
                        type: "error",
                        title: "错误",
                        content: "保存失败"
                    });
                }
            });

        });

        $('#cancelAdd').on("click", function () {
            var ucode = $('#ucode').val();
            if (fromView == "list") {
                window.location.href = "/account/manager/list";
            } else {
                window.location.href = "/account/detail?ucode=" + ucode;
            }
        });
    });
</script>

</body>
</html>
