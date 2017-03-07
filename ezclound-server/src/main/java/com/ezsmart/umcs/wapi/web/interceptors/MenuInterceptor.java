package com.ezsmart.umcs.wapi.web.interceptors;

import com.ezsmart.umcs.wapi.util.MenuUtil;
import com.ezsmart.umcs.wapi.util.Util;
import com.ezsmart.umcs.wapi.vo.Menu;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.CollectionUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Set;

/**
 * Created by lixiangyang on 16/4/9.
 */
public class MenuInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!Util.isAjaxRequest(request)) {
            List<Menu> menus = getMenuList(request);
            request.setAttribute("_menu_list", menus);
        }
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }

    private List<Menu> getMenuList(HttpServletRequest request) {
        SecurityContext securityContext = SecurityContextHolder.getContext();
        Authentication authentication = securityContext.getAuthentication();
        List<GrantedAuthority> authorities = (List<GrantedAuthority>) authentication.getAuthorities();

        Set<String> roles = Sets.newHashSet();
        for (GrantedAuthority a : authorities) {
            roles.add(a.getAuthority());
        }

        List<Menu> menus = MenuUtil.getMenuList();

        List<Menu> finalMenus = Lists.newArrayList();

        String uri = request.getRequestURI();

        for (Menu m1 : menus) {
            if (CollectionUtils.isEmpty(m1.getMenus())) {  //如果没有下层，则此层是链接
                if (isManuVisible(m1, roles)) {
                    if (isActive(uri, m1)) {
                        m1.setActive(true);
                    }
                    finalMenus.add(m1);
                }
            } else {  //如果有下层，遍历下层
                List<Menu> tempMenus = Lists.newArrayList();
                for (Menu m11 : m1.getMenus()) {
                    if (isManuVisible(m11, roles)) {
                        if (isActive(uri, m11)) {
                            m11.setActive(true);
                            m1.setActive(true);
                        }
                        tempMenus.add(m11);
                    }
                }
                if (!CollectionUtils.isEmpty(tempMenus)) {
                    m1.setMenus(tempMenus);
                    finalMenus.add(m1);
                }
            }
        }

        return finalMenus;
    }

    /**
     * 判断menu里的url是否需要设置成激活
     *
     * @param uri
     * @param menu
     * @return
     */
    private boolean isActive(String uri, Menu menu) {
        String menuUrl = menu.getUrl();

        if (menuUrl == null) {
            return false;
        }

        menuUrl = menuUrl.indexOf("?") > 0 ? menuUrl.substring(0, menuUrl.indexOf("?")) : menuUrl;
        if (uri.equals(menuUrl)) {
            return true;
        }

        return false;
    }

    /**
     * 判断menu是否可见
     *
     * @param menu
     * @param loginRole
     * @return
     */
    private boolean isManuVisible(Menu menu, Set<String> loginRole) {
        if (null == menu || CollectionUtils.isEmpty(loginRole)) {
            return false;
        }

        Set<String> menuRoles = menu.getRoles();
        if (CollectionUtils.isEmpty(menuRoles)) {
            return false;
        }

        Set<String> roleIntersection = Sets.intersection(loginRole, menuRoles); //取交集

        if (!CollectionUtils.isEmpty(roleIntersection)) {
            return true;
        }

        return false;
    }
}
