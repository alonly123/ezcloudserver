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
    <title>告警详情</title>
</head>
<body>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <!-- Horizontal Form -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">告警详情</h3>
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
                                <td>告警名称</td>
                                <td>${alarm.name}</td>
                            </tr>
                            <tr>
                                <td>告警类型</td>
                                <td>${alarm.alarmType}</td>
                            </tr>
                            <tr>
                                <td>告警等级</td>
                                <td>${alarm.alarmLevel}</td>
                            </tr>
                            <tr>
                                <td>设备code</td>
                                <td>${alarm.hostUcode}</td>
                            </tr>
                            <tr>
                                <td>告警内容</td>
                                <td>${alarm.content}</td>
                            </tr>
                            <tr>
                                <td>告警时间</td>
                                <td>${alarm.alarmTime}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <!-- /.box-footer -->
                    <div class="box-footer">
                        <a href="/alarm/r/list" class="btn btn-info pull-right">返回</a> &nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-info pull-right" id="js_ack_btn" data-id="${alarm.id}">
                            确认告警
                        </button>
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
<script src="/static/js/page/alarm/alarm.js?ver=${staticVersion}"></script>

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

        $("#js_ack_btn").click(function () {
            ack($(this));
        });

        function ack(eventTag) {
            var id = eventTag.data("id");
            var data = {"id": id};
            Alarm.ack(data, function (r) {
                if (r) {
                    if (r.code == 0) {
                        window.location.reload();
                        _showPop({
                            type: "success",
                            title: "确认成功",
                            content: "告警确认成功! 点击确定返回告警列表",
                            ok: {
                                name: '确定',
                                callback: function () {
                                    window.location.href = "/alarm/r/list";
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
                } else {
                    _showPop({
                        type: "error",
                        title: "错误",
                        content: "告警确认失败"
                    });
                }
            });
        }
    })
</script>

</body>
</html>
