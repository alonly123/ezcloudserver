/**
 * Created by lixiangyang on 16/4/8.
 */
$(function () {
    var ownerIdSelectTag = $("#js_owner_id_box");
    var searchUrl = "/channelCompany/searchChannelSelect";

    var select2Options = {
        placeholder: "请选择中间商",
        minimumInputLength: 1,
        ajax: {
            url: searchUrl,
            dataType: 'json',
            delay: 200,
            data: function (params) {
                return {
                    key: params.term, // search term
                    page: params.page,
                    pid: 0
                };
            },
            processResults: function (data, params) {
                params.page = params.page || 1;

                var totalCount = 0;
                var pageSize = 1;
                var result = new Array();

                if (data) {
                    if (data.code == 0) {
                        var datas = data.data ? data.data.data : null;
                        pageSize = data.data.pageSize;
                        totalCount = data.data.total;
                        if (datas) {
                            for (var d in datas) {
                                item = {};
                                item["id"] = datas[d]['id'];
                                item["text"] = datas[d]['name'];
                                result.push(item);
                            }
                        }

                        var more = (params.page * pageSize) < totalCount;
                        return {
                            results: result,
                            pagination: {
                                more: more
                            }
                        };
                    } else {
                        _showPop({
                            type: "error",
                            content: data.msg
                        });
                    }

                } else {
                    _showPop({
                        type: "error",
                        content: "获取数据失败"
                    });
                }

            },
            cache: true
        }
    }

    $("#js_owner_type").change(function () {
        //$("#js_owner_id_box").val();
        var ownerTypeDes = $("#js_owner_type  option:selected").text();
        var ownerType = $(this).val();


        $("#js_owner_type_des").val(ownerTypeDes);
        $("#js_owner_id_label").html(ownerTypeDes);

        if (0 == ownerType) {
            searchUrl = "/channelCompany/searchChannelSelect";
        } else if (1 == ownerType) {
            searchUrl = "/customer/searchCustomerSelect";
        }
        ownerIdSelectTag.val("");

        select2Options.ajax.url = searchUrl;

        select2Options.placeholder = "请选择" + ownerTypeDes;

        ownerIdSelectTag.select2(select2Options);
    });
    var ownerType = $('#js_owner_type').val();
    if(ownerType == 1){
        select2Options.placeholder = "请选择客户";
    }else{
        select2Options.placeholder = "请选择中间商";
    }
    ownerIdSelectTag.select2(select2Options);

    $('#js_save').on("click", function () {
        var ucode = $('#ucode').val(),
            password = $('#password').val(),
            repeatPassword = $('#repeat_password').val(),
            isAdd = $(this).attr("data-isAdd"),
            ownerId = ownerIdSelectTag.val(),
            ownerType = $('#js_owner_type').val(),
            email = $('#email').val();

        var accountInfo = {
            "id": $(this).attr("data-id"),
            "ucode": ucode,
            "password": password,
            "name": $('#uname').val(),
            "email": email,
            "descr": $('#descr').val(),
            "ownerId": ownerId,
            "ownerType": ownerType
        };
        if (!ownerId || ownerId == null || ownerId == 0) {
            _showPop({
                type: "error",
                content: "请选择账号的归属客户/中间商！"
            });
            return false;
        }
        if (!ucode || $.trim(ucode) == '') {
            _showPop({
                type: "error",
                content: "请输入账号"
            });
            return false;
        }
        if (isAdd == "true") {
            if (!password || $.trim(password) == '') {
                _showPop({
                    type: "error",
                    content: "请输入初始密码"
                });
                return false;
            }
            if (password.length < 6) {
                _showPop({
                    type: "error",
                    content: "密码长度必须不小于6位！"
                });
                return false;
            }
            if (password != repeatPassword || $.trim(repeatPassword) != $.trim(password)) {
                _showPop({
                    type: "error",
                    content: "两次密码不一致"
                });
                return false;
            }
        }
        if (!checkEmail(email)) {
            _showPop({
                type: "error",
                content: "邮箱格式有误！"
            });
            return false;
        }
        $.ajax({
            dataType: 'json',
            type: 'post',
            url: "/account/simple/save",
            data: accountInfo,
            success: function (r) {
                if (r) {
                    if (r.code == 0) {
                        _showPop({
                            type: "success",
                            title: "保存成功",
                            content: "保存成功!",
                            ok: {
                                name: '确定',
                                callback: function () {
                                    window.location.href = "/account/simple/list";
                                }
                            }
                        });
                    } else {
                        _showPop({
                            type: "error",
                            title: "保存失败",
                            content: "保存失败，" + r.msg
                        });
                    }
                } else {
                    _showPop({
                        type: "error",
                        title: "保存失败",
                        content: "保存失败"
                    });
                }
            },
            error: function (r) {
                _showPop({
                    type: "error",
                    title: "保存失败",
                    content: "保存失败"
                });
            }
        });
    });
    function checkEmail(email) {
        if (!email || email == "") {
            return true;
        }
        var reMail = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        if (reMail.test(email)) {
            return true;
        }
        return false;
    }


    $('#cancelAdd').on("click", function () {
        var ucode = $('#ucode').val();
        if (fromView == "list") {
            window.location.href = "/account/manager/list";
        } else {
            window.location.href = "/account/detail?ucode=" + ucode;
        }
        window.location.href = "/account/simple/list";
    });

});