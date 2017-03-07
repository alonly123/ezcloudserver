package com.ezsmart.umcs.services;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.domain.AdminRegion;

import java.util.List;

/**
 * Created by luochunteng on 2016/4/10.
 */
public interface AdminRegionService {

    public AdminRegion getAdminRegionByCode(int code);

    /**
     * 根据父节点查找子节点
     *
     * @param pcode
     * @return
     */
    public List<AdminRegion> getAdminRegionListByPCode(int pcode);

    /**
     * 新增地址
     *
     * @param adminRegion
     * @return
     */
    public BasicResult addAdminRegion(AdminRegion adminRegion);

    /**
     * 更新地址
     *
     * @param adminRegion
     * @return
     */
    public BasicResult updateAdminRegion(AdminRegion adminRegion);

    /**
     * 删除地址
     *
     * @param code
     * @return
     */
    public BasicResult deleteAdminRegion(int code);

    /**
     * 通过级别查询
     *
     * @param level
     * @return
     */
    public List<AdminRegion> getAdminRegionListByLevel(String level);

    /**
     * 通过最小节点的code，采用oracle 树查询得到一条省市区地址
     *
     * @param code
     * @return
     */
    public List<AdminRegion> getAdminRegionListByTree(int code);
}
