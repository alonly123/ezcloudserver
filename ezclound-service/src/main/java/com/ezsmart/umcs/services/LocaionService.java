package com.ezsmart.umcs.services;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.LocationCondition;
import com.ezsmart.umcs.domain.GeoLocation;

import java.util.List;

/**
 * @author xiejiayong
 */
public interface LocaionService {

    public BasicResult createLocation(GeoLocation location);

    public BasicResult deleteLocation(int locationId);

    public GeoLocation getLocationBy(int locationId);

    public List<GeoLocation> getLocationListByCondition(LocationCondition locationCondition, int pageNum, int pageSize);

    public int count(LocationCondition locationCondition);

    public BasicResult updateLocation(GeoLocation location);

}

