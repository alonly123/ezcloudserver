package com.ezsmart.umcs.services.impl;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.LocationCondition;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.GeoLocation;
import com.ezsmart.umcs.persistence.GeoLocationMapper;
import com.ezsmart.umcs.persistence.PublicSequenceMapper;
import com.ezsmart.umcs.services.LocaionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by luochunteng on 2016/4/23.
 */
@Component
public class LocationServiceImpl implements LocaionService {

    @Autowired
    private GeoLocationMapper geoLocationDao;

    @Autowired
    private PublicSequenceMapper publicSequenceDao;

    @Override
    public BasicResult createLocation(GeoLocation location) {
        if (location == null) {
            return new BasicResult(false, ReturnConstants.LOCATION_ADD_FAIL.getCode(), ReturnConstants.LOCATION_ADD_FAIL.getMessage());
        }
        location.setId(publicSequenceDao.getSeq());
        geoLocationDao.insert(location);
        return new BasicResult(true);
    }

    @Override
    public BasicResult deleteLocation(int locationId) {
        GeoLocation location = geoLocationDao.selectById(locationId);
        if (location == null) {
            return new BasicResult(false, ReturnConstants.LOCATION_NOT_EXIST.getCode(), ReturnConstants.LOCATION_NOT_EXIST.getMessage());
        }
        geoLocationDao.delete(locationId);
        return new BasicResult(true);
    }

    @Override
    public GeoLocation getLocationBy(int locationId) {
        return geoLocationDao.selectById(locationId);
    }

    @Override
    public List<GeoLocation> getLocationListByCondition(LocationCondition locationCondition, int pageNum, int pageSize) {
        if (locationCondition == null) {
            locationCondition = new LocationCondition();
        }
        locationCondition.setStartIndex((pageNum - 1) * pageSize + 1);
        locationCondition.setEndIndex(pageNum * pageSize + 1);
        return geoLocationDao.selectLocationListByCondition(locationCondition);
    }

    @Override
    public int count(LocationCondition locationCondition) {
        return geoLocationDao.countLocationByCondition(locationCondition);
    }

    @Override
    public BasicResult updateLocation(GeoLocation location) {
        if (location == null) {
            return new BasicResult(false, ReturnConstants.LOCATION_NOT_EXIST.getCode(), ReturnConstants.LOCATION_NOT_EXIST.getMessage());
        }
        geoLocationDao.update(location);
        return new BasicResult(true);
    }
}
