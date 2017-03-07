package com.ezsmart.umcs.wapi.view;

import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.util.ServiceUtil;
import com.ezsmart.umcs.wapi.constant.WapiConstDefine;

/**
 * @author luochunteng
 */
public class AccountView {
    private int id;
    private String ucode;
    private String name;
    private String ownerType;
    private String ownerTypeName;
    private int ownerId;
    private String ownerName;
    private String roleType;
    private String roleTypeName;
    private String email;
    private String descr;
    private String createTime;
    private String updateTime;
    private boolean showDeleteBtn;

    public AccountView(Account account) {
        this.id = account.getId();
        this.ucode = account.getUcode();
        this.name = account.getName();
        this.ownerId = account.getOwnerId();
        this.ownerType = account.getOwnerType();
        this.roleType = account.getRoleType();
        this.email = account.getEmail();
        this.descr = account.getDescr();
        this.roleTypeName = WapiConstDefine.RoleType.NORMAL.getName();
        if (WapiConstDefine.RoleType.ADMIN.getType().equals(this.roleType)) {
            this.roleTypeName = WapiConstDefine.RoleType.ADMIN.getName();
        }
        this.ownerTypeName = WapiConstDefine.AccountType.getTypeName(this.ownerType);
        this.createTime = ServiceUtil.formatDate(account.getCreatetime());
        this.updateTime = ServiceUtil.formatDate(account.getUpdatetime());
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUcode() {
        return ucode;
    }

    public void setUcode(String ucode) {
        this.ucode = ucode;
    }

    public String getOwnerType() {
        return ownerType;
    }

    public void setOwnerType(String ownerType) {
        this.ownerType = ownerType;
    }

    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

    public String getRoleType() {
        return roleType;
    }

    public void setRoleType(String roleType) {
        this.roleType = roleType;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getOwnerTypeName() {
        return ownerTypeName;
    }

    public void setOwnerTypeName(String ownerTypeName) {
        this.ownerTypeName = ownerTypeName;
    }

    public boolean isShowDeleteBtn() {
        return showDeleteBtn;
    }

    public void setShowDeleteBtn(boolean showDeleteBtn) {
        this.showDeleteBtn = showDeleteBtn;
    }

    public String getRoleTypeName() {
        return roleTypeName;
    }

    public void setRoleTypeName(String roleTypeName) {
        this.roleTypeName = roleTypeName;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
}
