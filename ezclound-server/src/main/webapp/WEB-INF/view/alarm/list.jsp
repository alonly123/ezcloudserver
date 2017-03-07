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
    <title>告警管理</title>
    <link rel="stylesheet"
          href="/static/js/lib/datatables/dataTables.bootstrap.css?ver=${staticVersion}">
    <link rel="stylesheet"
          href="/static/js/lib/daterangepicker/daterangepicker-bs3.css?ver=${staticVersion}">
</head>
<body>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">告警管理</h3>
                </div>
                <div class="">

                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form id="search" action="/alarm/r/list" method="post">
                        <div class="input-group col-xs-8" style="float:left;">
                            <div class="input-group-addon">
                                <i class="fa fa-clock-o"></i>
                            </div>
                            <input type="text" name="timeZone" class="form-control pull-right" id="js-datepicker"
                                   placeholder="点击选择时间" value="${timeZone}" readonly>
                        </div>
                        <div class="col-xs-2">
                            <button onclick="search()" class="btn btn-success ">查询</button>
                        </div>
                    </form>

                    <table id="js_table" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>告警名</th>
                            <th>告警类型</th>
                            <th>告警等级</th>
                            <th>告警时间</th>
                            <th>设备code</th>
                            <th>添加时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="alarm" varStatus="item" items="${page.data}">
                            <tr>
                                <td width="10%">${item.index + 1}</td>
                                <td width="15%"><a href="/alarm/r/detail?id=${alarm.id}"
                                                   target="_blank">${alarm.name}</a></td>
                                <td width="10%">${alarm.alarmType}</td>
                                <td width="10%">${alarm.alarmLevel}</td>
                                <td width="15%">${alarm.alarmTime}</td>
                                <td width="15%">${alarm.hostUcode}</td>
                                <td width="10%">${alarm.createTime}</td>
                                <td width="15%">
                                    <a href="javascript:void(0);" class="js_ack_btn" data-id="${alarm.id}">
                                        <i class="fa fa-pencil-square-o"></i>确认
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
                             total="${page.total}" uri="/alarm/r/list"></ez:page>
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
<script src="/static/js/lib/daterangepicker/moment.min.js?ver=${staticVersion}"></script>
<script src="/static/js/lib/daterangepicker/daterangepicker.js?ver=${staticVersion}"></script>
<script src="/static/js/page/alarm/alarm.js?ver=${staticVersion}"></script>

<script>
    $(function () {
        $("#js-datepicker").daterangepicker({
            "locale": {
                "format": "MM/DD/YYYY HH:mm:ss",
                "separator": " - ",
                "applyLabel": "确定",
                "cancelLabel": "取消",
                "fromLabel": "从",
                "toLabel": "到",
                "customRangeLabel": "Custom",
                "daysOfWeek": [
                    "日",
                    "一",
                    "二",
                    "三",
                    "四",
                    "五",
                    "六"
                ],
                "monthNames": [
                    "一月",
                    "二月",
                    "三月",
                    "四月",
                    "五月",
                    "六月",
                    "七月",
                    "八月",
                    "九月",
                    "十月",
                    "十一月",
                    "十二月"
                ],
                "firstDay": 1
            },
            "autoApply": true,
            "timePicker": true,
            "timePicker24Hour": false,
            "autoApply": true,
            "opens": 'center',
            timePickerIncrement: 10,
            format: 'YYYY/MM/DD HH:mm:ss'
        });

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

        $(".js_ack_btn").on("click", function () {
            ack($(this));
        });
    });

    function ack(eventTag) {
        var id = eventTag.data("id");
        var data = {"id": id};
        Alarm.ack(data, function (r) {
            if (r) {
                if (r.code == 0) {
                    window.location.reload();
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

    function search() {
        var form = document.forms[0];
        form.submit();
    }


</script>

</body>
</html>
