package com.ezsmart.umcs.wapi.util;

import com.ezsmart.umcs.domain.*;
import com.ezsmart.umcs.wapi.constant.WapiConstDefine;
import com.ezsmart.umcs.wapi.view.*;
import com.google.common.collect.Lists;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

public class ViewHelper {

    public static AccountView toAccountView(Account account) {
        AccountView accountView = new AccountView(account);
        //此处方便后期还有数据要处理
        return accountView;
    }

    public static List<AccountView> toAccountViewList(List<Account> accountList, Boolean isShowDeleteBtn) {
        List<AccountView> accountViewList = new ArrayList<AccountView>();
        for (Account account : accountList) {
            if (account != null) {
                AccountView accountView = toAccountView(account);
                accountView.setShowDeleteBtn(isShowDeleteBtn);
                accountViewList.add(accountView);
            }
        }
        return accountViewList;
    }

    public static CustomerView toCustomerView(Customer customer) {
        CustomerView customerView = new CustomerView(customer);
        return customerView;
    }

    public static List<CustomerView> toCustomerViewList(List<Customer> customerList, Account curAccount) {
        List<CustomerView> customerViewList = new ArrayList<CustomerView>();
        for (Customer customer : customerList) {
            if (customer != null) {
                CustomerView customerView = toCustomerView(customer);
                if (WapiConstDefine.AccountType.ROOT.getType().equals(curAccount.getOwnerType())) {
                    customerView.setShowDeleteBtn(true);
                    customerView.setShowEditBtn(true);
                }
                customerViewList.add(customerView);
            }
        }
        return customerViewList;
    }

    public static ChannelCompanyView toChannelCompanyView(ChannelCompany channelCompany) {
        ChannelCompanyView channelCompanyView = new ChannelCompanyView(channelCompany);
        return channelCompanyView;
    }

    public static List<ChannelCompanyView> toChannelCompanyViewList(List<ChannelCompany> channelCompanyList, Account curAccount) {
        List<ChannelCompanyView> channelCompanyViewList = new ArrayList<ChannelCompanyView>();
        for (ChannelCompany channelCompany : channelCompanyList) {
            if (channelCompany != null) {
                ChannelCompanyView channelCompanyView = toChannelCompanyView(channelCompany);
                if (WapiConstDefine.AccountType.ROOT.getType().equals(curAccount.getOwnerType())) {
                    channelCompanyView.setShowDeleteBtn(true);
                    channelCompanyView.setShowEditBtn(true);
                } else {
                    if (channelCompanyView.getId() == curAccount.getOwnerId()) {
                        channelCompanyView.setShowEditBtn(true);
                    }
                }
                channelCompanyViewList.add(channelCompanyView);
            }
        }
        return channelCompanyViewList;
    }

    public static List<SelectView> channelToSelectViewList(List<ChannelCompany> channelCompanyList) {
        List<SelectView> selectViews = new ArrayList<SelectView>();
        if (CollectionUtils.isEmpty(channelCompanyList)) {
            return selectViews;
        }

        for (ChannelCompany cc : channelCompanyList) {
            selectViews.add(new SelectView(cc.getId(), cc.getName()));
        }

        return selectViews;
    }

    public static SelectView channelToSelectView(ChannelCompany channelCompany) {
        SelectView selectView = null;
        if (null == channelCompany) {
            return selectView;
        }
        return new SelectView(channelCompany.getId(), channelCompany.getName());
    }

    public static List<SelectView> customerToSelectViewList(List<Customer> customerList) {
        List<SelectView> selectViews = new ArrayList<SelectView>();
        if (CollectionUtils.isEmpty(customerList)) {
            return selectViews;
        }

        for (Customer cc : customerList) {
            selectViews.add(new SelectView(cc.getId(), cc.getName()));
        }

        return selectViews;
    }

    public static SelectView customerToSelectView(Customer customer) {
        SelectView selectView = null;
        if (null == customer) {
            return selectView;
        }
        return new SelectView(customer.getId(), customer.getName());
    }

    public static SelectView getArea(AdminRegion adminRegion) {
        return new SelectView(adminRegion.getCode(), adminRegion.getName());
    }

    public static List<SelectView> getAreaList(List<AdminRegion> adminRegionList) {
        List<SelectView> areaList = new ArrayList<SelectView>();
        SelectView selectView = null;
        for (AdminRegion adminRegion : adminRegionList) {
            if (adminRegion != null && adminRegion.getCode() != 0) {
                selectView = getArea(adminRegion);
                areaList.add(selectView);
            }
        }

        return areaList;
    }

    public static LoginHistoryView toLoginHistoryView(LoginHistory loginHistory) {
        return new LoginHistoryView(loginHistory);
    }

    public static List<LoginHistoryView> toLoginHistoryViewList(List<LoginHistory> loginHistoryList) {
        List<LoginHistoryView> loginHistoryViewList = new ArrayList<LoginHistoryView>();
        for (LoginHistory loginHistory : loginHistoryList) {
            if (loginHistory != null) {
                loginHistoryViewList.add(toLoginHistoryView(loginHistory));
            }
        }
        return loginHistoryViewList;
    }

    public static List<HostModelView> toHostModelViewList(List<HostModel> hostModelList) {
        List<HostModelView> hostModelViews = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(hostModelList)) {
            for (HostModel hostModel : hostModelList) {
                hostModelViews.add(new HostModelView(hostModel));
            }
        }
        return hostModelViews;
    }

    public static LocationView toLocationView(GeoLocation location) {
        return new LocationView(location);
    }

    public static List<LocationView> toLocationViewList(List<GeoLocation> locationList) {
        List<LocationView> locationViewList = new ArrayList<LocationView>();
        for (GeoLocation location : locationList) {
            if (location != null) {
                locationViewList.add(toLocationView(location));
            }
        }
        return locationViewList;
    }

    public static RoomView toRoomView(Room room) {
        return new RoomView(room);
    }

    public static List<RoomView> toRoomViewList(List<Room> roomList) {
        List<RoomView> roomViewList = new ArrayList<RoomView>();
        for (Room room : roomList) {
            if (room != null) {
                roomViewList.add(toRoomView(room));
            }
        }
        return roomViewList;
    }

    public static List<HostModelPortView> toHostModelPortViewList(List<HostModelPort> hostModelPorts) {
        List<HostModelPortView> hostModelPortViews = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(hostModelPorts)) {
            for (HostModelPort p : hostModelPorts) {
                hostModelPortViews.add(new HostModelPortView(p));
            }
        }
        return hostModelPortViews;
    }

    public static List<HostModelTargetDeviceView> toHostModelTargetViewList(List<HostModelTargetDevice> hostModelTargetDevices) {
        List<HostModelTargetDeviceView> hostModelTargetDeviceViews = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(hostModelTargetDevices)) {
            for (HostModelTargetDevice td : hostModelTargetDevices) {
                hostModelTargetDeviceViews.add(new HostModelTargetDeviceView(td));
            }
        }
        return hostModelTargetDeviceViews;
    }

    public static List<TargetDeviceModelView> toTargetDeviceModelViewList(List<TargetDeviceModel> targetDeviceModels) {
        List<TargetDeviceModelView> targetDeviceModelViews = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(targetDeviceModels)) {
            for (TargetDeviceModel td : targetDeviceModels) {
                targetDeviceModelViews.add(new TargetDeviceModelView(td));
            }
        }
        return targetDeviceModelViews;
    }

    public static List<DeviceModelCheckItemView> toDeviceModelCheckItemViewList(List<DeviceModelCheckItem> deviceModelCheckItems) {
        List<DeviceModelCheckItemView> deviceModelCheckItemViews = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(deviceModelCheckItems)) {
            for (DeviceModelCheckItem td : deviceModelCheckItems) {
                deviceModelCheckItemViews.add(new DeviceModelCheckItemView(td));
            }
        }
        return deviceModelCheckItemViews;
    }

    public static List<DeviceModelCheckCommandView> toDeviceModelCheckCommandViewList(List<DeviceModelCheckCommand> deviceModelCheckCommands) {
        List<DeviceModelCheckCommandView> deviceModelCheckCommandViews = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(deviceModelCheckCommands)) {
            for (DeviceModelCheckCommand td : deviceModelCheckCommands) {
                deviceModelCheckCommandViews.add(new DeviceModelCheckCommandView(td));
            }
        }
        return deviceModelCheckCommandViews;
    }

    public static MonitorHostView toMonitorHostView(MonitorHost monitorHost) {
        return new MonitorHostView(monitorHost);
    }

    public static List<MonitorHostView> toMonitorHostViewList(List<MonitorHost> monitorHostList) {
        List<MonitorHostView> monitorHostViewList = new ArrayList<MonitorHostView>();
        for (MonitorHost monitorHost : monitorHostList) {
            if (monitorHost != null) {
                monitorHostViewList.add(toMonitorHostView(monitorHost));
            }
        }
        return monitorHostViewList;
    }

    public static List<AlarmView> toAlarmViewList(List<Alarm> alarms) {
        List<AlarmView> alarmViews = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(alarms)) {
            for (Alarm td : alarms) {
                alarmViews.add(new AlarmView(td));
            }
        }
        return alarmViews;
    }

    public static List<SelectView> locationToSelectViewList(List<GeoLocation> geoLocationList) {
        List<SelectView> selectViews = new ArrayList<SelectView>();
        if (CollectionUtils.isEmpty(geoLocationList)) {
            return selectViews;
        }

        for (GeoLocation cc : geoLocationList) {
            selectViews.add(new SelectView(cc.getId(), cc.getName()));
        }

        return selectViews;
    }

    public static SelectView locationToSelectView(GeoLocation geoLocation) {
        SelectView selectView = null;
        if (null == geoLocation) {
            return selectView;
        }
        return new SelectView(geoLocation.getId(), geoLocation.getName());
    }

    public static List<SelectView> hostModelToSelectViewList(List<HostModel> hostModelList) {
        List<SelectView> selectViews = new ArrayList<SelectView>();
        if (CollectionUtils.isEmpty(hostModelList)) {
            return selectViews;
        }

        for (HostModel cc : hostModelList) {
            selectViews.add(hostModelToSelectView(cc));
        }

        return selectViews;
    }

    public static SelectView hostModelToSelectView(HostModel hostModel) {
        SelectView selectView = null;
        if (null == hostModel) {
            return selectView;
        }
        return new SelectView(hostModel.getId(), hostModel.getName());
    }

    public static List<SelectView> roomToSelectViewList(List<Room> roomList) {
        List<SelectView> selectViews = new ArrayList<SelectView>();
        if (CollectionUtils.isEmpty(roomList)) {
            return selectViews;
        }

        for (Room cc : roomList) {
            selectViews.add(roomToSelectView(cc));
        }

        return selectViews;
    }

    public static SelectView roomToSelectView(Room room) {
        SelectView selectView = null;
        if (null == room) {
            return selectView;
        }
        return new SelectView(room.getId(), room.getName());
    }

    public static List<EventView> toEventList(List<Event> events) {
        List<EventView> eventViews = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(events)) {
            for (Event e : events) {
                eventViews.add(new EventView(e));
            }
        }
        return eventViews;
    }

    public static HostPortView toHostPortView(HostPort hostPort) {
        if (hostPort == null) {
            return null;
        }
        return new HostPortView(hostPort);
    }

    public static List<HostPortView> toHostPortViewList(List<HostPort> hostPortList) {
        List<HostPortView> hostPortViewList = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(hostPortList)) {
            for (HostPort hostPort : hostPortList) {
                hostPortViewList.add(toHostPortView(hostPort));
            }
        }
        return hostPortViewList;
    }

    public static TargetDeviceView toTargetDeviceView(TargetDevice targetDevice) {
        if (targetDevice == null) {
            return null;
        }
        return new TargetDeviceView(targetDevice);
    }

    public static List<TargetDeviceView> toTargetDeviceViewList(List<TargetDevice> targetDeviceList) {
        List<TargetDeviceView> targetDeviceViewList = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(targetDeviceList)) {
            for (TargetDevice targetDevice : targetDeviceList) {
                targetDeviceViewList.add(toTargetDeviceView(targetDevice));
            }
        }
        return targetDeviceViewList;
    }

    public static List<SmsTaskView> toSmsTaskViewList(List<SmsTask> smsTasks) {
        List<SmsTaskView> smsTaskViews = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(smsTasks)) {
            for (SmsTask st : smsTasks) {
                smsTaskViews.add(new SmsTaskView(st));
            }
        }
        return smsTaskViews;
    }

    public static CheckItemView toCheckItemView(CheckItem checkItem) {
        if (checkItem == null) {
            return null;
        }
        return new CheckItemView(checkItem);
    }

    public static List<CheckItemView> toCheckItemViewList(List<CheckItem> checkItemList) {
        List<CheckItemView> checkItemViewList = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(checkItemList)) {
            for (CheckItem checkItem : checkItemList) {
                checkItemViewList.add(toCheckItemView(checkItem));
            }
        }
        return checkItemViewList;
    }

    public static CheckCommandView toCheckCommandView(CheckCommand checkCommand) {
        if (checkCommand == null) {
            return null;
        }
        return new CheckCommandView(checkCommand);
    }

    public static List<CheckCommandView> toCheckCommandViewList(List<CheckCommand> checkCommandList) {
        List<CheckCommandView> checkCommandViewList = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(checkCommandList)) {
            for (CheckCommand checkCommand : checkCommandList) {
                checkCommandViewList.add(toCheckCommandView(checkCommand));
            }
        }
        return checkCommandViewList;
    }

    public static List<SelectView> getHostPortList(List<HostPort> hostPortList) {
        List<SelectView> hostPortViewList = new ArrayList<SelectView>();
        SelectView selectView = null;
        for (HostPort hostPort : hostPortList) {
            if (hostPort != null && !StringUtils.isEmpty(hostPort.getUcode())) {
                selectView = getCodeName(hostPort);
                hostPortViewList.add(selectView);
            }
        }

        return hostPortViewList;
    }

    public static SelectView getCodeName(HostPort hostPort) {
        return new SelectView(hostPort.getUcode(), hostPort.getName());
    }

    public static List<SelectView> monitorHostToSelectViewList(List<MonitorHost> monitorHostList) {
        List<SelectView> selectViews = new ArrayList<SelectView>();
        if (CollectionUtils.isEmpty(monitorHostList)) {
            return selectViews;
        }

        for (MonitorHost monitorHost : monitorHostList) {
            selectViews.add(monitorHostToSelectView(monitorHost));
        }

        return selectViews;
    }

    public static SelectView monitorHostToSelectView(MonitorHost monitorHost) {
        SelectView selectView = null;
        if (null == monitorHost) {
            return selectView;
        }
        return new SelectView(monitorHost.getUcode(), monitorHost.getName());
    }

    public static List<SelectView> hostModelTDToSelectViewList(List<HostModelTargetDevice> hostModelTargetDeviceList) {
        List<SelectView> selectViews = new ArrayList<SelectView>();
        if (CollectionUtils.isEmpty(hostModelTargetDeviceList)) {
            return selectViews;
        }

        for (HostModelTargetDevice hostModelTargetDevice : hostModelTargetDeviceList) {
            selectViews.add(hostModelTDToSelectView(hostModelTargetDevice));
        }

        return selectViews;
    }

    public static SelectView hostModelTDToSelectView(HostModelTargetDevice hostModelTargetDevice) {
        SelectView selectView = null;
        if (null == hostModelTargetDevice) {
            return selectView;
        }
        return new SelectView(hostModelTargetDevice.getDeviceModel(), hostModelTargetDevice.getName());
    }

    public static DiscoveredHostView toDiscoveredHostView(DiscoveredHost discoveredHost) {
        if (discoveredHost == null) {
            return null;
        }
        return new DiscoveredHostView(discoveredHost);
    }

    public static List<DiscoveredHostView> toDiscoveredHostViewList(List<DiscoveredHost> discoveredHostList) {
        List<DiscoveredHostView> discoveredHostViewList = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(discoveredHostList)) {
            for (DiscoveredHost discoveredHost : discoveredHostList) {
                discoveredHostViewList.add(toDiscoveredHostView(discoveredHost));
            }
        }
        return discoveredHostViewList;
    }

}
