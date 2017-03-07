<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title><sitemesh:write property='title'/>-亿纵云综合管理系统</title>
    <meta charset="UTF-8">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link href="/static/img/favicon.ico?ver=${staticVersion}" rel="icon" type="image/x-icon"/>
    <link href="/static/css/lib/bootstrap.min.css?ver=${staticVersion}" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="/static/css/lib/font-awesome.min.css?ver=${staticVersion}"/>
    <link href="/static/css/lib/ionicons.min.css?ver=${staticVersion}" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="/static/js/lib/select2/select2.min.css?ver=${staticVersion}"/>
    <link rel="stylesheet" href="/static/js/lib/jvectormap/jquery-jvectormap-1.2.2.css"/>
    <link href="/static/css/lib/AdminLTE.min.css?ver=${staticVersion}" rel="stylesheet" type="text/css"/>
    <link href="/static/css/lib/skins/skin-blue.min.css?ver=${staticVersion}" rel="stylesheet" type="text/css"/>
    <link href="/static/css/common/common.css?ver=${staticVersion}" rel="stylesheet" type="text/css"/>

    <!--[if lt IE 9]>
    <script src="/static/js/lib/html5shiv.min.js?ver=${staticVersion}"></script>
    <script src="/static/js/lib/respond.min.js?ver=${staticVersion}"></script>
    <![endif]-->


    <script src="/static/js/lib/react/react.min.js?ver=${staticVersion}"></script>
    <script src="/static/js/lib/react/react-dom.min.js?ver=${staticVersion}"></script>

    <script src="/static/js/lib/jQuery-2.1.4.min.js?ver=${staticVersion}"></script>
    <script src="/static/js/lib/bootstrap.min.js?ver=${staticVersion}" type="text/javascript"></script>
    <script src="/static/js/lib/app.min.js?ver=${staticVersion}" type="text/javascript"></script>

    <sitemesh:write property='head'/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <header class="main-header">

        <!-- Logo -->
        <a href="/" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>亿纵</b></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>亿纵</b>云综合管理系统</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- User Account Menu -->
                    <li class="dropdown user user-menu">
                        <!-- Menu Toggle Button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <!-- The user image in the navbar-->
                            <%--<img src="/static/img/user2-160x160.jpg" class="user-image" alt="User Image"/>--%>
                            <!-- hidden-xs hides the username on small devices so only the image appears. -->
                            <span class="hidden-xs">${sessionScope._login_user.name}</span>
                        </a>

                    </li>
                    <!-- Control Sidebar Toggle Button -->
                    <li>
                        <a href="/login/out" title="退出"><i class="fa fa-power-off"></i>退出</a>
                        <%--<a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>--%>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <jsp:include page="sidebar.jsp"/>

    <div class="content-wrapper">
        <sitemesh:write property='body'/>
    </div>


    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <%--<div class="pull-right hidden-xs">--%>
        <%--Anything you want--%>
        <%--</div>--%>
        <!-- Default to the left -->
        <strong>Copyright &copy; 2016 <a href="#">福州亿纵电子科技有限公司</a>.</strong>
    </footer>


    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
            <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane active" id="control-sidebar-home-tab">
                <h3 class="control-sidebar-heading">Recent Activity</h3>
                <ul class='control-sidebar-menu'>
                    <li>
                        <a href='javascript:;'>
                            <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                                <p>Will be 23 on April 24th</p>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

                <h3 class="control-sidebar-heading">Tasks Progress</h3>
                <ul class='control-sidebar-menu'>
                    <li>
                        <a href='javascript:;'>
                            <h4 class="control-sidebar-subheading">
                                Custom Template Design
                                <span class="label label-danger pull-right">70%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

            </div>
            <!-- /.tab-pane -->
            <!-- Stats tab content -->
            <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
            <!-- /.tab-pane -->
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
                <form method="post">
                    <h3 class="control-sidebar-heading">General Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Report panel usage
                            <input type="checkbox" class="pull-right" checked/>
                        </label>

                        <p>
                            Some information about this general settings option
                        </p>
                    </div>
                    <!-- /.form-group -->
                </form>
            </div>
            <!-- /.tab-pane -->
        </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class='control-sidebar-bg'></div>

    <jsp:include page="/decorators/modal.jsp"></jsp:include>

    <script>
        //        (function ($) {
        //            // 保存原有的jquery ajax;
        //            var $_ajax = $.ajax;
        //
        //            $.ajax = function (options) {
        //                var originalSuccess,
        //                        mySuccess,
        //                        success_context;
        //
        //                if (options.success) {
        //                    // save reference to original success callback
        //                    originalSuccess = options.success;
        //                    success_context = options.context ? options.context : $;
        //
        //                    // 自定义callback
        //                    mySuccess = function (data) {
        //
        //
        //                        if (data['code']) {
        //                            if (data.code === 403) {
        //                                alert(data.msg)
        //                            }
        //                            return;
        //
        //                            originalSuccess.apply(success_context, arguments);
        //                        }
        //                        ;
        //                        // override success callback with custom implementation
        //                        options.success = mySuccess;
        //                    }
        //
        //                    // call original ajax function with modified arguments
        //                    $_ajax.apply($, arguments);
        //                }
        //
        //
        //            }
        //        }
        //        )(jQuery);


    </script>


</div>
</body>
</html>
