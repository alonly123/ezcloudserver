<%--
  Created by IntelliJ IDEA.
  User: chunteng
  Date: 2016/3/28
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
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
    <title>账号详情</title>
</head>
<body>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <!-- Horizontal Form -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">账号详情</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal">

                    <div class="box-body">
                        <table id="js_table" class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th width="20%">属性</th>
                                <th width="80%">内容</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>账号</td>
                                <td>${accountInfo.ucode}</td>
                            </tr>
                            <tr>
                                <td>姓名</td>
                                <td>${accountInfo.name}</td>
                            </tr>
                            <tr>
                                <td>邮箱</td>
                                <td>${accountInfo.email}</td>
                            </tr>
                            <tr>
                                <td>账号类型</td>
                                <td>${accountInfo.roleTypeName}</td>
                            </tr>
                            <tr>
                                <td>所有者类型</td>
                                <td>${accountInfo.ownerTypeName}</td>
                            </tr>
                            <c:if test="${accountInfo.ownerType != '2'}">
                                <tr>
                                    <td>所有者名称</td>
                                    <td>${accountInfo.ownerName}</td>
                                </tr>
                            </c:if>
                            <tr>
                                <td>说明</td>
                                <td>${accountInfo.descr}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <!-- /.box-footer -->
                    <div class="box-footer">
                        <c:if test="${accountInfo.ownerType == '2'}">
                            <button type="button" class="btn btn-info pull-right" id="editAccount"
                                    data-url="/account/manager/add?ucode=${accountInfo.ucode}&fromView=detail">
                                修改
                            </button>
                        </c:if>
                        <c:if test="${accountInfo.ownerType != '2'}">
                            <button type="button" class="btn btn-info pull-right" id="editAccount"
                                    data-url="/account/simple/add?ucode=${accountInfo.ucode}&fromView=detail">
                                修改
                            </button>
                        </c:if>
                    </div>
                </form>
            </div>
            <!-- /.box -->
            <!-- general form elements disabled -->
        </div>
    </div>
</section>

<script src="/static/js/lib/datatables/jquery.dataTables.min.js?ver=${staticVersion}"></script>
<script src="/static/js/lib/datatables/dataTables.bootstrap.min.js?ver=${staticVersion}"></script>
<script>
    $(function () {

        $('#js_table').DataTable({
            "paging": false,
            "lengthChange": false,
            "searching": false,
            "ordering": false,
            "info": false,
            "autoWidth": false
        });

        $('#editAccount').on("click", function () {
            var url = $(this).attr("data-url");
            window.location.href = url;
        })
    })
</script>

</body>
</html>
