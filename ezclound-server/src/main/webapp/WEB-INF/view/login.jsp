<%--
  Created by IntelliJ IDEA.
  User: lixiangyang
  Date: 16/4/1
  Time: 下午10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登录</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <link href="/static/css/lib/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="/static/css/lib/font-awesome.min.css"/>
    <link href="/static/css/lib/ionicons.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/css/lib/AdminLTE.min.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="/static/js/lib/iCheck/square/blue.css">

    <!-- jQuery 2.1.4 -->
    <script src="/static/js/lib/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="/static/js/lib/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="/static/js/lib/iCheck/icheck.min.js"></script>

</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <b>亿纵</b>云综合管理系统
    </div>
    <div class="login-box-body">
        <p class="login-box-msg">登录</p>

        <form>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="账号" id="js_ucode">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="密码" id="js_password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox" id="js_remember"> 记住账号
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="button" class="btn btn-primary btn-block btn-flat" id="js_login">登录
                    </button>
                </div>
                <!-- /.col -->
            </div>
        </form>
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->


<%--<%@include file="/decorators/modal.jsp"%>--%>

<jsp:include page="/decorators/modal.jsp"></jsp:include>

<script src="/static/js/common/common-util.js?ver=${staticVersion}"></script>
<script>
    $(function () {
        init();

        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });

        $("#js_login").on("click", function () {
            submit();
        });

        $(document).keypress(function (e) {
            if (e.which == 13) {
                $("#js_login").click();
            }
        });

        function init() {
            var ucode = Cookie.get("_username");
            $("#js_ucode").val(ucode);
            if (ucode && ucode != '') {
                $("#js_remember").prop("checked", true);
            }
        }

        function bindSubmit() {
            $("#js_login").on("click", function () {
                submit();
            }).removeAttr("disabled").text("登录");
        }

        function unbindSubmit() {
            $("#js_login").off("click").attr("disabled", "disabled").html("登录&nbsp;<i class='fa fa-refresh fa-spin'></i>");
        }

        function setRemember(ucode) {
            if ($("#js_remember").prop("checked") == true) {
                Cookie.set("_username", ucode, 30);
            }
        }

        function clearRemember() {
            Cookie.delete("_username");
        }


        var submit = function () {
            var ucode = $("#js_ucode").val();
            var password = $("#js_password").val();
            if (!ucode || ucode == '') {
                _showPop({
                    type: "error",
                    content: "请输入正确登录名"
                });
                return false;
            }

            if (!password || password == '') {
                _showPop({
                    type: "error",
                    content: "请输入正确密码"
                });
                return false;
            }


            data = {"uCode": ucode, "password": password};
            unbindSubmit();
            $.ajax({
                dataType: 'json',
                type: 'post',
                url: "/login/do",
                data: data,
                success: function (r) {
                    if (r) {
                        if (r.code == 0) {
                            setRemember(ucode);
                            window.location.href = "/";
                            bindSubmit();
                        } else {
                            clearRemember();
                            _showPop({
                                type: "error",
                                title: "登录失败",
                                content: "登录失败，" + r.msg
                            });
                            bindSubmit();
                        }
                    } else {
                        clearRemember();
                        _showPop({
                            type: "error",
                            title: "登录失败",
                            content: "登录失败"
                        });
                        bindSubmit();
                    }
                },
                error: function (r) {
                    clearRemember();
                    _showPop({
                        type: "error",
                        title: "登录失败",
                        content: "登录失败"
                    });
                    bindSubmit();
                }
            });
        }
    });
</script>
</body>
</html>
