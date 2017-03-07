package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.domain.CheckCommand;
import com.ezsmart.umcs.wapi.util.Util;

import java.util.Date;

/**
 * @author luochunteng
 */
public class CheckCommandView {

    private int id;
    private int targetDeviceId;
    private String targetDeviceModel;
    private String name;
    private String value = "";
    private String valueType;
    private String param = "";
    private String hostucode = "";
    private String createtime = "";
    private String updatetime = "";

    public CheckCommandView(CheckCommand checkCommand) {
        this.id = checkCommand.getId();
        this.targetDeviceId = checkCommand.getTargetDeviceId();
        this.targetDeviceModel = checkCommand.getTargetDeviceModel();
        this.hostucode = checkCommand.getHostucode();
        this.name = checkCommand.getName();
        this.value = checkCommand.getValue();
        this.valueType = checkCommand.getValueType();
        this.param = checkCommand.getParam();
        this.createtime = Util.formatDate(checkCommand.getCreatetime());
        this.updatetime = Util.formatDate(checkCommand.getUpdatetime());
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTargetDeviceId() {
        return targetDeviceId;
    }

    public void setTargetDeviceId(int targetDeviceId) {
        this.targetDeviceId = targetDeviceId;
    }

    public String getTargetDeviceModel() {
        return targetDeviceModel;
    }

    public void setTargetDeviceModel(String targetDeviceModel) {
        this.targetDeviceModel = targetDeviceModel;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getValueType() {
        return valueType;
    }

    public void setValueType(String valueType) {
        this.valueType = valueType;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }

    public String getHostucode() {
        return hostucode;
    }

    public void setHostucode(String hostucode) {
        this.hostucode = hostucode;
    }
}
