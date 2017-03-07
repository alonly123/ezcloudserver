package com.ezsmart.umcs.wapi.util;

import com.ezsmart.umcs.wapi.vo.Menu;
import com.google.common.collect.Sets;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lixiangyang on 16/4/9.
 */
public class MenuUtil {

    public static List<Menu> getMenuList() {
        List<Menu> menus = new ArrayList<Menu>();

        List<Menu> childMenus1 = new ArrayList<Menu>();
        childMenus1.add(new Menu("管理员账号管理", "/account/manager/list", 1, 1, 2, false, "fa fa-user", Sets.newHashSet("ROLE_ADMIN")));
        childMenus1.add(new Menu("普通账号管理", "/account/simple/list", 2, 1, 2, false, "fa fa-user", Sets.newHashSet("ROLE_ADMIN", "ROLE_ROOT")));
        childMenus1.add(new Menu("中间商管理", "/channelCompany/list", 3, 1, 2, false, "fa fa-user-secret", Sets.newHashSet("ROLE_ADMIN", "ROLE_ROOT")));
        childMenus1.add(new Menu("客户管理", "/customer/list", 4, 1, 2, false, "fa fa-users", Sets.newHashSet("ROLE_ADMIN", "ROLE_ROOT", "ROLE_CHANNEL")));

        menus.add(new Menu("账号管理", "", 1, 1, 1, false, "fa fa-user", childMenus1));

        menus.add(new Menu("账号详情", "/account/detail", 2, 1, 2, false, "fa fa-user", Sets.newHashSet("ROLE_ADMIN", "ROLE_ROOT", "ROLE_CHANNEL", "ROLE_CUSTOMER")));
        menus.add(new Menu("中间商详情", "/channelCompany/detail", 3, 1, 2, false, "fa fa-user-secret", Sets.newHashSet("ROLE_CHANNEL")));
        menus.add(new Menu("客户详情", "/customer/detail", 4, 1, 2, false, "fa fa-users", Sets.newHashSet("ROLE_CUSTOMER")));
        menus.add(new Menu("修改密码", "/account/change_password", 5, 1, 2, false, "fa fa-key", Sets.newHashSet("ROLE_ADMIN", "ROLE_ROOT", "ROLE_CHANNEL", "ROLE_CUSTOMER")));
        menus.add(new Menu("位置管理", "/location/list", 5, 1, 2, false, "fa fa-location-arrow", Sets.newHashSet("ROLE_ADMIN", "ROLE_ROOT")));
        menus.add(new Menu("设备型号管理", "/admin/HostModel/list", 6, 1, 2, false, "fa fa-tv", Sets.newHashSet("ROLE_ADMIN", "ROLE_ROOT")));
        menus.add(new Menu("外设型号管理", "/admin/TargetDeviceModel/list", 7, 1, 2, false, "fa fa-tv", Sets.newHashSet("ROLE_ADMIN", "ROLE_ROOT")));
        menus.add(new Menu("设备发现管理", "/discoveredhost/list", 8, 1, 2, false, "fa fa-tv", Sets.newHashSet("ROLE_ADMIN", "ROLE_ROOT")));

        List<Menu> childMenus_dm = new ArrayList<Menu>();
        childMenus_dm.add(new Menu("监控设备管理", "/monitorhost/list", 1, 1, 2, false, "fa fa-tv", Sets.newHashSet("ROLE_ADMIN", "ROLE_ROOT", "ROLE_CHANNEL", "ROLE_CUSTOMER")));
        childMenus_dm.add(new Menu("监控设备外设管理", "/targetdevice/list", 2, 1, 2, false, "fa fa-tv", Sets.newHashSet("ROLE_ADMIN", "ROLE_ROOT", "ROLE_CHANNEL", "ROLE_CUSTOMER")));

        menus.add(new Menu("设备管理", "", 9, 1, 1, false, "fa fa-tv", childMenus_dm));
        menus.add(new Menu("告警管理", "/alarm/r/list", 10, 1, 2, false, "fa fa-bell", Sets.newHashSet("ROLE_ADMIN", "ROLE_ROOT", "ROLE_CHANNEL", "ROLE_CUSTOMER")));
        menus.add(new Menu("事件管理", "/admin/event/r/list", 11, 1, 2, false, "fa fa-calendar", Sets.newHashSet("ROLE_ADMIN", "ROLE_ROOT")));
        menus.add(new Menu("短信通知日志", "/admin/SmsTask/r/list", 12, 1, 2, false, "fa fa-commenting", Sets.newHashSet("ROLE_ADMIN", "ROLE_ROOT")));
        menus.add(new Menu("登录日志", "/admin/loginHistory/r/list", 13, 1, 2, false, "fa fa-history", Sets.newHashSet("ROLE_ADMIN", "ROLE_ROOT")));

        return menus;
    }
}
