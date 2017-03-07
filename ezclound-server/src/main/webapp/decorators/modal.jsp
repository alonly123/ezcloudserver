<%--
  Created by IntelliJ IDEA.
  User: lixiangyang
  Date: 16/4/3
  Time: 下午8:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal" id="js_modal_area" style="z-index: 1000000">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <div class="modal-title">
                    <span class="modal-title-text"></span>
                    <i class="fa fa-info-circle modal-icon"></i>
                </div>
                <%--<h4 class="modal-title"></h4>--%>
            </div>
            <div class="modal-body">
                <div style='font-size:16px; font-weight:bold; padding:0px 20px;' class="modal-content-body">
                </div>
            </div>
            <div class="modal-footer">
                <input type="button" id="poparea_cancel" value="关闭" data-dismiss="modal"
                       class="btn btn-default btn-sm"/>
                <input type="button" id="poparea_ok" value="确定" class="btn btn-success btn-sm"/>
            </div>
        </div>
    </div>
</div>
<script>
    //demo
    /*_showPop({
     type: "primary", //primary,info,warning,success,danger
     title: "title",
     content: "<div style='font-size:16px; font-weight:bold; padding:0px 20px;'>" + content + "</div>",
     ok: {
     display: true,
     name: "确定",
     callback: function() {
     window.location.href="/settle/orgsetting?orgId=" + $("#orgId").val() +"&f=join_org_charge";
     }
     }
     });*/
    function _showPop(obj) {
        if (obj) {
            var modal = $("#js_modal_area");
            var iconTag = modal.find(".modal-icon");
            var titleTag = modal.find(".modal-title");
            var titleTextTag = modal.find(".modal-title-text");
            var skin = {
                "default": {class: "fa-info-circle", color: "#999999"},
                "info": {class: "fa-info-circle", color: "#999999"},
                "warning": {class: "fa-exclamation-triangle", color: "#f58220"},
                "success": {class: "fa-check-circle", color: "#1d953f"},
                "error": {class: "fa-exclamation-triangle", color: "#d93a49"}
            }

            for (var i in skin) {
                iconTag.removeClass(skin[i]['class']);
            }
            var className = skin[obj.type] ? skin[obj.type]["class"] : skin["default"]["class"];
            iconTag.addClass(className);
            var color = skin[obj.type] ? skin[obj.type]["color"] : skin["default"]["color"];
            titleTag.css({"color": color});

            modal.find(".modal-body").find(".modal-content-body").empty().append(obj.content);
            titleTextTag.empty().append(obj.title);
            var hasOk = false;
            if (obj.ok) {
                hasOk = true;
                $("#poparea_ok").val(obj.ok.name ? obj.ok.name : "确定");

                $("#poparea_ok").css({'display': 'inline-block'}).unbind().click(function () {
                    modal.modal("hide");
                    if (obj.ok.callback) {
                        obj.ok.callback();
                    }
                    return true;
                })
                $("#poparea_cancel").addClass("pull-left");
            } else {
                $("#poparea_cancel").removeClass("pull-left");
                $("#poparea_ok").css({"display": "none"});
            }

            if (obj.cancel) {
                $("#poparea_cancel").val(obj.cancel.name ? obj.cancel.name : (hasOk ? "取消" : "关闭"));
            } else {
                $("#poparea_cancel").val("关闭");
            }

            $("#poparea_cancel").unbind().click(function () {
                modal.modal("hide");
                if (obj.cancel && obj.cancel.callback) {
                    obj.cancel.callback()
                }
                return false;
            })


            modal.modal();
        }
    }

</script>

