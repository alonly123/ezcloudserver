/**
 * Created by lixiangyang on 16/5/5.
 */

var Alarm = {
    ack: function (data, callback) {
        $.ajax({
            dataType: 'json',
            type: 'post',
            url: "/alarm/w/ack",
            data: data,
            success: function (r) {
                callback(r)
            },
            error: function (r) {
                _showPop({
                    type: "error",
                    title: "错误",
                    content: "告警确认失败"
                });
            }
        });
    }
};