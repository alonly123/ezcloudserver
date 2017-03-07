<%--
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
    <title>修改密码</title>
</head>
<body>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <!-- Horizontal Form -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">修改密码</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="old_password" class="col-sm-2 control-label">旧密码</label>

                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="old_password" placeholder="旧密码">
                            </div>
                            <div class="col-sm-4 bg-yellow color-palette hidden js_error_msg">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">新密码</label>

                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="password" placeholder="新密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="repeat_password" class="col-sm-2 control-label">重复新密码</label>

                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="repeat_password" placeholder="重复新密码">
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <button type="button" class="btn btn-info pull-right" id="js_save">保存</button>
                    </div>
                    <!-- /.box-footer -->
                </form>
            </div>
            <!-- /.box -->
            <!-- general form elements disabled -->
        </div>
    </div>
</section>
<script>
    $(function () {
        $("#js_save").on("click", function () {
            submit();
        });

        $(document).keypress(function (e) {
            if (e.which == 13) {
                $("#js_save").click();
            }
        });

        function bindSubmit() {
            $("#js_save").on("click", function () {
                submit();
            }).removeAttr("disabled").text("保存");
        }

        function unbindSubmit() {
            $("#js_save").off("click").attr("disabled", "disabled").html("保存&nbsp;<i class='fa fa-refresh fa-spin'></i>");
        }

        function submit() {
            var oldPassword = $("#old_password").val();
            var password = $("#password").val();
            var repeatPassword = $("#repeat_password").val();

            if (!oldPassword || $.trim(oldPassword) == '') {
                _showPop({
                    type: "error",
                    title: "错误",
                    content: "旧密码输入错误"
                });
                return false;
            }
            if (!password || $.trim(password) == '') {
                _showPop({
                    type: "error",
                    title: "错误",
                    content: "新密码输入错误"
                });
                return false;
            }
            if (!repeatPassword || $.trim(repeatPassword) == '') {
                _showPop({
                    type: "error",
                    title: "错误",
                    content: "重复新密码输入错误"
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


            data = {"oldpwd": oldPassword, "newpwd": password};
            unbindSubmit();
            $.ajax({
                dataType: 'json',
                type: 'post',
                url: "/account/change_password",
                data: data,
                success: function (r) {
                    if (r) {
                        if (r.code == 0) {
                            _showPop({
                                type: "success",
                                title: "修改密码成功",
                                content: "修改密码成功，点击确定重新登录!!",
                                ok: {
                                    name: '确定',
                                    callback: function () {
                                        window.location.href = "/login/out";
                                    }
                                }
                            });
                            bindSubmit();
                        } else {
                            _showPop({
                                type: "error",
                                title: "保存失败",
                                content: "保存失败，" + r.msg
                            });
                            bindSubmit();
                        }
                    } else {
                        _showPop({
                            type: "error",
                            title: "保存失败",
                            content: "保存失败"
                        });
                        bindSubmit();
                    }
                },
                error: function (r) {
                    _showPop({
                        type: "error",
                        title: "保存失败",
                        content: "保存失败"
                    });
                    bindSubmit();
                }
            });
        }
    });
</script>

</body>
</html>
