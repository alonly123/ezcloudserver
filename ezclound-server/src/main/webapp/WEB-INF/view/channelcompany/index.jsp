<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>首页</title>
</head>
<body>
<style>
    .box-info-overlay {
        border-top: none;

    }

    .box-info-overlay .overlay {
        border-radius: 2px;
    }
</style>

<!-- Main content -->
<section class="content">
    <!-- Info boxes -->

    <div class="row">
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="box box-info-overlay">
                <div class="info-box">
                    <span class="info-box-icon bg-green"><i class="fa fa-users"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">客户数量</span>
                        <span class="info-box-number" id="js_customer_count"></span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <div class="overlay js_overlay">
                    <i class="fa fa-refresh fa-spin"></i>
                </div>
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="box box-info-overlay">
                <div class="info-box">
                    <span class="info-box-icon bg-yellow"><i class="fa fa-warning"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">客户告警数</span>
                        <span class="info-box-number" id="js_customer_warning_count"></span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <div class="overlay js_overlay">
                    <i class="fa fa-refresh fa-spin"></i>
                </div>
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="box box-info-overlay">
                <div class="info-box">
                    <span class="info-box-icon bg-red"><i class="fa fa-bolt"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">客户严重数</span>
                        <span class="info-box-number" id="js_customer_danger_count"></span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <div class="overlay js_overlay">
                    <i class="fa fa-refresh fa-spin"></i>
                </div>
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="box box-info-overlay">
                <div class="info-box">
                    <span class="info-box-icon bg-green"><i class="fa fa-tv"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">设备总数</span>
                        <span class="info-box-number" id="js_monitor_count"></span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <div class="overlay js_overlay">
                    <i class="fa fa-refresh fa-spin"></i>
                </div>
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="box box-info-overlay">
                <div class="info-box">
                    <span class="info-box-icon bg-gray"><i class="fa fa-power-off"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">下线数</span>
                        <span class="info-box-number" id="js_monitor_offline_count"></span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <div class="overlay js_overlay">
                    <i class="fa fa-refresh fa-spin"></i>
                </div>
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="box box-info-overlay">
                <div class="info-box">
                    <span class="info-box-icon bg-yellow"><i class="fa fa-warning"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">告警数</span>
                        <span class="info-box-number" id="js_monitor_warning_count">0</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <div class="overlay js_overlay">
                    <i class="fa fa-refresh fa-spin"></i>
                </div>
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="box box-info-overlay">
                <div class="info-box">
                    <span class="info-box-icon bg-red"><i class="fa fa-bolt"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">严重数</span>
                        <span class="info-box-number" id="js_monitor_danger_count">0</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <div class="overlay js_overlay">
                    <i class="fa fa-refresh fa-spin"></i>
                </div>
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->
    </div>


    <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="box box-info-overlay">
                <div class="info-box">
                    <span class="info-box-icon bg-green"><i class="fa fa-tv"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">外设总数</span>
                        <span class="info-box-number" id="js_target_device_count"></span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <div class="overlay js_overlay">
                    <i class="fa fa-refresh fa-spin"></i>
                </div>
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->
    </div>

</section>
<!-- /.content -->
<script>
    $(function () {
        init();
    });
    function init() {
        $.ajax({
            dataType: 'json',
            type: 'post',
            url: '/channelCompany/index',
            success: function (r) {
                if (r.success == true) {
                    $("#js_customer_count").html(r.data.customerCount);
                    $("#js_customer_warning_count").html(r.data.customerWarningCount);
                    $("#js_customer_danger_count").html(r.data.customerDangerCount);
                    $("#js_monitor_count").html(r.data.monitorCount);
                    $("#js_monitor_offline_count").html(r.data.monitorOfflineCount);
                    $("#js_monitor_warning_count").html(r.data.monitorWarningCount);
                    $("#js_monitor_danger_count").html(r.data.monitorDangerCount);
                    $("#js_target_device_count").html(r.data.targetDeviceCount);
                    $(".js_overlay").hide();
                } else {
                    _showPop({
                        type: "error",
                        content: r.msg
                    });
                }
            },
            error: function () {
                _showPop({
                    type: "error",
                    content: "数据加载失败!"
                });
            }
        });

    }
</script>

</body>
</html>