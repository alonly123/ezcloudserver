package com.ezsmart.umcs.constant;

/**
 * Created by lixiangyang on 16/4/3.
 */
public class CommonConstants {
    public static final String SESSION_LOGIN_USER_KEY = "_login_user";
    public static final String SESSION_SPRING_SECURITY_CONTEXT_KEY = "SPRING_SECURITY_CONTEXT";

    public static final int COMMON_PAGE_SIZE = 20;

    /**
     * 最短密码
     */
    public static final int PASSWORD_MIN_LENGTH = 6;

    public static final String SUPER_ADMIN = "admin";

    /**
     * 用户角色：管理员/普通用户
     */
    public enum RoleType {
        ADMIN("0", "管理员"),
        NORMAL("1", "普通用户");
        private String type;
        private String name;

        RoleType(String type, String name) {
            this.type = type;
            this.name = name;
        }

        public String getType() {
            return type;
        }

        public String getName() {
            return name;
        }
    }

    /**
     * 账号类型：中间商/客户/公司账号
     */
    public enum AccountType {
        CHANNELCOMPANY("0", "中间商"),
        CUSTOMER("1", "客户"),
        ROOT("2", "直属账号");

        private String type;
        private String name;

        AccountType(String type, String name) {
            this.type = type;
            this.name = name;
        }

        public static String getTypeName(String type) {
            String typeName = "";
            for (AccountType accountType : AccountType.values()) {
                if (accountType.getType().equals(type)) {
                    typeName = accountType.getName();
                    break;
                }
            }
            return typeName;
        }

        public String getType() {
            return type;
        }

        public String getName() {
            return name;
        }

    }


    public enum SecurityRoleType {
        ADMIN("ROLE_ADMIN"),
        ROOT("ROLE_ROOT"),
        CHANNEL("ROLE_CHANNEL"),
        CUSTOMER("ROLE_CUSTOMER");

        private String value;

        SecurityRoleType(String value) {
            this.value = value;
        }

        public static SecurityRoleType findByValue(String value) {
            SecurityRoleType securityRoleType = null;
            for (SecurityRoleType srt : SecurityRoleType.values()) {
                if (srt.getValue().equals(value)) {
                    securityRoleType = srt;
                    break;
                }
            }
            return securityRoleType;
        }

        public String getValue() {
            return value;
        }
    }

    public enum MonitorHostPyhState {
        NORM("1", "正常"),
        BROKEN("3", "损坏");

        private String type;
        private String name;

        MonitorHostPyhState(String type, String name) {
            this.type = type;
            this.name = name;
        }

        public static String getTypeName(String type) {
            String typeName = "";
            for (AccountType accountType : AccountType.values()) {
                if (accountType.getType().equals(type)) {
                    typeName = accountType.getName();
                    break;
                }
            }
            return typeName;
        }

        public String getType() {
            return type;
        }

        public String getName() {
            return name;
        }

    }

    public enum MonitorHostState {
        OK("1", "正常"),
        WARN("3", "告警"),
        DANGER("5", "严重");

        private String type;
        private String name;

        MonitorHostState(String type, String name) {
            this.type = type;
            this.name = name;
        }

        public static String getTypeName(String type) {
            String typeName = "";
            for (AccountType accountType : AccountType.values()) {
                if (accountType.getType().equals(type)) {
                    typeName = accountType.getName();
                    break;
                }
            }
            return typeName;
        }

        public String getType() {
            return type;
        }

        public String getName() {
            return name;
        }

    }

    public enum MonitorHostConnState {
        ONLINE("1", "在线"),
        OFFLINE("2", "下线"),
        UNKNOWN("0", "未知");

        private String type;
        private String name;

        MonitorHostConnState(String type, String name) {
            this.type = type;
            this.name = name;
        }

        public static String getTypeName(String type) {
            String typeName = "";
            for (AccountType accountType : AccountType.values()) {
                if (accountType.getType().equals(type)) {
                    typeName = accountType.getName();
                    break;
                }
            }
            return typeName;
        }

        public String getType() {
            return type;
        }

        public String getName() {
            return name;
        }

    }


}
