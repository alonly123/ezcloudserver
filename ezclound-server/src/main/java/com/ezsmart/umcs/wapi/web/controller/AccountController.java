package com.ezsmart.umcs.wapi.web.controller;

import com.ezsmart.umcs.common.BasicResult;
import com.ezsmart.umcs.condition.AccountCondition;
import com.ezsmart.umcs.constant.CommonConstants;
import com.ezsmart.umcs.constant.ReturnConstants;
import com.ezsmart.umcs.domain.Account;
import com.ezsmart.umcs.domain.ChannelCompany;
import com.ezsmart.umcs.domain.Customer;
import com.ezsmart.umcs.exception.BusException;
import com.ezsmart.umcs.services.impl.AccountServiceImpl;
import com.ezsmart.umcs.services.impl.ChannelCompanyServiceImpl;
import com.ezsmart.umcs.services.impl.CustomerServiceImpl;
import com.ezsmart.umcs.util.ServiceUtil;
import com.ezsmart.umcs.wapi.constant.WapiConstDefine;
import com.ezsmart.umcs.wapi.request.AccountRequest;
import com.ezsmart.umcs.wapi.util.LoginUtil;
import com.ezsmart.umcs.wapi.util.Util;
import com.ezsmart.umcs.wapi.util.ViewHelper;
import com.ezsmart.umcs.wapi.view.AccountView;
import com.ezsmart.umcs.wapi.view.PageView;
import com.ezsmart.umcs.wapi.view.SelectView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.swing.text.View;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("account")
public class AccountController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(AccountController.class);

    @Autowired
    private AccountServiceImpl accountService;
    @Autowired
    private CustomerServiceImpl customerService;
    @Autowired
    private ChannelCompanyServiceImpl channelCompanyService;

    @RequestMapping(value = "/detail")
    public String getManagerAccountInfo(@RequestParam(value = "ucode", defaultValue = "") String ucode,
                                        HttpServletRequest request, Model model) {
        Account loginAccount = LoginUtil.getLoginAccount(request);
        if (StringUtils.isEmpty(ucode)) {
            ucode = loginAccount.getUcode();
        }

        Account account = accountService.getAccountByUCode(ucode);
        String ownerName = "";
        if (account != null && !CommonConstants.AccountType.ROOT.getType().equals(account.getOwnerType())) {
            //普通账号，返回所有者名称
            if (account.getOwnerType().equals(CommonConstants.AccountType.CHANNELCOMPANY.getType())) {
                ChannelCompany channelCompany = channelCompanyService.getChannelComopanyById(account.getOwnerId());
                if (channelCompany != null) {
                    ownerName = channelCompany.getName();
                }
            } else {
                Customer customer = customerService.getCustomerById(account.getOwnerId());
                if (customer != null) {
                    ownerName = customer.getName();
                }
            }
        }
        AccountView accountView = ViewHelper.toAccountView(account);
        accountView.setOwnerName(ownerName);
        model.addAttribute("accountInfo", accountView);
        return "account/detail";
    }

    /**
     * 新增/编辑账号
     *
     * @return
     */
    @RequestMapping(value = "/manager/add")
    public String addManagerAccount(@RequestParam(value = "ucode", defaultValue = "") String uCode,
                                    @RequestParam(value = "fromView", required = false) String fromView, Model model,
                                    HttpServletRequest request) {
        Account curAccount = LoginUtil.getLoginAccount(request);
        boolean isAdd = false;
        boolean isCanEdit = false;
        Account account;
        if (StringUtils.isEmpty(uCode)) {
            isAdd = true;
            if (!WapiConstDefine.SUPER_ADMIN.equals(curAccount.getUcode())) {
                //只有超级管理员才有权限
                throw new BusException(ReturnConstants.ACCESS_DENIED.getCode());
            }
        }
        if (isAdd) {
            account = new Account();
        } else {
            if (CommonConstants.SUPER_ADMIN.equals(curAccount.getUcode())) {
                isCanEdit = true;
            }
            account = accountService.getAccountByUCode(uCode);
            if (CommonConstants.SUPER_ADMIN.equals(account.getUcode())) {
                isCanEdit = false;
            }
        }
        AccountView accountView = ViewHelper.toAccountView(account);
        model.addAttribute("accountInfo", accountView);
        model.addAttribute("isAdd", isAdd);
        model.addAttribute("fromView", fromView);
        model.addAttribute("isCanEdit", isCanEdit);
        return "account/manager/add";
    }

    //TODO
    @ResponseBody
    @RequestMapping(value = "/manager/save")
    public Object saveManagerAccount(AccountRequest accountRequest, Model model, HttpServletRequest request) {
        Account curAccount = LoginUtil.getLoginAccount(request);
        BasicResult basicResult;
        try {
            accountRequest.setOwnerId(0);
            accountRequest.setOwnerType(CommonConstants.AccountType.ROOT.getType());
            accountRequest.setRoleType(CommonConstants.RoleType.ADMIN.getType());
            Account account = getAccount(accountRequest);
            int id = account.getId();
            if (id == 0) {
                if (!WapiConstDefine.SUPER_ADMIN.equals(curAccount.getUcode())) {
                    //只有超级管理员才有权限
                    throw new BusException(ReturnConstants.ACCESS_DENIED.getCode());
                }
                //add
                String password = accountRequest.getPassword();
                basicResult = Util.checkPassword(password);
                if (!basicResult.isSuccess()) {
                    return basicResult;
                }
                account.setPassword(Util.getMD5ByBase64(accountRequest.getPassword()));
                basicResult = accountService.createAccount(account);
            } else {
                //update
                basicResult = accountService.updateAccount(account);
            }
            return basicResult;
        } catch (Exception e) {
            LOGGER.error("save manager account fail;error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    private Account getAccount(AccountRequest accountRequest) {
        Account newAccount = new Account();
        newAccount.setId(accountRequest.getId());
        newAccount.setUcode(accountRequest.getUcode());
        newAccount.setDescr(accountRequest.getDescr());
        newAccount.setName(accountRequest.getName());
        newAccount.setOwnerId(accountRequest.getOwnerId());
        newAccount.setOwnerType(accountRequest.getOwnerType());
        newAccount.setRoleType(accountRequest.getRoleType());
        newAccount.setEmail(accountRequest.getEmail());
        return newAccount;
    }

    @RequestMapping(value = "/manager/list")
    public String getManagerAccountList(Model model,
                                        @RequestParam(value = "key", defaultValue = "") String keywords,
                                        @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                        @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
                                        HttpServletRequest request) {
        Account curAccount = LoginUtil.getLoginAccount(request);
        Boolean isShowDeleteBtn = false;
        if (WapiConstDefine.SUPER_ADMIN.equals(curAccount.getUcode())) {
            isShowDeleteBtn = true;
        }
        int total = accountService.getCount(keywords, CommonConstants.RoleType.ADMIN.getType());
        List<Account> accounts = accountService
                .getList(CommonConstants.RoleType.ADMIN.getType(), keywords, pageNum, pageSize);
        List<AccountView> accountViewList = ViewHelper.toAccountViewList(accounts, isShowDeleteBtn);
        PageView<AccountView> page = new PageView<AccountView>(pageSize, pageNum, total,
                accountViewList);

        model.addAttribute("accountPage", page);
        model.addAttribute("keyword", keywords);
        return "account/manager/list";
    }

    /**
     * 新增/编辑账号
     *
     * @return
     */
    @RequestMapping(value = "/simple/add")
    public String addSimpleAccount(@RequestParam(value = "ucode", defaultValue = "") String uCode,
                                   @RequestParam(value = "fromView", required = false) String fromView, Model model
            , HttpServletRequest request) {
        Account curAccount = LoginUtil.getLoginAccount(request);
        boolean isAdd = false;
        boolean isCanEdit = false;
        if (curAccount.getOwnerType().equals(CommonConstants.AccountType.ROOT.getType())) {
            isCanEdit = true;
        }
        Account account;
        if (StringUtils.isEmpty(uCode)) {
            isAdd = true;
        }
        if (isAdd) {
            account = new Account();
        } else {
            account = accountService.getAccountByUCode(uCode);
            if (account != null) {
                SelectView selectView = null;
                if (CommonConstants.AccountType.CUSTOMER.getType().equals(account.getOwnerType())) {
                    Customer customer = customerService.getCustomerById(account.getOwnerId());
                    if (customer != null) {
                        selectView = ViewHelper.customerToSelectView(customer);
                    }
                } else if (CommonConstants.AccountType.CHANNELCOMPANY.getType().equals(account.getOwnerType())) {
                    ChannelCompany channelCompany = channelCompanyService.getChannelComopanyById(account.getOwnerId());
                    if (channelCompany != null) {
                        selectView = ViewHelper.channelToSelectView(channelCompany);
                    }
                }
                if (account.getOwnerId() != 0) {
                    isCanEdit = false;
                }
                model.addAttribute("selectView", selectView);
            }
        }
        AccountView accountView = ViewHelper.toAccountView(account);
        model.addAttribute("accountInfo", accountView);
        model.addAttribute("isAdd", isAdd);
        model.addAttribute("fromView", fromView);
        model.addAttribute("isCanEdit", isCanEdit);
        return "account/simple/add";
    }

    //TODO
    @ResponseBody
    @RequestMapping(value = "/simple/save")
    public Object saveSimpleAccount(AccountRequest accountRequest, Model model) {
        try {
            Account account = getAccount(accountRequest);
            account.setRoleType(CommonConstants.RoleType.NORMAL.getType());
            int id = account.getId();
            if (id == 0) {
                String password = accountRequest.getPassword();
                BasicResult basicResult = Util.checkPassword(password);
                if (!basicResult.isSuccess()) {
                    return basicResult;
                }
                account.setPassword(Util.getMD5ByBase64(accountRequest.getPassword()));
                return accountService.createAccount(account);
            } else {
                return accountService.updateAccount(account);
            }
        } catch (Exception e) {
            LOGGER.error("save account fail; error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @RequestMapping(value = "/simple/list")
    public String getSimpleAccountList(Model model,
                                       @RequestParam(value = "key", defaultValue = "") String keywords,
                                       @RequestParam(value = "ownertype", defaultValue = "0") String ownertype,
                                       @RequestParam(value = "ownerId", defaultValue = "0") int ownerId,
                                       @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                       @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
                                       HttpServletRequest request) {
        Account curAccount = LoginUtil.getLoginAccount(request);
        Boolean isShowDeleteBtn = false;
        if (WapiConstDefine.AccountType.ROOT.getType().equals(curAccount.getOwnerType())) {
            isShowDeleteBtn = true;
        }
        AccountCondition accountCondition = new AccountCondition();
        accountCondition.setKeyWord(keywords);
        accountCondition.setOwnerId(ownerId);
        accountCondition.setOwnerType(ownertype);
        accountCondition.setRoleType(CommonConstants.RoleType.NORMAL.getType());
        int total = accountService.getCount(accountCondition);
        List<Account> accounts = accountService.getList(accountCondition, pageNum, pageSize);
        List<AccountView> accountViewList = ViewHelper.toAccountViewList(accounts, isShowDeleteBtn);
        PageView<AccountView> page = new PageView<AccountView>(pageSize, pageNum, total,
                accountViewList);
        SelectView selectView = new SelectView();
        if (CommonConstants.AccountType.CHANNELCOMPANY.getType().equals(ownertype)) {
            ChannelCompany channelCompany = channelCompanyService.getChannelComopanyById(ownerId);
            selectView = ViewHelper.channelToSelectView(channelCompany);
        } else if (CommonConstants.AccountType.CUSTOMER.getType().equals(ownertype)) {
            Customer customer = customerService.getCustomerById(ownerId);
            selectView = ViewHelper.customerToSelectView(customer);
        }

        model.addAttribute("ownertype", ownertype);
        model.addAttribute("selectView", selectView);
        model.addAttribute("accountPage", page);
        model.addAttribute("keyword", keywords);
        return "account/simple/list";
    }

    @RequestMapping(value = "/change_password", method = RequestMethod.GET)
    public String changePasswordPage() {

        return "account/change_password";
    }

    @ResponseBody
    @RequestMapping(value = "/change_password", method = RequestMethod.POST)
    public Object changePassword(
            @RequestParam(value = "oldpwd", required = true) String oldPassword,
            @RequestParam(value = "newpwd", required = true) String newPassword,
            HttpServletRequest request, Model model) {

        try {
            Account loginAccount = LoginUtil.getLoginAccount(request);
            String ucode = loginAccount.getUcode();
            BasicResult validateOldPwdResult = Util.checkPassword(oldPassword);
            BasicResult validateNewPwdResult = Util.checkPassword(newPassword);
            if (!validateOldPwdResult.isSuccess())
                return validateOldPwdResult;
            if (!validateNewPwdResult.isSuccess())
                return validateNewPwdResult;

            Account account = accountService.getAccountByUCode(ucode);

            if (account == null) {
                return new BasicResult(false, ReturnConstants.ACCOUNT_NOT_EXIST.getCode(), ReturnConstants.ACCOUNT_NOT_EXIST.getMessage());
            }

            if (oldPassword.trim().equals(newPassword)) {
                return new BasicResult(false, ReturnConstants.PASSWORD_REPEAT_ERROR.getCode(), ReturnConstants.PASSWORD_REPEAT_ERROR.getMessage());
            }

            oldPassword = Util.getMD5ByBase64(oldPassword.trim());
            String password = account.getPassword();
            if (!oldPassword.equals(password)) {
                LOGGER.info("changePassword password is not correct");
                return new BasicResult(false, ReturnConstants.OLD_PASSWORD_ERROR.getCode(), ReturnConstants.OLD_PASSWORD_ERROR.getMessage());
            }
            newPassword = Util.getMD5ByBase64(newPassword.trim());
            accountService.updatePassword(account.getId(), newPassword);

            return new BasicResult(true);
        } catch (Exception e) {
            LOGGER.error("changePassword ", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping(value = "/delete_account")
    public Object deleteAccount(@RequestParam(value = "ucode") String ucode, Model model) {
        try {
            Account account = accountService.getAccountByUCode(ucode);
            if (account == null) {
                return new BasicResult(false, ReturnConstants.ACCOUNT_NOT_EXIST.getCode(), ReturnConstants.ACCOUNT_NOT_EXIST.getMessage());
            }
            return accountService.deleteAccount(ucode);
        } catch (Exception e) {
            LOGGER.error("delete account fail; error:{}", e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }


    @ResponseBody
    @RequestMapping(value = "/reset_pwd")
    public Object resetPassword(@RequestParam(value = "ucode") String ucode, Model model) {
        try {
            Account account = accountService.getAccountByUCode(ucode);

            if (account == null) {
                return new BasicResult(false, ReturnConstants.ACCOUNT_NOT_EXIST.getCode(), ReturnConstants.ACCOUNT_NOT_EXIST.getMessage());
            }
            String newPassword = ServiceUtil.formatDate(new Date(), "yyyyMMdd");

            newPassword = Util.getMD5ByBase64(newPassword);
            LOGGER.info("resetPassword ucode={} newPassword={}", ucode, newPassword);

            return accountService.updatePassword(account.getId(), newPassword);
        } catch (Exception e) {
            LOGGER.error("resetPassword fail; ucode={} error:{}", ucode, e);
            return new BasicResult(false, ReturnConstants.DEFAULT_ERROR.getCode(), ReturnConstants.DEFAULT_ERROR.getMessage());
        }
    }


}
