<%--
  Created by IntelliJ IDEA.
  User: lixiangyang
  Date: 16/4/7
  Time: 下午9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>没有权限-亿纵云综合管理系统</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="/static/img/favicon.ico?ver=${staticVersion}" rel="icon" type="image/x-icon"/>
    <link href="/static/css/lib/bootstrap.min.css?ver=${staticVersion}" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="/static/css/lib/font-awesome.min.css?ver=${staticVersion}"/>
    <link href="/static/css/lib/ionicons.min.css?ver=${staticVersion}" rel="stylesheet" type="text/css"/>
    <link href="/static/css/lib/AdminLTE.min.css?ver=${staticVersion}" rel="stylesheet" type="text/css"/>
    <link href="/static/css/lib/skins/skin-blue.min.css?ver=${staticVersion}" rel="stylesheet" type="text/css"/>
    <link href="/static/css/common/common.css?ver=${staticVersion}" rel="stylesheet" type="text/css"/>


    <!--[if lt IE 9]>
    <script src="/static/js/lib/html5shiv.min.js?ver=${staticVersion}"></script>
    <script src="/static/js/lib/respond.min.js?ver=${staticVersion}"></script>
    <![endif]-->
</head>
<body class="hold-transition login-page">
<div>

    <!-- Content Wrapper. Contains page content -->
    <div class="">
        <!-- Content Header (Page header) -->

        <!-- Main content -->
        <section class="content">

            <div class="error-page">
                <h2 class="headline text-red">403</h2>

                <div class="error-content" style="vertical-align: top">
                    <h3>
                        <i class="fa fa-warning text-red"></i> Permission denied！
                    </h3>

                    <p>

                    </p>

                    <h3>您没有权限</h3>
                    <a href="/">返回首页</a>
                </div>
            </div>
            <!-- /.error-page -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
</div>
<!-- ./wrapper -->

</body>
</html>

