<%--
  Created by IntelliJ IDEA.
  User: luochunteng
  Date: 2016/4/2
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<input type="hidden" value="${errorMsg}" id="errorMsg">
<input type="hidden" value="${errorCode}" id="errorCode">
</body>
<script>
    $(function () {
        var errorCode = $('#errorCode').val(),
                errorMsg = $('#errorMsg').val();
        console.info(errorCode);
        _showPop({
            type: "error",
            title: "错误",
            content: errorMsg
        });
    })
</script>
</html>
