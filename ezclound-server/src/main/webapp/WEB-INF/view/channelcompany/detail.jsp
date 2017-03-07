<%--
  Created by IntelliJ IDEA.
  User: luochunteng
  Date: 2016/4/2
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>中间商详情</title>
</head>
<body>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <!-- Horizontal Form -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">中间商详情</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal">
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">中间商名称</label>

                            <div class="col-sm-10 color-palette">
                                ${channelCompanyInfo.name}
                            </div>
                            <div class="col-sm-4 bg-yellow color-palette hidden js_error_msg">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">联系人</label>

                            <div class="col-sm-10 color-palette">
                                ${channelCompanyInfo.contacts}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">移动电话</label>

                            <div class="col-sm-10 color-palette">
                                ${channelCompanyInfo.mphone}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">固定电话</label>

                            <div class="col-sm-10 color-palette">
                                ${channelCompanyInfo.phone}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">销量</label>

                            <div class="col-sm-10 color-palette">
                                ${channelCompanyInfo.saleVolume}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">公司地址</label>

                            <div class="col-sm-10 color-palette">
                                ${channelCompanyInfo.address}
                            </div>
                        </div>

                    </div>
                    <!-- /.box-body -->
                    <!-- /.box-footer -->
                </form>
            </div>
            <!-- /.box -->
            <!-- general form elements disabled -->
        </div>
    </div>
</section>
</body>
</html>