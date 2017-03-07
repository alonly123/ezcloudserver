/**
 * Created by luochunteng /lixiangyang.
 */

var Area = {
    getProvince: function (callback) {
        $.ajax({
            dataType: 'json',
            type: 'get',
            url: "/adminregion/get_provinceList",
            data: '',
            success: function (r) {
                callback(r)
            },
            error: function (r) {
                _showPop({
                    type: "error",
                    title: "错误",
                    content: "获取地址失败"
                });
            }
        });
    },
    getCityOrCounty: function (pcode, callback) {
        $.ajax({
            dataType: 'json',
            type: 'get',
            url: "/adminregion/get_city_county",
            data: {'pcode': pcode},
            success: function (r) {
                callback(r)
            },
            error: function (r) {
                _showPop({
                    type: "error",
                    title: "错误",
                    content: "获取地址失败"
                });
            }
        });
    }
};


var Cookie = {
    set: function (key, value, expiredays) {
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + expiredays);
        document.cookie = key
        + "="
        + encodeURIComponent(value)
        + ((expiredays == null) ? "" : ";expires="
        + exdate.toGMTString()) + ";path=/";
    },
    get: function (key) {
        if (document.cookie.length > 0) {
            c_start = document.cookie.indexOf(key + "=");
            if (c_start != -1) {
                c_start = c_start + key.length + 1;
                c_end = document.cookie.indexOf(";", c_start);
                if (c_end == -1) {
                    c_end = document.cookie.length
                }
                return decodeURIComponent(document.cookie.substring(c_start, c_end))
            }
        }
        return ""
    },
    delete: function (key) {
        var cval = this.get(key);
        if (cval != null)
            this.set(key, "", -1);
    }
}
