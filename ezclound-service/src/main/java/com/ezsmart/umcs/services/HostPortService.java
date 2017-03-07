package com.ezsmart.umcs.services;

import com.ezsmart.umcs.domain.HostPort;

import java.util.List;

/**
 * Created by luochunteng on 2016/5/9 0009.
 */
public interface HostPortService {

    public HostPort getHostPortById(int id);
    public HostPort getHostPortByUCode(String code);

    public List<HostPort> getHostPortListByHostCode(String hostUcode);
}
