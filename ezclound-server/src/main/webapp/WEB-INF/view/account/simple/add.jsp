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
    <title>编辑普通账号</title>
</head>
<body>
<section class="content">
    <div class="col-md-12">
        <!-- Horizontal Form -->
        <div class="box box-info">
            <div class="box-header with-border">
                <c:choose>
                    <c:when test="${isAdd == true}">
                        <h3 class="box-title" id="pageTitle">新增普通账号</h3>
                    </c:when>
                    <c:otherwise>
                        <h3 class="box-title" id="pageTitle">编辑普通账号</h3>
                    </c:otherwise>
                </c:choose>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal">
                <c:if test="${accountInfo.ownerType != '1'}">
                    <input type="hidden" id="js_owner_type_des" value="中间商">
                </c:if>
                <c:if test="${accountInfo.ownerType == '1'}">
                    <input type="hidden" id="js_owner_type_des" value="客户">
                </c:if>

                <div class="box-body">
                    <div class="form-group">
                        <label for="js_owner_type" class="col-sm-2 control-label">账号类型</label>

                        <div class="col-sm-5">
                            <c:if test="${isCanEdit == true}">
                                <select class="form-control" id="js_owner_type">
                                    <option value="0"
                                            <c:if test="${accountInfo.ownerType == '0'}">selected="selected" </c:if>>中间商
                                    </option>
                                    <option value="1"
                                            <c:if test="${accountInfo.ownerType == '1'}">selected="selected" </c:if>>客户
                                    </option>
                                </select>
                            </c:if>
                            <c:if test="${isCanEdit == false}">
                                <select class="form-control" id="js_owner_type" disabled>
                                    <option value="0"
                                            <c:if test="${accountInfo.ownerType == '0'}">selected="selected" </c:if>>中间商
                                    </option>
                                    <option value="1"
                                            <c:if test="${accountInfo.ownerType == '1'}">selected="selected" </c:if>>客户
                                    </option>
                                </select>
                            </c:if>
                        </div>
                        <div class="col-sm-4 bg-yellow color-palette hidden js_error_msg">
                        </div>
                    </div>
                    <div class="form-group">
                        <c:if test="${accountInfo.ownerType != '1'}">
                            <label for="js_owner_id_box" id="js_owner_id_label"
                                   class="col-sm-2 control-label">中间商</label>
                        </c:if>
                        <c:if test="${accountInfo.ownerType == '1'}">
                            <label for="js_owner_id_box" id="js_owner_id_label"
                                   class="col-sm-2 control-label">客户</label>
                        </c:if>

                        <div class="col-sm-5">
                            <c:if test="${isCanEdit}">
                                <select class="form-control select2" id="js_owner_id_box">
                                    <option value="${selectView.id}">${selectView.name}</option>
                                </select>
                            </c:if>

                            <c:if test="${!isCanEdit}">
                                <select class="form-control select2" id="js_owner_id_box" disabled>
                                    <option value="${selectView.id}">${selectView.name}</option>
                                </select>
                            </c:if>
                        </div>
                        <div class="col-sm-4 bg-yellow color-palette hidden js_error_msg">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ucode" class="col-sm-2 control-label">账号</label>

                        <div class="col-sm-5">

                            <c:if test="${isCanEdit == true}">
                                <input type="text" class="form-control" id="ucode" placeholder="账号"
                                       value="${accountInfo.ucode}">
                            </c:if>
                            <c:if test="${isCanEdit == false}">
                                <input type="text" class="form-control" id="ucode" placeholder="账号"
                                       value="${accountInfo.ucode}" disabled>
                            </c:if>
                        </div>
                        <div class="col-sm-4 bg-yellow color-palette hidden js_error_msg">
                        </div>
                    </div>
                    <c:if test="${isAdd == true}">
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">密码</label>

                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="password" placeholder="密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="repeat_password" class="col-sm-2 control-label">重复密码</label>

                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="repeat_password" placeholder="重复密码">
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
                            <input type="test" class="form-control" id="email" placeholder="邮箱"
                                   value="${accountInfo.email}" onblur="validateEmail(this)">
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
                    <button type="button" class="btn btn-info pull-right" id="js_save" data-isAdd="${isAdd}"
                            data-id="${accountInfo.id}">保存
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


<script src="/static/js/lib/select2/select2.full.min.js?ver=${staticVersion}"></script>
<script type="text/javascript" src="/static/js/page/account/simple/add.js?ver=${staticVersion}"></script>
<script>
    var isAdd = $('#isAdd').val(),
            fromView = $('#fromView').val();
    function checkEmail(email) {
        if (!email || email == "") {
            return true;
        }
        var reMail = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        if (reMail.test(email)) {
            return true;
        }
        return false;
    }

    function validateEmail(item) {
        var email = $.trim($(item).val());
        if (!checkEmail(email)) {
            if (!checkEmail(email)) {
                _showPop({
                    type: "error",
                    title: "失败",
                    content: "邮箱格式有误！"
                });
            }
        }
    }
</script>

</body>
</html>
