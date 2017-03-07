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
    <title>短信通知详情</title>
</head>
<body>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <!-- Horizontal Form -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">短信通知详情</h3>
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
                                <td>发生时间</td>
                                <td>${smsTask.eventTime}</td>
                            </tr>
                            <tr>
                                <td>触发源id</td>
                                <td>${smsTask.keyId}</td>
                            </tr>
                            <tr>
                                <td>事件id</td>
                                <td><a href="/admin/event/r/detail?id=${smsTask.eventId}">${smsTask.eventId}</a></td>
                            </tr>
                            <tr>
                                <td>内容</td>
                                <td>${smsTask.content}</td>
                            </tr>
                            <tr>
                                <td>发送时间</td>
                                <td>${smsTask.sendTime}</td>
                            </tr>
                            <tr>
                                <td>发送号码</td>
                                <td>${smsTask.phone}</td>
                            </tr>
                            <tr>
                                <td>添加时间</td>
                                <td>${smsTask.createTime}</td>
                            </tr>
                            <tr>
                                <td>修改时间</td>
                                <td>${smsTask.updateTime}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <!-- /.box-footer -->
                    <div class="box-footer">
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

    })
</script>

</body>
</html>
