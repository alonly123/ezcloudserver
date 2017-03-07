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
    <title>外设型号管理</title>
    <link rel="stylesheet"
          href="/static/js/lib/datatables/dataTables.bootstrap.css?ver=${staticVersion}">
</head>
<body>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">外设型号管理</h3>
                </div>
                <div class="">

                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form id="search" action="/admin/TargetDeviceModel/list" method="post">
                        <div class="input-group " style="width:300px; float:left;">
                            <input type="text" name="key" placeholder="外设型号名称" class="form-control"
                                   value="${param.key}"/>
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-primary btn-flat" onclick="searchAccounts()">搜索
                                </button>
                            </span>
                        </div>
                    </form>

                    <table id="js_table" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>名称</th>
                            <th>内部型号编码</th>
                            <th>型号编码</th>
                            <th>供应商</th>
                            <th>说明</th>
                            <th>修改时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="targetDeviceModel" varStatus="item" items="${page.data}">
                            <tr>
                                <td width="5%">${item.index + 1}</td>
                                <td width="15%"><a
                                        href="/admin/TargetDeviceModel/detail?id=${targetDeviceModel.id}">${targetDeviceModel.name}</a>
                                </td>
                                <td width="10%">${targetDeviceModel.model}</td>
                                <td width="10%">${targetDeviceModel.longModel}</td>
                                <td width="15%">${targetDeviceModel.vendor}</td>
                                <td width="15%">${targetDeviceModel.descr}</td>
                                <td width="10%">${targetDeviceModel.updateTime}</td>
                                <td width="20%">
                                    <a href="/admin/TargetDeviceModel/detail?id=${targetDeviceModel.id}">
                                        <i class="fa fa-info-circle"></i>查看
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
                <div class="box-footer clearfix">
                    <ez:page pageSize="${page.pageSize}" pageNum="${page.pageNum}"
                             total="${page.total}" uri="/admin/TargetDeviceModel/list"></ez:page>
                </div>
                <!-- /.box-footer -->
            </div>
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->

    <div class="modal" id="js_edit_modal" style="display:none">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span--%>
                    <%--aria-hidden="true">&times;</span></button>--%>
                    <h4 class="modal-title">编辑外设型号</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="ucode" class="col-sm-2 control-label">账号</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="ucode" placeholder="账号"
                                           value="">

                                </div>
                            </div>
                            <div class="form-group">
                                <label for="uname" class="col-sm-2 control-label">姓名</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="uname" placeholder="姓名"
                                           value="">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="email" class="col-sm-2 control-label">邮箱</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="email" placeholder="邮箱"
                                           value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="descr" class="col-sm-2 control-label">说明</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="descr" placeholder="说明"
                                           value="">
                                </div>
                            </div>

                        </div>
                        <!-- /.box-footer -->
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary">保存</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->


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
</script>

</body>
</html>
