package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.domain.AdminRegion;
import com.ezsmart.umcs.persistence.AdminRegionMapper;
import com.ezsmart.umcs.services.AdminRegionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.List;

/**
 * Created by luochunteng on 2016/4/10.
 */
@Component
public class AdminRegionServiceImpl implements AdminRegionService {
    @Autowired
    private AdminRegionMapper adminRegionDao;

    @Override
    public AdminRegion getAdminRegionByCode(int code) {
        return adminRegionDao.selectByCode(code);
    }

    @Override
    public List<AdminRegion> getAdminRegionListByPCode(int pcode) {
        return adminRegionDao.selectByPCode(pcode);
    }

    @Override
    public List<AdminRegion> getAdminRegionListByLevel(String level) {
        return adminRegionDao.selectByLevel(level);
    }

    @Override
    public List<AdminRegion> getAdminRegionListByTree(int code) {
        List<AdminRegion> addressList = adminRegionDao.selectByTree(code);
        Collections.reverse(addressList);
        return addressList;
    }

    @Override
    public BasicResult addAdminRegion(AdminRegion adminRegion) {
        return null;
    }

    @Override
    public BasicResult updateAdminRegion(AdminRegion adminRegion) {
        return null;
    }

    @Override
    public BasicResult deleteAdminRegion(int code) {
        return null;
    }
}
