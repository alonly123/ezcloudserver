<%--
  Created by IntelliJ IDEA.
  User: luochunteng
  Date: 2016/4/2
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>中间商管理</title>
    <link rel="stylesheet"
          href="/static/js/lib/datatables/dataTables.bootstrap.css?ver=${staticVersion}">
</head>
<body>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">中间商管理</h3>
                </div>
                <div class="">

                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form id="searchCompany" action="/channelCompany/list" method="post">
                        <div class="input-group " style="width:300px; float:left;">
                            <input type="text" name="key" placeholder="中间商名称"
                                   class="form-control" value="${keyword}"/>
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-primary btn-flat" onclick="searchCompany()">搜索
                            </button>
                        </span>
                        </div>
                        <div class="col-xs-2">
                            <a href="/channelCompany/add" class="btn btn-success ">添加中间商</a>
                        </div>
                    </form>

                    <table id="js_table" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>中间商名称</th>
                            <th>联系人</th>
                            <th>移动电话</th>
                            <th>固定电话</th>
                            <th>销量</th>
                            <th>创建时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="channelCompany" varStatus="item" items="${channelCompanyPage.data}">
                            <tr>
                                <td width="5%">${item.index + 1}</td>
                                <td width="20%" title="${channelCompany.name}"><a
                                        href="/channelCompany/detail?id=${channelCompany.id}">${channelCompany.name}</a>
                                </td>
                                <td width="12%" title="${channelCompany.contacts}">${channelCompany.contacts}</td>
                                <td width="10%" title="${channelCompany.mphone}">${channelCompany.mphone}</td>
                                <td width="15%" title="${channelCompany.phone}">${channelCompany.phone}</td>
                                <td width="8%">${channelCompany.saleVolume}</td>
                                <td width="15%">${channelCompany.createTime}</td>
                                <td width="15%">
                                    <a href="/channelCompany/add?id=${channelCompany.id}">
                                        <i class="fa fa-pencil-square-o"></i>编辑
                                    </a>
                                    <c:if test="${channelCompany.showDeleteBtn == true}">
                                        <a href="javascript:deleteCompany('${channelCompany.id}');"
                                           data-companyId="${channelCompany.id}" id="deleteCompany">
                                            <i class="fa fa-pencil-square-o"></i>删除
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
                    <ez:page pageSize="${channelCompanyPage.pageSize}" pageNum="${channelCompanyPage.pageNum}"
                             total="${channelCompanyPage.total}" uri="/channelCompany/list">111</ez:page>
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
    function deleteCompany(companyId) {
        var param = {
            "id": companyId
        }
        _showPop({
            type: "success",
            title: "系统提示",
            content: "确认删除吗？",
            ok: {
                name: '确定',
                callback: function () {
                    $.get("/channelCompany/delete", $.param(param), function (r) {
                        if (r) {
                            if (r.code == 0) {
                                _showPop({
                                    type: "success",
                                    title: "删除成功",
                                    content: "删除成功!",
                                    ok: {
                                        name: '确定',
                                        callback: function () {
                                            window.location.href = "/channelCompany/list";
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
    function searchCompany() {
        var form = document.forms[0];
        form.submit();
    }
</script>

</body>
</html>