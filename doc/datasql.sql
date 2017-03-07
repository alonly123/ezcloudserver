prompt PL/SQL Developer import file
prompt Created on 2016年5月10日 by xxx
set feedback off
set define off
prompt Dropping ACCOUNT...
drop table ACCOUNT cascade constraints;
prompt Dropping ADMINREGION...
drop table ADMINREGION cascade constraints;
prompt Dropping ALARM...
drop table ALARM cascade constraints;
prompt Dropping ALARMHISTORY...
drop table ALARMHISTORY cascade constraints;
prompt Dropping CHANNELCOMPANY...
drop table CHANNELCOMPANY cascade constraints;
prompt Dropping CHECKCOMMAND...
drop table CHECKCOMMAND cascade constraints;
prompt Dropping CHECKITEM...
drop table CHECKITEM cascade constraints;
prompt Dropping CHECKVALUEHISTORY...
drop table CHECKVALUEHISTORY cascade constraints;
prompt Dropping CHECKVALUETREND...
drop table CHECKVALUETREND cascade constraints;
prompt Dropping CUSTOMER...
drop table CUSTOMER cascade constraints;
prompt Dropping DEVICEMODEL_CHECKCOMMAND...
drop table DEVICEMODEL_CHECKCOMMAND cascade constraints;
prompt Dropping DEVICEMODEL_CHECKITEM...
drop table DEVICEMODEL_CHECKITEM cascade constraints;
prompt Dropping DISCOVEREDHOST...
drop table DISCOVEREDHOST cascade constraints;
prompt Dropping EVENT...
drop table EVENT cascade constraints;
prompt Dropping GEOLOCATION...
drop table GEOLOCATION cascade constraints;
prompt Dropping HOSTCONNECTHISTORY...
drop table HOSTCONNECTHISTORY cascade constraints;
prompt Dropping HOSTMODEL...
drop table HOSTMODEL cascade constraints;
prompt Dropping HOSTMODEL_PORT...
drop table HOSTMODEL_PORT cascade constraints;
prompt Dropping HOSTMODEL_TARGETDEVICE...
drop table HOSTMODEL_TARGETDEVICE cascade constraints;
prompt Dropping HOSTPORT...
drop table HOSTPORT cascade constraints;
prompt Dropping LOGINHISTORY...
drop table LOGINHISTORY cascade constraints;
prompt Dropping MONITORHOST...
drop table MONITORHOST cascade constraints;
prompt Dropping ROOM...
drop table ROOM cascade constraints;
prompt Dropping SMSTASK...
drop table SMSTASK cascade constraints;
prompt Dropping TARGETDEVICE...
drop table TARGETDEVICE cascade constraints;
prompt Dropping TARGETDEVICEMODEL...
drop table TARGETDEVICEMODEL cascade constraints;
prompt Creating ACCOUNT...
create table ACCOUNT
(
  ID         INTEGER not null,
  NAME       VARCHAR2(255),
  UCODE      VARCHAR2(255),
  PASSWORD   VARCHAR2(255),
  OWNERTYPE  VARCHAR2(255),
  OWNERID    INTEGER,
  ROLETYPE   VARCHAR2(255),
  EMAIL      VARCHAR2(255),
  DESCR      VARCHAR2(4000),
  CREATETIME DATE,
  UPDATETIME DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table ACCOUNT
  is '账号表';
comment on column ACCOUNT.ID
  is '主键';
comment on column ACCOUNT.NAME
  is '名称';
comment on column ACCOUNT.UCODE
  is '编号';
comment on column ACCOUNT.PASSWORD
  is '角色类型';
comment on column ACCOUNT.OWNERTYPE
  is '账号所属类型';
comment on column ACCOUNT.OWNERID
  is '账号所属id';
comment on column ACCOUNT.ROLETYPE
  is '角色类型';
comment on column ACCOUNT.EMAIL
  is '电子邮箱';
comment on column ACCOUNT.DESCR
  is '描述';
alter table ACCOUNT
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACCOUNT
  add unique (UCODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ADMINREGION...
create table ADMINREGION
(
  ID          INTEGER not null,
  CODE        NUMBER,
  NAME        VARCHAR2(255),
  REGIONLEVEL VARCHAR2(255),
  PCODE       INTEGER,
  CREATETIME  DATE default '',
  UPDATETIME  DATE default ''
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table ADMINREGION
  is '管理地区';
comment on column ADMINREGION.ID
  is '主键';
comment on column ADMINREGION.CODE
  is '邮编';
comment on column ADMINREGION.NAME
  is '名称';
comment on column ADMINREGION.REGIONLEVEL
  is '地区级别';
comment on column ADMINREGION.PCODE
  is '父地区';
alter table ADMINREGION
  add constraint PK_ADMINREGION primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index UIDX_ADMINREGION_CODE on ADMINREGION (CODE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ALARM...
create table ALARM
(
  ID         INTEGER not null,
  NAME       VARCHAR2(255),
  ALARMTIME  DATE,
  ALARMLEVEL VARCHAR2(255),
  ALARMTYPE  VARCHAR2(255),
  SOURCEID   INTEGER,
  SOURCETYPE VARCHAR2(255),
  CONTENT    VARCHAR2(4000),
  ACKTIME    DATE,
  ACKUSER    VARCHAR2(255),
  CREATETIME DATE default '',
  UPDATETIME DATE default '',
  HOSTUCODE  VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table ALARM
  is '报警表';
comment on column ALARM.ID
  is '主键';
comment on column ALARM.NAME
  is '事件名称';
comment on column ALARM.ALARMTIME
  is '发生时间';
comment on column ALARM.ALARMLEVEL
  is '级别';
comment on column ALARM.ALARMTYPE
  is '高级类型';
comment on column ALARM.SOURCEID
  is '触发源id';
comment on column ALARM.SOURCETYPE
  is '触发源表';
comment on column ALARM.CONTENT
  is '内容';
comment on column ALARM.ACKTIME
  is '确认时间';
comment on column ALARM.ACKUSER
  is '确认账号';
alter table ALARM
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ALARMHISTORY...
create table ALARMHISTORY
(
  ID         INTEGER not null,
  NAME       VARCHAR2(255),
  ALARMTIME  DATE,
  ALARMLEVEL VARCHAR2(255),
  ALARMTYPE  VARCHAR2(255),
  SOURCEID   INTEGER,
  SOURCETYPE VARCHAR2(255),
  CONTENT    VARCHAR2(4000),
  ACKTIME    DATE,
  ACKUSER    VARCHAR2(255),
  CREATETIME DATE default '',
  UPDATETIME DATE default '',
  HOSTUCODE  VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table ALARMHISTORY
  is '报警表';
comment on column ALARMHISTORY.ID
  is '主键';
comment on column ALARMHISTORY.NAME
  is '事件名称';
comment on column ALARMHISTORY.ALARMTIME
  is '发生时间';
comment on column ALARMHISTORY.ALARMLEVEL
  is '级别';
comment on column ALARMHISTORY.ALARMTYPE
  is '高级类型';
comment on column ALARMHISTORY.SOURCEID
  is '触发源id';
comment on column ALARMHISTORY.SOURCETYPE
  is '触发源表';
comment on column ALARMHISTORY.CONTENT
  is '内容';
comment on column ALARMHISTORY.ACKTIME
  is '确认时间';
comment on column ALARMHISTORY.ACKUSER
  is '确认账号';
alter table ALARMHISTORY
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CHANNELCOMPANY...
create table CHANNELCOMPANY
(
  ID         INTEGER not null,
  NAME       VARCHAR2(255),
  CONTACTS   VARCHAR2(255),
  MPHONE     VARCHAR2(255),
  PHONE      VARCHAR2(255),
  SALEVOLUME VARCHAR2(255),
  CREATETIME DATE,
  UPDATETIME DATE,
  AREACODE   NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table CHANNELCOMPANY
  is '建设单位（中间商）';
comment on column CHANNELCOMPANY.ID
  is '主键';
comment on column CHANNELCOMPANY.NAME
  is '公司名称';
comment on column CHANNELCOMPANY.CONTACTS
  is '联系人(可以多人以半角逗号分隔）';
comment on column CHANNELCOMPANY.MPHONE
  is '移动电话(可以多人以半角逗号分隔）';
comment on column CHANNELCOMPANY.PHONE
  is '电话';
comment on column CHANNELCOMPANY.SALEVOLUME
  is '销量';
alter table CHANNELCOMPANY
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CHECKCOMMAND...
create table CHECKCOMMAND
(
  ID                INTEGER not null,
  TARGETDEVICEID    INTEGER,
  TARGETDEVICEMODEL VARCHAR2(255),
  NAME              VARCHAR2(255),
  VALUE             VARCHAR2(255),
  VALUETYPE         VARCHAR2(255),
  CREATETIME        DATE default '',
  UPDATETIME        DATE default '',
  PARAM             VARCHAR2(500),
  HOSTUCODE         VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table CHECKCOMMAND
  is '监控节点参数';
comment on column CHECKCOMMAND.ID
  is '主键';
comment on column CHECKCOMMAND.TARGETDEVICEID
  is '所属监控节点';
comment on column CHECKCOMMAND.TARGETDEVICEMODEL
  is '所归属目标设备型号';
comment on column CHECKCOMMAND.NAME
  is '参数名称';
comment on column CHECKCOMMAND.VALUE
  is '参数值';
comment on column CHECKCOMMAND.VALUETYPE
  is '参数值类型';
comment on column CHECKCOMMAND.HOSTUCODE
  is '设备唯一号';
alter table CHECKCOMMAND
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating CHECKITEM...
create table CHECKITEM
(
  ID                INTEGER not null,
  HOSTUCODE         VARCHAR2(255),
  TARGETDEVICEID    INTEGER,
  TARGETDEVICEMODEL VARCHAR2(255),
  NAME              VARCHAR2(255),
  CODE              VARCHAR2(255),
  MAXVALUE          FLOAT,
  MINVALUE          FLOAT,
  EQVALUE           INTEGER,
  VALUETYPE         VARCHAR2(255),
  CREATETIME        DATE default '',
  UPDATETIME        DATE default ''
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table CHECKITEM
  is '监控节点key描述';
comment on column CHECKITEM.ID
  is '主键';
comment on column CHECKITEM.HOSTUCODE
  is '主机编号';
comment on column CHECKITEM.TARGETDEVICEID
  is '所属监控节点';
comment on column CHECKITEM.TARGETDEVICEMODEL
  is '所归属目标设备型号';
comment on column CHECKITEM.NAME
  is 'KEY名称';
comment on column CHECKITEM.CODE
  is 'Key编号';
comment on column CHECKITEM.MAXVALUE
  is '最大告警阈值';
comment on column CHECKITEM.MINVALUE
  is '最小告警阈值';
comment on column CHECKITEM.EQVALUE
  is '相等告警';
comment on column CHECKITEM.VALUETYPE
  is '值类型';
alter table CHECKITEM
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating CHECKVALUEHISTORY...
create table CHECKVALUEHISTORY
(
  ID          INTEGER not null,
  ITEMID      INTEGER,
  NUMBERVALUE FLOAT,
  STRINGVALUE VARCHAR2(255),
  TIME        TIMESTAMP(6),
  CREATETIME  DATE default '',
  UPDATETIME  DATE default ''
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table CHECKVALUEHISTORY
  is '监控节点值描述';
comment on column CHECKVALUEHISTORY.ID
  is '主键';
comment on column CHECKVALUEHISTORY.ITEMID
  is '所属key值';
comment on column CHECKVALUEHISTORY.NUMBERVALUE
  is '字符串值';
comment on column CHECKVALUEHISTORY.STRINGVALUE
  is 'KEY名称';
comment on column CHECKVALUEHISTORY.TIME
  is '采集时间';
alter table CHECKVALUEHISTORY
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating CHECKVALUETREND...
create table CHECKVALUETREND
(
  ID         INTEGER not null,
  ITEMID     INTEGER,
  VALUEMIN   FLOAT,
  VALUEAVG   FLOAT,
  VALUEMAX   FLOAT,
  TIME       TIMESTAMP(6),
  CREATETIME DATE default '',
  UPDATETIME DATE default ''
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table CHECKVALUETREND
  is '监控节点值描述1小时趋势数据';
comment on column CHECKVALUETREND.ID
  is '主键';
comment on column CHECKVALUETREND.ITEMID
  is '所属key值';
comment on column CHECKVALUETREND.VALUEMIN
  is '最小值';
comment on column CHECKVALUETREND.VALUEAVG
  is '平均值';
comment on column CHECKVALUETREND.VALUEMAX
  is '最大值';
comment on column CHECKVALUETREND.TIME
  is '采集时间';
alter table CHECKVALUETREND
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating CUSTOMER...
create table CUSTOMER
(
  ID          INTEGER not null,
  NAME        VARCHAR2(255),
  CONTACTS    VARCHAR2(255),
  MAINTIANER  VARCHAR2(255),
  MPHONE      VARCHAR2(255),
  PHONE       VARCHAR2(255),
  NOTIFYPHONE VARCHAR2(255),
  NOTIFYEMAIL VARCHAR2(255),
  POSTCODE    VARCHAR2(255),
  PID         INTEGER,
  CREATETIME  DATE,
  UPDATETIME  DATE,
  AREACODE    NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table CUSTOMER
  is '使用单位（最终用户）';
comment on column CUSTOMER.ID
  is '主键';
comment on column CUSTOMER.NAME
  is '名称';
comment on column CUSTOMER.CONTACTS
  is '联系人';
comment on column CUSTOMER.MAINTIANER
  is '设备维护人';
comment on column CUSTOMER.MPHONE
  is '移动电话(可以多人以半角逗号分隔）';
comment on column CUSTOMER.PHONE
  is '固定电话，可为空';
comment on column CUSTOMER.NOTIFYPHONE
  is '告警通知电话(可以多人以半角逗号分隔）';
comment on column CUSTOMER.NOTIFYEMAIL
  is '告警通知邮箱(可以多人以半角逗号分隔）';
comment on column CUSTOMER.POSTCODE
  is '邮编号';
comment on column CUSTOMER.PID
  is '上级单位';
alter table CUSTOMER
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating DEVICEMODEL_CHECKCOMMAND...
create table DEVICEMODEL_CHECKCOMMAND
(
  ID                INTEGER not null,
  TARGETDEVICEMODEL VARCHAR2(255),
  NAME              VARCHAR2(255),
  VALUE             VARCHAR2(255),
  VALUETYPE         VARCHAR2(255),
  CREATETIME        DATE default '',
  UPDATETIME        DATE default '',
  CODE              VARCHAR2(20),
  PARAM             VARCHAR2(500)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DEVICEMODEL_CHECKCOMMAND
  is '节点型号检测参数';
comment on column DEVICEMODEL_CHECKCOMMAND.ID
  is '主键';
comment on column DEVICEMODEL_CHECKCOMMAND.TARGETDEVICEMODEL
  is '外设型号';
comment on column DEVICEMODEL_CHECKCOMMAND.NAME
  is '参数名称';
comment on column DEVICEMODEL_CHECKCOMMAND.VALUE
  is '参数值';
comment on column DEVICEMODEL_CHECKCOMMAND.VALUETYPE
  is '参数值类型';
comment on column DEVICEMODEL_CHECKCOMMAND.CODE
  is '编码4字符长度';
comment on column DEVICEMODEL_CHECKCOMMAND.PARAM
  is '参数';
alter table DEVICEMODEL_CHECKCOMMAND
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DEVICEMODEL_CHECKCOMMAND
  add unique (TARGETDEVICEMODEL)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating DEVICEMODEL_CHECKITEM...
create table DEVICEMODEL_CHECKITEM
(
  ID                INTEGER not null,
  TARGETDEVICEMODEL VARCHAR2(255),
  NAME              VARCHAR2(255),
  CODE              VARCHAR2(255),
  MAXVALUE          FLOAT,
  MINVALUE          FLOAT,
  EQVALUE           FLOAT,
  VALUETYPE         VARCHAR2(255),
  CREATETIME        DATE default '',
  UPDATETIME        DATE default ''
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DEVICEMODEL_CHECKITEM
  is '节点型号检测项目';
comment on column DEVICEMODEL_CHECKITEM.ID
  is '主键';
comment on column DEVICEMODEL_CHECKITEM.TARGETDEVICEMODEL
  is '目标设备型号';
comment on column DEVICEMODEL_CHECKITEM.NAME
  is 'KEY名称';
comment on column DEVICEMODEL_CHECKITEM.CODE
  is 'Key编号';
comment on column DEVICEMODEL_CHECKITEM.MAXVALUE
  is '最大告警阈值';
comment on column DEVICEMODEL_CHECKITEM.MINVALUE
  is '最小告警阈值';
comment on column DEVICEMODEL_CHECKITEM.EQVALUE
  is '等于值';
comment on column DEVICEMODEL_CHECKITEM.VALUETYPE
  is '值类型';
alter table DEVICEMODEL_CHECKITEM
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating DISCOVEREDHOST...
create table DISCOVEREDHOST
(
  ID            INTEGER not null,
  UCODE         VARCHAR2(255),
  PYHSTATE      VARCHAR2(255),
  CONNSTATE     VARCHAR2(255),
  DISCOVERYTIME DATE,
  LASTCHECK     DATE,
  CREATETIME    DATE default '',
  UPDATETIME    DATE default ''
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table DISCOVEREDHOST
  is '发现主机';
comment on column DISCOVEREDHOST.ID
  is '主键';
comment on column DISCOVEREDHOST.UCODE
  is '编号';
comment on column DISCOVEREDHOST.PYHSTATE
  is '设备物理状态';
comment on column DISCOVEREDHOST.CONNSTATE
  is '连接状态';
comment on column DISCOVEREDHOST.DISCOVERYTIME
  is '首次发现时间';
comment on column DISCOVEREDHOST.LASTCHECK
  is '最近更新时间';
alter table DISCOVEREDHOST
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table DISCOVEREDHOST
  add unique (UCODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating EVENT...
create table EVENT
(
  ID         INTEGER not null,
  NAME       VARCHAR2(255),
  EVENTTIME  DATE,
  SOURCEID   INTEGER,
  SOURCETYPE VARCHAR2(255),
  CONTENT    VARCHAR2(4000),
  CREATETIME DATE default '',
  UPDATETIME DATE default ''
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table EVENT
  is '事件表';
comment on column EVENT.ID
  is '主键';
comment on column EVENT.NAME
  is '名称';
comment on column EVENT.EVENTTIME
  is '发生时间';
comment on column EVENT.SOURCEID
  is '触发源id';
comment on column EVENT.SOURCETYPE
  is '触发源表';
comment on column EVENT.CONTENT
  is '内容';
alter table EVENT
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating GEOLOCATION...
create table GEOLOCATION
(
  ID         INTEGER not null,
  NAME       VARCHAR2(255),
  LON        FLOAT,
  LAT        FLOAT,
  POSTCODE   VARCHAR2(255),
  ADDRESS    VARCHAR2(255),
  CREATETIME DATE default '',
  UPDATETIME DATE default '',
  AREACODE   VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table GEOLOCATION
  is '建筑物表';
comment on column GEOLOCATION.ID
  is '主键';
comment on column GEOLOCATION.NAME
  is '名称';
comment on column GEOLOCATION.LON
  is '经度';
comment on column GEOLOCATION.LAT
  is '纬度';
comment on column GEOLOCATION.POSTCODE
  is '邮编';
comment on column GEOLOCATION.ADDRESS
  is '地址';
comment on column GEOLOCATION.AREACODE
  is '����code';
alter table GEOLOCATION
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating HOSTCONNECTHISTORY...
create table HOSTCONNECTHISTORY
(
  ID          INTEGER not null,
  HOSTUCODE   VARCHAR2(255),
  LASTONLINE  DATE,
  LASTOFFLINE DATE,
  CREATETIME  DATE default '',
  UPDATETIME  DATE default ''
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HOSTCONNECTHISTORY
  is '设备在线日志';
comment on column HOSTCONNECTHISTORY.ID
  is '主键';
comment on column HOSTCONNECTHISTORY.HOSTUCODE
  is '主机唯一号';
comment on column HOSTCONNECTHISTORY.LASTONLINE
  is '最近上线时间';
comment on column HOSTCONNECTHISTORY.LASTOFFLINE
  is '最近下线时间';
alter table HOSTCONNECTHISTORY
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HOSTCONNECTHISTORY
  add unique (HOSTUCODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating HOSTMODEL...
create table HOSTMODEL
(
  ID         INTEGER not null,
  MODEL      VARCHAR2(20),
  NAME       VARCHAR2(300),
  DESCR      VARCHAR2(4000),
  CREATETIME DATE default '',
  UPDATETIME DATE default ''
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HOSTMODEL
  is '设备型号';
comment on column HOSTMODEL.ID
  is '主键';
comment on column HOSTMODEL.MODEL
  is '型号';
comment on column HOSTMODEL.NAME
  is '名称';
comment on column HOSTMODEL.DESCR
  is '描述';
alter table HOSTMODEL
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating HOSTMODEL_PORT...
create table HOSTMODEL_PORT
(
  ID         INTEGER not null,
  UCODE      VARCHAR2(255),
  NAME       VARCHAR2(255),
  HOSTMODEL  VARCHAR2(20),
  SPEC       VARCHAR2(255),
  CREATETIME DATE default '',
  UPDATETIME DATE default ''
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HOSTMODEL_PORT
  is '设备型号端口';
comment on column HOSTMODEL_PORT.ID
  is '主键';
comment on column HOSTMODEL_PORT.UCODE
  is '端口唯一标识';
comment on column HOSTMODEL_PORT.NAME
  is '名称';
comment on column HOSTMODEL_PORT.HOSTMODEL
  is '对应的主机型号';
comment on column HOSTMODEL_PORT.SPEC
  is '端口类型';
alter table HOSTMODEL_PORT
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating HOSTMODEL_TARGETDEVICE...
create table HOSTMODEL_TARGETDEVICE
(
  ID          INTEGER not null,
  PORTUCODE   VARCHAR2(255),
  DEVICEMODEL VARCHAR2(255),
  NAME        VARCHAR2(255),
  DEVICETYPE  VARCHAR2(255),
  ADDR        INTEGER,
  CREATETIME  DATE,
  UPDATETIME  DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table HOSTMODEL_TARGETDEVICE
  is '设备型号监控终端';
comment on column HOSTMODEL_TARGETDEVICE.ID
  is '主键';
comment on column HOSTMODEL_TARGETDEVICE.PORTUCODE
  is '对应模板端口ID';
comment on column HOSTMODEL_TARGETDEVICE.DEVICEMODEL
  is '型号';
comment on column HOSTMODEL_TARGETDEVICE.NAME
  is '名称';
comment on column HOSTMODEL_TARGETDEVICE.DEVICETYPE
  is '监控节点类型';
comment on column HOSTMODEL_TARGETDEVICE.ADDR
  is '地址';
alter table HOSTMODEL_TARGETDEVICE
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating HOSTPORT...
create table HOSTPORT
(
  ID         INTEGER not null,
  NAME       VARCHAR2(255),
  UCODE      VARCHAR2(255),
  HOSTUCODE  VARCHAR2(255),
  SPEC       VARCHAR2(255),
  CREATETIME DATE default '',
  UPDATETIME DATE default '',
  PARAM      VARCHAR2(500)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table HOSTPORT
  is '监控端口';
comment on column HOSTPORT.ID
  is '主键';
comment on column HOSTPORT.NAME
  is '名称';
comment on column HOSTPORT.UCODE
  is '编号';
comment on column HOSTPORT.HOSTUCODE
  is '所在监控主机唯一编码';
comment on column HOSTPORT.SPEC
  is '端口类型';
comment on column HOSTPORT.PARAM
  is '端口参数';
alter table HOSTPORT
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HOSTPORT
  add unique (UCODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating LOGINHISTORY...
create table LOGINHISTORY
(
  ID         INTEGER not null,
  USERCODE   VARCHAR2(255),
  LOGINTIME  DATE,
  USERIPADDR VARCHAR2(255),
  CREATETIME DATE,
  UPDATETIME DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table LOGINHISTORY
  is '登录日志表';
comment on column LOGINHISTORY.ID
  is '主键';
comment on column LOGINHISTORY.USERCODE
  is '编号';
comment on column LOGINHISTORY.LOGINTIME
  is '登录时间';
comment on column LOGINHISTORY.USERIPADDR
  is '登录的用户IP';
alter table LOGINHISTORY
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating MONITORHOST...
create table MONITORHOST
(
  ID               INTEGER not null,
  NAME             VARCHAR2(255),
  UCODE            VARCHAR2(255),
  MODEL            VARCHAR2(255),
  IPADDR           VARCHAR2(255),
  IMEI             VARCHAR2(255),
  PHONE            VARCHAR2(255),
  LOCATIONID       INTEGER,
  ROOMID           INTEGER,
  CUSTOMERID       INTEGER,
  CHANNELCOMPANYID INTEGER,
  PHYSTATE         VARCHAR2(255),
  STATE            VARCHAR2(255),
  CONNSTATE        VARCHAR2(255),
  LASTCHECK        DATE,
  CREATETIME       DATE default '',
  UPDATETIME       DATE default ''
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table MONITORHOST
  is '设备表(监控主机)';
comment on column MONITORHOST.ID
  is '主键';
comment on column MONITORHOST.NAME
  is '名称';
comment on column MONITORHOST.UCODE
  is '编号';
comment on column MONITORHOST.MODEL
  is '型号';
comment on column MONITORHOST.IPADDR
  is '上报IP';
comment on column MONITORHOST.IMEI
  is '通讯卡imei号';
comment on column MONITORHOST.PHONE
  is '通讯卡手机号';
comment on column MONITORHOST.LOCATIONID
  is '位置点';
comment on column MONITORHOST.ROOMID
  is '监控室';
comment on column MONITORHOST.CUSTOMERID
  is '使用客户';
comment on column MONITORHOST.CHANNELCOMPANYID
  is '施工单位';
comment on column MONITORHOST.PHYSTATE
  is '设备物理状态';
comment on column MONITORHOST.STATE
  is '运行状态';
comment on column MONITORHOST.CONNSTATE
  is '连接状态';
comment on column MONITORHOST.LASTCHECK
  is '最近上报时间';
alter table MONITORHOST
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MONITORHOST
  add unique (UCODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ROOM...
create table ROOM
(
  ID          INTEGER not null,
  NAME        VARCHAR2(255),
  LOCATIONID  INTEGER,
  WIDTH       FLOAT,
  HEIGHT      FLOAT,
  PICURL      VARCHAR2(255),
  PICWIDTH    INTEGER,
  PICHEIGHT   INTEGER,
  MODELID     INTEGER,
  FLOORNUMBER INTEGER,
  STATE       VARCHAR2(255),
  CREATETIME  DATE default '',
  UPDATETIME  DATE default ''
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table ROOM
  is '监控室';
comment on column ROOM.ID
  is '主键';
comment on column ROOM.NAME
  is '名称';
comment on column ROOM.LOCATIONID
  is '位置点';
comment on column ROOM.WIDTH
  is '宽';
comment on column ROOM.HEIGHT
  is '高';
comment on column ROOM.PICURL
  is '伪三维图地址';
comment on column ROOM.PICWIDTH
  is '图宽';
comment on column ROOM.PICHEIGHT
  is '图高';
comment on column ROOM.MODELID
  is '所属三维建模';
comment on column ROOM.FLOORNUMBER
  is '楼层号';
comment on column ROOM.STATE
  is '状态';
alter table ROOM
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SMSTASK...
create table SMSTASK
(
  ID         INTEGER not null,
  EVENTTIME  DATE,
  KEYID      INTEGER,
  EVENTID    INTEGER,
  CONTENT    VARCHAR2(4000),
  SENDTIME   DATE,
  PHONE      VARCHAR2(255),
  CREATETIME DATE default '',
  UPDATETIME DATE default ''
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SMSTASK
  is '短信告警任务';
comment on column SMSTASK.ID
  is '主键';
comment on column SMSTASK.EVENTTIME
  is '发生时间';
comment on column SMSTASK.KEYID
  is '触发源id';
comment on column SMSTASK.EVENTID
  is '事件id';
comment on column SMSTASK.CONTENT
  is '内容';
comment on column SMSTASK.SENDTIME
  is '发送时间';
comment on column SMSTASK.PHONE
  is '实际发送号码';
alter table SMSTASK
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TARGETDEVICE...
create table TARGETDEVICE
(
  ID            INTEGER not null,
  CODE          VARCHAR2(255),
  NAME          VARCHAR2(255),
  PORTUCODE     VARCHAR2(500),
  ADDR          INTEGER,
  DEVICETYPE    VARCHAR2(255),
  ISUSE         NUMBER(1),
  CHECKINTERVAL INTEGER,
  PHYSTATE      VARCHAR2(255),
  STATE         VARCHAR2(255),
  LASTCHECK     DATE,
  MODEL         VARCHAR2(255),
  GRAPHX        INTEGER,
  GRAPHY        INTEGER,
  CREATETIME    DATE default '',
  UPDATETIME    DATE default '',
  HOSTUCODE     VARCHAR2(500)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TARGETDEVICE
  is '监控节点（监控终端）';
comment on column TARGETDEVICE.ID
  is '主键';
comment on column TARGETDEVICE.CODE
  is '编号';
comment on column TARGETDEVICE.NAME
  is '名称';
comment on column TARGETDEVICE.PORTUCODE
  is '所在端子';
comment on column TARGETDEVICE.ADDR
  is '地址号';
comment on column TARGETDEVICE.DEVICETYPE
  is '监控节点类型';
comment on column TARGETDEVICE.ISUSE
  is '是否使用中';
comment on column TARGETDEVICE.CHECKINTERVAL
  is '采集频率';
comment on column TARGETDEVICE.PHYSTATE
  is '物理状态';
comment on column TARGETDEVICE.STATE
  is '运行状态';
comment on column TARGETDEVICE.LASTCHECK
  is '最后采集时间';
comment on column TARGETDEVICE.MODEL
  is '设备型号';
comment on column TARGETDEVICE.GRAPHX
  is 'X坐标';
comment on column TARGETDEVICE.GRAPHY
  is 'Y坐标';
comment on column TARGETDEVICE.HOSTUCODE
  is '设备唯一编号';
alter table TARGETDEVICE
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TARGETDEVICE
  add unique (CODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TARGETDEVICEMODEL...
create table TARGETDEVICEMODEL
(
  ID         INTEGER not null,
  MODEL      VARCHAR2(20),
  NAME       VARCHAR2(255),
  VENDOR     VARCHAR2(255),
  DESCR      VARCHAR2(3000),
  CREATETIME DATE default '',
  UPDATETIME DATE default '',
  LONGMODEL  VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TARGETDEVICEMODEL
  is '目标设备型号库';
comment on column TARGETDEVICEMODEL.ID
  is '主键';
comment on column TARGETDEVICEMODEL.MODEL
  is '型号';
comment on column TARGETDEVICEMODEL.NAME
  is '型号名称';
comment on column TARGETDEVICEMODEL.VENDOR
  is '供应商';
comment on column TARGETDEVICEMODEL.DESCR
  is '备注说明';
comment on column TARGETDEVICEMODEL.LONGMODEL
  is '长型号';
alter table TARGETDEVICEMODEL
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TARGETDEVICEMODEL
  add unique (MODEL)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for ACCOUNT...
alter table ACCOUNT disable all triggers;
prompt Disabling triggers for ADMINREGION...
alter table ADMINREGION disable all triggers;
prompt Disabling triggers for ALARM...
alter table ALARM disable all triggers;
prompt Disabling triggers for ALARMHISTORY...
alter table ALARMHISTORY disable all triggers;
prompt Disabling triggers for CHANNELCOMPANY...
alter table CHANNELCOMPANY disable all triggers;
prompt Disabling triggers for CHECKCOMMAND...
alter table CHECKCOMMAND disable all triggers;
prompt Disabling triggers for CHECKITEM...
alter table CHECKITEM disable all triggers;
prompt Disabling triggers for CHECKVALUEHISTORY...
alter table CHECKVALUEHISTORY disable all triggers;
prompt Disabling triggers for CHECKVALUETREND...
alter table CHECKVALUETREND disable all triggers;
prompt Disabling triggers for CUSTOMER...
alter table CUSTOMER disable all triggers;
prompt Disabling triggers for DEVICEMODEL_CHECKCOMMAND...
alter table DEVICEMODEL_CHECKCOMMAND disable all triggers;
prompt Disabling triggers for DEVICEMODEL_CHECKITEM...
alter table DEVICEMODEL_CHECKITEM disable all triggers;
prompt Disabling triggers for DISCOVEREDHOST...
alter table DISCOVEREDHOST disable all triggers;
prompt Disabling triggers for EVENT...
alter table EVENT disable all triggers;
prompt Disabling triggers for GEOLOCATION...
alter table GEOLOCATION disable all triggers;
prompt Disabling triggers for HOSTCONNECTHISTORY...
alter table HOSTCONNECTHISTORY disable all triggers;
prompt Disabling triggers for HOSTMODEL...
alter table HOSTMODEL disable all triggers;
prompt Disabling triggers for HOSTMODEL_PORT...
alter table HOSTMODEL_PORT disable all triggers;
prompt Disabling triggers for HOSTMODEL_TARGETDEVICE...
alter table HOSTMODEL_TARGETDEVICE disable all triggers;
prompt Disabling triggers for HOSTPORT...
alter table HOSTPORT disable all triggers;
prompt Disabling triggers for LOGINHISTORY...
alter table LOGINHISTORY disable all triggers;
prompt Disabling triggers for MONITORHOST...
alter table MONITORHOST disable all triggers;
prompt Disabling triggers for ROOM...
alter table ROOM disable all triggers;
prompt Disabling triggers for SMSTASK...
alter table SMSTASK disable all triggers;
prompt Disabling triggers for TARGETDEVICE...
alter table TARGETDEVICE disable all triggers;
prompt Disabling triggers for TARGETDEVICEMODEL...
alter table TARGETDEVICEMODEL disable all triggers;
prompt Loading ACCOUNT...
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (3593, '1002', '1002', '96E79218965EB72C92A549DD5A330112', '0', 3567, '1', '1002', '1002', null, to_date('10-04-2016 21:30:56', 'dd-mm-yyyy hh24:mi:ss'));
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (2, 'admin', 'admin', '96E79218965EB72C92A549DD5A330112', '2', 0, '0', 'admin', 'admin', null, to_date('10-04-2016 15:49:41', 'dd-mm-yyyy hh24:mi:ss'));
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (3605, 'ch001', 'ch001', '96E79218965EB72C92A549DD5A330112', '0', 3604, '1', 'ch001', 'ch001', to_date('10-04-2016 13:15:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-04-2016 15:43:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (3606, '1008', '1008', '96E79218965EB72C92A549DD5A330112', '0', 3604, '1', null, null, to_date('10-04-2016 13:20:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-04-2016 13:20:44', 'dd-mm-yyyy hh24:mi:ss'));
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (3610, 'c001', 'c001', '96E79218965EB72C92A549DD5A330112', '1', 3608, '1', 'c001', 'c001', to_date('10-04-2016 15:57:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-04-2016 15:57:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (3554, '123', '123213', '96E79218965EB72C92A549DD5A330112', '2', 0, '0', '213', '12321', null, null);
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (3556, '1232', '2134', '96E79218965EB72C92A549DD5A330112', '2', 0, '0', '21s', 'zad', null, null);
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (3557, '1233333333', '1213', '96E79218965EB72C92A549DD5A330112', '2', 0, '0', '213', '213', null, null);
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (3558, 'test23', 'test24', '96E79218965EB72C92A549DD5A330112', '2', 0, '0', 'test33', 'test33', null, null);
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (3594, '10012', '10012', '96E79218965EB72C92A549DD5A330112', '1', 3585, '1', '10012', '10012', null, null);
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (3597, 'root', 'root', '96E79218965EB72C92A549DD5A330112', '2', 0, '0', 'xiejy@fzcjit.com.cn', '测试账号3', null, to_date('14-04-2016 01:06:04', 'dd-mm-yyyy hh24:mi:ss'));
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (3598, '1005', '1005', '96E79218965EB72C92A549DD5A330112', '1', 3585, '1', '1005', '1005', null, null);
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (1, '李向阳', '1', '96E79218965EB72C92A549DD5A330112', '2', 0, '0', null, null, null, to_date('10-04-2016 15:50:10', 'dd-mm-yyyy hh24:mi:ss'));
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (3579, '321', 'hehe', '96E79218965EB72C92A549DD5A330112', '2', 0, '0', '213', '23', null, to_date('10-04-2016 15:50:24', 'dd-mm-yyyy hh24:mi:ss'));
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (3601, 'admin_03', 'admin_03', '96E79218965EB72C92A549DD5A330112', '2', 0, '0', 'admin_03', 'admin_03', to_date('10-04-2016 11:08:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-04-2016 11:08:25', 'dd-mm-yyyy hh24:mi:ss'));
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (3602, 'admin_04', 'admin_04', '96E79218965EB72C92A549DD5A330112', '2', 0, '0', 'admin_04', 'admin_04', to_date('10-04-2016 11:09:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-04-2016 11:09:20', 'dd-mm-yyyy hh24:mi:ss'));
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (3603, '1006', '1006', '96E79218965EB72C92A549DD5A330112', '0', 3567, '1', '1006', '1006', to_date('10-04-2016 11:10:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-04-2016 11:10:25', 'dd-mm-yyyy hh24:mi:ss'));
insert into ACCOUNT (ID, NAME, UCODE, PASSWORD, OWNERTYPE, OWNERID, ROLETYPE, EMAIL, DESCR, CREATETIME, UPDATETIME)
values (3611, '2', '2222222222', '96E79218965EB72C92A549DD5A330112', '0', 3604, '1', '2', '2', to_date('11-04-2016 12:52:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-04-2016 12:52:24', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 18 records loaded
prompt Loading ADMINREGION...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1, 130725, '尚义县', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2, 130726, '蔚　县', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3, 130727, '阳原县', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (4, 130728, '怀安县', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (5, 130729, '万全县', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (6, 130730, '怀来县', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (7, 130731, '涿鹿县', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (8, 130732, '赤城县', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (9, 130733, '崇礼县', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (10, 130801, '市辖区', '3', 130800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (11, 130802, '双桥区', '3', 130800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (12, 130803, '双滦区', '3', 130800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (13, 130804, '鹰手营子矿区', '3', 130800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (14, 130821, '承德县', '3', 130800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (15, 130822, '兴隆县', '3', 130800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (16, 130823, '平泉县', '3', 130800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (17, 130824, '滦平县', '3', 130800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (18, 130825, '隆化县', '3', 130800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (19, 130826, '丰宁满族自治县', '3', 130800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (20, 130827, '宽城满族自治县', '3', 130800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (21, 130828, '围场满族蒙古族自治县', '3', 130800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (22, 130901, '市辖区', '3', 130900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (23, 130902, '新华区', '3', 130900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (24, 130903, '运河区', '3', 130900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (25, 130921, '沧　县', '3', 130900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (26, 130922, '青　县', '3', 130900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (27, 130923, '东光县', '3', 130900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (28, 130924, '海兴县', '3', 130900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (29, 130925, '盐山县', '3', 130900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (30, 130926, '肃宁县', '3', 130900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (31, 130927, '南皮县', '3', 130900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (32, 130928, '吴桥县', '3', 130900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (33, 130929, '献　县', '3', 130900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (34, 130930, '孟村回族自治县', '3', 130900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (35, 130981, '泊头市', '3', 130900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (36, 130982, '任丘市', '3', 130900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (37, 130983, '黄骅市', '3', 130900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (38, 130984, '河间市', '3', 130900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (39, 131001, '市辖区', '3', 131000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (40, 131002, '安次区', '3', 131000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (41, 131003, '广阳区', '3', 131000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (42, 131022, '固安县', '3', 131000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (43, 131023, '永清县', '3', 131000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (44, 131024, '香河县', '3', 131000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (45, 131025, '大城县', '3', 131000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (46, 131026, '文安县', '3', 131000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (47, 131028, '大厂回族自治县', '3', 131000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (48, 131081, '霸州市', '3', 131000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (49, 131082, '三河市', '3', 131000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (50, 131101, '市辖区', '3', 131100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (51, 131102, '桃城区', '3', 131100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (52, 131121, '枣强县', '3', 131100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (53, 131122, '武邑县', '3', 131100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (54, 131123, '武强县', '3', 131100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (55, 131124, '饶阳县', '3', 131100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (56, 131125, '安平县', '3', 131100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (57, 131126, '故城县', '3', 131100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (58, 131127, '景　县', '3', 131100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (59, 131128, '阜城县', '3', 131100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (60, 131181, '冀州市', '3', 131100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (61, 131182, '深州市', '3', 131100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (62, 140101, '市辖区', '3', 140100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (63, 140105, '小店区', '3', 140100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (64, 140106, '迎泽区', '3', 140100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (65, 140107, '杏花岭区', '3', 140100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (66, 140108, '尖草坪区', '3', 140100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (67, 140109, '万柏林区', '3', 140100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (68, 140110, '晋源区', '3', 140100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (69, 140121, '清徐县', '3', 140100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (70, 140122, '阳曲县', '3', 140100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (71, 140123, '娄烦县', '3', 140100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (72, 140181, '古交市', '3', 140100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (73, 140201, '市辖区', '3', 140200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (74, 140202, '城　区', '3', 140200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (75, 140203, '矿　区', '3', 140200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (76, 140211, '南郊区', '3', 140200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (77, 140212, '新荣区', '3', 140200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (78, 140221, '阳高县', '3', 140200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (79, 140222, '天镇县', '3', 140200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (80, 140223, '广灵县', '3', 140200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (81, 140224, '灵丘县', '3', 140200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (82, 140225, '浑源县', '3', 140200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (83, 140226, '左云县', '3', 140200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (84, 140227, '大同县', '3', 140200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (85, 140301, '市辖区', '3', 140300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (86, 140302, '城　区', '3', 140300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (87, 140303, '矿　区', '3', 140300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (88, 140311, '郊　区', '3', 140300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (89, 140321, '平定县', '3', 140300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (90, 140322, '盂　县', '3', 140300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (91, 140401, '市辖区', '3', 140400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (92, 140402, '城　区', '3', 140400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (93, 140411, '郊　区', '3', 140400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (94, 140421, '长治县', '3', 140400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (95, 140423, '襄垣县', '3', 140400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (96, 140424, '屯留县', '3', 140400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (97, 140425, '平顺县', '3', 140400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (98, 140426, '黎城县', '3', 140400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (99, 140427, '壶关县', '3', 140400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (100, 140428, '长子县', '3', 140400, null, null);
commit;
prompt 100 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (101, 140429, '武乡县', '3', 140400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (102, 140430, '沁　县', '3', 140400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (103, 140431, '沁源县', '3', 140400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (104, 140481, '潞城市', '3', 140400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (105, 140501, '市辖区', '3', 140500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (106, 140502, '城　区', '3', 140500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (107, 140521, '沁水县', '3', 140500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (108, 140522, '阳城县', '3', 140500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (109, 140524, '陵川县', '3', 140500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (110, 140525, '泽州县', '3', 140500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (111, 140581, '高平市', '3', 140500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (112, 140601, '市辖区', '3', 140600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (113, 140602, '朔城区', '3', 140600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (114, 140603, '平鲁区', '3', 140600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (115, 140621, '山阴县', '3', 140600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (116, 140622, '应　县', '3', 140600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (117, 140623, '右玉县', '3', 140600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (118, 140624, '怀仁县', '3', 140600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (119, 140701, '市辖区', '3', 140700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (120, 140702, '榆次区', '3', 140700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (121, 140721, '榆社县', '3', 140700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (122, 140722, '左权县', '3', 140700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (123, 140723, '和顺县', '3', 140700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (124, 140724, '昔阳县', '3', 140700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (125, 140725, '寿阳县', '3', 140700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (126, 140726, '太谷县', '3', 140700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (127, 140727, '祁　县', '3', 140700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (128, 140728, '平遥县', '3', 140700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (129, 140729, '灵石县', '3', 140700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (130, 140781, '介休市', '3', 140700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (131, 140801, '市辖区', '3', 140800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (132, 140802, '盐湖区', '3', 140800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (133, 140821, '临猗县', '3', 140800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (134, 140822, '万荣县', '3', 140800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (135, 140823, '闻喜县', '3', 140800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (136, 140824, '稷山县', '3', 140800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (137, 140825, '新绛县', '3', 140800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (138, 140826, '绛　县', '3', 140800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (139, 140827, '垣曲县', '3', 140800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (140, 140828, '夏　县', '3', 140800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (141, 140829, '平陆县', '3', 140800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (142, 140830, '芮城县', '3', 140800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (143, 140881, '永济市', '3', 140800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (144, 140882, '河津市', '3', 140800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (145, 140901, '市辖区', '3', 140900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (146, 140902, '忻府区', '3', 140900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (147, 140921, '定襄县', '3', 140900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (148, 140922, '五台县', '3', 140900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (149, 140923, '代　县', '3', 140900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (150, 140924, '繁峙县', '3', 140900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (151, 140925, '宁武县', '3', 140900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (152, 140926, '静乐县', '3', 140900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (153, 140927, '神池县', '3', 140900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (154, 140928, '五寨县', '3', 140900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (155, 140929, '岢岚县', '3', 140900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (156, 140930, '河曲县', '3', 140900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (157, 140931, '保德县', '3', 140900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (158, 140932, '偏关县', '3', 140900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (159, 140981, '原平市', '3', 140900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (160, 141001, '市辖区', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (161, 141002, '尧都区', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (162, 141021, '曲沃县', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (163, 141022, '翼城县', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (164, 141023, '襄汾县', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (165, 141024, '洪洞县', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (166, 141025, '古　县', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (167, 141026, '安泽县', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (168, 141027, '浮山县', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (169, 141028, '吉　县', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (170, 141029, '乡宁县', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (171, 141030, '大宁县', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (172, 141031, '隰　县', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (173, 141032, '永和县', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (174, 141033, '蒲　县', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (175, 141034, '汾西县', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (176, 141081, '侯马市', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (177, 141082, '霍州市', '3', 141000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (178, 141101, '市辖区', '3', 141100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (179, 141102, '离石区', '3', 141100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (180, 141121, '文水县', '3', 141100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (181, 141122, '交城县', '3', 141100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (182, 141123, '兴　县', '3', 141100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (183, 141124, '临　县', '3', 141100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (184, 141125, '柳林县', '3', 141100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (185, 141126, '石楼县', '3', 141100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (186, 141127, '岚　县', '3', 141100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (187, 141128, '方山县', '3', 141100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (188, 141129, '中阳县', '3', 141100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (189, 141130, '交口县', '3', 141100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (190, 141181, '孝义市', '3', 141100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (191, 141182, '汾阳市', '3', 141100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (192, 150101, '市辖区', '3', 150100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (193, 150102, '新城区', '3', 150100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (194, 150103, '回民区', '3', 150100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (195, 150104, '玉泉区', '3', 150100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (196, 150105, '赛罕区', '3', 150100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (197, 150121, '土默特左旗', '3', 150100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (198, 150122, '托克托县', '3', 150100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (199, 150123, '和林格尔县', '3', 150100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (200, 150124, '清水河县', '3', 150100, null, null);
commit;
prompt 200 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (201, 150125, '武川县', '3', 150100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (202, 150201, '市辖区', '3', 150200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (203, 150202, '东河区', '3', 150200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (204, 150203, '昆都仑区', '3', 150200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (205, 150204, '青山区', '3', 150200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (206, 150205, '石拐区', '3', 150200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (207, 150206, '白云矿区', '3', 150200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (208, 150207, '九原区', '3', 150200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (209, 150221, '土默特右旗', '3', 150200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (210, 150222, '固阳县', '3', 150200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (211, 150223, '达尔罕茂明安联合旗', '3', 150200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (212, 150301, '市辖区', '3', 150300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (213, 150302, '海勃湾区', '3', 150300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (214, 150303, '海南区', '3', 150300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (215, 150304, '乌达区', '3', 150300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (216, 150401, '市辖区', '3', 150400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (217, 150402, '红山区', '3', 150400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (218, 150403, '元宝山区', '3', 150400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (219, 150404, '松山区', '3', 150400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (220, 150421, '阿鲁科尔沁旗', '3', 150400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (221, 150422, '巴林左旗', '3', 150400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (222, 150423, '巴林右旗', '3', 150400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (223, 150424, '林西县', '3', 150400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (224, 150425, '克什克腾旗', '3', 150400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (225, 150426, '翁牛特旗', '3', 150400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (226, 150428, '喀喇沁旗', '3', 150400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (227, 150429, '宁城县', '3', 150400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (228, 150430, '敖汉旗', '3', 150400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (229, 150501, '市辖区', '3', 150500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (230, 150502, '科尔沁区', '3', 150500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (231, 150521, '科尔沁左翼中旗', '3', 150500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (232, 150522, '科尔沁左翼后旗', '3', 150500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (233, 150523, '开鲁县', '3', 150500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (234, 150524, '库伦旗', '3', 150500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (235, 150525, '奈曼旗', '3', 150500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (236, 150526, '扎鲁特旗', '3', 150500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (237, 150581, '霍林郭勒市', '3', 150500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (238, 150602, '东胜区', '3', 150600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (239, 150621, '达拉特旗', '3', 150600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (240, 150622, '准格尔旗', '3', 150600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (241, 150623, '鄂托克前旗', '3', 150600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (242, 150624, '鄂托克旗', '3', 150600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (243, 150625, '杭锦旗', '3', 150600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (244, 110000, '北京市', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (245, 120000, '天津市', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (246, 130000, '河北省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (247, 140000, '山西省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (248, 150000, '内蒙古自治区', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (249, 210000, '辽宁省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (250, 220000, '吉林省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (251, 230000, '黑龙江省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (252, 310000, '上海市', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (253, 320000, '江苏省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (254, 330000, '浙江省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (255, 340000, '安徽省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (256, 350000, '福建省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (257, 360000, '江西省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (258, 370000, '山东省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (259, 410000, '河南省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (260, 420000, '湖北省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (261, 430000, '湖南省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (262, 440000, '广东省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (263, 450000, '广西壮族自治区', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (264, 460000, '海南省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (265, 500000, '重庆市', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (266, 510000, '四川省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (267, 520000, '贵州省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (268, 530000, '云南省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (269, 540000, '西藏自治区', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (270, 610000, '陕西省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (271, 620000, '甘肃省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (272, 630000, '青海省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (273, 640000, '宁夏回族自治区', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (274, 650000, '新疆维吾尔自治区', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (275, 710000, '台湾省', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (276, 810000, '香港特别行政区', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (277, 820000, '澳门特别行政区', '1', null, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (278, 150626, '乌审旗', '3', 150600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (279, 150627, '伊金霍洛旗', '3', 150600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (280, 150701, '市辖区', '3', 150700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (281, 150702, '海拉尔区', '3', 150700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (282, 150721, '阿荣旗', '3', 150700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (283, 150722, '莫力达瓦达斡尔族自治旗', '3', 150700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (284, 150723, '鄂伦春自治旗', '3', 150700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (285, 150724, '鄂温克族自治旗', '3', 150700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (286, 150725, '陈巴尔虎旗', '3', 150700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (287, 150726, '新巴尔虎左旗', '3', 150700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (288, 150727, '新巴尔虎右旗', '3', 150700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (289, 150781, '满洲里市', '3', 150700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (290, 150782, '牙克石市', '3', 150700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (291, 150783, '扎兰屯市', '3', 150700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (292, 150784, '额尔古纳市', '3', 150700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (293, 150785, '根河市', '3', 150700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (294, 150801, '市辖区', '3', 150800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (295, 150802, '临河区', '3', 150800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (296, 150821, '五原县', '3', 150800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (297, 150822, '磴口县', '3', 150800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (298, 150823, '乌拉特前旗', '3', 150800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (299, 150824, '乌拉特中旗', '3', 150800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (300, 150825, '乌拉特后旗', '3', 150800, null, null);
commit;
prompt 300 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (301, 150826, '杭锦后旗', '3', 150800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (302, 150901, '市辖区', '3', 150900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (303, 150902, '集宁区', '3', 150900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (304, 150921, '卓资县', '3', 150900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (305, 150922, '化德县', '3', 150900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (306, 150923, '商都县', '3', 150900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (307, 150924, '兴和县', '3', 150900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (308, 150925, '凉城县', '3', 150900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (309, 150926, '察哈尔右翼前旗', '3', 150900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (310, 150927, '察哈尔右翼中旗', '3', 150900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (311, 150928, '察哈尔右翼后旗', '3', 150900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (312, 150929, '四子王旗', '3', 150900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (313, 150981, '丰镇市', '3', 150900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (314, 152201, '乌兰浩特市', '3', 152200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (315, 152202, '阿尔山市', '3', 152200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (316, 152221, '科尔沁右翼前旗', '3', 152200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (317, 152222, '科尔沁右翼中旗', '3', 152200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (318, 152223, '扎赉特旗', '3', 152200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (319, 152224, '突泉县', '3', 152200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (320, 152501, '二连浩特市', '3', 152500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (321, 152502, '锡林浩特市', '3', 152500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (322, 152522, '阿巴嘎旗', '3', 152500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (323, 152523, '苏尼特左旗', '3', 152500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (324, 152524, '苏尼特右旗', '3', 152500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (325, 152525, '东乌珠穆沁旗', '3', 152500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (326, 152526, '西乌珠穆沁旗', '3', 152500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (327, 152527, '太仆寺旗', '3', 152500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (328, 152528, '镶黄旗', '3', 152500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (329, 152529, '正镶白旗', '3', 152500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (330, 152530, '正蓝旗', '3', 152500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (331, 152531, '多伦县', '3', 152500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (332, 152921, '阿拉善左旗', '3', 152900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (333, 152922, '阿拉善右旗', '3', 152900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (334, 152923, '额济纳旗', '3', 152900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (335, 210101, '市辖区', '3', 210100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (336, 210102, '和平区', '3', 210100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (337, 210103, '沈河区', '3', 210100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (338, 210104, '大东区', '3', 210100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (339, 210105, '皇姑区', '3', 210100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (340, 210106, '铁西区', '3', 210100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (341, 210111, '苏家屯区', '3', 210100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (342, 210112, '东陵区', '3', 210100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (343, 210113, '新城子区', '3', 210100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (344, 210114, '于洪区', '3', 210100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (345, 210122, '辽中县', '3', 210100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (346, 210123, '康平县', '3', 210100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (347, 210124, '法库县', '3', 210100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (348, 210181, '新民市', '3', 210100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (349, 210201, '市辖区', '3', 210200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (350, 210202, '中山区', '3', 210200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (351, 210203, '西岗区', '3', 210200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (352, 210204, '沙河口区', '3', 210200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (353, 210211, '甘井子区', '3', 210200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (354, 210212, '旅顺口区', '3', 210200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (355, 210213, '金州区', '3', 210200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (356, 210224, '长海县', '3', 210200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (357, 210281, '瓦房店市', '3', 210200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (358, 210282, '普兰店市', '3', 210200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (359, 210283, '庄河市', '3', 210200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (360, 210301, '市辖区', '3', 210300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (361, 210302, '铁东区', '3', 210300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (362, 210303, '铁西区', '3', 210300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (363, 210304, '立山区', '3', 210300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (364, 210311, '千山区', '3', 210300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (365, 210321, '台安县', '3', 210300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (366, 210323, '岫岩满族自治县', '3', 210300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (367, 210381, '海城市', '3', 210300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (368, 210401, '市辖区', '3', 210400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (369, 210402, '新抚区', '3', 210400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (370, 210403, '东洲区', '3', 210400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (371, 210404, '望花区', '3', 210400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (372, 210411, '顺城区', '3', 210400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (373, 210421, '抚顺县', '3', 210400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (374, 210422, '新宾满族自治县', '3', 210400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (375, 210423, '清原满族自治县', '3', 210400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (376, 210501, '市辖区', '3', 210500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (377, 210502, '平山区', '3', 210500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (378, 210503, '溪湖区', '3', 210500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (379, 210504, '明山区', '3', 210500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (380, 210505, '南芬区', '3', 210500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (381, 210521, '本溪满族自治县', '3', 210500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (382, 210522, '桓仁满族自治县', '3', 210500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (383, 210601, '市辖区', '3', 210600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (384, 210602, '元宝区', '3', 210600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (385, 210603, '振兴区', '3', 210600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (386, 210604, '振安区', '3', 210600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (387, 210624, '宽甸满族自治县', '3', 210600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (388, 210681, '东港市', '3', 210600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (389, 210682, '凤城市', '3', 210600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (390, 210701, '市辖区', '3', 210700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (391, 210702, '古塔区', '3', 210700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (392, 210703, '凌河区', '3', 210700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (393, 210711, '太和区', '3', 210700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (394, 210726, '黑山县', '3', 210700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (395, 210727, '义　县', '3', 210700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (396, 210781, '凌海市', '3', 210700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (397, 210782, '北宁市', '3', 210700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (398, 210801, '市辖区', '3', 210800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (399, 210802, '站前区', '3', 210800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (400, 210803, '西市区', '3', 210800, null, null);
commit;
prompt 400 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (401, 210804, '鲅鱼圈区', '3', 210800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (402, 210811, '老边区', '3', 210800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (403, 210881, '盖州市', '3', 210800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (404, 210882, '大石桥市', '3', 210800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (405, 210901, '市辖区', '3', 210900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (406, 210902, '海州区', '3', 210900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (407, 210903, '新邱区', '3', 210900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (408, 210904, '太平区', '3', 210900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (409, 210905, '清河门区', '3', 210900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (410, 210911, '细河区', '3', 210900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (411, 210921, '阜新蒙古族自治县', '3', 210900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (412, 210922, '彰武县', '3', 210900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (413, 211001, '市辖区', '3', 211000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (414, 211002, '白塔区', '3', 211000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (415, 211003, '文圣区', '3', 211000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (416, 211004, '宏伟区', '3', 211000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (417, 211005, '弓长岭区', '3', 211000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (418, 211011, '太子河区', '3', 211000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (419, 211021, '辽阳县', '3', 211000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (420, 211081, '灯塔市', '3', 211000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (421, 211101, '市辖区', '3', 211100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (422, 211102, '双台子区', '3', 211100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (423, 211103, '兴隆台区', '3', 211100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (424, 211121, '大洼县', '3', 211100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (425, 211122, '盘山县', '3', 211100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (426, 211201, '市辖区', '3', 211200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (427, 211202, '银州区', '3', 211200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (428, 211204, '清河区', '3', 211200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (429, 211221, '铁岭县', '3', 211200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (430, 211223, '西丰县', '3', 211200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (431, 211224, '昌图县', '3', 211200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (432, 211281, '调兵山市', '3', 211200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (433, 211282, '开原市', '3', 211200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (434, 211301, '市辖区', '3', 211300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (435, 211302, '双塔区', '3', 211300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (436, 211303, '龙城区', '3', 211300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (437, 211321, '朝阳县', '3', 211300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (438, 211322, '建平县', '3', 211300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (439, 211324, '喀喇沁左翼蒙古族自治县', '3', 211300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (440, 211381, '北票市', '3', 211300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (441, 211382, '凌源市', '3', 211300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (442, 211401, '市辖区', '3', 211400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (443, 211402, '连山区', '3', 211400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (444, 211403, '龙港区', '3', 211400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (445, 211404, '南票区', '3', 211400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (446, 211421, '绥中县', '3', 211400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (447, 211422, '建昌县', '3', 211400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (448, 211481, '兴城市', '3', 211400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (449, 220101, '市辖区', '3', 220100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (450, 220102, '南关区', '3', 220100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (451, 220103, '宽城区', '3', 220100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (452, 220104, '朝阳区', '3', 220100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (453, 220105, '二道区', '3', 220100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (454, 220106, '绿园区', '3', 220100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (455, 220112, '双阳区', '3', 220100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (456, 220122, '农安县', '3', 220100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (457, 220181, '九台市', '3', 220100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (458, 220182, '榆树市', '3', 220100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (459, 220183, '德惠市', '3', 220100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (460, 220201, '市辖区', '3', 220200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (461, 220202, '昌邑区', '3', 220200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (462, 220203, '龙潭区', '3', 220200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (463, 220204, '船营区', '3', 220200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (464, 220211, '丰满区', '3', 220200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (465, 220221, '永吉县', '3', 220200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (466, 220281, '蛟河市', '3', 220200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (467, 220282, '桦甸市', '3', 220200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (468, 220283, '舒兰市', '3', 220200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (469, 220284, '磐石市', '3', 220200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (470, 220301, '市辖区', '3', 220300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (471, 220302, '铁西区', '3', 220300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (472, 220303, '铁东区', '3', 220300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (473, 220322, '梨树县', '3', 220300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (474, 220323, '伊通满族自治县', '3', 220300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (475, 220381, '公主岭市', '3', 220300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (476, 220382, '双辽市', '3', 220300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (477, 220401, '市辖区', '3', 220400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (478, 220402, '龙山区', '3', 220400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (479, 220403, '西安区', '3', 220400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (480, 220421, '东丰县', '3', 220400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (481, 220422, '东辽县', '3', 220400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (482, 220501, '市辖区', '3', 220500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (483, 220502, '东昌区', '3', 220500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (484, 220503, '二道江区', '3', 220500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (485, 220521, '通化县', '3', 220500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (486, 220523, '辉南县', '3', 220500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (487, 220524, '柳河县', '3', 220500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (488, 220581, '梅河口市', '3', 220500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (489, 220582, '集安市', '3', 220500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (490, 220601, '市辖区', '3', 220600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (491, 220602, '八道江区', '3', 220600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (492, 220621, '抚松县', '3', 220600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (493, 220622, '靖宇县', '3', 220600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (494, 220623, '长白朝鲜族自治县', '3', 220600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (495, 220625, '江源县', '3', 220600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (496, 220681, '临江市', '3', 220600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (497, 220701, '市辖区', '3', 220700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (498, 220702, '宁江区', '3', 220700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (499, 220721, '前郭尔罗斯蒙古族自治县', '3', 220700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (500, 220722, '长岭县', '3', 220700, null, null);
commit;
prompt 500 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (501, 220723, '乾安县', '3', 220700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (502, 220724, '扶余县', '3', 220700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (503, 220801, '市辖区', '3', 220800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (504, 220802, '洮北区', '3', 220800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (505, 220821, '镇赉县', '3', 220800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (506, 220822, '通榆县', '3', 220800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (507, 220881, '洮南市', '3', 220800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (508, 220882, '大安市', '3', 220800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (509, 222401, '延吉市', '3', 222400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (510, 222402, '图们市', '3', 222400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (511, 222403, '敦化市', '3', 222400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (512, 222404, '珲春市', '3', 222400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (513, 222405, '龙井市', '3', 222400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (514, 222406, '和龙市', '3', 222400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (515, 222424, '汪清县', '3', 222400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (516, 222426, '安图县', '3', 222400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (517, 230101, '市辖区', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (518, 230102, '道里区', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (519, 230103, '南岗区', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (520, 230104, '道外区', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (521, 230106, '香坊区', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (522, 230107, '动力区', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (523, 230108, '平房区', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (524, 230109, '松北区', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (525, 230111, '呼兰区', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (526, 230123, '依兰县', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (527, 230124, '方正县', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (528, 230125, '宾　县', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (529, 230126, '巴彦县', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (530, 230127, '木兰县', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (531, 230128, '通河县', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (532, 230129, '延寿县', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (533, 230181, '阿城市', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (534, 230182, '双城市', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (535, 230183, '尚志市', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (536, 230184, '五常市', '3', 230100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (537, 230201, '市辖区', '3', 230200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (538, 230202, '龙沙区', '3', 230200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (539, 230203, '建华区', '3', 230200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (540, 230204, '铁锋区', '3', 230200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (541, 230205, '昂昂溪区', '3', 230200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (542, 230206, '富拉尔基区', '3', 230200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (543, 230207, '碾子山区', '3', 230200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (544, 230208, '梅里斯达斡尔族区', '3', 230200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (545, 230221, '龙江县', '3', 230200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (546, 230223, '依安县', '3', 230200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (547, 230224, '泰来县', '3', 230200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (548, 230225, '甘南县', '3', 230200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (549, 230227, '富裕县', '3', 230200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (550, 230229, '克山县', '3', 230200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (551, 230230, '克东县', '3', 230200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (552, 230231, '拜泉县', '3', 230200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (553, 230281, '讷河市', '3', 230200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (554, 230301, '市辖区', '3', 230300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (555, 230302, '鸡冠区', '3', 230300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (556, 230303, '恒山区', '3', 230300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (557, 230304, '滴道区', '3', 230300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (558, 230305, '梨树区', '3', 230300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (559, 230306, '城子河区', '3', 230300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (560, 230307, '麻山区', '3', 230300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (561, 230321, '鸡东县', '3', 230300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (562, 230381, '虎林市', '3', 230300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (563, 230382, '密山市', '3', 230300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (564, 230401, '市辖区', '3', 230400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (565, 230402, '向阳区', '3', 230400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (566, 230403, '工农区', '3', 230400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (567, 230404, '南山区', '3', 230400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (568, 230405, '兴安区', '3', 230400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (569, 230406, '东山区', '3', 230400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (570, 230407, '兴山区', '3', 230400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (571, 230421, '萝北县', '3', 230400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (572, 230422, '绥滨县', '3', 230400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (573, 230501, '市辖区', '3', 230500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (574, 230502, '尖山区', '3', 230500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (575, 230503, '岭东区', '3', 230500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (576, 230505, '四方台区', '3', 230500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (577, 230506, '宝山区', '3', 230500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (578, 230521, '集贤县', '3', 230500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (579, 230522, '友谊县', '3', 230500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (580, 230523, '宝清县', '3', 230500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (581, 230524, '饶河县', '3', 230500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (582, 230601, '市辖区', '3', 230600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (583, 230602, '萨尔图区', '3', 230600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (584, 230603, '龙凤区', '3', 230600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (585, 230604, '让胡路区', '3', 230600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (586, 230605, '红岗区', '3', 230600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (587, 230606, '大同区', '3', 230600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (588, 230621, '肇州县', '3', 230600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (589, 230622, '肇源县', '3', 230600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (590, 230623, '林甸县', '3', 230600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (591, 230624, '杜尔伯特蒙古族自治县', '3', 230600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (592, 230701, '市辖区', '3', 230700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (593, 230702, '伊春区', '3', 230700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (594, 230703, '南岔区', '3', 230700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (595, 230704, '友好区', '3', 230700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (596, 230705, '西林区', '3', 230700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (597, 230706, '翠峦区', '3', 230700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (598, 230707, '新青区', '3', 230700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (599, 230708, '美溪区', '3', 230700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (600, 230709, '金山屯区', '3', 230700, null, null);
commit;
prompt 600 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (601, 230710, '五营区', '3', 230700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (602, 230711, '乌马河区', '3', 230700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (603, 230712, '汤旺河区', '3', 230700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (604, 230713, '带岭区', '3', 230700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (605, 230714, '乌伊岭区', '3', 230700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (606, 230715, '红星区', '3', 230700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (607, 230716, '上甘岭区', '3', 230700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (608, 230722, '嘉荫县', '3', 230700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (609, 230781, '铁力市', '3', 230700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (610, 230801, '市辖区', '3', 230800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (611, 230802, '永红区', '3', 230800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (612, 230803, '向阳区', '3', 230800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (613, 230804, '前进区', '3', 230800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (614, 230805, '东风区', '3', 230800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (615, 230811, '郊　区', '3', 230800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (616, 230822, '桦南县', '3', 230800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (617, 230826, '桦川县', '3', 230800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (618, 230828, '汤原县', '3', 230800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (619, 230833, '抚远县', '3', 230800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (620, 230881, '同江市', '3', 230800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (621, 230882, '富锦市', '3', 230800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (622, 230901, '市辖区', '3', 230900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (623, 230902, '新兴区', '3', 230900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (624, 230903, '桃山区', '3', 230900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (625, 230904, '茄子河区', '3', 230900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (626, 230921, '勃利县', '3', 230900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (627, 231001, '市辖区', '3', 231000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (628, 231002, '东安区', '3', 231000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (629, 231003, '阳明区', '3', 231000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (630, 231004, '爱民区', '3', 231000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (631, 231005, '西安区', '3', 231000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (632, 231024, '东宁县', '3', 231000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (633, 231025, '林口县', '3', 231000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (634, 231081, '绥芬河市', '3', 231000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (635, 231083, '海林市', '3', 231000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (636, 231084, '宁安市', '3', 231000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (637, 231085, '穆棱市', '3', 231000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (638, 231101, '市辖区', '3', 231100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (639, 231102, '爱辉区', '3', 231100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (640, 231121, '嫩江县', '3', 231100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (641, 231123, '逊克县', '3', 231100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (642, 231124, '孙吴县', '3', 231100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (643, 231181, '北安市', '3', 231100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (644, 231182, '五大连池市', '3', 231100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (645, 231201, '市辖区', '3', 231200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (646, 231202, '北林区', '3', 231200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (647, 231221, '望奎县', '3', 231200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (648, 231222, '兰西县', '3', 231200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (649, 231223, '青冈县', '3', 231200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (650, 231224, '庆安县', '3', 231200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (651, 231225, '明水县', '3', 231200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (652, 231226, '绥棱县', '3', 231200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (653, 231281, '安达市', '3', 231200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (654, 231282, '肇东市', '3', 231200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (655, 231283, '海伦市', '3', 231200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (656, 232721, '呼玛县', '3', 232700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (657, 232722, '塔河县', '3', 232700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (658, 232723, '漠河县', '3', 232700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (659, 310101, '黄浦区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (660, 310103, '卢湾区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (661, 310104, '徐汇区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (662, 310105, '长宁区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (663, 310106, '静安区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (664, 310107, '普陀区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (665, 310108, '闸北区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (666, 310109, '虹口区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (667, 310110, '杨浦区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (668, 310112, '闵行区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (669, 310113, '宝山区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (670, 310114, '嘉定区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (671, 310115, '浦东新区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (672, 310116, '金山区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (673, 310117, '松江区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (674, 310118, '青浦区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (675, 310119, '南汇区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (676, 310120, '奉贤区', '3', 310100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (677, 310230, '崇明县', '3', 310200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (678, 320101, '市辖区', '3', 320100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (679, 320102, '玄武区', '3', 320100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (680, 320103, '白下区', '3', 320100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (681, 320104, '秦淮区', '3', 320100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (682, 320105, '建邺区', '3', 320100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (683, 320106, '鼓楼区', '3', 320100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (684, 320107, '下关区', '3', 320100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (685, 320111, '浦口区', '3', 320100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (686, 320113, '栖霞区', '3', 320100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (687, 320114, '雨花台区', '3', 320100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (688, 320115, '江宁区', '3', 320100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (689, 320116, '六合区', '3', 320100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (690, 320124, '溧水县', '3', 320100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (691, 320125, '高淳县', '3', 320100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (692, 320201, '市辖区', '3', 320200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (693, 320202, '崇安区', '3', 320200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (694, 320203, '南长区', '3', 320200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (695, 320204, '北塘区', '3', 320200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (696, 320205, '锡山区', '3', 320200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (697, 320206, '惠山区', '3', 320200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (698, 320211, '滨湖区', '3', 320200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (699, 320281, '江阴市', '3', 320200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (700, 320282, '宜兴市', '3', 320200, null, null);
commit;
prompt 700 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (701, 320301, '市辖区', '3', 320300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (702, 320302, '鼓楼区', '3', 320300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (703, 320303, '云龙区', '3', 320300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (704, 320304, '九里区', '3', 320300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (705, 320305, '贾汪区', '3', 320300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (706, 320311, '泉山区', '3', 320300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (707, 320321, '丰　县', '3', 320300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (708, 320322, '沛　县', '3', 320300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (709, 320323, '铜山县', '3', 320300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (710, 320324, '睢宁县', '3', 320300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (711, 320381, '新沂市', '3', 320300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (712, 320382, '邳州市', '3', 320300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (713, 320401, '市辖区', '3', 320400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (714, 320402, '天宁区', '3', 320400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (715, 320404, '钟楼区', '3', 320400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (716, 320405, '戚墅堰区', '3', 320400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (717, 320411, '新北区', '3', 320400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (718, 320412, '武进区', '3', 320400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (719, 320481, '溧阳市', '3', 320400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (720, 320482, '金坛市', '3', 320400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (721, 320501, '市辖区', '3', 320500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (722, 320502, '沧浪区', '3', 320500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (723, 320503, '平江区', '3', 320500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (724, 320504, '金阊区', '3', 320500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (725, 320505, '虎丘区', '3', 320500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (726, 320506, '吴中区', '3', 320500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (727, 320507, '相城区', '3', 320500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (728, 320581, '常熟市', '3', 320500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (729, 110100, '市辖区', '2', 110000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (730, 110200, '县', '2', 110000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (731, 120100, '市辖区', '2', 120000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (732, 120200, '县', '2', 120000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (733, 130100, '石家庄市', '2', 130000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (734, 130200, '唐山市', '2', 130000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (735, 130300, '秦皇岛市', '2', 130000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (736, 130400, '邯郸市', '2', 130000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (737, 130500, '邢台市', '2', 130000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (738, 130600, '保定市', '2', 130000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (739, 130700, '张家口市', '2', 130000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (740, 130800, '承德市', '2', 130000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (741, 130900, '沧州市', '2', 130000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (742, 131000, '廊坊市', '2', 130000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (743, 131100, '衡水市', '2', 130000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (744, 140100, '太原市', '2', 140000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (745, 140200, '大同市', '2', 140000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (746, 140300, '阳泉市', '2', 140000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (747, 140400, '长治市', '2', 140000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (748, 140500, '晋城市', '2', 140000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (749, 140600, '朔州市', '2', 140000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (750, 140700, '晋中市', '2', 140000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (751, 140800, '运城市', '2', 140000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (752, 140900, '忻州市', '2', 140000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (753, 141000, '临汾市', '2', 140000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (754, 141100, '吕梁市', '2', 140000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (755, 150100, '呼和浩特市', '2', 150000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (756, 150200, '包头市', '2', 150000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (757, 150300, '乌海市', '2', 150000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (758, 150400, '赤峰市', '2', 150000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (759, 150500, '通辽市', '2', 150000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (760, 150600, '鄂尔多斯市', '2', 150000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (761, 150700, '呼伦贝尔市', '2', 150000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (762, 150800, '巴彦淖尔市', '2', 150000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (763, 150900, '乌兰察布市', '2', 150000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (764, 152200, '兴安盟', '2', 150000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (765, 152500, '锡林郭勒盟', '2', 150000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (766, 152900, '阿拉善盟', '2', 150000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (767, 210100, '沈阳市', '2', 210000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (768, 210200, '大连市', '2', 210000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (769, 210300, '鞍山市', '2', 210000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (770, 210400, '抚顺市', '2', 210000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (771, 210500, '本溪市', '2', 210000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (772, 210600, '丹东市', '2', 210000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (773, 210700, '锦州市', '2', 210000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (774, 210800, '营口市', '2', 210000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (775, 210900, '阜新市', '2', 210000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (776, 211000, '辽阳市', '2', 210000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (777, 211100, '盘锦市', '2', 210000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (778, 211200, '铁岭市', '2', 210000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (779, 211300, '朝阳市', '2', 210000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (780, 211400, '葫芦岛市', '2', 210000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (781, 220100, '长春市', '2', 220000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (782, 220200, '吉林市', '2', 220000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (783, 220300, '四平市', '2', 220000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (784, 220400, '辽源市', '2', 220000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (785, 220500, '通化市', '2', 220000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (786, 220600, '白山市', '2', 220000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (787, 220700, '松原市', '2', 220000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (788, 220800, '白城市', '2', 220000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (789, 222400, '延边朝鲜族自治州', '2', 220000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (790, 230100, '哈尔滨市', '2', 230000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (791, 230200, '齐齐哈尔市', '2', 230000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (792, 230300, '鸡西市', '2', 230000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (793, 230400, '鹤岗市', '2', 230000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (794, 230500, '双鸭山市', '2', 230000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (795, 230600, '大庆市', '2', 230000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (796, 230700, '伊春市', '2', 230000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (797, 230800, '佳木斯市', '2', 230000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (798, 230900, '七台河市', '2', 230000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (799, 231000, '牡丹江市', '2', 230000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (800, 231100, '黑河市', '2', 230000, null, null);
commit;
prompt 800 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (801, 231200, '绥化市', '2', 230000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (802, 232700, '大兴安岭地区', '2', 230000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (803, 310100, '市辖区', '2', 310000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (804, 310200, '县', '2', 310000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (805, 320100, '南京市', '2', 320000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (806, 320200, '无锡市', '2', 320000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (807, 320300, '徐州市', '2', 320000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (808, 320400, '常州市', '2', 320000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (809, 320500, '苏州市', '2', 320000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (810, 320600, '南通市', '2', 320000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (811, 320700, '连云港市', '2', 320000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (812, 320800, '淮安市', '2', 320000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (813, 320900, '盐城市', '2', 320000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (814, 321000, '扬州市', '2', 320000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (815, 321100, '镇江市', '2', 320000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (816, 321200, '泰州市', '2', 320000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (817, 321300, '宿迁市', '2', 320000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (818, 330100, '杭州市', '2', 330000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (819, 330200, '宁波市', '2', 330000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (820, 330300, '温州市', '2', 330000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (821, 330400, '嘉兴市', '2', 330000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (822, 330500, '湖州市', '2', 330000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (823, 330600, '绍兴市', '2', 330000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (824, 330700, '金华市', '2', 330000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (825, 330800, '衢州市', '2', 330000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (826, 330900, '舟山市', '2', 330000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (827, 331000, '台州市', '2', 330000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (828, 331100, '丽水市', '2', 330000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (829, 340100, '合肥市', '2', 340000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (830, 340200, '芜湖市', '2', 340000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (831, 340300, '蚌埠市', '2', 340000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (832, 340400, '淮南市', '2', 340000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (833, 340500, '马鞍山市', '2', 340000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (834, 340600, '淮北市', '2', 340000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (835, 340700, '铜陵市', '2', 340000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (836, 340800, '安庆市', '2', 340000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (837, 341000, '黄山市', '2', 340000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (838, 341100, '滁州市', '2', 340000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (839, 341200, '阜阳市', '2', 340000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (840, 341300, '宿州市', '2', 340000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (841, 341400, '巢湖市', '2', 340000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (842, 341500, '六安市', '2', 340000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (843, 341600, '亳州市', '2', 340000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (844, 341700, '池州市', '2', 340000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (845, 341800, '宣城市', '2', 340000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (846, 350100, '福州市', '2', 350000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (847, 350200, '厦门市', '2', 350000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (848, 350300, '莆田市', '2', 350000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (849, 350400, '三明市', '2', 350000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (850, 350500, '泉州市', '2', 350000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (851, 350600, '漳州市', '2', 350000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (852, 350700, '南平市', '2', 350000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (853, 350800, '龙岩市', '2', 350000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (854, 350900, '宁德市', '2', 350000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (855, 360100, '南昌市', '2', 360000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (856, 360200, '景德镇市', '2', 360000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (857, 360300, '萍乡市', '2', 360000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (858, 360400, '九江市', '2', 360000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (859, 360500, '新余市', '2', 360000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (860, 360600, '鹰潭市', '2', 360000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (861, 360700, '赣州市', '2', 360000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (862, 360800, '吉安市', '2', 360000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (863, 360900, '宜春市', '2', 360000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (864, 361000, '抚州市', '2', 360000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (865, 361100, '上饶市', '2', 360000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (866, 370100, '济南市', '2', 370000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (867, 370200, '青岛市', '2', 370000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (868, 370300, '淄博市', '2', 370000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (869, 370400, '枣庄市', '2', 370000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (870, 370500, '东营市', '2', 370000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (871, 370600, '烟台市', '2', 370000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (872, 370700, '潍坊市', '2', 370000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (873, 370800, '济宁市', '2', 370000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (874, 370900, '泰安市', '2', 370000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (875, 371000, '威海市', '2', 370000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (876, 371100, '日照市', '2', 370000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (877, 371200, '莱芜市', '2', 370000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (878, 371300, '临沂市', '2', 370000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (879, 371400, '德州市', '2', 370000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (880, 371500, '聊城市', '2', 370000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (881, 371600, '滨州市', '2', 370000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (882, 371700, '荷泽市', '2', 370000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (883, 410100, '郑州市', '2', 410000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (884, 410200, '开封市', '2', 410000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (885, 410300, '洛阳市', '2', 410000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (886, 410400, '平顶山市', '2', 410000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (887, 410500, '安阳市', '2', 410000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (888, 410600, '鹤壁市', '2', 410000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (889, 410700, '新乡市', '2', 410000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (890, 410800, '焦作市', '2', 410000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (891, 410900, '濮阳市', '2', 410000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (892, 411000, '许昌市', '2', 410000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (893, 411100, '漯河市', '2', 410000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (894, 411200, '三门峡市', '2', 410000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (895, 411300, '南阳市', '2', 410000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (896, 411400, '商丘市', '2', 410000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (897, 411500, '信阳市', '2', 410000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (898, 411600, '周口市', '2', 410000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (899, 411700, '驻马店市', '2', 410000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (900, 420100, '武汉市', '2', 420000, null, null);
commit;
prompt 900 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (901, 420200, '黄石市', '2', 420000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (902, 420300, '十堰市', '2', 420000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (903, 420500, '宜昌市', '2', 420000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (904, 420600, '襄樊市', '2', 420000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (905, 420700, '鄂州市', '2', 420000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (906, 420800, '荆门市', '2', 420000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (907, 420900, '孝感市', '2', 420000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (908, 421000, '荆州市', '2', 420000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (909, 421100, '黄冈市', '2', 420000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (910, 421200, '咸宁市', '2', 420000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (911, 421300, '随州市', '2', 420000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (912, 422800, '恩施土家族苗族自治州', '2', 420000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (913, 429000, '省直辖行政单位', '2', 420000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (914, 430100, '长沙市', '2', 430000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (915, 430200, '株洲市', '2', 430000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (916, 430300, '湘潭市', '2', 430000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (917, 430400, '衡阳市', '2', 430000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (918, 430500, '邵阳市', '2', 430000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (919, 430600, '岳阳市', '2', 430000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (920, 430700, '常德市', '2', 430000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (921, 430800, '张家界市', '2', 430000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (922, 430900, '益阳市', '2', 430000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (923, 431000, '郴州市', '2', 430000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (924, 431100, '永州市', '2', 430000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (925, 431200, '怀化市', '2', 430000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (926, 431300, '娄底市', '2', 430000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (927, 433100, '湘西土家族苗族自治州', '2', 430000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (928, 440100, '广州市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (929, 440200, '韶关市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (930, 440300, '深圳市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (931, 440400, '珠海市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (932, 440500, '汕头市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (933, 440600, '佛山市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (934, 440700, '江门市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (935, 440800, '湛江市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (936, 440900, '茂名市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (937, 441200, '肇庆市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (938, 441300, '惠州市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (939, 441400, '梅州市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (940, 441500, '汕尾市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (941, 441600, '河源市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (942, 441700, '阳江市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (943, 441800, '清远市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (944, 441900, '东莞市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (945, 442000, '中山市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (946, 445100, '潮州市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (947, 445200, '揭阳市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (948, 445300, '云浮市', '2', 440000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (949, 450100, '南宁市', '2', 450000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (950, 450200, '柳州市', '2', 450000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (951, 450300, '桂林市', '2', 450000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (952, 450400, '梧州市', '2', 450000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (953, 450500, '北海市', '2', 450000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (954, 450600, '防城港市', '2', 450000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (955, 450700, '钦州市', '2', 450000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (956, 450800, '贵港市', '2', 450000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (957, 450900, '玉林市', '2', 450000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (958, 451000, '百色市', '2', 450000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (959, 451100, '贺州市', '2', 450000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (960, 451200, '河池市', '2', 450000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (961, 451300, '来宾市', '2', 450000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (962, 451400, '崇左市', '2', 450000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (963, 460100, '海口市', '2', 460000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (964, 460200, '三亚市', '2', 460000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (965, 469000, '省直辖县级行政单位', '2', 460000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (966, 500100, '市辖区', '2', 500000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (967, 500200, '县', '2', 500000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (968, 500300, '市', '2', 500000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (969, 510100, '成都市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (970, 510300, '自贡市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (971, 510400, '攀枝花市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (972, 510500, '泸州市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (973, 510600, '德阳市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (974, 510700, '绵阳市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (975, 510800, '广元市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (976, 510900, '遂宁市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (977, 511000, '内江市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (978, 511100, '乐山市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (979, 511300, '南充市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (980, 511400, '眉山市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (981, 511500, '宜宾市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (982, 511600, '广安市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (983, 511700, '达州市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (984, 511800, '雅安市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (985, 511900, '巴中市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (986, 512000, '资阳市', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (987, 513200, '阿坝藏族羌族自治州', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (988, 513300, '甘孜藏族自治州', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (989, 513400, '凉山彝族自治州', '2', 510000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (990, 520100, '贵阳市', '2', 520000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (991, 520200, '六盘水市', '2', 520000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (992, 520300, '遵义市', '2', 520000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (993, 520400, '安顺市', '2', 520000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (994, 522200, '铜仁地区', '2', 520000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (995, 522300, '黔西南布依族苗族自治州', '2', 520000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (996, 522400, '毕节地区', '2', 520000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (997, 522600, '黔东南苗族侗族自治州', '2', 520000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (998, 522700, '黔南布依族苗族自治州', '2', 520000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (999, 530100, '昆明市', '2', 530000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1000, 530300, '曲靖市', '2', 530000, null, null);
commit;
prompt 1000 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1001, 530400, '玉溪市', '2', 530000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1002, 530500, '保山市', '2', 530000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1003, 530600, '昭通市', '2', 530000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1004, 530700, '丽江市', '2', 530000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1005, 530800, '思茅市', '2', 530000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1006, 530900, '临沧市', '2', 530000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1007, 532300, '楚雄彝族自治州', '2', 530000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1008, 532500, '红河哈尼族彝族自治州', '2', 530000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1009, 532600, '文山壮族苗族自治州', '2', 530000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1010, 532800, '西双版纳傣族自治州', '2', 530000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1011, 532900, '大理白族自治州', '2', 530000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1012, 533100, '德宏傣族景颇族自治州', '2', 530000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1013, 533300, '怒江傈僳族自治州', '2', 530000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1014, 533400, '迪庆藏族自治州', '2', 530000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1015, 540100, '拉萨市', '2', 540000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1016, 542100, '昌都地区', '2', 540000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1017, 542200, '山南地区', '2', 540000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1018, 542300, '日喀则地区', '2', 540000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1019, 542400, '那曲地区', '2', 540000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1020, 542500, '阿里地区', '2', 540000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1021, 542600, '林芝地区', '2', 540000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1022, 610100, '西安市', '2', 610000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1023, 610200, '铜川市', '2', 610000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1024, 610300, '宝鸡市', '2', 610000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1025, 610400, '咸阳市', '2', 610000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1026, 610500, '渭南市', '2', 610000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1027, 610600, '延安市', '2', 610000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1028, 610700, '汉中市', '2', 610000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1029, 610800, '榆林市', '2', 610000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1030, 610900, '安康市', '2', 610000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1031, 611000, '商洛市', '2', 610000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1032, 620100, '兰州市', '2', 620000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1033, 620200, '嘉峪关市', '2', 620000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1034, 620300, '金昌市', '2', 620000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1035, 620400, '白银市', '2', 620000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1036, 620500, '天水市', '2', 620000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1037, 620600, '武威市', '2', 620000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1038, 620700, '张掖市', '2', 620000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1039, 620800, '平凉市', '2', 620000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1040, 620900, '酒泉市', '2', 620000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1041, 621000, '庆阳市', '2', 620000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1042, 621100, '定西市', '2', 620000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1043, 621200, '陇南市', '2', 620000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1044, 622900, '临夏回族自治州', '2', 620000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1045, 623000, '甘南藏族自治州', '2', 620000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1046, 630100, '西宁市', '2', 630000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1047, 632100, '海东地区', '2', 630000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1048, 632200, '海北藏族自治州', '2', 630000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1049, 632300, '黄南藏族自治州', '2', 630000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1050, 632500, '海南藏族自治州', '2', 630000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1051, 632600, '果洛藏族自治州', '2', 630000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1052, 632700, '玉树藏族自治州', '2', 630000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1053, 632800, '海西蒙古族藏族自治州', '2', 630000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1054, 640100, '银川市', '2', 640000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1055, 640200, '石嘴山市', '2', 640000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1056, 640300, '吴忠市', '2', 640000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1057, 640400, '固原市', '2', 640000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1058, 640500, '中卫市', '2', 640000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1059, 650100, '乌鲁木齐市', '2', 650000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1060, 650200, '克拉玛依市', '2', 650000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1061, 652100, '吐鲁番地区', '2', 650000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1062, 652200, '哈密地区', '2', 650000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1063, 652300, '昌吉回族自治州', '2', 650000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1064, 652700, '博尔塔拉蒙古自治州', '2', 650000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1065, 652800, '巴音郭楞蒙古自治州', '2', 650000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1066, 652900, '阿克苏地区', '2', 650000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1067, 653000, '克孜勒苏柯尔克孜自治州', '2', 650000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1068, 653100, '喀什地区', '2', 650000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1069, 653200, '和田地区', '2', 650000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1070, 654000, '伊犁哈萨克自治州', '2', 650000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1071, 654200, '塔城地区', '2', 650000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1072, 654300, '阿勒泰地区', '2', 650000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1073, 659000, '省直辖行政单位', '2', 650000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1074, 110101, '东城区', '3', 110100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1075, 110102, '西城区', '3', 110100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1076, 110103, '崇文区', '3', 110100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1077, 110104, '宣武区', '3', 110100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1078, 110105, '朝阳区', '3', 110100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1079, 110106, '丰台区', '3', 110100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1080, 110107, '石景山区', '3', 110100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1081, 110108, '海淀区', '3', 110100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1082, 110109, '门头沟区', '3', 110100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1083, 110111, '房山区', '3', 110100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1084, 110112, '通州区', '3', 110100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1085, 110113, '顺义区', '3', 110100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1086, 110114, '昌平区', '3', 110100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1087, 110115, '大兴区', '3', 110100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1088, 110116, '怀柔区', '3', 110100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1089, 110117, '平谷区', '3', 110100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1090, 110228, '密云县', '3', 110200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1091, 110229, '延庆县', '3', 110200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1092, 120101, '和平区', '3', 120100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1093, 120102, '河东区', '3', 120100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1094, 120103, '河西区', '3', 120100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1095, 120104, '南开区', '3', 120100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1096, 120105, '河北区', '3', 120100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1097, 120106, '红桥区', '3', 120100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1098, 120107, '塘沽区', '3', 120100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1099, 120108, '汉沽区', '3', 120100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1100, 120109, '大港区', '3', 120100, null, null);
commit;
prompt 1100 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1101, 120110, '东丽区', '3', 120100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1102, 120111, '西青区', '3', 120100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1103, 120112, '津南区', '3', 120100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1104, 120113, '北辰区', '3', 120100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1105, 120114, '武清区', '3', 120100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1106, 120115, '宝坻区', '3', 120100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1107, 120221, '宁河县', '3', 120200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1108, 120223, '静海县', '3', 120200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1109, 120225, '蓟　县', '3', 120200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1110, 130101, '市辖区', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1111, 130102, '长安区', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1112, 130103, '桥东区', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1113, 130104, '桥西区', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1114, 130105, '新华区', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1115, 130107, '井陉矿区', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1116, 130108, '裕华区', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1117, 130121, '井陉县', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1118, 130123, '正定县', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1119, 130124, '栾城县', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1120, 130125, '行唐县', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1121, 130126, '灵寿县', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1122, 130127, '高邑县', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1123, 130128, '深泽县', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1124, 130129, '赞皇县', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1125, 130130, '无极县', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1126, 130131, '平山县', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1127, 130132, '元氏县', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1128, 130133, '赵　县', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1129, 130181, '辛集市', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1130, 130182, '藁城市', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1131, 130183, '晋州市', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1132, 130184, '新乐市', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1133, 130185, '鹿泉市', '3', 130100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1134, 130201, '市辖区', '3', 130200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1135, 130202, '路南区', '3', 130200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1136, 130203, '路北区', '3', 130200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1137, 130204, '古冶区', '3', 130200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1138, 130205, '开平区', '3', 130200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1139, 130207, '丰南区', '3', 130200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1140, 130208, '丰润区', '3', 130200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1141, 130223, '滦　县', '3', 130200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1142, 130224, '滦南县', '3', 130200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1143, 130225, '乐亭县', '3', 130200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1144, 130227, '迁西县', '3', 130200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1145, 130229, '玉田县', '3', 130200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1146, 130230, '唐海县', '3', 130200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1147, 130281, '遵化市', '3', 130200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1148, 130283, '迁安市', '3', 130200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1149, 130301, '市辖区', '3', 130300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1150, 130302, '海港区', '3', 130300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1151, 130303, '山海关区', '3', 130300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1152, 130304, '北戴河区', '3', 130300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1153, 130321, '青龙满族自治县', '3', 130300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1154, 130322, '昌黎县', '3', 130300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1155, 130323, '抚宁县', '3', 130300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1156, 130324, '卢龙县', '3', 130300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1157, 130401, '市辖区', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1158, 130402, '邯山区', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1159, 130403, '丛台区', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1160, 130404, '复兴区', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1161, 130406, '峰峰矿区', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1162, 130421, '邯郸县', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1163, 130423, '临漳县', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1164, 130424, '成安县', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1165, 130425, '大名县', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1166, 130426, '涉　县', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1167, 130427, '磁　县', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1168, 130428, '肥乡县', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1169, 130429, '永年县', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1170, 130430, '邱　县', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1171, 130431, '鸡泽县', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1172, 130432, '广平县', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1173, 130433, '馆陶县', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1174, 130434, '魏　县', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1175, 130435, '曲周县', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1176, 130481, '武安市', '3', 130400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1177, 130501, '市辖区', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1178, 130502, '桥东区', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1179, 130503, '桥西区', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1180, 130521, '邢台县', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1181, 130522, '临城县', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1182, 130523, '内丘县', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1183, 130524, '柏乡县', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1184, 130525, '隆尧县', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1185, 130526, '任　县', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1186, 130527, '南和县', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1187, 130528, '宁晋县', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1188, 130529, '巨鹿县', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1189, 130530, '新河县', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1190, 130531, '广宗县', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1191, 130532, '平乡县', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1192, 130533, '威　县', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1193, 130534, '清河县', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1194, 130535, '临西县', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1195, 130581, '南宫市', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1196, 130582, '沙河市', '3', 130500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1197, 130601, '市辖区', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1198, 130602, '新市区', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1199, 130603, '北市区', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1200, 130604, '南市区', '3', 130600, null, null);
commit;
prompt 1200 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1201, 130621, '满城县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1202, 130622, '清苑县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1203, 130623, '涞水县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1204, 130624, '阜平县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1205, 130625, '徐水县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1206, 130626, '定兴县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1207, 130627, '唐　县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1208, 130628, '高阳县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1209, 130629, '容城县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1210, 130630, '涞源县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1211, 130631, '望都县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1212, 130632, '安新县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1213, 130633, '易　县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1214, 130634, '曲阳县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1215, 130635, '蠡　县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1216, 130636, '顺平县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1217, 130637, '博野县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1218, 130638, '雄　县', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1219, 130681, '涿州市', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1220, 130682, '定州市', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1221, 130683, '安国市', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1222, 130684, '高碑店市', '3', 130600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1223, 130701, '市辖区', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1224, 130702, '桥东区', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1225, 130703, '桥西区', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1226, 130705, '宣化区', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1227, 130706, '下花园区', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1228, 130721, '宣化县', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1229, 130722, '张北县', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1230, 130723, '康保县', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1231, 130724, '沽源县', '3', 130700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1232, 430603, '云溪区', '3', 430600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1233, 430611, '君山区', '3', 430600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1234, 430621, '岳阳县', '3', 430600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1235, 430623, '华容县', '3', 430600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1236, 430624, '湘阴县', '3', 430600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1237, 430626, '平江县', '3', 430600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1238, 430681, '汨罗市', '3', 430600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1239, 430682, '临湘市', '3', 430600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1240, 430701, '市辖区', '3', 430700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1241, 430702, '武陵区', '3', 430700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1242, 430703, '鼎城区', '3', 430700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1243, 430721, '安乡县', '3', 430700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1244, 430722, '汉寿县', '3', 430700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1245, 430723, '澧　县', '3', 430700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1246, 430724, '临澧县', '3', 430700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1247, 430725, '桃源县', '3', 430700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1248, 430726, '石门县', '3', 430700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1249, 430781, '津市市', '3', 430700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1250, 430801, '市辖区', '3', 430800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1251, 430802, '永定区', '3', 430800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1252, 430811, '武陵源区', '3', 430800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1253, 430821, '慈利县', '3', 430800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1254, 430822, '桑植县', '3', 430800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1255, 430901, '市辖区', '3', 430900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1256, 430902, '资阳区', '3', 430900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1257, 430903, '赫山区', '3', 430900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1258, 430921, '南　县', '3', 430900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1259, 430922, '桃江县', '3', 430900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1260, 430923, '安化县', '3', 430900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1261, 430981, '沅江市', '3', 430900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1262, 431001, '市辖区', '3', 431000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1263, 431002, '北湖区', '3', 431000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1264, 431003, '苏仙区', '3', 431000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1265, 431021, '桂阳县', '3', 431000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1266, 431022, '宜章县', '3', 431000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1267, 431023, '永兴县', '3', 431000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1268, 431024, '嘉禾县', '3', 431000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1269, 431025, '临武县', '3', 431000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1270, 431026, '汝城县', '3', 431000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1271, 431027, '桂东县', '3', 431000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1272, 431028, '安仁县', '3', 431000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1273, 431081, '资兴市', '3', 431000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1274, 431101, '市辖区', '3', 431100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1275, 431102, '芝山区', '3', 431100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1276, 431103, '冷水滩区', '3', 431100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1277, 431121, '祁阳县', '3', 431100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1278, 431122, '东安县', '3', 431100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1279, 431123, '双牌县', '3', 431100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1280, 431124, '道　县', '3', 431100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1281, 431125, '江永县', '3', 431100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1282, 431126, '宁远县', '3', 431100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1283, 431127, '蓝山县', '3', 431100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1284, 431128, '新田县', '3', 431100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1285, 431129, '江华瑶族自治县', '3', 431100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1286, 431201, '市辖区', '3', 431200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1287, 431202, '鹤城区', '3', 431200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1288, 431221, '中方县', '3', 431200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1289, 431222, '沅陵县', '3', 431200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1290, 431223, '辰溪县', '3', 431200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1291, 431224, '溆浦县', '3', 431200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1292, 431225, '会同县', '3', 431200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1293, 431226, '麻阳苗族自治县', '3', 431200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1294, 431227, '新晃侗族自治县', '3', 431200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1295, 431228, '芷江侗族自治县', '3', 431200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1296, 431229, '靖州苗族侗族自治县', '3', 431200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1297, 431230, '通道侗族自治县', '3', 431200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1298, 431281, '洪江市', '3', 431200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1299, 431301, '市辖区', '3', 431300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1300, 431302, '娄星区', '3', 431300, null, null);
commit;
prompt 1300 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1301, 431321, '双峰县', '3', 431300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1302, 431322, '新化县', '3', 431300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1303, 431381, '冷水江市', '3', 431300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1304, 431382, '涟源市', '3', 431300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1305, 433101, '吉首市', '3', 433100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1306, 433122, '泸溪县', '3', 433100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1307, 433123, '凤凰县', '3', 433100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1308, 433124, '花垣县', '3', 433100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1309, 433125, '保靖县', '3', 433100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1310, 433126, '古丈县', '3', 433100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1311, 433127, '永顺县', '3', 433100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1312, 433130, '龙山县', '3', 433100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1313, 440101, '市辖区', '3', 440100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1314, 440102, '东山区', '3', 440100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1315, 440103, '荔湾区', '3', 440100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1316, 440104, '越秀区', '3', 440100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1317, 440105, '海珠区', '3', 440100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1318, 440106, '天河区', '3', 440100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1319, 440107, '芳村区', '3', 440100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1320, 440111, '白云区', '3', 440100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1321, 440112, '黄埔区', '3', 440100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1322, 440113, '番禺区', '3', 440100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1323, 440114, '花都区', '3', 440100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1324, 440183, '增城市', '3', 440100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1325, 440184, '从化市', '3', 440100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1326, 440201, '市辖区', '3', 440200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1327, 440203, '武江区', '3', 440200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1328, 440204, '浈江区', '3', 440200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1329, 440205, '曲江区', '3', 440200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1330, 440222, '始兴县', '3', 440200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1331, 440224, '仁化县', '3', 440200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1332, 440229, '翁源县', '3', 440200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1333, 440232, '乳源瑶族自治县', '3', 440200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1334, 440233, '新丰县', '3', 440200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1335, 440281, '乐昌市', '3', 440200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1336, 440282, '南雄市', '3', 440200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1337, 440301, '市辖区', '3', 440300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1338, 440303, '罗湖区', '3', 440300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1339, 440304, '福田区', '3', 440300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1340, 440305, '南山区', '3', 440300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1341, 440306, '宝安区', '3', 440300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1342, 440307, '龙岗区', '3', 440300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1343, 440308, '盐田区', '3', 440300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1344, 440401, '市辖区', '3', 440400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1345, 440402, '香洲区', '3', 440400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1346, 440403, '斗门区', '3', 440400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1347, 440404, '金湾区', '3', 440400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1348, 440501, '市辖区', '3', 440500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1349, 440507, '龙湖区', '3', 440500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1350, 440511, '金平区', '3', 440500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1351, 440512, '濠江区', '3', 440500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1352, 440513, '潮阳区', '3', 440500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1353, 440514, '潮南区', '3', 440500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1354, 440515, '澄海区', '3', 440500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1355, 440523, '南澳县', '3', 440500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1356, 440601, '市辖区', '3', 440600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1357, 440604, '禅城区', '3', 440600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1358, 440605, '南海区', '3', 440600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1359, 440606, '顺德区', '3', 440600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1360, 440607, '三水区', '3', 440600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1361, 440608, '高明区', '3', 440600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1362, 440701, '市辖区', '3', 440700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1363, 440703, '蓬江区', '3', 440700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1364, 440704, '江海区', '3', 440700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1365, 440705, '新会区', '3', 440700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1366, 440781, '台山市', '3', 440700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1367, 440783, '开平市', '3', 440700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1368, 440784, '鹤山市', '3', 440700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1369, 440785, '恩平市', '3', 440700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1370, 440801, '市辖区', '3', 440800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1371, 440802, '赤坎区', '3', 440800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1372, 440803, '霞山区', '3', 440800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1373, 440804, '坡头区', '3', 440800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1374, 440811, '麻章区', '3', 440800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1375, 440823, '遂溪县', '3', 440800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1376, 440825, '徐闻县', '3', 440800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1377, 440881, '廉江市', '3', 440800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1378, 440882, '雷州市', '3', 440800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1379, 440883, '吴川市', '3', 440800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1380, 440901, '市辖区', '3', 440900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1381, 440902, '茂南区', '3', 440900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1382, 440903, '茂港区', '3', 440900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1383, 440923, '电白县', '3', 440900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1384, 440981, '高州市', '3', 440900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1385, 440982, '化州市', '3', 440900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1386, 440983, '信宜市', '3', 440900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1387, 441201, '市辖区', '3', 441200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1388, 441202, '端州区', '3', 441200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1389, 441203, '鼎湖区', '3', 441200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1390, 441223, '广宁县', '3', 441200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1391, 441224, '怀集县', '3', 441200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1392, 441225, '封开县', '3', 441200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1393, 441226, '德庆县', '3', 441200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1394, 441283, '高要市', '3', 441200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1395, 441284, '四会市', '3', 441200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1396, 441301, '市辖区', '3', 441300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1397, 441302, '惠城区', '3', 441300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1398, 441303, '惠阳区', '3', 441300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1399, 441322, '博罗县', '3', 441300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1400, 441323, '惠东县', '3', 441300, null, null);
commit;
prompt 1400 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1401, 441324, '龙门县', '3', 441300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1402, 441401, '市辖区', '3', 441400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1403, 441402, '梅江区', '3', 441400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1404, 441421, '梅　县', '3', 441400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1405, 441422, '大埔县', '3', 441400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1406, 441423, '丰顺县', '3', 441400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1407, 441424, '五华县', '3', 441400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1408, 441426, '平远县', '3', 441400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1409, 441427, '蕉岭县', '3', 441400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1410, 441481, '兴宁市', '3', 441400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1411, 441501, '市辖区', '3', 441500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1412, 441502, '城　区', '3', 441500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1413, 441521, '海丰县', '3', 441500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1414, 441523, '陆河县', '3', 441500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1415, 441581, '陆丰市', '3', 441500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1416, 441601, '市辖区', '3', 441600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1417, 441602, '源城区', '3', 441600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1418, 441621, '紫金县', '3', 441600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1419, 441622, '龙川县', '3', 441600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1420, 441623, '连平县', '3', 441600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1421, 441624, '和平县', '3', 441600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1422, 441625, '东源县', '3', 441600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1423, 441701, '市辖区', '3', 441700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1424, 441702, '江城区', '3', 441700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1425, 441721, '阳西县', '3', 441700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1426, 441723, '阳东县', '3', 441700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1427, 441781, '阳春市', '3', 441700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1428, 441801, '市辖区', '3', 441800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1429, 441802, '清城区', '3', 441800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1430, 441821, '佛冈县', '3', 441800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1431, 441823, '阳山县', '3', 441800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1432, 441825, '连山壮族瑶族自治县', '3', 441800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1433, 441826, '连南瑶族自治县', '3', 441800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1434, 441827, '清新县', '3', 441800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1435, 441881, '英德市', '3', 441800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1436, 441882, '连州市', '3', 441800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1437, 445101, '市辖区', '3', 445100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1438, 445102, '湘桥区', '3', 445100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1439, 445121, '潮安县', '3', 445100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1440, 445122, '饶平县', '3', 445100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1441, 445201, '市辖区', '3', 445200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1442, 445202, '榕城区', '3', 445200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1443, 445221, '揭东县', '3', 445200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1444, 445222, '揭西县', '3', 445200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1445, 445224, '惠来县', '3', 445200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1446, 445281, '普宁市', '3', 445200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1447, 445301, '市辖区', '3', 445300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1448, 445302, '云城区', '3', 445300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1449, 445321, '新兴县', '3', 445300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1450, 445322, '郁南县', '3', 445300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1451, 445323, '云安县', '3', 445300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1452, 445381, '罗定市', '3', 445300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1453, 450101, '市辖区', '3', 450100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1454, 450102, '兴宁区', '3', 450100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1455, 450103, '青秀区', '3', 450100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1456, 450105, '江南区', '3', 450100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1457, 450107, '西乡塘区', '3', 450100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1458, 450108, '良庆区', '3', 450100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1459, 450109, '邕宁区', '3', 450100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1460, 450122, '武鸣县', '3', 450100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1461, 450123, '隆安县', '3', 450100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1462, 450124, '马山县', '3', 450100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1463, 450125, '上林县', '3', 450100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1464, 450126, '宾阳县', '3', 450100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1465, 450127, '横　县', '3', 450100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1466, 450201, '市辖区', '3', 450200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1467, 450202, '城中区', '3', 450200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1468, 450203, '鱼峰区', '3', 450200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1469, 450204, '柳南区', '3', 450200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1470, 450205, '柳北区', '3', 450200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1471, 450221, '柳江县', '3', 450200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1472, 450222, '柳城县', '3', 450200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1473, 450223, '鹿寨县', '3', 450200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1474, 450224, '融安县', '3', 450200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1475, 450225, '融水苗族自治县', '3', 450200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1476, 450226, '三江侗族自治县', '3', 450200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1477, 450301, '市辖区', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1478, 450302, '秀峰区', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1479, 450303, '叠彩区', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1480, 450304, '象山区', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1481, 450305, '七星区', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1482, 450311, '雁山区', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1483, 450321, '阳朔县', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1484, 450322, '临桂县', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1485, 450323, '灵川县', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1486, 450324, '全州县', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1487, 450325, '兴安县', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1488, 450326, '永福县', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1489, 450327, '灌阳县', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1490, 450328, '龙胜各族自治县', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1491, 450329, '资源县', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1492, 450330, '平乐县', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1493, 450331, '荔蒲县', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1494, 450332, '恭城瑶族自治县', '3', 450300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1495, 450401, '市辖区', '3', 450400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1496, 450403, '万秀区', '3', 450400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1497, 450404, '蝶山区', '3', 450400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1498, 450405, '长洲区', '3', 450400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1499, 450421, '苍梧县', '3', 450400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1500, 450422, '藤　县', '3', 450400, null, null);
commit;
prompt 1500 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1501, 450423, '蒙山县', '3', 450400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1502, 450481, '岑溪市', '3', 450400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1503, 450501, '市辖区', '3', 450500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1504, 450502, '海城区', '3', 450500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1505, 450503, '银海区', '3', 450500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1506, 450512, '铁山港区', '3', 450500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1507, 450521, '合浦县', '3', 450500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1508, 450601, '市辖区', '3', 450600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1509, 450602, '港口区', '3', 450600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1510, 450603, '防城区', '3', 450600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1511, 450621, '上思县', '3', 450600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1512, 450681, '东兴市', '3', 450600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1513, 450701, '市辖区', '3', 450700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1514, 450702, '钦南区', '3', 450700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1515, 450703, '钦北区', '3', 450700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1516, 450721, '灵山县', '3', 450700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1517, 450722, '浦北县', '3', 450700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1518, 450801, '市辖区', '3', 450800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1519, 450802, '港北区', '3', 450800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1520, 450803, '港南区', '3', 450800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1521, 450804, '覃塘区', '3', 450800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1522, 450821, '平南县', '3', 450800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1523, 450881, '桂平市', '3', 450800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1524, 450901, '市辖区', '3', 450900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1525, 450902, '玉州区', '3', 450900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1526, 450921, '容　县', '3', 450900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1527, 450922, '陆川县', '3', 450900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1528, 450923, '博白县', '3', 450900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1529, 450924, '兴业县', '3', 450900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1530, 450981, '北流市', '3', 450900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1531, 451001, '市辖区', '3', 451000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1532, 451002, '右江区', '3', 451000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1533, 451021, '田阳县', '3', 451000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1534, 451022, '田东县', '3', 451000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1535, 451023, '平果县', '3', 451000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1536, 451024, '德保县', '3', 451000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1537, 451025, '靖西县', '3', 451000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1538, 451026, '那坡县', '3', 451000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1539, 451027, '凌云县', '3', 451000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1540, 451028, '乐业县', '3', 451000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1541, 451029, '田林县', '3', 451000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1542, 451030, '西林县', '3', 451000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1543, 451031, '隆林各族自治县', '3', 451000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1544, 451101, '市辖区', '3', 451100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1545, 451102, '八步区', '3', 451100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1546, 451121, '昭平县', '3', 451100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1547, 451122, '钟山县', '3', 451100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1548, 451123, '富川瑶族自治县', '3', 451100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1549, 451201, '市辖区', '3', 451200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1550, 451202, '金城江区', '3', 451200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1551, 451221, '南丹县', '3', 451200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1552, 451222, '天峨县', '3', 451200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1553, 451223, '凤山县', '3', 451200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1554, 451224, '东兰县', '3', 451200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1555, 451225, '罗城仫佬族自治县', '3', 451200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1556, 451226, '环江毛南族自治县', '3', 451200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1557, 451227, '巴马瑶族自治县', '3', 451200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1558, 451228, '都安瑶族自治县', '3', 451200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1559, 451229, '大化瑶族自治县', '3', 451200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1560, 451281, '宜州市', '3', 451200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1561, 451301, '市辖区', '3', 451300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1562, 451302, '兴宾区', '3', 451300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1563, 451321, '忻城县', '3', 451300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1564, 451322, '象州县', '3', 451300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1565, 451323, '武宣县', '3', 451300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1566, 451324, '金秀瑶族自治县', '3', 451300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1567, 451381, '合山市', '3', 451300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1568, 451401, '市辖区', '3', 451400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1569, 451402, '江洲区', '3', 451400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1570, 451421, '扶绥县', '3', 451400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1571, 451422, '宁明县', '3', 451400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1572, 451423, '龙州县', '3', 451400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1573, 451424, '大新县', '3', 451400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1574, 451425, '天等县', '3', 451400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1575, 451481, '凭祥市', '3', 451400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1576, 460101, '市辖区', '3', 460100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1577, 460105, '秀英区', '3', 460100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1578, 460106, '龙华区', '3', 460100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1579, 460107, '琼山区', '3', 460100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1580, 460108, '美兰区', '3', 460100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1581, 460201, '市辖区', '3', 460200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1582, 469001, '五指山市', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1583, 469002, '琼海市', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1584, 469003, '儋州市', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1585, 469005, '文昌市', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1586, 469006, '万宁市', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1587, 469007, '东方市', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1588, 469025, '定安县', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1589, 469026, '屯昌县', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1590, 469027, '澄迈县', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1591, 469028, '临高县', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1592, 469030, '白沙黎族自治县', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1593, 469031, '昌江黎族自治县', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1594, 469033, '乐东黎族自治县', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1595, 469034, '陵水黎族自治县', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1596, 469035, '保亭黎族苗族自治县', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1597, 469036, '琼中黎族苗族自治县', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1598, 469037, '西沙群岛', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1599, 469038, '南沙群岛', '3', 469000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1600, 469039, '中沙群岛的岛礁及其海域', '3', 469000, null, null);
commit;
prompt 1600 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1601, 500101, '万州区', '3', 500100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1602, 500102, '涪陵区', '3', 500100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1603, 500103, '渝中区', '3', 500100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1604, 500104, '大渡口区', '3', 500100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1605, 500105, '江北区', '3', 500100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1606, 500106, '沙坪坝区', '3', 500100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1607, 500107, '九龙坡区', '3', 500100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1608, 500108, '南岸区', '3', 500100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1609, 500109, '北碚区', '3', 500100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1610, 500110, '万盛区', '3', 500100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1611, 500111, '双桥区', '3', 500100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1612, 500112, '渝北区', '3', 500100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1613, 500113, '巴南区', '3', 500100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1614, 500114, '黔江区', '3', 500100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1615, 500115, '长寿区', '3', 500100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1616, 500222, '綦江县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1617, 500223, '潼南县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1618, 500224, '铜梁县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1619, 500225, '大足县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1620, 500226, '荣昌县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1621, 500227, '璧山县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1622, 500228, '梁平县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1623, 500229, '城口县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1624, 500230, '丰都县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1625, 500231, '垫江县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1626, 500232, '武隆县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1627, 500233, '忠　县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1628, 500234, '开　县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1629, 500235, '云阳县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1630, 500236, '奉节县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1631, 500237, '巫山县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1632, 500238, '巫溪县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1633, 500240, '石柱土家族自治县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1634, 500241, '秀山土家族苗族自治县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1635, 500242, '酉阳土家族苗族自治县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1636, 500243, '彭水苗族土家族自治县', '3', 500200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1637, 500381, '江津市', '3', 500300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1638, 500382, '合川市', '3', 500300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1639, 500383, '永川市', '3', 500300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1640, 500384, '南川市', '3', 500300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1641, 510101, '市辖区', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1642, 510104, '锦江区', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1643, 510105, '青羊区', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1644, 510106, '金牛区', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1645, 510107, '武侯区', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1646, 510108, '成华区', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1647, 510112, '龙泉驿区', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1648, 510113, '青白江区', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1649, 510114, '新都区', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1650, 510115, '温江区', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1651, 510121, '金堂县', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1652, 510122, '双流县', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1653, 510124, '郫　县', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1654, 510129, '大邑县', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1655, 510131, '蒲江县', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1656, 510132, '新津县', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1657, 510181, '都江堰市', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1658, 510182, '彭州市', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1659, 510183, '邛崃市', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1660, 510184, '崇州市', '3', 510100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1661, 510301, '市辖区', '3', 510300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1662, 510302, '自流井区', '3', 510300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1663, 510303, '贡井区', '3', 510300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1664, 510304, '大安区', '3', 510300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1665, 510311, '沿滩区', '3', 510300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1666, 510321, '荣　县', '3', 510300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1667, 510322, '富顺县', '3', 510300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1668, 510401, '市辖区', '3', 510400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1669, 510402, '东　区', '3', 510400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1670, 510403, '西　区', '3', 510400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1671, 510411, '仁和区', '3', 510400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1672, 510421, '米易县', '3', 510400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1673, 510422, '盐边县', '3', 510400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1674, 510501, '市辖区', '3', 510500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1675, 510502, '江阳区', '3', 510500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1676, 510503, '纳溪区', '3', 510500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1677, 510504, '龙马潭区', '3', 510500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1678, 510521, '泸　县', '3', 510500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1679, 510522, '合江县', '3', 510500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1680, 510524, '叙永县', '3', 510500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1681, 510525, '古蔺县', '3', 510500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1682, 510601, '市辖区', '3', 510600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1683, 510603, '旌阳区', '3', 510600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1684, 510623, '中江县', '3', 510600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1685, 510626, '罗江县', '3', 510600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1686, 510681, '广汉市', '3', 510600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1687, 510682, '什邡市', '3', 510600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1688, 510683, '绵竹市', '3', 510600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1689, 510701, '市辖区', '3', 510700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1690, 510703, '涪城区', '3', 510700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1691, 510704, '游仙区', '3', 510700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1692, 510722, '三台县', '3', 510700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1693, 510723, '盐亭县', '3', 510700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1694, 510724, '安　县', '3', 510700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1695, 510725, '梓潼县', '3', 510700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1696, 510726, '北川羌族自治县', '3', 510700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1697, 510727, '平武县', '3', 510700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1698, 510781, '江油市', '3', 510700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1699, 510801, '市辖区', '3', 510800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1700, 510802, '市中区', '3', 510800, null, null);
commit;
prompt 1700 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1701, 510811, '元坝区', '3', 510800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1702, 510812, '朝天区', '3', 510800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1703, 510821, '旺苍县', '3', 510800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1704, 510822, '青川县', '3', 510800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1705, 510823, '剑阁县', '3', 510800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1706, 510824, '苍溪县', '3', 510800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1707, 510901, '市辖区', '3', 510900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1708, 510903, '船山区', '3', 510900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1709, 510904, '安居区', '3', 510900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1710, 510921, '蓬溪县', '3', 510900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1711, 510922, '射洪县', '3', 510900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1712, 510923, '大英县', '3', 510900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1713, 511001, '市辖区', '3', 511000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1714, 511002, '市中区', '3', 511000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1715, 511011, '东兴区', '3', 511000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1716, 511024, '威远县', '3', 511000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1717, 511025, '资中县', '3', 511000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1718, 511028, '隆昌县', '3', 511000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1719, 511101, '市辖区', '3', 511100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1720, 511102, '市中区', '3', 511100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1721, 511111, '沙湾区', '3', 511100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1722, 511112, '五通桥区', '3', 511100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1723, 511113, '金口河区', '3', 511100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1724, 511123, '犍为县', '3', 511100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1725, 511124, '井研县', '3', 511100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1726, 511126, '夹江县', '3', 511100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1727, 511129, '沐川县', '3', 511100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1728, 511132, '峨边彝族自治县', '3', 511100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1729, 511133, '马边彝族自治县', '3', 511100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1730, 511181, '峨眉山市', '3', 511100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1731, 511301, '市辖区', '3', 511300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1732, 511302, '顺庆区', '3', 511300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1733, 511303, '高坪区', '3', 511300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1734, 511304, '嘉陵区', '3', 511300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1735, 511321, '南部县', '3', 511300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1736, 511322, '营山县', '3', 511300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1737, 511323, '蓬安县', '3', 511300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1738, 511324, '仪陇县', '3', 511300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1739, 511325, '西充县', '3', 511300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1740, 511381, '阆中市', '3', 511300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1741, 511401, '市辖区', '3', 511400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1742, 511402, '东坡区', '3', 511400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1743, 511421, '仁寿县', '3', 511400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1744, 511422, '彭山县', '3', 511400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1745, 511423, '洪雅县', '3', 511400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1746, 511424, '丹棱县', '3', 511400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1747, 511425, '青神县', '3', 511400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1748, 511501, '市辖区', '3', 511500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1749, 511502, '翠屏区', '3', 511500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1750, 511521, '宜宾县', '3', 511500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1751, 511522, '南溪县', '3', 511500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1752, 511523, '江安县', '3', 511500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1753, 511524, '长宁县', '3', 511500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1754, 511525, '高　县', '3', 511500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1755, 511526, '珙　县', '3', 511500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1756, 511527, '筠连县', '3', 511500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1757, 511528, '兴文县', '3', 511500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1758, 511529, '屏山县', '3', 511500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1759, 511601, '市辖区', '3', 511600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1760, 511602, '广安区', '3', 511600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1761, 511621, '岳池县', '3', 511600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1762, 511622, '武胜县', '3', 511600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1763, 511623, '邻水县', '3', 511600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1764, 511681, '华莹市', '3', 511600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1765, 511701, '市辖区', '3', 511700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1766, 511702, '通川区', '3', 511700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1767, 511721, '达　县', '3', 511700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1768, 511722, '宣汉县', '3', 511700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1769, 511723, '开江县', '3', 511700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1770, 511724, '大竹县', '3', 511700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1771, 511725, '渠　县', '3', 511700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1772, 511781, '万源市', '3', 511700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1773, 511801, '市辖区', '3', 511800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1774, 511802, '雨城区', '3', 511800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1775, 511821, '名山县', '3', 511800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1776, 511822, '荥经县', '3', 511800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1777, 511823, '汉源县', '3', 511800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1778, 511824, '石棉县', '3', 511800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1779, 511825, '天全县', '3', 511800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1780, 511826, '芦山县', '3', 511800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1781, 511827, '宝兴县', '3', 511800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1782, 511901, '市辖区', '3', 511900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1783, 511902, '巴州区', '3', 511900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1784, 511921, '通江县', '3', 511900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1785, 511922, '南江县', '3', 511900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1786, 511923, '平昌县', '3', 511900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1787, 512001, '市辖区', '3', 512000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1788, 512002, '雁江区', '3', 512000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1789, 512021, '安岳县', '3', 512000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1790, 512022, '乐至县', '3', 512000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1791, 512081, '简阳市', '3', 512000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1792, 513221, '汶川县', '3', 513200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1793, 513222, '理　县', '3', 513200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1794, 513223, '茂　县', '3', 513200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1795, 513224, '松潘县', '3', 513200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1796, 513225, '九寨沟县', '3', 513200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1797, 513226, '金川县', '3', 513200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1798, 513227, '小金县', '3', 513200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1799, 513228, '黑水县', '3', 513200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1800, 513229, '马尔康县', '3', 513200, null, null);
commit;
prompt 1800 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1801, 513230, '壤塘县', '3', 513200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1802, 513231, '阿坝县', '3', 513200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1803, 513232, '若尔盖县', '3', 513200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1804, 513233, '红原县', '3', 513200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1805, 513321, '康定县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1806, 513322, '泸定县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1807, 513323, '丹巴县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1808, 513324, '九龙县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1809, 513325, '雅江县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1810, 513326, '道孚县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1811, 513327, '炉霍县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1812, 513328, '甘孜县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1813, 513329, '新龙县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1814, 513330, '德格县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1815, 513331, '白玉县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1816, 513332, '石渠县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1817, 513333, '色达县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1818, 513334, '理塘县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1819, 513335, '巴塘县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1820, 513336, '乡城县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1821, 513337, '稻城县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1822, 513338, '得荣县', '3', 513300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1823, 513401, '西昌市', '3', 513400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1824, 513422, '木里藏族自治县', '3', 513400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1825, 513423, '盐源县', '3', 513400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1826, 513424, '德昌县', '3', 513400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1827, 513425, '会理县', '3', 513400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1828, 513426, '会东县', '3', 513400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1829, 513427, '宁南县', '3', 513400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1830, 513428, '普格县', '3', 513400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1831, 513429, '布拖县', '3', 513400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1832, 513430, '金阳县', '3', 513400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1833, 513431, '昭觉县', '3', 513400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1834, 513432, '喜德县', '3', 513400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1835, 513433, '冕宁县', '3', 513400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1836, 513434, '越西县', '3', 513400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1837, 513435, '甘洛县', '3', 513400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1838, 513436, '美姑县', '3', 513400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1839, 513437, '雷波县', '3', 513400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1840, 520101, '市辖区', '3', 520100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1841, 520102, '南明区', '3', 520100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1842, 520103, '云岩区', '3', 520100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1843, 520111, '花溪区', '3', 520100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1844, 520112, '乌当区', '3', 520100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1845, 520113, '白云区', '3', 520100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1846, 520114, '小河区', '3', 520100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1847, 520121, '开阳县', '3', 520100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1848, 520122, '息烽县', '3', 520100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1849, 520123, '修文县', '3', 520100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1850, 520181, '清镇市', '3', 520100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1851, 520201, '钟山区', '3', 520200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1852, 520203, '六枝特区', '3', 520200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1853, 520221, '水城县', '3', 520200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1854, 520222, '盘　县', '3', 520200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1855, 520301, '市辖区', '3', 520300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1856, 520302, '红花岗区', '3', 520300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1857, 520303, '汇川区', '3', 520300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1858, 520321, '遵义县', '3', 520300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1859, 520322, '桐梓县', '3', 520300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1860, 520323, '绥阳县', '3', 520300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1861, 520324, '正安县', '3', 520300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1862, 520325, '道真仡佬族苗族自治县', '3', 520300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1863, 520326, '务川仡佬族苗族自治县', '3', 520300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1864, 520327, '凤冈县', '3', 520300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1865, 520328, '湄潭县', '3', 520300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1866, 520329, '余庆县', '3', 520300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1867, 520330, '习水县', '3', 520300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1868, 520381, '赤水市', '3', 520300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1869, 520382, '仁怀市', '3', 520300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1870, 520401, '市辖区', '3', 520400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1871, 520402, '西秀区', '3', 520400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1872, 520421, '平坝县', '3', 520400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1873, 520422, '普定县', '3', 520400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1874, 520423, '镇宁布依族苗族自治县', '3', 520400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1875, 520424, '关岭布依族苗族自治县', '3', 520400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1876, 520425, '紫云苗族布依族自治县', '3', 520400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1877, 522201, '铜仁市', '3', 522200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1878, 522222, '江口县', '3', 522200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1879, 522223, '玉屏侗族自治县', '3', 522200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1880, 522224, '石阡县', '3', 522200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1881, 522225, '思南县', '3', 522200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1882, 522226, '印江土家族苗族自治县', '3', 522200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1883, 522227, '德江县', '3', 522200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1884, 522228, '沿河土家族自治县', '3', 522200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1885, 522229, '松桃苗族自治县', '3', 522200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1886, 522230, '万山特区', '3', 522200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1887, 522301, '兴义市', '3', 522300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1888, 522322, '兴仁县', '3', 522300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1889, 522323, '普安县', '3', 522300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1890, 522324, '晴隆县', '3', 522300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1891, 522325, '贞丰县', '3', 522300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1892, 522326, '望谟县', '3', 522300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1893, 522327, '册亨县', '3', 522300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1894, 522328, '安龙县', '3', 522300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1895, 522401, '毕节市', '3', 522400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1896, 522422, '大方县', '3', 522400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1897, 522423, '黔西县', '3', 522400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1898, 522424, '金沙县', '3', 522400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1899, 522425, '织金县', '3', 522400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1900, 522426, '纳雍县', '3', 522400, null, null);
commit;
prompt 1900 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1901, 522427, '威宁彝族回族苗族自治县', '3', 522400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1902, 522428, '赫章县', '3', 522400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1903, 522601, '凯里市', '3', 522600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1904, 522622, '黄平县', '3', 522600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1905, 522623, '施秉县', '3', 522600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1906, 522624, '三穗县', '3', 522600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1907, 522625, '镇远县', '3', 522600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1908, 522626, '岑巩县', '3', 522600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1909, 522627, '天柱县', '3', 522600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1910, 522628, '锦屏县', '3', 522600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1911, 522629, '剑河县', '3', 522600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1912, 522630, '台江县', '3', 522600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1913, 522631, '黎平县', '3', 522600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1914, 522632, '榕江县', '3', 522600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1915, 522633, '从江县', '3', 522600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1916, 522634, '雷山县', '3', 522600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1917, 522635, '麻江县', '3', 522600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1918, 522636, '丹寨县', '3', 522600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1919, 522701, '都匀市', '3', 522700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1920, 522702, '福泉市', '3', 522700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1921, 522722, '荔波县', '3', 522700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1922, 522723, '贵定县', '3', 522700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1923, 522725, '瓮安县', '3', 522700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1924, 522726, '独山县', '3', 522700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1925, 522727, '平塘县', '3', 522700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1926, 522728, '罗甸县', '3', 522700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1927, 522729, '长顺县', '3', 522700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1928, 522730, '龙里县', '3', 522700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1929, 522731, '惠水县', '3', 522700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1930, 522732, '三都水族自治县', '3', 522700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1931, 530101, '市辖区', '3', 530100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1932, 530102, '五华区', '3', 530100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1933, 530103, '盘龙区', '3', 530100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1934, 530111, '官渡区', '3', 530100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1935, 530112, '西山区', '3', 530100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1936, 530113, '东川区', '3', 530100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1937, 530121, '呈贡县', '3', 530100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1938, 530122, '晋宁县', '3', 530100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1939, 530124, '富民县', '3', 530100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1940, 530125, '宜良县', '3', 530100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1941, 530126, '石林彝族自治县', '3', 530100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1942, 530127, '嵩明县', '3', 530100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1943, 530128, '禄劝彝族苗族自治县', '3', 530100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1944, 530129, '寻甸回族彝族自治县', '3', 530100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1945, 530181, '安宁市', '3', 530100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1946, 530301, '市辖区', '3', 530300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1947, 530302, '麒麟区', '3', 530300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1948, 530321, '马龙县', '3', 530300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1949, 530322, '陆良县', '3', 530300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1950, 530323, '师宗县', '3', 530300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1951, 530324, '罗平县', '3', 530300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1952, 530325, '富源县', '3', 530300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1953, 530326, '会泽县', '3', 530300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1954, 530328, '沾益县', '3', 530300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1955, 530381, '宣威市', '3', 530300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1956, 530401, '市辖区', '3', 530400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1957, 530402, '红塔区', '3', 530400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1958, 530421, '江川县', '3', 530400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1959, 530422, '澄江县', '3', 530400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1960, 530423, '通海县', '3', 530400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1961, 530424, '华宁县', '3', 530400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1962, 530425, '易门县', '3', 530400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1963, 530426, '峨山彝族自治县', '3', 530400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1964, 530427, '新平彝族傣族自治县', '3', 530400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1965, 530428, '元江哈尼族彝族傣族自治县', '3', 530400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1966, 530501, '市辖区', '3', 530500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1967, 530502, '隆阳区', '3', 530500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1968, 530521, '施甸县', '3', 530500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1969, 530522, '腾冲县', '3', 530500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1970, 530523, '龙陵县', '3', 530500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1971, 530524, '昌宁县', '3', 530500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1972, 530601, '市辖区', '3', 530600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1973, 530602, '昭阳区', '3', 530600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1974, 530621, '鲁甸县', '3', 530600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1975, 530622, '巧家县', '3', 530600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1976, 530623, '盐津县', '3', 530600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1977, 530624, '大关县', '3', 530600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1978, 530625, '永善县', '3', 530600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1979, 530626, '绥江县', '3', 530600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1980, 530627, '镇雄县', '3', 530600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1981, 530628, '彝良县', '3', 530600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1982, 530629, '威信县', '3', 530600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1983, 530630, '水富县', '3', 530600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1984, 530701, '市辖区', '3', 530700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1985, 530702, '古城区', '3', 530700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1986, 530721, '玉龙纳西族自治县', '3', 530700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1987, 530722, '永胜县', '3', 530700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1988, 530723, '华坪县', '3', 530700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1989, 530724, '宁蒗彝族自治县', '3', 530700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1990, 530801, '市辖区', '3', 530800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1991, 530802, '翠云区', '3', 530800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1992, 530821, '普洱哈尼族彝族自治县', '3', 530800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1993, 530822, '墨江哈尼族自治县', '3', 530800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1994, 530823, '景东彝族自治县', '3', 530800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1995, 530824, '景谷傣族彝族自治县', '3', 530800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1996, 530825, '镇沅彝族哈尼族拉祜族自治县', '3', 530800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1997, 530826, '江城哈尼族彝族自治县', '3', 530800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1998, 530827, '孟连傣族拉祜族佤族自治县', '3', 530800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (1999, 530828, '澜沧拉祜族自治县', '3', 530800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2000, 530829, '西盟佤族自治县', '3', 530800, null, null);
commit;
prompt 2000 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2001, 530901, '市辖区', '3', 530900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2002, 530902, '临翔区', '3', 530900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2003, 530921, '凤庆县', '3', 530900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2004, 530922, '云　县', '3', 530900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2005, 530923, '永德县', '3', 530900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2006, 530924, '镇康县', '3', 530900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2007, 530925, '双江拉祜族佤族布朗族傣族自治县', '3', 530900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2008, 530926, '耿马傣族佤族自治县', '3', 530900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2009, 530927, '沧源佤族自治县', '3', 530900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2010, 532301, '楚雄市', '3', 532300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2011, 532322, '双柏县', '3', 532300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2012, 532323, '牟定县', '3', 532300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2013, 532324, '南华县', '3', 532300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2014, 532325, '姚安县', '3', 532300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2015, 532326, '大姚县', '3', 532300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2016, 532327, '永仁县', '3', 532300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2017, 532328, '元谋县', '3', 532300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2018, 532329, '武定县', '3', 532300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2019, 532331, '禄丰县', '3', 532300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2020, 532501, '个旧市', '3', 532500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2021, 532502, '开远市', '3', 532500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2022, 532522, '蒙自县', '3', 532500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2023, 532523, '屏边苗族自治县', '3', 532500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2024, 532524, '建水县', '3', 532500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2025, 532525, '石屏县', '3', 532500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2026, 532526, '弥勒县', '3', 532500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2027, 532527, '泸西县', '3', 532500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2028, 532528, '元阳县', '3', 532500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2029, 532529, '红河县', '3', 532500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2030, 532530, '金平苗族瑶族傣族自治县', '3', 532500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2031, 532531, '绿春县', '3', 532500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2032, 532532, '河口瑶族自治县', '3', 532500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2033, 532621, '文山县', '3', 532600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2034, 532622, '砚山县', '3', 532600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2035, 532623, '西畴县', '3', 532600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2036, 532624, '麻栗坡县', '3', 532600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2037, 532625, '马关县', '3', 532600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2038, 532626, '丘北县', '3', 532600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2039, 532627, '广南县', '3', 532600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2040, 532628, '富宁县', '3', 532600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2041, 532801, '景洪市', '3', 532800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2042, 532822, '勐海县', '3', 532800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2043, 532823, '勐腊县', '3', 532800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2044, 532901, '大理市', '3', 532900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2045, 532922, '漾濞彝族自治县', '3', 532900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2046, 532923, '祥云县', '3', 532900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2047, 532924, '宾川县', '3', 532900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2048, 532925, '弥渡县', '3', 532900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2049, 532926, '南涧彝族自治县', '3', 532900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2050, 532927, '巍山彝族回族自治县', '3', 532900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2051, 532928, '永平县', '3', 532900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2052, 532929, '云龙县', '3', 532900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2053, 532930, '洱源县', '3', 532900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2054, 532931, '剑川县', '3', 532900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2055, 532932, '鹤庆县', '3', 532900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2056, 533102, '瑞丽市', '3', 533100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2057, 533103, '潞西市', '3', 533100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2058, 533122, '梁河县', '3', 533100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2059, 533123, '盈江县', '3', 533100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2060, 533124, '陇川县', '3', 533100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2061, 533321, '泸水县', '3', 533300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2062, 533323, '福贡县', '3', 533300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2063, 533324, '贡山独龙族怒族自治县', '3', 533300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2064, 533325, '兰坪白族普米族自治县', '3', 533300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2065, 533421, '香格里拉县', '3', 533400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2066, 533422, '德钦县', '3', 533400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2067, 533423, '维西傈僳族自治县', '3', 533400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2068, 540101, '市辖区', '3', 540100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2069, 540102, '城关区', '3', 540100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2070, 540121, '林周县', '3', 540100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2071, 540122, '当雄县', '3', 540100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2072, 540123, '尼木县', '3', 540100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2073, 540124, '曲水县', '3', 540100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2074, 540125, '堆龙德庆县', '3', 540100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2075, 540126, '达孜县', '3', 540100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2076, 540127, '墨竹工卡县', '3', 540100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2077, 542121, '昌都县', '3', 542100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2078, 542122, '江达县', '3', 542100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2079, 542123, '贡觉县', '3', 542100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2080, 542124, '类乌齐县', '3', 542100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2081, 542125, '丁青县', '3', 542100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2082, 542126, '察雅县', '3', 542100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2083, 542127, '八宿县', '3', 542100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2084, 542128, '左贡县', '3', 542100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2085, 542129, '芒康县', '3', 542100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2086, 542132, '洛隆县', '3', 542100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2087, 542133, '边坝县', '3', 542100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2088, 542221, '乃东县', '3', 542200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2089, 542222, '扎囊县', '3', 542200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2090, 542223, '贡嘎县', '3', 542200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2091, 542224, '桑日县', '3', 542200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2092, 542225, '琼结县', '3', 542200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2093, 542226, '曲松县', '3', 542200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2094, 542227, '措美县', '3', 542200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2095, 542228, '洛扎县', '3', 542200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2096, 542229, '加查县', '3', 542200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2097, 542231, '隆子县', '3', 542200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2098, 542232, '错那县', '3', 542200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2099, 542233, '浪卡子县', '3', 542200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2100, 542301, '日喀则市', '3', 542300, null, null);
commit;
prompt 2100 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2101, 542322, '南木林县', '3', 542300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2102, 542323, '江孜县', '3', 542300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2103, 542324, '定日县', '3', 542300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2104, 542325, '萨迦县', '3', 542300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2105, 542326, '拉孜县', '3', 542300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2106, 542327, '昂仁县', '3', 542300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2107, 542328, '谢通门县', '3', 542300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2108, 542329, '白朗县', '3', 542300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2109, 542330, '仁布县', '3', 542300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2110, 542331, '康马县', '3', 542300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2111, 542332, '定结县', '3', 542300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2112, 542333, '仲巴县', '3', 542300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2113, 542334, '亚东县', '3', 542300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2114, 542335, '吉隆县', '3', 542300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2115, 542336, '聂拉木县', '3', 542300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2116, 542337, '萨嘎县', '3', 542300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2117, 542338, '岗巴县', '3', 542300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2118, 542421, '那曲县', '3', 542400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2119, 542422, '嘉黎县', '3', 542400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2120, 542423, '比如县', '3', 542400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2121, 542424, '聂荣县', '3', 542400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2122, 542425, '安多县', '3', 542400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2123, 542426, '申扎县', '3', 542400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2124, 542427, '索　县', '3', 542400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2125, 542428, '班戈县', '3', 542400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2126, 542429, '巴青县', '3', 542400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2127, 542430, '尼玛县', '3', 542400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2128, 542521, '普兰县', '3', 542500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2129, 542522, '札达县', '3', 542500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2130, 542523, '噶尔县', '3', 542500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2131, 542524, '日土县', '3', 542500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2132, 542525, '革吉县', '3', 542500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2133, 542526, '改则县', '3', 542500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2134, 542527, '措勤县', '3', 542500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2135, 542621, '林芝县', '3', 542600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2136, 542622, '工布江达县', '3', 542600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2137, 542623, '米林县', '3', 542600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2138, 542624, '墨脱县', '3', 542600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2139, 542625, '波密县', '3', 542600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2140, 542626, '察隅县', '3', 542600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2141, 542627, '朗　县', '3', 542600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2142, 610101, '市辖区', '3', 610100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2143, 610102, '新城区', '3', 610100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2144, 610103, '碑林区', '3', 610100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2145, 610104, '莲湖区', '3', 610100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2146, 610111, '灞桥区', '3', 610100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2147, 610112, '未央区', '3', 610100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2148, 610113, '雁塔区', '3', 610100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2149, 610114, '阎良区', '3', 610100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2150, 610115, '临潼区', '3', 610100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2151, 610116, '长安区', '3', 610100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2152, 610122, '蓝田县', '3', 610100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2153, 610124, '周至县', '3', 610100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2154, 610125, '户　县', '3', 610100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2155, 610126, '高陵县', '3', 610100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2156, 610201, '市辖区', '3', 610200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2157, 610202, '王益区', '3', 610200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2158, 610203, '印台区', '3', 610200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2159, 610204, '耀州区', '3', 610200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2160, 610222, '宜君县', '3', 610200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2161, 610301, '市辖区', '3', 610300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2162, 610302, '渭滨区', '3', 610300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2163, 610303, '金台区', '3', 610300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2164, 610304, '陈仓区', '3', 610300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2165, 610322, '凤翔县', '3', 610300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2166, 610323, '岐山县', '3', 610300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2167, 610324, '扶风县', '3', 610300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2168, 610326, '眉　县', '3', 610300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2169, 610327, '陇　县', '3', 610300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2170, 610328, '千阳县', '3', 610300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2171, 610329, '麟游县', '3', 610300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2172, 610330, '凤　县', '3', 610300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2173, 610331, '太白县', '3', 610300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2174, 610401, '市辖区', '3', 610400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2175, 610402, '秦都区', '3', 610400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2176, 610403, '杨凌区', '3', 610400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2177, 610404, '渭城区', '3', 610400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2178, 610422, '三原县', '3', 610400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2179, 610423, '泾阳县', '3', 610400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2180, 610424, '乾　县', '3', 610400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2181, 610425, '礼泉县', '3', 610400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2182, 610426, '永寿县', '3', 610400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2183, 610427, '彬　县', '3', 610400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2184, 610428, '长武县', '3', 610400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2185, 610429, '旬邑县', '3', 610400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2186, 320582, '张家港市', '3', 320500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2187, 320583, '昆山市', '3', 320500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2188, 320584, '吴江市', '3', 320500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2189, 320585, '太仓市', '3', 320500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2190, 320601, '市辖区', '3', 320600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2191, 320602, '崇川区', '3', 320600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2192, 320611, '港闸区', '3', 320600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2193, 320621, '海安县', '3', 320600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2194, 320623, '如东县', '3', 320600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2195, 320681, '启东市', '3', 320600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2196, 320682, '如皋市', '3', 320600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2197, 320683, '通州市', '3', 320600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2198, 320684, '海门市', '3', 320600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2199, 320701, '市辖区', '3', 320700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2200, 320703, '连云区', '3', 320700, null, null);
commit;
prompt 2200 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2201, 320705, '新浦区', '3', 320700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2202, 320706, '海州区', '3', 320700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2203, 320721, '赣榆县', '3', 320700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2204, 320722, '东海县', '3', 320700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2205, 320723, '灌云县', '3', 320700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2206, 320724, '灌南县', '3', 320700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2207, 320801, '市辖区', '3', 320800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2208, 320802, '清河区', '3', 320800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2209, 320803, '楚州区', '3', 320800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2210, 320804, '淮阴区', '3', 320800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2211, 320811, '清浦区', '3', 320800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2212, 320826, '涟水县', '3', 320800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2213, 320829, '洪泽县', '3', 320800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2214, 320830, '盱眙县', '3', 320800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2215, 320831, '金湖县', '3', 320800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2216, 320901, '市辖区', '3', 320900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2217, 320902, '亭湖区', '3', 320900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2218, 320903, '盐都区', '3', 320900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2219, 320921, '响水县', '3', 320900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2220, 320922, '滨海县', '3', 320900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2221, 320923, '阜宁县', '3', 320900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2222, 320924, '射阳县', '3', 320900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2223, 320925, '建湖县', '3', 320900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2224, 320981, '东台市', '3', 320900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2225, 320982, '大丰市', '3', 320900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2226, 321001, '市辖区', '3', 321000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2227, 321002, '广陵区', '3', 321000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2228, 321003, '邗江区', '3', 321000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2229, 321011, '郊　区', '3', 321000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2230, 321023, '宝应县', '3', 321000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2231, 321081, '仪征市', '3', 321000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2232, 321084, '高邮市', '3', 321000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2233, 321088, '江都市', '3', 321000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2234, 321101, '市辖区', '3', 321100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2235, 321102, '京口区', '3', 321100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2236, 321111, '润州区', '3', 321100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2237, 321112, '丹徒区', '3', 321100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2238, 321181, '丹阳市', '3', 321100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2239, 321182, '扬中市', '3', 321100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2240, 321183, '句容市', '3', 321100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2241, 321201, '市辖区', '3', 321200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2242, 321202, '海陵区', '3', 321200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2243, 321203, '高港区', '3', 321200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2244, 321281, '兴化市', '3', 321200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2245, 321282, '靖江市', '3', 321200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2246, 321283, '泰兴市', '3', 321200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2247, 321284, '姜堰市', '3', 321200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2248, 321301, '市辖区', '3', 321300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2249, 321302, '宿城区', '3', 321300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2250, 321311, '宿豫区', '3', 321300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2251, 321322, '沭阳县', '3', 321300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2252, 321323, '泗阳县', '3', 321300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2253, 321324, '泗洪县', '3', 321300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2254, 330101, '市辖区', '3', 330100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2255, 330102, '上城区', '3', 330100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2256, 330103, '下城区', '3', 330100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2257, 330104, '江干区', '3', 330100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2258, 330105, '拱墅区', '3', 330100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2259, 330106, '西湖区', '3', 330100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2260, 330108, '滨江区', '3', 330100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2261, 330109, '萧山区', '3', 330100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2262, 330110, '余杭区', '3', 330100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2263, 330122, '桐庐县', '3', 330100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2264, 330127, '淳安县', '3', 330100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2265, 330182, '建德市', '3', 330100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2266, 330183, '富阳市', '3', 330100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2267, 330185, '临安市', '3', 330100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2268, 330201, '市辖区', '3', 330200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2269, 330203, '海曙区', '3', 330200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2270, 330204, '江东区', '3', 330200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2271, 330205, '江北区', '3', 330200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2272, 330206, '北仑区', '3', 330200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2273, 330211, '镇海区', '3', 330200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2274, 330212, '鄞州区', '3', 330200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2275, 330225, '象山县', '3', 330200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2276, 330226, '宁海县', '3', 330200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2277, 330281, '余姚市', '3', 330200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2278, 330282, '慈溪市', '3', 330200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2279, 330283, '奉化市', '3', 330200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2280, 330301, '市辖区', '3', 330300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2281, 330302, '鹿城区', '3', 330300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2282, 330303, '龙湾区', '3', 330300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2283, 330304, '瓯海区', '3', 330300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2284, 330322, '洞头县', '3', 330300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2285, 330324, '永嘉县', '3', 330300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2286, 330326, '平阳县', '3', 330300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2287, 330327, '苍南县', '3', 330300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2288, 330328, '文成县', '3', 330300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2289, 330329, '泰顺县', '3', 330300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2290, 330381, '瑞安市', '3', 330300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2291, 330382, '乐清市', '3', 330300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2292, 330401, '市辖区', '3', 330400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2293, 330402, '秀城区', '3', 330400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2294, 330411, '秀洲区', '3', 330400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2295, 330421, '嘉善县', '3', 330400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2296, 330424, '海盐县', '3', 330400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2297, 330481, '海宁市', '3', 330400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2298, 330482, '平湖市', '3', 330400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2299, 330483, '桐乡市', '3', 330400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2300, 330501, '市辖区', '3', 330500, null, null);
commit;
prompt 2300 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2301, 330502, '吴兴区', '3', 330500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2302, 330503, '南浔区', '3', 330500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2303, 330521, '德清县', '3', 330500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2304, 330522, '长兴县', '3', 330500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2305, 330523, '安吉县', '3', 330500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2306, 330601, '市辖区', '3', 330600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2307, 330602, '越城区', '3', 330600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2308, 330621, '绍兴县', '3', 330600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2309, 330624, '新昌县', '3', 330600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2310, 330681, '诸暨市', '3', 330600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2311, 330682, '上虞市', '3', 330600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2312, 330683, '嵊州市', '3', 330600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2313, 330701, '市辖区', '3', 330700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2314, 330702, '婺城区', '3', 330700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2315, 330703, '金东区', '3', 330700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2316, 330723, '武义县', '3', 330700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2317, 330726, '浦江县', '3', 330700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2318, 330727, '磐安县', '3', 330700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2319, 330781, '兰溪市', '3', 330700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2320, 330782, '义乌市', '3', 330700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2321, 330783, '东阳市', '3', 330700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2322, 330784, '永康市', '3', 330700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2323, 330801, '市辖区', '3', 330800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2324, 330802, '柯城区', '3', 330800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2325, 330803, '衢江区', '3', 330800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2326, 330822, '常山县', '3', 330800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2327, 330824, '开化县', '3', 330800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2328, 330825, '龙游县', '3', 330800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2329, 330881, '江山市', '3', 330800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2330, 330901, '市辖区', '3', 330900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2331, 330902, '定海区', '3', 330900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2332, 330903, '普陀区', '3', 330900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2333, 330921, '岱山县', '3', 330900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2334, 330922, '嵊泗县', '3', 330900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2335, 331001, '市辖区', '3', 331000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2336, 331002, '椒江区', '3', 331000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2337, 331003, '黄岩区', '3', 331000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2338, 331004, '路桥区', '3', 331000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2339, 331021, '玉环县', '3', 331000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2340, 331022, '三门县', '3', 331000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2341, 331023, '天台县', '3', 331000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2342, 331024, '仙居县', '3', 331000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2343, 331081, '温岭市', '3', 331000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2344, 331082, '临海市', '3', 331000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2345, 331101, '市辖区', '3', 331100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2346, 331102, '莲都区', '3', 331100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2347, 331121, '青田县', '3', 331100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2348, 331122, '缙云县', '3', 331100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2349, 331123, '遂昌县', '3', 331100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2350, 331124, '松阳县', '3', 331100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2351, 331125, '云和县', '3', 331100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2352, 331126, '庆元县', '3', 331100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2353, 331127, '景宁畲族自治县', '3', 331100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2354, 331181, '龙泉市', '3', 331100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2355, 340101, '市辖区', '3', 340100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2356, 340102, '瑶海区', '3', 340100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2357, 340103, '庐阳区', '3', 340100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2358, 340104, '蜀山区', '3', 340100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2359, 340111, '包河区', '3', 340100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2360, 340121, '长丰县', '3', 340100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2361, 340122, '肥东县', '3', 340100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2362, 340123, '肥西县', '3', 340100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2363, 340201, '市辖区', '3', 340200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2364, 340202, '镜湖区', '3', 340200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2365, 340203, '马塘区', '3', 340200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2366, 340204, '新芜区', '3', 340200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2367, 340207, '鸠江区', '3', 340200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2368, 340221, '芜湖县', '3', 340200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2369, 340222, '繁昌县', '3', 340200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2370, 340223, '南陵县', '3', 340200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2371, 340301, '市辖区', '3', 340300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2372, 340302, '龙子湖区', '3', 340300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2373, 340303, '蚌山区', '3', 340300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2374, 340304, '禹会区', '3', 340300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2375, 340311, '淮上区', '3', 340300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2376, 340321, '怀远县', '3', 340300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2377, 340322, '五河县', '3', 340300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2378, 340323, '固镇县', '3', 340300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2379, 340401, '市辖区', '3', 340400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2380, 340402, '大通区', '3', 340400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2381, 340403, '田家庵区', '3', 340400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2382, 340404, '谢家集区', '3', 340400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2383, 340405, '八公山区', '3', 340400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2384, 340406, '潘集区', '3', 340400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2385, 340421, '凤台县', '3', 340400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2386, 340501, '市辖区', '3', 340500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2387, 340502, '金家庄区', '3', 340500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2388, 340503, '花山区', '3', 340500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2389, 340504, '雨山区', '3', 340500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2390, 340521, '当涂县', '3', 340500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2391, 340601, '市辖区', '3', 340600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2392, 340602, '杜集区', '3', 340600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2393, 340603, '相山区', '3', 340600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2394, 340604, '烈山区', '3', 340600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2395, 340621, '濉溪县', '3', 340600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2396, 340701, '市辖区', '3', 340700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2397, 340702, '铜官山区', '3', 340700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2398, 340703, '狮子山区', '3', 340700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2399, 340711, '郊　区', '3', 340700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2400, 340721, '铜陵县', '3', 340700, null, null);
commit;
prompt 2400 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2401, 340801, '市辖区', '3', 340800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2402, 340802, '迎江区', '3', 340800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2403, 340803, '大观区', '3', 340800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2404, 340811, '郊　区', '3', 340800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2405, 340822, '怀宁县', '3', 340800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2406, 340823, '枞阳县', '3', 340800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2407, 340824, '潜山县', '3', 340800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2408, 340825, '太湖县', '3', 340800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2409, 340826, '宿松县', '3', 340800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2410, 340827, '望江县', '3', 340800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2411, 340828, '岳西县', '3', 340800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2412, 340881, '桐城市', '3', 340800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2413, 341001, '市辖区', '3', 341000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2414, 341002, '屯溪区', '3', 341000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2415, 341003, '黄山区', '3', 341000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2416, 341004, '徽州区', '3', 341000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2417, 341021, '歙　县', '3', 341000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2418, 341022, '休宁县', '3', 341000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2419, 341023, '黟　县', '3', 341000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2420, 341024, '祁门县', '3', 341000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2421, 341101, '市辖区', '3', 341100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2422, 341102, '琅琊区', '3', 341100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2423, 341103, '南谯区', '3', 341100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2424, 341122, '来安县', '3', 341100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2425, 341124, '全椒县', '3', 341100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2426, 341125, '定远县', '3', 341100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2427, 341126, '凤阳县', '3', 341100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2428, 341181, '天长市', '3', 341100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2429, 341182, '明光市', '3', 341100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2430, 341201, '市辖区', '3', 341200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2431, 341202, '颍州区', '3', 341200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2432, 341203, '颍东区', '3', 341200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2433, 341204, '颍泉区', '3', 341200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2434, 341221, '临泉县', '3', 341200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2435, 341222, '太和县', '3', 341200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2436, 341225, '阜南县', '3', 341200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2437, 341226, '颍上县', '3', 341200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2438, 341282, '界首市', '3', 341200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2439, 341301, '市辖区', '3', 341300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2440, 341302, '墉桥区', '3', 341300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2441, 341321, '砀山县', '3', 341300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2442, 341322, '萧　县', '3', 341300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2443, 341323, '灵璧县', '3', 341300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2444, 341324, '泗　县', '3', 341300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2445, 341401, '市辖区', '3', 341400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2446, 341402, '居巢区', '3', 341400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2447, 341421, '庐江县', '3', 341400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2448, 341422, '无为县', '3', 341400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2449, 341423, '含山县', '3', 341400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2450, 341424, '和　县', '3', 341400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2451, 341501, '市辖区', '3', 341500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2452, 341502, '金安区', '3', 341500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2453, 341503, '裕安区', '3', 341500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2454, 341521, '寿　县', '3', 341500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2455, 341522, '霍邱县', '3', 341500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2456, 341523, '舒城县', '3', 341500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2457, 341524, '金寨县', '3', 341500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2458, 341525, '霍山县', '3', 341500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2459, 341601, '市辖区', '3', 341600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2460, 341602, '谯城区', '3', 341600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2461, 341621, '涡阳县', '3', 341600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2462, 341622, '蒙城县', '3', 341600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2463, 341623, '利辛县', '3', 341600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2464, 341701, '市辖区', '3', 341700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2465, 341702, '贵池区', '3', 341700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2466, 341721, '东至县', '3', 341700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2467, 341722, '石台县', '3', 341700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2468, 341723, '青阳县', '3', 341700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2469, 341801, '市辖区', '3', 341800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2470, 341802, '宣州区', '3', 341800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2471, 341821, '郎溪县', '3', 341800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2472, 341822, '广德县', '3', 341800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2473, 341823, '泾　县', '3', 341800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2474, 341824, '绩溪县', '3', 341800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2475, 341825, '旌德县', '3', 341800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2476, 341881, '宁国市', '3', 341800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2477, 350101, '市辖区', '3', 350100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2478, 350102, '鼓楼区', '3', 350100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2479, 350103, '台江区', '3', 350100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2480, 350104, '仓山区', '3', 350100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2481, 350105, '马尾区', '3', 350100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2482, 350111, '晋安区', '3', 350100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2483, 350121, '闽侯县', '3', 350100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2484, 350122, '连江县', '3', 350100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2485, 350123, '罗源县', '3', 350100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2486, 350124, '闽清县', '3', 350100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2487, 350125, '永泰县', '3', 350100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2488, 350128, '平潭县', '3', 350100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2489, 350181, '福清市', '3', 350100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2490, 350182, '长乐市', '3', 350100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2491, 350201, '市辖区', '3', 350200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2492, 350203, '思明区', '3', 350200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2493, 350205, '海沧区', '3', 350200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2494, 350206, '湖里区', '3', 350200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2495, 350211, '集美区', '3', 350200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2496, 350212, '同安区', '3', 350200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2497, 350213, '翔安区', '3', 350200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2498, 350301, '市辖区', '3', 350300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2499, 350302, '城厢区', '3', 350300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2500, 350303, '涵江区', '3', 350300, null, null);
commit;
prompt 2500 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2501, 350304, '荔城区', '3', 350300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2502, 350305, '秀屿区', '3', 350300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2503, 350322, '仙游县', '3', 350300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2504, 350401, '市辖区', '3', 350400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2505, 350402, '梅列区', '3', 350400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2506, 350403, '三元区', '3', 350400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2507, 350421, '明溪县', '3', 350400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2508, 350423, '清流县', '3', 350400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2509, 350424, '宁化县', '3', 350400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2510, 350425, '大田县', '3', 350400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2511, 350426, '尤溪县', '3', 350400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2512, 350427, '沙　县', '3', 350400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2513, 350428, '将乐县', '3', 350400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2514, 350429, '泰宁县', '3', 350400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2515, 350430, '建宁县', '3', 350400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2516, 350481, '永安市', '3', 350400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2517, 350501, '市辖区', '3', 350500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2518, 350502, '鲤城区', '3', 350500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2519, 350503, '丰泽区', '3', 350500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2520, 350504, '洛江区', '3', 350500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2521, 350505, '泉港区', '3', 350500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2522, 350521, '惠安县', '3', 350500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2523, 350524, '安溪县', '3', 350500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2524, 350525, '永春县', '3', 350500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2525, 350526, '德化县', '3', 350500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2526, 350527, '金门县', '3', 350500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2527, 350581, '石狮市', '3', 350500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2528, 350582, '晋江市', '3', 350500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2529, 350583, '南安市', '3', 350500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2530, 350601, '市辖区', '3', 350600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2531, 350602, '芗城区', '3', 350600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2532, 350603, '龙文区', '3', 350600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2533, 350622, '云霄县', '3', 350600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2534, 350623, '漳浦县', '3', 350600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2535, 350624, '诏安县', '3', 350600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2536, 350625, '长泰县', '3', 350600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2537, 350626, '东山县', '3', 350600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2538, 350627, '南靖县', '3', 350600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2539, 350628, '平和县', '3', 350600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2540, 350629, '华安县', '3', 350600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2541, 350681, '龙海市', '3', 350600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2542, 350701, '市辖区', '3', 350700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2543, 350702, '延平区', '3', 350700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2544, 350721, '顺昌县', '3', 350700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2545, 350722, '浦城县', '3', 350700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2546, 350723, '光泽县', '3', 350700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2547, 350724, '松溪县', '3', 350700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2548, 350725, '政和县', '3', 350700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2549, 350781, '邵武市', '3', 350700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2550, 350782, '武夷山市', '3', 350700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2551, 350783, '建瓯市', '3', 350700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2552, 350784, '建阳市', '3', 350700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2553, 350801, '市辖区', '3', 350800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2554, 350802, '新罗区', '3', 350800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2555, 350821, '长汀县', '3', 350800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2556, 350822, '永定县', '3', 350800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2557, 350823, '上杭县', '3', 350800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2558, 350824, '武平县', '3', 350800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2559, 350825, '连城县', '3', 350800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2560, 350881, '漳平市', '3', 350800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2561, 350901, '市辖区', '3', 350900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2562, 350902, '蕉城区', '3', 350900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2563, 350921, '霞浦县', '3', 350900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2564, 350922, '古田县', '3', 350900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2565, 350923, '屏南县', '3', 350900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2566, 350924, '寿宁县', '3', 350900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2567, 350925, '周宁县', '3', 350900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2568, 350926, '柘荣县', '3', 350900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2569, 350981, '福安市', '3', 350900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2570, 350982, '福鼎市', '3', 350900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2571, 360101, '市辖区', '3', 360100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2572, 360102, '东湖区', '3', 360100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2573, 360103, '西湖区', '3', 360100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2574, 360104, '青云谱区', '3', 360100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2575, 360105, '湾里区', '3', 360100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2576, 360111, '青山湖区', '3', 360100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2577, 360121, '南昌县', '3', 360100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2578, 360122, '新建县', '3', 360100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2579, 360123, '安义县', '3', 360100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2580, 360124, '进贤县', '3', 360100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2581, 360201, '市辖区', '3', 360200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2582, 360202, '昌江区', '3', 360200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2583, 360203, '珠山区', '3', 360200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2584, 360222, '浮梁县', '3', 360200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2585, 360281, '乐平市', '3', 360200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2586, 360301, '市辖区', '3', 360300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2587, 360302, '安源区', '3', 360300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2588, 360313, '湘东区', '3', 360300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2589, 360321, '莲花县', '3', 360300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2590, 360322, '上栗县', '3', 360300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2591, 360323, '芦溪县', '3', 360300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2592, 360401, '市辖区', '3', 360400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2593, 360402, '庐山区', '3', 360400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2594, 360403, '浔阳区', '3', 360400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2595, 360421, '九江县', '3', 360400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2596, 360423, '武宁县', '3', 360400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2597, 360424, '修水县', '3', 360400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2598, 360425, '永修县', '3', 360400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2599, 360426, '德安县', '3', 360400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2600, 360427, '星子县', '3', 360400, null, null);
commit;
prompt 2600 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2601, 360428, '都昌县', '3', 360400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2602, 360429, '湖口县', '3', 360400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2603, 360430, '彭泽县', '3', 360400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2604, 360481, '瑞昌市', '3', 360400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2605, 360501, '市辖区', '3', 360500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2606, 360502, '渝水区', '3', 360500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2607, 360521, '分宜县', '3', 360500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2608, 360601, '市辖区', '3', 360600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2609, 360602, '月湖区', '3', 360600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2610, 360622, '余江县', '3', 360600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2611, 360681, '贵溪市', '3', 360600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2612, 360701, '市辖区', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2613, 360702, '章贡区', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2614, 360721, '赣　县', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2615, 360722, '信丰县', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2616, 360723, '大余县', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2617, 360724, '上犹县', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2618, 360725, '崇义县', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2619, 360726, '安远县', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2620, 360727, '龙南县', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2621, 360728, '定南县', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2622, 360729, '全南县', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2623, 360730, '宁都县', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2624, 360731, '于都县', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2625, 360732, '兴国县', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2626, 360733, '会昌县', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2627, 360734, '寻乌县', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2628, 360735, '石城县', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2629, 360781, '瑞金市', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2630, 360782, '南康市', '3', 360700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2631, 360801, '市辖区', '3', 360800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2632, 360802, '吉州区', '3', 360800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2633, 360803, '青原区', '3', 360800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2634, 360821, '吉安县', '3', 360800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2635, 360822, '吉水县', '3', 360800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2636, 360823, '峡江县', '3', 360800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2637, 360824, '新干县', '3', 360800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2638, 360825, '永丰县', '3', 360800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2639, 360826, '泰和县', '3', 360800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2640, 360827, '遂川县', '3', 360800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2641, 360828, '万安县', '3', 360800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2642, 360829, '安福县', '3', 360800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2643, 360830, '永新县', '3', 360800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2644, 360881, '井冈山市', '3', 360800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2645, 360901, '市辖区', '3', 360900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2646, 360902, '袁州区', '3', 360900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2647, 360921, '奉新县', '3', 360900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2648, 360922, '万载县', '3', 360900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2649, 360923, '上高县', '3', 360900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2650, 360924, '宜丰县', '3', 360900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2651, 360925, '靖安县', '3', 360900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2652, 360926, '铜鼓县', '3', 360900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2653, 360981, '丰城市', '3', 360900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2654, 360982, '樟树市', '3', 360900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2655, 360983, '高安市', '3', 360900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2656, 361001, '市辖区', '3', 361000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2657, 361002, '临川区', '3', 361000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2658, 361021, '南城县', '3', 361000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2659, 361022, '黎川县', '3', 361000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2660, 361023, '南丰县', '3', 361000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2661, 361024, '崇仁县', '3', 361000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2662, 361025, '乐安县', '3', 361000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2663, 361026, '宜黄县', '3', 361000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2664, 361027, '金溪县', '3', 361000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2665, 361028, '资溪县', '3', 361000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2666, 361029, '东乡县', '3', 361000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2667, 361030, '广昌县', '3', 361000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2668, 361101, '市辖区', '3', 361100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2669, 361102, '信州区', '3', 361100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2670, 361121, '上饶县', '3', 361100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2671, 361122, '广丰县', '3', 361100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2672, 361123, '玉山县', '3', 361100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2673, 361124, '铅山县', '3', 361100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2674, 361125, '横峰县', '3', 361100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2675, 361126, '弋阳县', '3', 361100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2676, 361127, '余干县', '3', 361100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2677, 361128, '鄱阳县', '3', 361100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2678, 361129, '万年县', '3', 361100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2679, 361130, '婺源县', '3', 361100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2680, 361181, '德兴市', '3', 361100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2681, 370101, '市辖区', '3', 370100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2682, 370102, '历下区', '3', 370100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2683, 370103, '市中区', '3', 370100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2684, 370104, '槐荫区', '3', 370100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2685, 370105, '天桥区', '3', 370100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2686, 370112, '历城区', '3', 370100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2687, 370113, '长清区', '3', 370100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2688, 370124, '平阴县', '3', 370100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2689, 370125, '济阳县', '3', 370100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2690, 370126, '商河县', '3', 370100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2691, 370181, '章丘市', '3', 370100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2692, 370201, '市辖区', '3', 370200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2693, 370202, '市南区', '3', 370200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2694, 370203, '市北区', '3', 370200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2695, 370205, '四方区', '3', 370200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2696, 370211, '黄岛区', '3', 370200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2697, 370212, '崂山区', '3', 370200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2698, 370213, '李沧区', '3', 370200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2699, 370214, '城阳区', '3', 370200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2700, 370281, '胶州市', '3', 370200, null, null);
commit;
prompt 2700 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2701, 370282, '即墨市', '3', 370200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2702, 370283, '平度市', '3', 370200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2703, 370284, '胶南市', '3', 370200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2704, 370285, '莱西市', '3', 370200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2705, 370301, '市辖区', '3', 370300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2706, 370302, '淄川区', '3', 370300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2707, 370303, '张店区', '3', 370300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2708, 370304, '博山区', '3', 370300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2709, 370305, '临淄区', '3', 370300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2710, 370306, '周村区', '3', 370300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2711, 370321, '桓台县', '3', 370300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2712, 370322, '高青县', '3', 370300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2713, 370323, '沂源县', '3', 370300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2714, 370401, '市辖区', '3', 370400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2715, 370402, '市中区', '3', 370400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2716, 370403, '薛城区', '3', 370400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2717, 370404, '峄城区', '3', 370400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2718, 370405, '台儿庄区', '3', 370400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2719, 370406, '山亭区', '3', 370400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2720, 370481, '滕州市', '3', 370400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2721, 370501, '市辖区', '3', 370500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2722, 370502, '东营区', '3', 370500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2723, 370503, '河口区', '3', 370500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2724, 370521, '垦利县', '3', 370500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2725, 370522, '利津县', '3', 370500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2726, 370523, '广饶县', '3', 370500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2727, 370601, '市辖区', '3', 370600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2728, 370602, '芝罘区', '3', 370600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2729, 370611, '福山区', '3', 370600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2730, 370612, '牟平区', '3', 370600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2731, 370613, '莱山区', '3', 370600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2732, 370634, '长岛县', '3', 370600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2733, 370681, '龙口市', '3', 370600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2734, 370682, '莱阳市', '3', 370600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2735, 370683, '莱州市', '3', 370600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2736, 370684, '蓬莱市', '3', 370600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2737, 370685, '招远市', '3', 370600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2738, 370686, '栖霞市', '3', 370600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2739, 370687, '海阳市', '3', 370600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2740, 370701, '市辖区', '3', 370700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2741, 370702, '潍城区', '3', 370700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2742, 370703, '寒亭区', '3', 370700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2743, 370704, '坊子区', '3', 370700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2744, 370705, '奎文区', '3', 370700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2745, 370724, '临朐县', '3', 370700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2746, 370725, '昌乐县', '3', 370700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2747, 370781, '青州市', '3', 370700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2748, 370782, '诸城市', '3', 370700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2749, 370783, '寿光市', '3', 370700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2750, 370784, '安丘市', '3', 370700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2751, 370785, '高密市', '3', 370700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2752, 370786, '昌邑市', '3', 370700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2753, 370801, '市辖区', '3', 370800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2754, 370802, '市中区', '3', 370800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2755, 370811, '任城区', '3', 370800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2756, 370826, '微山县', '3', 370800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2757, 370827, '鱼台县', '3', 370800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2758, 370828, '金乡县', '3', 370800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2759, 370829, '嘉祥县', '3', 370800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2760, 370830, '汶上县', '3', 370800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2761, 370831, '泗水县', '3', 370800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2762, 370832, '梁山县', '3', 370800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2763, 370881, '曲阜市', '3', 370800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2764, 370882, '兖州市', '3', 370800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2765, 370883, '邹城市', '3', 370800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2766, 370901, '市辖区', '3', 370900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2767, 370902, '泰山区', '3', 370900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2768, 370903, '岱岳区', '3', 370900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2769, 370921, '宁阳县', '3', 370900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2770, 370923, '东平县', '3', 370900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2771, 370982, '新泰市', '3', 370900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2772, 370983, '肥城市', '3', 370900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2773, 371001, '市辖区', '3', 371000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2774, 371002, '环翠区', '3', 371000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2775, 371081, '文登市', '3', 371000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2776, 371082, '荣成市', '3', 371000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2777, 371083, '乳山市', '3', 371000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2778, 371101, '市辖区', '3', 371100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2779, 371102, '东港区', '3', 371100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2780, 371103, '岚山区', '3', 371100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2781, 371121, '五莲县', '3', 371100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2782, 371122, '莒　县', '3', 371100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2783, 371201, '市辖区', '3', 371200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2784, 371202, '莱城区', '3', 371200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2785, 371203, '钢城区', '3', 371200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2786, 371301, '市辖区', '3', 371300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2787, 371302, '兰山区', '3', 371300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2788, 371311, '罗庄区', '3', 371300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2789, 371312, '河东区', '3', 371300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2790, 371321, '沂南县', '3', 371300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2791, 371322, '郯城县', '3', 371300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2792, 371323, '沂水县', '3', 371300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2793, 371324, '苍山县', '3', 371300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2794, 371325, '费　县', '3', 371300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2795, 371326, '平邑县', '3', 371300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2796, 371327, '莒南县', '3', 371300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2797, 371328, '蒙阴县', '3', 371300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2798, 371329, '临沭县', '3', 371300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2799, 371401, '市辖区', '3', 371400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2800, 371402, '德城区', '3', 371400, null, null);
commit;
prompt 2800 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2801, 371421, '陵　县', '3', 371400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2802, 371422, '宁津县', '3', 371400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2803, 371423, '庆云县', '3', 371400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2804, 371424, '临邑县', '3', 371400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2805, 371425, '齐河县', '3', 371400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2806, 371426, '平原县', '3', 371400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2807, 371427, '夏津县', '3', 371400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2808, 371428, '武城县', '3', 371400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2809, 371481, '乐陵市', '3', 371400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2810, 371482, '禹城市', '3', 371400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2811, 371501, '市辖区', '3', 371500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2812, 371502, '东昌府区', '3', 371500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2813, 371521, '阳谷县', '3', 371500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2814, 371522, '莘　县', '3', 371500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2815, 371523, '茌平县', '3', 371500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2816, 371524, '东阿县', '3', 371500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2817, 371525, '冠　县', '3', 371500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2818, 371526, '高唐县', '3', 371500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2819, 371581, '临清市', '3', 371500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2820, 371601, '市辖区', '3', 371600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2821, 371602, '滨城区', '3', 371600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2822, 371621, '惠民县', '3', 371600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2823, 371622, '阳信县', '3', 371600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2824, 371623, '无棣县', '3', 371600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2825, 371624, '沾化县', '3', 371600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2826, 371625, '博兴县', '3', 371600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2827, 371626, '邹平县', '3', 371600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2828, 371701, '市辖区', '3', 371700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2829, 371702, '牡丹区', '3', 371700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2830, 371721, '曹　县', '3', 371700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2831, 371722, '单　县', '3', 371700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2832, 371723, '成武县', '3', 371700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2833, 371724, '巨野县', '3', 371700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2834, 371725, '郓城县', '3', 371700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2835, 371726, '鄄城县', '3', 371700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2836, 371727, '定陶县', '3', 371700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2837, 371728, '东明县', '3', 371700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2838, 410101, '市辖区', '3', 410100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2839, 410102, '中原区', '3', 410100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2840, 410103, '二七区', '3', 410100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2841, 410104, '管城回族区', '3', 410100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2842, 410105, '金水区', '3', 410100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2843, 410106, '上街区', '3', 410100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2844, 410108, '邙山区', '3', 410100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2845, 410122, '中牟县', '3', 410100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2846, 410181, '巩义市', '3', 410100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2847, 410182, '荥阳市', '3', 410100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2848, 410183, '新密市', '3', 410100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2849, 410184, '新郑市', '3', 410100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2850, 410185, '登封市', '3', 410100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2851, 410201, '市辖区', '3', 410200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2852, 410202, '龙亭区', '3', 410200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2853, 410203, '顺河回族区', '3', 410200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2854, 410204, '鼓楼区', '3', 410200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2855, 410205, '南关区', '3', 410200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2856, 410211, '郊　区', '3', 410200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2857, 410221, '杞　县', '3', 410200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2858, 410222, '通许县', '3', 410200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2859, 410223, '尉氏县', '3', 410200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2860, 410224, '开封县', '3', 410200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2861, 410225, '兰考县', '3', 410200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2862, 410301, '市辖区', '3', 410300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2863, 410302, '老城区', '3', 410300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2864, 410303, '西工区', '3', 410300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2865, 410304, '廛河回族区', '3', 410300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2866, 410305, '涧西区', '3', 410300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2867, 410306, '吉利区', '3', 410300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2868, 410307, '洛龙区', '3', 410300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2869, 410322, '孟津县', '3', 410300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2870, 410323, '新安县', '3', 410300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2871, 410324, '栾川县', '3', 410300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2872, 410325, '嵩　县', '3', 410300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2873, 410326, '汝阳县', '3', 410300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2874, 410327, '宜阳县', '3', 410300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2875, 410328, '洛宁县', '3', 410300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2876, 410329, '伊川县', '3', 410300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2877, 410381, '偃师市', '3', 410300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2878, 410401, '市辖区', '3', 410400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2879, 410402, '新华区', '3', 410400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2880, 410403, '卫东区', '3', 410400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2881, 410404, '石龙区', '3', 410400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2882, 410411, '湛河区', '3', 410400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2883, 410421, '宝丰县', '3', 410400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2884, 410422, '叶　县', '3', 410400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2885, 410423, '鲁山县', '3', 410400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2886, 410425, '郏　县', '3', 410400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2887, 410481, '舞钢市', '3', 410400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2888, 410482, '汝州市', '3', 410400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2889, 410501, '市辖区', '3', 410500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2890, 410502, '文峰区', '3', 410500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2891, 410503, '北关区', '3', 410500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2892, 410505, '殷都区', '3', 410500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2893, 410506, '龙安区', '3', 410500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2894, 410522, '安阳县', '3', 410500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2895, 410523, '汤阴县', '3', 410500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2896, 410526, '滑　县', '3', 410500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2897, 410527, '内黄县', '3', 410500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2898, 410581, '林州市', '3', 410500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2899, 410601, '市辖区', '3', 410600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2900, 410602, '鹤山区', '3', 410600, null, null);
commit;
prompt 2900 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2901, 410603, '山城区', '3', 410600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2902, 410611, '淇滨区', '3', 410600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2903, 410621, '浚　县', '3', 410600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2904, 410622, '淇　县', '3', 410600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2905, 410701, '市辖区', '3', 410700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2906, 410702, '红旗区', '3', 410700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2907, 410703, '卫滨区', '3', 410700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2908, 410704, '凤泉区', '3', 410700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2909, 410711, '牧野区', '3', 410700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2910, 410721, '新乡县', '3', 410700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2911, 410724, '获嘉县', '3', 410700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2912, 410725, '原阳县', '3', 410700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2913, 410726, '延津县', '3', 410700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2914, 410727, '封丘县', '3', 410700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2915, 410728, '长垣县', '3', 410700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2916, 410781, '卫辉市', '3', 410700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2917, 410782, '辉县市', '3', 410700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2918, 410801, '市辖区', '3', 410800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2919, 410802, '解放区', '3', 410800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2920, 410803, '中站区', '3', 410800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2921, 410804, '马村区', '3', 410800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2922, 410811, '山阳区', '3', 410800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2923, 410821, '修武县', '3', 410800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2924, 410822, '博爱县', '3', 410800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2925, 410823, '武陟县', '3', 410800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2926, 410825, '温　县', '3', 410800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2927, 410881, '济源市', '3', 410800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2928, 410882, '沁阳市', '3', 410800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2929, 410883, '孟州市', '3', 410800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2930, 410901, '市辖区', '3', 410900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2931, 410902, '华龙区', '3', 410900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2932, 410922, '清丰县', '3', 410900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2933, 410923, '南乐县', '3', 410900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2934, 410926, '范　县', '3', 410900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2935, 410927, '台前县', '3', 410900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2936, 410928, '濮阳县', '3', 410900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2937, 411001, '市辖区', '3', 411000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2938, 411002, '魏都区', '3', 411000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2939, 411023, '许昌县', '3', 411000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2940, 411024, '鄢陵县', '3', 411000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2941, 411025, '襄城县', '3', 411000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2942, 411081, '禹州市', '3', 411000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2943, 411082, '长葛市', '3', 411000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2944, 411101, '市辖区', '3', 411100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2945, 411102, '源汇区', '3', 411100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2946, 411103, '郾城区', '3', 411100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2947, 411104, '召陵区', '3', 411100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2948, 411121, '舞阳县', '3', 411100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2949, 411122, '临颍县', '3', 411100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2950, 411201, '市辖区', '3', 411200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2951, 411202, '湖滨区', '3', 411200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2952, 411221, '渑池县', '3', 411200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2953, 411222, '陕　县', '3', 411200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2954, 411224, '卢氏县', '3', 411200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2955, 411281, '义马市', '3', 411200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2956, 411282, '灵宝市', '3', 411200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2957, 411301, '市辖区', '3', 411300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2958, 411302, '宛城区', '3', 411300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2959, 411303, '卧龙区', '3', 411300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2960, 411321, '南召县', '3', 411300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2961, 411322, '方城县', '3', 411300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2962, 411323, '西峡县', '3', 411300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2963, 411324, '镇平县', '3', 411300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2964, 411325, '内乡县', '3', 411300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2965, 411326, '淅川县', '3', 411300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2966, 411327, '社旗县', '3', 411300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2967, 411328, '唐河县', '3', 411300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2968, 411329, '新野县', '3', 411300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2969, 411330, '桐柏县', '3', 411300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2970, 411381, '邓州市', '3', 411300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2971, 411401, '市辖区', '3', 411400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2972, 411402, '梁园区', '3', 411400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2973, 411403, '睢阳区', '3', 411400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2974, 411421, '民权县', '3', 411400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2975, 411422, '睢　县', '3', 411400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2976, 411423, '宁陵县', '3', 411400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2977, 411424, '柘城县', '3', 411400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2978, 411425, '虞城县', '3', 411400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2979, 411426, '夏邑县', '3', 411400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2980, 411481, '永城市', '3', 411400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2981, 411501, '市辖区', '3', 411500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2982, 411502, '师河区', '3', 411500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2983, 411503, '平桥区', '3', 411500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2984, 411521, '罗山县', '3', 411500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2985, 411522, '光山县', '3', 411500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2986, 411523, '新　县', '3', 411500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2987, 411524, '商城县', '3', 411500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2988, 411525, '固始县', '3', 411500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2989, 411526, '潢川县', '3', 411500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2990, 411527, '淮滨县', '3', 411500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2991, 411528, '息　县', '3', 411500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2992, 411601, '市辖区', '3', 411600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2993, 411602, '川汇区', '3', 411600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2994, 411621, '扶沟县', '3', 411600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2995, 411622, '西华县', '3', 411600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2996, 411623, '商水县', '3', 411600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2997, 411624, '沈丘县', '3', 411600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2998, 411625, '郸城县', '3', 411600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (2999, 411626, '淮阳县', '3', 411600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3000, 411627, '太康县', '3', 411600, null, null);
commit;
prompt 3000 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3001, 411628, '鹿邑县', '3', 411600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3002, 411681, '项城市', '3', 411600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3003, 411701, '市辖区', '3', 411700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3004, 411702, '驿城区', '3', 411700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3005, 411721, '西平县', '3', 411700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3006, 411722, '上蔡县', '3', 411700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3007, 411723, '平舆县', '3', 411700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3008, 411724, '正阳县', '3', 411700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3009, 411725, '确山县', '3', 411700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3010, 411726, '泌阳县', '3', 411700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3011, 411727, '汝南县', '3', 411700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3012, 411728, '遂平县', '3', 411700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3013, 411729, '新蔡县', '3', 411700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3014, 420101, '市辖区', '3', 420100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3015, 420102, '江岸区', '3', 420100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3016, 420103, '江汉区', '3', 420100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3017, 420104, '乔口区', '3', 420100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3018, 420105, '汉阳区', '3', 420100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3019, 420106, '武昌区', '3', 420100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3020, 420107, '青山区', '3', 420100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3021, 420111, '洪山区', '3', 420100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3022, 420112, '东西湖区', '3', 420100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3023, 420113, '汉南区', '3', 420100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3024, 420114, '蔡甸区', '3', 420100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3025, 420115, '江夏区', '3', 420100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3026, 420116, '黄陂区', '3', 420100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3027, 420117, '新洲区', '3', 420100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3028, 420201, '市辖区', '3', 420200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3029, 420202, '黄石港区', '3', 420200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3030, 420203, '西塞山区', '3', 420200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3031, 420204, '下陆区', '3', 420200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3032, 420205, '铁山区', '3', 420200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3033, 420222, '阳新县', '3', 420200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3034, 420281, '大冶市', '3', 420200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3035, 420301, '市辖区', '3', 420300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3036, 420302, '茅箭区', '3', 420300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3037, 420303, '张湾区', '3', 420300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3038, 420321, '郧　县', '3', 420300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3039, 420322, '郧西县', '3', 420300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3040, 420323, '竹山县', '3', 420300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3041, 420324, '竹溪县', '3', 420300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3042, 420325, '房　县', '3', 420300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3043, 420381, '丹江口市', '3', 420300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3044, 420501, '市辖区', '3', 420500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3045, 420502, '西陵区', '3', 420500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3046, 420503, '伍家岗区', '3', 420500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3047, 420504, '点军区', '3', 420500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3048, 420505, '猇亭区', '3', 420500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3049, 420506, '夷陵区', '3', 420500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3050, 420525, '远安县', '3', 420500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3051, 420526, '兴山县', '3', 420500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3052, 420527, '秭归县', '3', 420500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3053, 420528, '长阳土家族自治县', '3', 420500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3054, 420529, '五峰土家族自治县', '3', 420500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3055, 420581, '宜都市', '3', 420500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3056, 420582, '当阳市', '3', 420500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3057, 420583, '枝江市', '3', 420500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3058, 420601, '市辖区', '3', 420600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3059, 420602, '襄城区', '3', 420600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3060, 420606, '樊城区', '3', 420600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3061, 420607, '襄阳区', '3', 420600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3062, 420624, '南漳县', '3', 420600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3063, 420625, '谷城县', '3', 420600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3064, 420626, '保康县', '3', 420600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3065, 420682, '老河口市', '3', 420600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3066, 420683, '枣阳市', '3', 420600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3067, 420684, '宜城市', '3', 420600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3068, 420701, '市辖区', '3', 420700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3069, 420702, '梁子湖区', '3', 420700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3070, 420703, '华容区', '3', 420700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3071, 420704, '鄂城区', '3', 420700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3072, 420801, '市辖区', '3', 420800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3073, 420802, '东宝区', '3', 420800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3074, 420804, '掇刀区', '3', 420800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3075, 420821, '京山县', '3', 420800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3076, 420822, '沙洋县', '3', 420800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3077, 420881, '钟祥市', '3', 420800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3078, 420901, '市辖区', '3', 420900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3079, 420902, '孝南区', '3', 420900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3080, 420921, '孝昌县', '3', 420900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3081, 420922, '大悟县', '3', 420900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3082, 420923, '云梦县', '3', 420900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3083, 420981, '应城市', '3', 420900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3084, 420982, '安陆市', '3', 420900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3085, 420984, '汉川市', '3', 420900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3086, 421001, '市辖区', '3', 421000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3087, 421002, '沙市区', '3', 421000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3088, 421003, '荆州区', '3', 421000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3089, 421022, '公安县', '3', 421000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3090, 421023, '监利县', '3', 421000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3091, 421024, '江陵县', '3', 421000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3092, 421081, '石首市', '3', 421000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3093, 421083, '洪湖市', '3', 421000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3094, 421087, '松滋市', '3', 421000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3095, 421101, '市辖区', '3', 421100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3096, 421102, '黄州区', '3', 421100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3097, 421121, '团风县', '3', 421100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3098, 421122, '红安县', '3', 421100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3099, 421123, '罗田县', '3', 421100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3100, 421124, '英山县', '3', 421100, null, null);
commit;
prompt 3100 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3101, 421125, '浠水县', '3', 421100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3102, 421126, '蕲春县', '3', 421100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3103, 421127, '黄梅县', '3', 421100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3104, 421181, '麻城市', '3', 421100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3105, 421182, '武穴市', '3', 421100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3106, 421201, '市辖区', '3', 421200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3107, 421202, '咸安区', '3', 421200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3108, 421221, '嘉鱼县', '3', 421200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3109, 421222, '通城县', '3', 421200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3110, 421223, '崇阳县', '3', 421200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3111, 421224, '通山县', '3', 421200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3112, 421281, '赤壁市', '3', 421200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3113, 421301, '市辖区', '3', 421300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3114, 421302, '曾都区', '3', 421300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3115, 421381, '广水市', '3', 421300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3116, 422801, '恩施市', '3', 422800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3117, 422802, '利川市', '3', 422800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3118, 422822, '建始县', '3', 422800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3119, 422823, '巴东县', '3', 422800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3120, 422825, '宣恩县', '3', 422800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3121, 422826, '咸丰县', '3', 422800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3122, 422827, '来凤县', '3', 422800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3123, 422828, '鹤峰县', '3', 422800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3124, 429004, '仙桃市', '3', 429000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3125, 429005, '潜江市', '3', 429000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3126, 429006, '天门市', '3', 429000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3127, 429021, '神农架林区', '3', 429000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3128, 430101, '市辖区', '3', 430100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3129, 430102, '芙蓉区', '3', 430100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3130, 430103, '天心区', '3', 430100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3131, 430104, '岳麓区', '3', 430100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3132, 430105, '开福区', '3', 430100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3133, 430111, '雨花区', '3', 430100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3134, 430121, '长沙县', '3', 430100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3135, 430122, '望城县', '3', 430100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3136, 430124, '宁乡县', '3', 430100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3137, 430181, '浏阳市', '3', 430100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3138, 430201, '市辖区', '3', 430200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3139, 430202, '荷塘区', '3', 430200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3140, 430203, '芦淞区', '3', 430200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3141, 430204, '石峰区', '3', 430200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3142, 430211, '天元区', '3', 430200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3143, 430221, '株洲县', '3', 430200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3144, 430223, '攸　县', '3', 430200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3145, 430224, '茶陵县', '3', 430200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3146, 430225, '炎陵县', '3', 430200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3147, 430281, '醴陵市', '3', 430200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3148, 430301, '市辖区', '3', 430300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3149, 430302, '雨湖区', '3', 430300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3150, 430304, '岳塘区', '3', 430300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3151, 430321, '湘潭县', '3', 430300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3152, 430381, '湘乡市', '3', 430300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3153, 430382, '韶山市', '3', 430300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3154, 430401, '市辖区', '3', 430400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3155, 430405, '珠晖区', '3', 430400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3156, 430406, '雁峰区', '3', 430400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3157, 430407, '石鼓区', '3', 430400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3158, 430408, '蒸湘区', '3', 430400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3159, 430412, '南岳区', '3', 430400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3160, 430421, '衡阳县', '3', 430400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3161, 430422, '衡南县', '3', 430400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3162, 430423, '衡山县', '3', 430400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3163, 430424, '衡东县', '3', 430400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3164, 430426, '祁东县', '3', 430400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3165, 430481, '耒阳市', '3', 430400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3166, 430482, '常宁市', '3', 430400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3167, 430501, '市辖区', '3', 430500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3168, 430502, '双清区', '3', 430500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3169, 430503, '大祥区', '3', 430500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3170, 430511, '北塔区', '3', 430500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3171, 430521, '邵东县', '3', 430500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3172, 430522, '新邵县', '3', 430500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3173, 430523, '邵阳县', '3', 430500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3174, 430524, '隆回县', '3', 430500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3175, 430525, '洞口县', '3', 430500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3176, 430527, '绥宁县', '3', 430500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3177, 430528, '新宁县', '3', 430500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3178, 430529, '城步苗族自治县', '3', 430500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3179, 430581, '武冈市', '3', 430500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3180, 430601, '市辖区', '3', 430600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3181, 430602, '岳阳楼区', '3', 430600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3182, 610430, '淳化县', '3', 610400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3183, 610431, '武功县', '3', 610400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3184, 610481, '兴平市', '3', 610400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3185, 610501, '市辖区', '3', 610500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3186, 610502, '临渭区', '3', 610500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3187, 610521, '华　县', '3', 610500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3188, 610522, '潼关县', '3', 610500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3189, 610523, '大荔县', '3', 610500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3190, 610524, '合阳县', '3', 610500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3191, 610525, '澄城县', '3', 610500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3192, 610526, '蒲城县', '3', 610500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3193, 610527, '白水县', '3', 610500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3194, 610528, '富平县', '3', 610500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3195, 610581, '韩城市', '3', 610500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3196, 610582, '华阴市', '3', 610500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3197, 610601, '市辖区', '3', 610600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3198, 610602, '宝塔区', '3', 610600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3199, 610621, '延长县', '3', 610600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3200, 610622, '延川县', '3', 610600, null, null);
commit;
prompt 3200 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3201, 610623, '子长县', '3', 610600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3202, 610624, '安塞县', '3', 610600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3203, 610625, '志丹县', '3', 610600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3204, 610626, '吴旗县', '3', 610600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3205, 610627, '甘泉县', '3', 610600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3206, 610628, '富　县', '3', 610600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3207, 610629, '洛川县', '3', 610600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3208, 610630, '宜川县', '3', 610600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3209, 610631, '黄龙县', '3', 610600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3210, 610632, '黄陵县', '3', 610600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3211, 610701, '市辖区', '3', 610700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3212, 610702, '汉台区', '3', 610700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3213, 610721, '南郑县', '3', 610700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3214, 610722, '城固县', '3', 610700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3215, 610723, '洋　县', '3', 610700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3216, 610724, '西乡县', '3', 610700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3217, 610725, '勉　县', '3', 610700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3218, 610726, '宁强县', '3', 610700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3219, 610727, '略阳县', '3', 610700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3220, 610728, '镇巴县', '3', 610700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3221, 610729, '留坝县', '3', 610700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3222, 610730, '佛坪县', '3', 610700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3223, 610801, '市辖区', '3', 610800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3224, 610802, '榆阳区', '3', 610800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3225, 610821, '神木县', '3', 610800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3226, 610822, '府谷县', '3', 610800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3227, 610823, '横山县', '3', 610800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3228, 610824, '靖边县', '3', 610800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3229, 610825, '定边县', '3', 610800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3230, 610826, '绥德县', '3', 610800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3231, 610827, '米脂县', '3', 610800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3232, 610828, '佳　县', '3', 610800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3233, 610829, '吴堡县', '3', 610800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3234, 610830, '清涧县', '3', 610800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3235, 610831, '子洲县', '3', 610800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3236, 610901, '市辖区', '3', 610900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3237, 610902, '汉滨区', '3', 610900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3238, 610921, '汉阴县', '3', 610900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3239, 610922, '石泉县', '3', 610900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3240, 610923, '宁陕县', '3', 610900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3241, 610924, '紫阳县', '3', 610900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3242, 610925, '岚皋县', '3', 610900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3243, 610926, '平利县', '3', 610900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3244, 610927, '镇坪县', '3', 610900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3245, 610928, '旬阳县', '3', 610900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3246, 610929, '白河县', '3', 610900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3247, 611001, '市辖区', '3', 611000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3248, 611002, '商州区', '3', 611000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3249, 611021, '洛南县', '3', 611000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3250, 611022, '丹凤县', '3', 611000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3251, 611023, '商南县', '3', 611000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3252, 611024, '山阳县', '3', 611000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3253, 611025, '镇安县', '3', 611000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3254, 611026, '柞水县', '3', 611000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3255, 620101, '市辖区', '3', 620100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3256, 620102, '城关区', '3', 620100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3257, 620103, '七里河区', '3', 620100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3258, 620104, '西固区', '3', 620100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3259, 620105, '安宁区', '3', 620100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3260, 620111, '红古区', '3', 620100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3261, 620121, '永登县', '3', 620100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3262, 620122, '皋兰县', '3', 620100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3263, 620123, '榆中县', '3', 620100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3264, 620201, '市辖区', '3', 620200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3265, 620301, '市辖区', '3', 620300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3266, 620302, '金川区', '3', 620300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3267, 620321, '永昌县', '3', 620300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3268, 620401, '市辖区', '3', 620400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3269, 620402, '白银区', '3', 620400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3270, 620403, '平川区', '3', 620400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3271, 620421, '靖远县', '3', 620400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3272, 620422, '会宁县', '3', 620400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3273, 620423, '景泰县', '3', 620400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3274, 620501, '市辖区', '3', 620500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3275, 620502, '秦城区', '3', 620500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3276, 620503, '北道区', '3', 620500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3277, 620521, '清水县', '3', 620500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3278, 620522, '秦安县', '3', 620500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3279, 620523, '甘谷县', '3', 620500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3280, 620524, '武山县', '3', 620500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3281, 620525, '张家川回族自治县', '3', 620500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3282, 620601, '市辖区', '3', 620600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3283, 620602, '凉州区', '3', 620600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3284, 620621, '民勤县', '3', 620600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3285, 620622, '古浪县', '3', 620600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3286, 620623, '天祝藏族自治县', '3', 620600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3287, 620701, '市辖区', '3', 620700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3288, 620702, '甘州区', '3', 620700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3289, 620721, '肃南裕固族自治县', '3', 620700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3290, 620722, '民乐县', '3', 620700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3291, 620723, '临泽县', '3', 620700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3292, 620724, '高台县', '3', 620700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3293, 620725, '山丹县', '3', 620700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3294, 620801, '市辖区', '3', 620800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3295, 620802, '崆峒区', '3', 620800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3296, 620821, '泾川县', '3', 620800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3297, 620822, '灵台县', '3', 620800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3298, 620823, '崇信县', '3', 620800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3299, 620824, '华亭县', '3', 620800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3300, 620825, '庄浪县', '3', 620800, null, null);
commit;
prompt 3300 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3301, 620826, '静宁县', '3', 620800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3302, 620901, '市辖区', '3', 620900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3303, 620902, '肃州区', '3', 620900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3304, 620921, '金塔县', '3', 620900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3305, 620922, '安西县', '3', 620900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3306, 620923, '肃北蒙古族自治县', '3', 620900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3307, 620924, '阿克塞哈萨克族自治县', '3', 620900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3308, 620981, '玉门市', '3', 620900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3309, 620982, '敦煌市', '3', 620900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3310, 621001, '市辖区', '3', 621000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3311, 621002, '西峰区', '3', 621000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3312, 621021, '庆城县', '3', 621000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3313, 621022, '环　县', '3', 621000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3314, 621023, '华池县', '3', 621000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3315, 621024, '合水县', '3', 621000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3316, 621025, '正宁县', '3', 621000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3317, 621026, '宁　县', '3', 621000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3318, 621027, '镇原县', '3', 621000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3319, 621101, '市辖区', '3', 621100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3320, 621102, '安定区', '3', 621100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3321, 621121, '通渭县', '3', 621100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3322, 621122, '陇西县', '3', 621100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3323, 621123, '渭源县', '3', 621100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3324, 621124, '临洮县', '3', 621100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3325, 621125, '漳　县', '3', 621100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3326, 621126, '岷　县', '3', 621100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3327, 621201, '市辖区', '3', 621200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3328, 621202, '武都区', '3', 621200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3329, 621221, '成　县', '3', 621200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3330, 621222, '文　县', '3', 621200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3331, 621223, '宕昌县', '3', 621200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3332, 621224, '康　县', '3', 621200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3333, 621225, '西和县', '3', 621200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3334, 621226, '礼　县', '3', 621200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3335, 621227, '徽　县', '3', 621200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3336, 621228, '两当县', '3', 621200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3337, 622901, '临夏市', '3', 622900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3338, 622921, '临夏县', '3', 622900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3339, 622922, '康乐县', '3', 622900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3340, 622923, '永靖县', '3', 622900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3341, 622924, '广河县', '3', 622900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3342, 622925, '和政县', '3', 622900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3343, 622926, '东乡族自治县', '3', 622900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3344, 622927, '积石山保安族东乡族撒拉族自治县', '3', 622900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3345, 623001, '合作市', '3', 623000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3346, 623021, '临潭县', '3', 623000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3347, 623022, '卓尼县', '3', 623000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3348, 623023, '舟曲县', '3', 623000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3349, 623024, '迭部县', '3', 623000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3350, 623025, '玛曲县', '3', 623000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3351, 623026, '碌曲县', '3', 623000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3352, 623027, '夏河县', '3', 623000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3353, 630101, '市辖区', '3', 630100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3354, 630102, '城东区', '3', 630100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3355, 630103, '城中区', '3', 630100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3356, 630104, '城西区', '3', 630100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3357, 630105, '城北区', '3', 630100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3358, 630121, '大通回族土族自治县', '3', 630100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3359, 630122, '湟中县', '3', 630100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3360, 630123, '湟源县', '3', 630100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3361, 632121, '平安县', '3', 632100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3362, 632122, '民和回族土族自治县', '3', 632100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3363, 632123, '乐都县', '3', 632100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3364, 632126, '互助土族自治县', '3', 632100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3365, 632127, '化隆回族自治县', '3', 632100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3366, 632128, '循化撒拉族自治县', '3', 632100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3367, 632221, '门源回族自治县', '3', 632200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3368, 632222, '祁连县', '3', 632200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3369, 632223, '海晏县', '3', 632200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3370, 632224, '刚察县', '3', 632200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3371, 632321, '同仁县', '3', 632300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3372, 632322, '尖扎县', '3', 632300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3373, 632323, '泽库县', '3', 632300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3374, 632324, '河南蒙古族自治县', '3', 632300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3375, 632521, '共和县', '3', 632500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3376, 632522, '同德县', '3', 632500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3377, 632523, '贵德县', '3', 632500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3378, 632524, '兴海县', '3', 632500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3379, 632525, '贵南县', '3', 632500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3380, 632621, '玛沁县', '3', 632600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3381, 632622, '班玛县', '3', 632600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3382, 632623, '甘德县', '3', 632600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3383, 632624, '达日县', '3', 632600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3384, 632625, '久治县', '3', 632600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3385, 632626, '玛多县', '3', 632600, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3386, 632721, '玉树县', '3', 632700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3387, 632722, '杂多县', '3', 632700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3388, 632723, '称多县', '3', 632700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3389, 632724, '治多县', '3', 632700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3390, 632725, '囊谦县', '3', 632700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3391, 632726, '曲麻莱县', '3', 632700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3392, 632801, '格尔木市', '3', 632800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3393, 632802, '德令哈市', '3', 632800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3394, 632821, '乌兰县', '3', 632800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3395, 632822, '都兰县', '3', 632800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3396, 632823, '天峻县', '3', 632800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3397, 640101, '市辖区', '3', 640100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3398, 640104, '兴庆区', '3', 640100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3399, 640105, '西夏区', '3', 640100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3400, 640106, '金凤区', '3', 640100, null, null);
commit;
prompt 3400 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3401, 640121, '永宁县', '3', 640100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3402, 640122, '贺兰县', '3', 640100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3403, 640181, '灵武市', '3', 640100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3404, 640201, '市辖区', '3', 640200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3405, 640202, '大武口区', '3', 640200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3406, 640205, '惠农区', '3', 640200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3407, 640221, '平罗县', '3', 640200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3408, 640301, '市辖区', '3', 640300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3409, 640302, '利通区', '3', 640300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3410, 640323, '盐池县', '3', 640300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3411, 640324, '同心县', '3', 640300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3412, 640381, '青铜峡市', '3', 640300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3413, 640401, '市辖区', '3', 640400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3414, 640402, '原州区', '3', 640400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3415, 640422, '西吉县', '3', 640400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3416, 640423, '隆德县', '3', 640400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3417, 640424, '泾源县', '3', 640400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3418, 640425, '彭阳县', '3', 640400, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3419, 640501, '市辖区', '3', 640500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3420, 640502, '沙坡头区', '3', 640500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3421, 640521, '中宁县', '3', 640500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3422, 640522, '海原县', '3', 640500, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3423, 650101, '市辖区', '3', 650100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3424, 650102, '天山区', '3', 650100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3425, 650103, '沙依巴克区', '3', 650100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3426, 650104, '新市区', '3', 650100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3427, 650105, '水磨沟区', '3', 650100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3428, 650106, '头屯河区', '3', 650100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3429, 650107, '达坂城区', '3', 650100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3430, 650108, '东山区', '3', 650100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3431, 650121, '乌鲁木齐县', '3', 650100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3432, 650201, '市辖区', '3', 650200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3433, 650202, '独山子区', '3', 650200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3434, 650203, '克拉玛依区', '3', 650200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3435, 650204, '白碱滩区', '3', 650200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3436, 650205, '乌尔禾区', '3', 650200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3437, 652101, '吐鲁番市', '3', 652100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3438, 652122, '鄯善县', '3', 652100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3439, 652123, '托克逊县', '3', 652100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3440, 652201, '哈密市', '3', 652200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3441, 652222, '巴里坤哈萨克自治县', '3', 652200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3442, 652223, '伊吾县', '3', 652200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3443, 652301, '昌吉市', '3', 652300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3444, 652302, '阜康市', '3', 652300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3445, 652303, '米泉市', '3', 652300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3446, 652323, '呼图壁县', '3', 652300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3447, 652324, '玛纳斯县', '3', 652300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3448, 652325, '奇台县', '3', 652300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3449, 652327, '吉木萨尔县', '3', 652300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3450, 652328, '木垒哈萨克自治县', '3', 652300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3451, 652701, '博乐市', '3', 652700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3452, 652722, '精河县', '3', 652700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3453, 652723, '温泉县', '3', 652700, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3454, 652801, '库尔勒市', '3', 652800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3455, 652822, '轮台县', '3', 652800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3456, 652823, '尉犁县', '3', 652800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3457, 652824, '若羌县', '3', 652800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3458, 652825, '且末县', '3', 652800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3459, 652826, '焉耆回族自治县', '3', 652800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3460, 652827, '和静县', '3', 652800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3461, 652828, '和硕县', '3', 652800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3462, 652829, '博湖县', '3', 652800, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3463, 652901, '阿克苏市', '3', 652900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3464, 652922, '温宿县', '3', 652900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3465, 652923, '库车县', '3', 652900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3466, 652924, '沙雅县', '3', 652900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3467, 652925, '新和县', '3', 652900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3468, 652926, '拜城县', '3', 652900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3469, 652927, '乌什县', '3', 652900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3470, 652928, '阿瓦提县', '3', 652900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3471, 652929, '柯坪县', '3', 652900, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3472, 653001, '阿图什市', '3', 653000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3473, 653022, '阿克陶县', '3', 653000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3474, 653023, '阿合奇县', '3', 653000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3475, 653024, '乌恰县', '3', 653000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3476, 653101, '喀什市', '3', 653100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3477, 653121, '疏附县', '3', 653100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3478, 653122, '疏勒县', '3', 653100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3479, 653123, '英吉沙县', '3', 653100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3480, 653124, '泽普县', '3', 653100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3481, 653125, '莎车县', '3', 653100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3482, 653126, '叶城县', '3', 653100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3483, 653127, '麦盖提县', '3', 653100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3484, 653128, '岳普湖县', '3', 653100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3485, 653129, '伽师县', '3', 653100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3486, 653130, '巴楚县', '3', 653100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3487, 653131, '塔什库尔干塔吉克自治县', '3', 653100, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3488, 653201, '和田市', '3', 653200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3489, 653221, '和田县', '3', 653200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3490, 653222, '墨玉县', '3', 653200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3491, 653223, '皮山县', '3', 653200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3492, 653224, '洛浦县', '3', 653200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3493, 653225, '策勒县', '3', 653200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3494, 653226, '于田县', '3', 653200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3495, 653227, '民丰县', '3', 653200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3496, 654002, '伊宁市', '3', 654000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3497, 654003, '奎屯市', '3', 654000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3498, 654021, '伊宁县', '3', 654000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3499, 654022, '察布查尔锡伯自治县', '3', 654000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3500, 654023, '霍城县', '3', 654000, null, null);
commit;
prompt 3500 records committed...
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3501, 654024, '巩留县', '3', 654000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3502, 654025, '新源县', '3', 654000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3503, 654026, '昭苏县', '3', 654000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3504, 654027, '特克斯县', '3', 654000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3505, 654028, '尼勒克县', '3', 654000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3506, 654201, '塔城市', '3', 654200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3507, 654202, '乌苏市', '3', 654200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3508, 654221, '额敏县', '3', 654200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3509, 654223, '沙湾县', '3', 654200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3510, 654224, '托里县', '3', 654200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3511, 654225, '裕民县', '3', 654200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3512, 654226, '和布克赛尔蒙古自治县', '3', 654200, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3513, 654301, '阿勒泰市', '3', 654300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3514, 654321, '布尔津县', '3', 654300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3515, 654322, '富蕴县', '3', 654300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3516, 654323, '福海县', '3', 654300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3517, 654324, '哈巴河县', '3', 654300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3518, 654325, '青河县', '3', 654300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3519, 654326, '吉木乃县', '3', 654300, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3520, 659001, '石河子市', '3', 659000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3521, 659002, '阿拉尔市', '3', 659000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3522, 659003, '图木舒克市', '3', 659000, null, null);
insert into ADMINREGION (ID, CODE, NAME, REGIONLEVEL, PCODE, CREATETIME, UPDATETIME)
values (3523, 659004, '五家渠市', '3', 659000, null, null);
commit;
prompt 3523 records loaded
prompt Loading ALARM...
insert into ALARM (ID, NAME, ALARMTIME, ALARMLEVEL, ALARMTYPE, SOURCEID, SOURCETYPE, CONTENT, ACKTIME, ACKUSER, CREATETIME, UPDATETIME, HOSTUCODE)
values (4, 'test4', to_date('04-05-2016 13:14:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', 1, '1', 'haohgggg', null, null, to_date('05-05-2016 13:14:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-05-2016 13:14:20', 'dd-mm-yyyy hh24:mi:ss'), 'TA0001');
commit;
prompt 1 records loaded
prompt Loading ALARMHISTORY...
insert into ALARMHISTORY (ID, NAME, ALARMTIME, ALARMLEVEL, ALARMTYPE, SOURCEID, SOURCETYPE, CONTENT, ACKTIME, ACKUSER, CREATETIME, UPDATETIME, HOSTUCODE)
values (1, 'test1', to_date('04-05-2016 23:14:26', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', 1, '1', '后安徽公安和公安和高光红安徽公安改好后工行', to_date('06-05-2016 23:16:14', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('06-05-2016 23:16:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-05-2016 23:16:14', 'dd-mm-yyyy hh24:mi:ss'), 'TA0001');
insert into ALARMHISTORY (ID, NAME, ALARMTIME, ALARMLEVEL, ALARMTYPE, SOURCEID, SOURCETYPE, CONTENT, ACKTIME, ACKUSER, CREATETIME, UPDATETIME, HOSTUCODE)
values (3, 'test3', to_date('04-05-2016 13:14:20', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', 1, '1', 'haohgggg', null, null, to_date('05-05-2016 13:14:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-05-2016 13:14:20', 'dd-mm-yyyy hh24:mi:ss'), 'TA0001');
commit;
prompt 2 records loaded
prompt Loading CHANNELCOMPANY...
insert into CHANNELCOMPANY (ID, NAME, CONTACTS, MPHONE, PHONE, SALEVOLUME, CREATETIME, UPDATETIME, AREACODE)
values (3567, '百度', '李彦宏', '124213123213123333333333333', '12322233', '21312', null, to_date('11-04-2016 12:53:29', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into CHANNELCOMPANY (ID, NAME, CONTACTS, MPHONE, PHONE, SALEVOLUME, CREATETIME, UPDATETIME, AREACODE)
values (3582, '淘宝', '马云', '22', null, null, null, null, null);
insert into CHANNELCOMPANY (ID, NAME, CONTACTS, MPHONE, PHONE, SALEVOLUME, CREATETIME, UPDATETIME, AREACODE)
values (3618, 'asdfsa ', null, null, null, null, to_date('13-04-2016 17:49:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-04-2016 17:49:48', 'dd-mm-yyyy hh24:mi:ss'), 130304);
insert into CHANNELCOMPANY (ID, NAME, CONTACTS, MPHONE, PHONE, SALEVOLUME, CREATETIME, UPDATETIME, AREACODE)
values (3619, '123121312', null, null, null, null, to_date('13-04-2016 22:33:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-04-2016 22:33:29', 'dd-mm-yyyy hh24:mi:ss'), 421121);
insert into CHANNELCOMPANY (ID, NAME, CONTACTS, MPHONE, PHONE, SALEVOLUME, CREATETIME, UPDATETIME, AREACODE)
values (3604, '91无线', null, null, null, null, to_date('10-04-2016 13:15:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-04-2016 13:15:04', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into CHANNELCOMPANY (ID, NAME, CONTACTS, MPHONE, PHONE, SALEVOLUME, CREATETIME, UPDATETIME, AREACODE)
values (3599, '今目标', null, null, null, null, null, null, null);
insert into CHANNELCOMPANY (ID, NAME, CONTACTS, MPHONE, PHONE, SALEVOLUME, CREATETIME, UPDATETIME, AREACODE)
values (3613, '测试今目标', null, null, null, null, to_date('11-04-2016 14:19:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-04-2016 14:19:50', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHANNELCOMPANY (ID, NAME, CONTACTS, MPHONE, PHONE, SALEVOLUME, CREATETIME, UPDATETIME, AREACODE)
values (3642, '福州创杰', '谢家永', '18650372760', '88961234', '33', to_date('18-04-2016 10:29:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-04-2016 10:29:00', 'dd-mm-yyyy hh24:mi:ss'), 350103);
insert into CHANNELCOMPANY (ID, NAME, CONTACTS, MPHONE, PHONE, SALEVOLUME, CREATETIME, UPDATETIME, AREACODE)
values (3616, '321321', null, null, null, null, to_date('12-04-2016 23:55:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-04-2016 23:55:40', 'dd-mm-yyyy hh24:mi:ss'), 421302);
insert into CHANNELCOMPANY (ID, NAME, CONTACTS, MPHONE, PHONE, SALEVOLUME, CREATETIME, UPDATETIME, AREACODE)
values (3617, 'dfadad', null, null, null, null, to_date('12-04-2016 23:57:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-04-2016 23:57:21', 'dd-mm-yyyy hh24:mi:ss'), 411702);
insert into CHANNELCOMPANY (ID, NAME, CONTACTS, MPHONE, PHONE, SALEVOLUME, CREATETIME, UPDATETIME, AREACODE)
values (3614, '测试地址', null, null, null, null, to_date('12-04-2016 23:52:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-04-2016 23:52:08', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHANNELCOMPANY (ID, NAME, CONTACTS, MPHONE, PHONE, SALEVOLUME, CREATETIME, UPDATETIME, AREACODE)
values (3615, '21321', null, null, null, null, to_date('12-04-2016 23:53:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-04-2016 23:53:53', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CHANNELCOMPANY (ID, NAME, CONTACTS, MPHONE, PHONE, SALEVOLUME, CREATETIME, UPDATETIME, AREACODE)
values (3672, '23打的费', '第三方大师', null, null, null, to_date('23-04-2016 11:48:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-04-2016 11:48:13', 'dd-mm-yyyy hh24:mi:ss'), 110101);
insert into CHANNELCOMPANY (ID, NAME, CONTACTS, MPHONE, PHONE, SALEVOLUME, CREATETIME, UPDATETIME, AREACODE)
values (3612, '福州创杰', '232323', '1864032222', '223', '333', to_date('11-04-2016 12:54:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-04-2016 12:54:43', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into CHANNELCOMPANY (ID, NAME, CONTACTS, MPHONE, PHONE, SALEVOLUME, CREATETIME, UPDATETIME, AREACODE)
values (3621, '360', null, null, null, null, to_date('14-04-2016 00:57:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-04-2016 00:57:58', 'dd-mm-yyyy hh24:mi:ss'), 110103);
commit;
prompt 15 records loaded
prompt Loading CHECKCOMMAND...
prompt Table is empty
prompt Loading CHECKITEM...
prompt Table is empty
prompt Loading CHECKVALUEHISTORY...
prompt Table is empty
prompt Loading CHECKVALUETREND...
prompt Table is empty
prompt Loading CUSTOMER...
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (1, '11百度科技有限公司', '17312345678', '李彦宏', '1', '1', '1', '1', '1', 3582, null, null, null);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (2, '搜狐科技', null, null, null, null, null, null, null, null, null, null, null);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (4, '京东科技', '1', '1', '1', '1', '1', '1', '1', 3582, null, null, null);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (5, '腾讯科技', null, null, null, null, null, null, null, null, null, null, null);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (6, '阿里巴巴', '21321', null, null, null, null, null, null, 3567, null, null, null);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (7, '蚂蚁金服', '12', '12', '12', '12', '12', '12', '12', 3567, null, null, null);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (9, '滴滴科技', null, null, null, null, null, null, null, null, null, null, null);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (3585, '大连市政', '123', '123', '213', null, null, '12', '3', 3567, null, null, null);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (3600, '今目标厦门分公司', null, null, null, null, null, null, null, 3599, null, null, null);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (3620, 'adfdfda', null, null, null, null, null, null, null, 3567, to_date('14-04-2016 00:26:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-04-2016 00:26:05', 'dd-mm-yyyy hh24:mi:ss'), 120102);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (3623, '360安全卫士', null, null, null, null, null, null, null, 3621, to_date('14-04-2016 01:02:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-04-2016 01:02:24', 'dd-mm-yyyy hh24:mi:ss'), 110228);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (3587, '11百度科技有限公司', '17312345678', '李彦宏', '213', '123', null, null, null, 3567, null, null, null);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (3590, '11百度科技有限公司', '17312345678', '李彦宏', '213', '123', '123', '123', '123', 3567, null, null, null);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (3641, '谢家永', '1', '1', '1', '1', '1', '1', null, 3567, to_date('14-04-2016 09:50:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-04-2016 09:50:27', 'dd-mm-yyyy hh24:mi:ss'), 350104);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (3643, '美特', null, null, null, null, null, null, null, 3604, to_date('18-04-2016 21:14:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-04-2016 21:14:39', 'dd-mm-yyyy hh24:mi:ss'), 110103);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (3586, '11百度科技有限公司', '17312345678', '李彦宏', '1232', '1213', '12321', '213', '123', 3567, null, null, null);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (3588, '11百度科技有限公司', '17312345678', '李彦宏', null, null, null, null, null, 3567, null, null, null);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (3589, '11百度科技有限公司', '17312345678', '李彦宏', null, null, null, null, null, 3567, null, null, null);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (3591, '213', '213', '213', '213', '213', '213', '123', '231', 3567, null, null, null);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (3607, '安卓市场', null, null, null, null, null, null, null, 3604, to_date('10-04-2016 14:49:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-04-2016 14:49:02', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (3608, '91桌面', null, null, null, null, null, null, null, 3604, to_date('10-04-2016 14:49:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-04-2016 14:49:16', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into CUSTOMER (ID, NAME, CONTACTS, MAINTIANER, MPHONE, PHONE, NOTIFYPHONE, NOTIFYEMAIL, POSTCODE, PID, CREATETIME, UPDATETIME, AREACODE)
values (3609, '熊猫看书', null, null, null, null, null, null, null, 3604, to_date('10-04-2016 14:49:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-04-2016 14:49:31', 'dd-mm-yyyy hh24:mi:ss'), null);
commit;
prompt 22 records loaded
prompt Loading DEVICEMODEL_CHECKCOMMAND...
insert into DEVICEMODEL_CHECKCOMMAND (ID, TARGETDEVICEMODEL, NAME, VALUE, VALUETYPE, CREATETIME, UPDATETIME, CODE, PARAM)
values (1001, 'TA', '温湿度采集命令', '0104000000271CB', 'RTU', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'), 'TA01', null);
insert into DEVICEMODEL_CHECKCOMMAND (ID, TARGETDEVICEMODEL, NAME, VALUE, VALUETYPE, CREATETIME, UPDATETIME, CODE, PARAM)
values (1002, 'TB', '温湿度采集命令', '0104000000271CB', 'RTU', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'), 'TB01', null);
insert into DEVICEMODEL_CHECKCOMMAND (ID, TARGETDEVICEMODEL, NAME, VALUE, VALUETYPE, CREATETIME, UPDATETIME, CODE, PARAM)
values (1003, 'UA', 'UPS_Q1', 'Q1', 'ASCII', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'), 'UA01', null);
commit;
prompt 3 records loaded
prompt Loading DEVICEMODEL_CHECKITEM...
insert into DEVICEMODEL_CHECKITEM (ID, TARGETDEVICEMODEL, NAME, CODE, MAXVALUE, MINVALUE, EQVALUE, VALUETYPE, CREATETIME, UPDATETIME)
values (1000, 'TA', '温度', '1', 30, 10, null, 'FLOAT', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'));
insert into DEVICEMODEL_CHECKITEM (ID, TARGETDEVICEMODEL, NAME, CODE, MAXVALUE, MINVALUE, EQVALUE, VALUETYPE, CREATETIME, UPDATETIME)
values (1001, 'TA', '湿度', '2', 90, 10, null, 'FLOAT', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'));
insert into DEVICEMODEL_CHECKITEM (ID, TARGETDEVICEMODEL, NAME, CODE, MAXVALUE, MINVALUE, EQVALUE, VALUETYPE, CREATETIME, UPDATETIME)
values (1002, 'UA', '电压', '1', 250, 120, null, 'FLOAT', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'));
commit;
prompt 3 records loaded
prompt Loading DISCOVEREDHOST...
prompt Table is empty
prompt Loading EVENT...
insert into EVENT (ID, NAME, EVENTTIME, SOURCEID, SOURCETYPE, CONTENT, CREATETIME, UPDATETIME)
values (1, '测试1', to_date('07-05-2016 22:15:04', 'dd-mm-yyyy hh24:mi:ss'), 1, '1', '阿红好狗好更好歌喉个', to_date('07-05-2016 22:15:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-05-2016 22:15:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into EVENT (ID, NAME, EVENTTIME, SOURCEID, SOURCETYPE, CONTENT, CREATETIME, UPDATETIME)
values (2, '测试2', to_date('08-05-2016 22:15:38', 'dd-mm-yyyy hh24:mi:ss'), 1, '1', 'haohgohaohgoag', to_date('08-05-2016 22:15:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-05-2016 22:15:49', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 2 records loaded
prompt Loading GEOLOCATION...
insert into GEOLOCATION (ID, NAME, LON, LAT, POSTCODE, ADDRESS, CREATETIME, UPDATETIME, AREACODE)
values (3686, '北京', 0, 0, null, null, to_date('24-04-2016 15:24:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 21:52:48', 'dd-mm-yyyy hh24:mi:ss'), '110101');
insert into GEOLOCATION (ID, NAME, LON, LAT, POSTCODE, ADDRESS, CREATETIME, UPDATETIME, AREACODE)
values (3687, '厦门', 0, 0, '100083', '爱上谁发的是 ', to_date('24-04-2016 15:24:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 21:52:27', 'dd-mm-yyyy hh24:mi:ss'), '110101');
commit;
prompt 2 records loaded
prompt Loading HOSTCONNECTHISTORY...
prompt Table is empty
prompt Loading HOSTMODEL...
insert into HOSTMODEL (ID, MODEL, NAME, DESCR, CREATETIME, UPDATETIME)
values (1000, 'TA', 'UPS监测(GPRS)', 'UPS监测设备GPRS云版', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'));
insert into HOSTMODEL (ID, MODEL, NAME, DESCR, CREATETIME, UPDATETIME)
values (1001, 'IA', 'IOT网关A型', '智能网关双网口', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('12-04-2016', 'dd-mm-yyyy'));
insert into HOSTMODEL (ID, MODEL, NAME, DESCR, CREATETIME, UPDATETIME)
values (1002, 'RP', '防雷箱A型号', '防雷箱A型号', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'));
commit;
prompt 3 records loaded
prompt Loading HOSTMODEL_PORT...
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (1001, 'c1', '串口1', 'TA', 'RS232', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('12-04-2016', 'dd-mm-yyyy'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (1002, 'c2', '串口2', 'TA', 'RS232', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (1003, 'c3', '串口3', 'TA', 'RS485', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('12-04-2016', 'dd-mm-yyyy'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (1004, 'c4', '串口4', 'TA', 'RS485', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (1005, 'led.1', '电源指示灯', 'TA', 'LED', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (1006, 'sim', 'SIM卡口', 'TA', 'SIM', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (1007, 'ant', '天线', 'TA', '普通天线', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3849, 'c1', '串口1', 'IA', 'RS232', to_date('10-05-2016 15:32:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3850, 'c2', '串口2', 'IA', 'RS232', to_date('10-05-2016 15:32:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3851, 'c3', '串口3', 'IA', 'RS485', to_date('10-05-2016 15:32:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3852, 'c4', '串口4', 'IA', 'RS485', to_date('10-05-2016 15:32:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3853, 'led.1', '电源指示灯', 'IA', 'LED', to_date('10-05-2016 15:32:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3854, 'sim', 'SIM卡口', 'IA', 'SIM', to_date('10-05-2016 15:32:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3855, 'ant', '天线', 'IA', '普通天线', to_date('10-05-2016 15:32:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3856, 'c1', '串口1', 'RP', 'RS232', to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3857, 'c2', '串口2', 'RP', 'RS232', to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3858, 'c3', '串口3', 'RP', 'RS485', to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3859, 'c4', '串口4', 'RP', 'RS485', to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3860, 'led.1', '电源指示灯', 'RP', 'LED', to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3861, 'sim', 'SIM卡口', 'RP', 'SIM', to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3862, 'ant', '天线', 'RP', '普通天线', to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3863, 'c1', '串口1', 'RP', 'RS232', to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3864, 'c2', '串口2', 'RP', 'RS232', to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3865, 'c3', '串口3', 'RP', 'RS485', to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3866, 'c4', '串口4', 'RP', 'RS485', to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3867, 'led.1', '电源指示灯', 'RP', 'LED', to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3868, 'sim', 'SIM卡口', 'RP', 'SIM', to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into HOSTMODEL_PORT (ID, UCODE, NAME, HOSTMODEL, SPEC, CREATETIME, UPDATETIME)
values (3869, 'ant', '天线', 'RP', '普通天线', to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 15:32:13', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 28 records loaded
prompt Loading HOSTMODEL_TARGETDEVICE...
insert into HOSTMODEL_TARGETDEVICE (ID, PORTUCODE, DEVICEMODEL, NAME, DEVICETYPE, ADDR, CREATETIME, UPDATETIME)
values (1, 'c1', 'dy', '打印机', '11', 1, to_date('18-04-2016 22:24:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 22:24:17', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 1 records loaded
prompt Loading HOSTPORT...
insert into HOSTPORT (ID, NAME, UCODE, HOSTUCODE, SPEC, CREATETIME, UPDATETIME, PARAM)
values (3823, '串口3', 'c3', '1', 'RS485', to_date('10-05-2016 14:26:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 14:26:45', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into HOSTPORT (ID, NAME, UCODE, HOSTUCODE, SPEC, CREATETIME, UPDATETIME, PARAM)
values (3824, '串口4', 'c4', '1', 'RS485', to_date('10-05-2016 14:26:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 14:26:45', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into HOSTPORT (ID, NAME, UCODE, HOSTUCODE, SPEC, CREATETIME, UPDATETIME, PARAM)
values (3825, '电源指示灯', 'led.1', '1', 'LED', to_date('10-05-2016 14:26:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 14:26:45', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into HOSTPORT (ID, NAME, UCODE, HOSTUCODE, SPEC, CREATETIME, UPDATETIME, PARAM)
values (3826, 'SIM卡口', 'sim', '1', 'SIM', to_date('10-05-2016 14:26:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 14:26:45', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into HOSTPORT (ID, NAME, UCODE, HOSTUCODE, SPEC, CREATETIME, UPDATETIME, PARAM)
values (3827, '天线', 'ant', '1', '普通天线', to_date('10-05-2016 14:26:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 14:26:45', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into HOSTPORT (ID, NAME, UCODE, HOSTUCODE, SPEC, CREATETIME, UPDATETIME, PARAM)
values (3820, '串口1', 'c1', '1', 'RS232', to_date('10-05-2016 14:26:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 14:26:44', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into HOSTPORT (ID, NAME, UCODE, HOSTUCODE, SPEC, CREATETIME, UPDATETIME, PARAM)
values (3822, '串口2', 'c2', '1', 'RS232', to_date('10-05-2016 14:26:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 14:26:45', 'dd-mm-yyyy hh24:mi:ss'), null);
commit;
prompt 7 records loaded
prompt Loading LOGINHISTORY...
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3702, '1', to_date('25-04-2016 22:19:31', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('25-04-2016 22:19:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2016 22:19:31', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3703, '1', to_date('25-04-2016 22:27:38', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('25-04-2016 22:27:38', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2016 22:27:38', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3706, 'admin', to_date('25-04-2016 22:42:14', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('25-04-2016 22:42:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2016 22:42:14', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3708, 'admin', to_date('25-04-2016 22:53:40', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('25-04-2016 22:53:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2016 22:53:40', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3710, 'admin', to_date('25-04-2016 22:58:59', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('25-04-2016 22:58:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2016 22:58:59', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3712, 'admin', to_date('25-04-2016 23:04:48', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('25-04-2016 23:04:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2016 23:04:48', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3713, 'admin', to_date('25-04-2016 23:18:01', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('25-04-2016 23:18:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2016 23:18:01', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3714, 'admin', to_date('25-04-2016 23:43:17', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('25-04-2016 23:43:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2016 23:43:17', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3717, '1', to_date('27-04-2016 22:54:59', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('27-04-2016 22:54:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-04-2016 22:54:59', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3720, '1', to_date('28-04-2016 21:50:17', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('28-04-2016 21:50:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-04-2016 21:50:17', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3722, 'admin', to_date('30-04-2016 23:21:26', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('30-04-2016 23:21:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-04-2016 23:21:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3723, 'admin', to_date('01-05-2016 09:55:12', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('01-05-2016 09:55:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2016 09:55:12', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3734, 'admin', to_date('04-05-2016 23:29:26', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('04-05-2016 23:29:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-05-2016 23:29:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3735, 'admin', to_date('04-05-2016 23:30:33', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('04-05-2016 23:30:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-05-2016 23:30:33', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3751, '1', to_date('06-05-2016 22:45:26', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('06-05-2016 22:45:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-05-2016 22:45:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3755, '1', to_date('06-05-2016 22:59:26', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('06-05-2016 22:59:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-05-2016 22:59:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3778, 'admin', to_date('09-05-2016 22:03:53', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('09-05-2016 22:03:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-05-2016 22:03:53', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3871, 'admin', to_date('10-05-2016 17:06:35', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('10-05-2016 17:06:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 17:06:35', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3872, 'admin', to_date('10-05-2016 18:12:12', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('10-05-2016 18:12:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 18:12:12', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3676, 'admin', to_date('23-04-2016 14:04:52', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('23-04-2016 14:04:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-04-2016 14:04:52', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3680, 'admin', to_date('24-04-2016 14:42:58', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('24-04-2016 14:42:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 14:42:58', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3681, 'admin', to_date('24-04-2016 14:46:59', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('24-04-2016 14:46:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 14:46:59', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3682, 'admin', to_date('24-04-2016 15:07:20', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('24-04-2016 15:07:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 15:07:20', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3685, 'admin', to_date('24-04-2016 15:20:52', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('24-04-2016 15:20:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 15:20:52', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3688, 'admin', to_date('24-04-2016 15:41:52', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('24-04-2016 15:41:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 15:41:52', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3699, '1', to_date('25-04-2016 21:30:20', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('25-04-2016 21:30:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2016 21:30:20', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3729, 'admin', to_date('02-05-2016 22:15:53', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('02-05-2016 22:15:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-05-2016 22:15:53', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3756, 'admin', to_date('06-05-2016 22:59:30', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('06-05-2016 22:59:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-05-2016 22:59:30', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3790, '1', to_date('09-05-2016 22:56:37', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('09-05-2016 22:56:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-05-2016 22:56:37', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3878, '1', to_date('10-05-2016 21:38:36', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('10-05-2016 21:38:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 21:38:36', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3665, 'admin', to_date('23-04-2016 10:56:19', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('23-04-2016 10:56:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-04-2016 10:56:19', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3677, '1', to_date('23-04-2016 23:13:36', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('23-04-2016 23:13:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-04-2016 23:13:36', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3691, 'admin', to_date('24-04-2016 21:45:04', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('24-04-2016 21:45:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 21:45:04', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3692, 'admin', to_date('24-04-2016 21:51:30', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('24-04-2016 21:51:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 21:51:30', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3693, 'admin', to_date('24-04-2016 21:56:06', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('24-04-2016 21:56:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 21:56:06', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3694, 'admin', to_date('24-04-2016 22:02:08', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('24-04-2016 22:02:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 22:02:08', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3695, 'admin', to_date('24-04-2016 22:03:59', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('24-04-2016 22:03:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 22:03:59', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3696, 'admin', to_date('24-04-2016 22:06:46', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('24-04-2016 22:06:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 22:06:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3697, 'admin', to_date('24-04-2016 22:16:03', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('24-04-2016 22:16:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 22:16:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3698, 'admin', to_date('24-04-2016 22:24:26', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('24-04-2016 22:24:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 22:24:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3715, 'admin', to_date('26-04-2016 20:34:27', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('26-04-2016 20:34:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-04-2016 20:34:27', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3719, '1', to_date('28-04-2016 21:00:23', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('28-04-2016 21:00:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-04-2016 21:00:23', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3724, 'admin', to_date('02-05-2016 22:05:09', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('02-05-2016 22:05:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-05-2016 22:05:09', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3725, 'admin', to_date('02-05-2016 22:06:46', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('02-05-2016 22:06:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-05-2016 22:06:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3730, 'admin', to_date('04-05-2016 22:47:35', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('04-05-2016 22:47:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-05-2016 22:47:35', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3737, 'admin', to_date('04-05-2016 23:37:43', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('04-05-2016 23:37:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-05-2016 23:37:43', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3738, 'admin', to_date('04-05-2016 23:40:12', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('04-05-2016 23:40:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-05-2016 23:40:12', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3739, 'admin', to_date('05-05-2016 22:12:33', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('05-05-2016 22:12:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-05-2016 22:12:33', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3740, 'admin', to_date('05-05-2016 22:13:34', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('05-05-2016 22:13:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-05-2016 22:13:34', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3741, 'admin', to_date('05-05-2016 22:15:03', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('05-05-2016 22:15:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-05-2016 22:15:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3746, 'admin', to_date('06-05-2016 21:05:06', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('06-05-2016 21:05:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-05-2016 21:05:06', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3758, '1', to_date('06-05-2016 23:07:05', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('06-05-2016 23:07:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-05-2016 23:07:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3759, '1', to_date('06-05-2016 23:09:06', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('06-05-2016 23:09:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-05-2016 23:09:06', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3761, '1', to_date('06-05-2016 23:16:06', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('06-05-2016 23:16:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-05-2016 23:16:06', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3765, '1', to_date('07-05-2016 23:15:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('07-05-2016 23:15:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-05-2016 23:15:08', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3766, '1', to_date('08-05-2016 20:38:03', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('08-05-2016 20:38:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-05-2016 20:38:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3770, '1', to_date('08-05-2016 22:24:22', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('08-05-2016 22:24:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-05-2016 22:24:22', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3771, '1', to_date('08-05-2016 22:38:09', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('08-05-2016 22:38:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-05-2016 22:38:09', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3772, 'admin', to_date('09-05-2016 11:56:28', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('09-05-2016 11:56:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-05-2016 11:56:28', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3774, 'admin', to_date('09-05-2016 13:24:23', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('09-05-2016 13:24:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-05-2016 13:24:23', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3789, '1', to_date('09-05-2016 22:47:45', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('09-05-2016 22:47:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-05-2016 22:47:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3792, 'admin', to_date('10-05-2016 12:47:08', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('10-05-2016 12:47:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 12:47:08', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3797, 'admin', to_date('10-05-2016 12:58:22', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('10-05-2016 12:58:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 12:58:22', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3802, 'admin', to_date('10-05-2016 14:08:46', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('10-05-2016 14:08:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 14:08:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3809, 'admin', to_date('10-05-2016 14:16:29', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('10-05-2016 14:16:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 14:16:29', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3870, 'admin', to_date('10-05-2016 16:12:10', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('10-05-2016 16:12:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 16:12:10', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3874, 'admin', to_date('10-05-2016 18:15:16', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('10-05-2016 18:15:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 18:15:16', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3644, '1', to_date('20-04-2016 22:14:12', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('20-04-2016 22:14:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-04-2016 22:14:12', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3673, 'admin', to_date('23-04-2016 11:52:19', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('23-04-2016 11:52:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-04-2016 11:52:19', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3675, 'admin', to_date('23-04-2016 13:25:41', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('23-04-2016 13:25:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-04-2016 13:25:41', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3679, 'admin', to_date('24-04-2016 14:37:30', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('24-04-2016 14:37:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 14:37:30', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3690, '1', to_date('24-04-2016 18:53:36', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('24-04-2016 18:53:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 18:53:36', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3700, '1', to_date('25-04-2016 21:38:24', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('25-04-2016 21:38:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2016 21:38:24', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3701, '1', to_date('25-04-2016 21:40:58', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('25-04-2016 21:40:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2016 21:40:58', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3704, 'admin', to_date('25-04-2016 22:37:45', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('25-04-2016 22:37:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2016 22:37:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3705, 'admin', to_date('25-04-2016 22:39:04', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('25-04-2016 22:39:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2016 22:39:04', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3718, '1', to_date('27-04-2016 22:59:05', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('27-04-2016 22:59:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-04-2016 22:59:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3721, '1', to_date('28-04-2016 22:02:13', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('28-04-2016 22:02:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-04-2016 22:02:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3726, 'admin', to_date('02-05-2016 22:07:44', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('02-05-2016 22:07:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-05-2016 22:07:44', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3727, 'admin', to_date('02-05-2016 22:09:26', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('02-05-2016 22:09:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-05-2016 22:09:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3728, 'admin', to_date('02-05-2016 22:10:31', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('02-05-2016 22:10:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-05-2016 22:10:31', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3732, '1', to_date('04-05-2016 23:26:07', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('04-05-2016 23:26:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-05-2016 23:26:07', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3733, '1', to_date('04-05-2016 23:29:04', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('04-05-2016 23:29:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-05-2016 23:29:04', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3736, 'admin', to_date('04-05-2016 23:32:13', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('04-05-2016 23:32:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-05-2016 23:32:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3745, '1', to_date('05-05-2016 23:51:27', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('05-05-2016 23:51:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-05-2016 23:51:27', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3747, 'admin', to_date('06-05-2016 21:45:43', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('06-05-2016 21:45:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-05-2016 21:45:43', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3748, 'admin', to_date('06-05-2016 21:45:54', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('06-05-2016 21:45:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-05-2016 21:45:54', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3750, 'admin', to_date('06-05-2016 22:38:53', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('06-05-2016 22:38:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-05-2016 22:38:53', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3752, 'admin', to_date('06-05-2016 22:51:15', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('06-05-2016 22:51:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-05-2016 22:51:15', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3775, 'admin', to_date('09-05-2016 14:43:51', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('09-05-2016 14:43:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-05-2016 14:43:51', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3776, 'admin', to_date('09-05-2016 18:17:42', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('09-05-2016 18:17:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-05-2016 18:17:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3784, 'admin', to_date('09-05-2016 22:29:36', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('09-05-2016 22:29:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-05-2016 22:29:36', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3674, '1', to_date('23-04-2016 13:21:13', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('23-04-2016 13:21:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-04-2016 13:21:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3678, 'admin', to_date('24-04-2016 11:03:39', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('24-04-2016 11:03:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 11:03:39', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3689, '1', to_date('24-04-2016 18:31:29', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('24-04-2016 18:31:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2016 18:31:29', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3716, '1', to_date('27-04-2016 21:49:43', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('27-04-2016 21:49:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-04-2016 21:49:43', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3731, 'admin', to_date('04-05-2016 22:51:48', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('04-05-2016 22:51:48', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-05-2016 22:51:48', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3742, 'admin', to_date('05-05-2016 22:47:23', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('05-05-2016 22:47:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-05-2016 22:47:23', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3743, 'admin', to_date('05-05-2016 23:15:11', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('05-05-2016 23:15:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-05-2016 23:15:11', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3744, '1', to_date('05-05-2016 23:17:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('05-05-2016 23:17:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-05-2016 23:17:08', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 100 records committed...
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3749, 'admin', to_date('06-05-2016 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('06-05-2016 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-05-2016 21:48:09', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3763, 'admin', to_date('06-05-2016 23:17:05', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('06-05-2016 23:17:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-05-2016 23:17:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3767, '1', to_date('08-05-2016 20:48:05', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('08-05-2016 20:48:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-05-2016 20:48:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3768, '1', to_date('08-05-2016 22:07:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('08-05-2016 22:07:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-05-2016 22:07:08', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3769, '1', to_date('08-05-2016 22:09:55', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('08-05-2016 22:09:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-05-2016 22:09:55', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3777, 'admin', to_date('09-05-2016 22:03:46', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('09-05-2016 22:03:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-05-2016 22:03:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3779, 'admin', to_date('09-05-2016 22:09:40', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', to_date('09-05-2016 22:09:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-05-2016 22:09:40', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3791, '1', to_date('09-05-2016 23:34:07', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('09-05-2016 23:34:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-05-2016 23:34:07', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3876, '1', to_date('10-05-2016 21:26:12', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('10-05-2016 21:26:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 21:26:12', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3877, '1', to_date('10-05-2016 21:35:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('10-05-2016 21:35:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 21:35:08', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3879, '1', to_date('10-05-2016 22:17:54', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('10-05-2016 22:17:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 22:17:54', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3880, '1', to_date('10-05-2016 22:19:41', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('10-05-2016 22:19:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 22:19:41', 'dd-mm-yyyy hh24:mi:ss'));
insert into LOGINHISTORY (ID, USERCODE, LOGINTIME, USERIPADDR, CREATETIME, UPDATETIME)
values (3881, '1', to_date('10-05-2016 22:21:19', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('10-05-2016 22:21:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 22:21:19', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 113 records loaded
prompt Loading MONITORHOST...
insert into MONITORHOST (ID, NAME, UCODE, MODEL, IPADDR, IMEI, PHONE, LOCATIONID, ROOMID, CUSTOMERID, CHANNELCOMPANYID, PHYSTATE, STATE, CONNSTATE, LASTCHECK, CREATETIME, UPDATETIME)
values (1, 'UPS监测', 'TA0001', 'TA', null, null, null, null, null, 7, 3567, '正常', '正常', '在线', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('18-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'));
insert into MONITORHOST (ID, NAME, UCODE, MODEL, IPADDR, IMEI, PHONE, LOCATIONID, ROOMID, CUSTOMERID, CHANNELCOMPANYID, PHYSTATE, STATE, CONNSTATE, LASTCHECK, CREATETIME, UPDATETIME)
values (2, 'UPS监测', 'TA0002', 'TA', null, null, null, null, null, 3585, 3567, '正常', '正常', '在线', to_date('18-04-2016', 'dd-mm-yyyy'), to_date('18-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'));
insert into MONITORHOST (ID, NAME, UCODE, MODEL, IPADDR, IMEI, PHONE, LOCATIONID, ROOMID, CUSTOMERID, CHANNELCOMPANYID, PHYSTATE, STATE, CONNSTATE, LASTCHECK, CREATETIME, UPDATETIME)
values (3875, '12', 'TA12', 'TA', null, null, null, 0, 0, 0, 0, '0', '0', '0', to_date('10-05-2016 18:25:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 18:25:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 18:25:18', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 3 records loaded
prompt Loading ROOM...
insert into ROOM (ID, NAME, LOCATIONID, WIDTH, HEIGHT, PICURL, PICWIDTH, PICHEIGHT, MODELID, FLOORNUMBER, STATE, CREATETIME, UPDATETIME)
values (3711, '房间2', 3686, 0, 0, null, 0, 0, 0, 0, '0', to_date('25-04-2016 23:00:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2016 23:00:22', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 1 records loaded
prompt Loading SMSTASK...
insert into SMSTASK (ID, EVENTTIME, KEYID, EVENTID, CONTENT, SENDTIME, PHONE, CREATETIME, UPDATETIME)
values (1, to_date('05-05-2016 22:44:44', 'dd-mm-yyyy hh24:mi:ss'), 1, 1, '好哦啊还刚好和公安回滚', to_date('08-05-2016 22:44:57', 'dd-mm-yyyy hh24:mi:ss'), '17641189234', to_date('09-05-2016 22:45:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-05-2016 22:45:16', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 1 records loaded
prompt Loading TARGETDEVICE...
insert into TARGETDEVICE (ID, CODE, NAME, PORTUCODE, ADDR, DEVICETYPE, ISUSE, CHECKINTERVAL, PHYSTATE, STATE, LASTCHECK, MODEL, GRAPHX, GRAPHY, CREATETIME, UPDATETIME, HOSTUCODE)
values (3821, null, '打印机', 'c1', 1, '11', 0, 3, '0', '0', to_date('10-05-2016 14:26:44', 'dd-mm-yyyy hh24:mi:ss'), 'dy', 0, 0, to_date('10-05-2016 14:26:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2016 14:26:44', 'dd-mm-yyyy hh24:mi:ss'), '1');
commit;
prompt 1 records loaded
prompt Loading TARGETDEVICEMODEL...
insert into TARGETDEVICEMODEL (ID, MODEL, NAME, VENDOR, DESCR, CREATETIME, UPDATETIME, LONGMODEL)
values (1000, 'TA', '温湿度E10', '福州亿纵', '温湿度监测装置', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'), 'WISDOM.TH.THS_E10');
insert into TARGETDEVICEMODEL (ID, MODEL, NAME, VENDOR, DESCR, CREATETIME, UPDATETIME, LONGMODEL)
values (1003, 'UA', 'UPS_Q1', '通用UPS', 'UPS设备', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'), 'GENERIC.UPS.01');
insert into TARGETDEVICEMODEL (ID, MODEL, NAME, VENDOR, DESCR, CREATETIME, UPDATETIME, LONGMODEL)
values (1001, 'TB', '温湿度R10', '福州亿纵', '温湿度监测装置', to_date('19-04-2016', 'dd-mm-yyyy'), to_date('19-04-2016', 'dd-mm-yyyy'), 'WISDOM.TH.RTH_R10');
commit;
prompt 3 records loaded
prompt Enabling triggers for ACCOUNT...
alter table ACCOUNT enable all triggers;
prompt Enabling triggers for ADMINREGION...
alter table ADMINREGION enable all triggers;
prompt Enabling triggers for ALARM...
alter table ALARM enable all triggers;
prompt Enabling triggers for ALARMHISTORY...
alter table ALARMHISTORY enable all triggers;
prompt Enabling triggers for CHANNELCOMPANY...
alter table CHANNELCOMPANY enable all triggers;
prompt Enabling triggers for CHECKCOMMAND...
alter table CHECKCOMMAND enable all triggers;
prompt Enabling triggers for CHECKITEM...
alter table CHECKITEM enable all triggers;
prompt Enabling triggers for CHECKVALUEHISTORY...
alter table CHECKVALUEHISTORY enable all triggers;
prompt Enabling triggers for CHECKVALUETREND...
alter table CHECKVALUETREND enable all triggers;
prompt Enabling triggers for CUSTOMER...
alter table CUSTOMER enable all triggers;
prompt Enabling triggers for DEVICEMODEL_CHECKCOMMAND...
alter table DEVICEMODEL_CHECKCOMMAND enable all triggers;
prompt Enabling triggers for DEVICEMODEL_CHECKITEM...
alter table DEVICEMODEL_CHECKITEM enable all triggers;
prompt Enabling triggers for DISCOVEREDHOST...
alter table DISCOVEREDHOST enable all triggers;
prompt Enabling triggers for EVENT...
alter table EVENT enable all triggers;
prompt Enabling triggers for GEOLOCATION...
alter table GEOLOCATION enable all triggers;
prompt Enabling triggers for HOSTCONNECTHISTORY...
alter table HOSTCONNECTHISTORY enable all triggers;
prompt Enabling triggers for HOSTMODEL...
alter table HOSTMODEL enable all triggers;
prompt Enabling triggers for HOSTMODEL_PORT...
alter table HOSTMODEL_PORT enable all triggers;
prompt Enabling triggers for HOSTMODEL_TARGETDEVICE...
alter table HOSTMODEL_TARGETDEVICE enable all triggers;
prompt Enabling triggers for HOSTPORT...
alter table HOSTPORT enable all triggers;
prompt Enabling triggers for LOGINHISTORY...
alter table LOGINHISTORY enable all triggers;
prompt Enabling triggers for MONITORHOST...
alter table MONITORHOST enable all triggers;
prompt Enabling triggers for ROOM...
alter table ROOM enable all triggers;
prompt Enabling triggers for SMSTASK...
alter table SMSTASK enable all triggers;
prompt Enabling triggers for TARGETDEVICE...
alter table TARGETDEVICE enable all triggers;
prompt Enabling triggers for TARGETDEVICEMODEL...
alter table TARGETDEVICEMODEL enable all triggers;
set feedback on
set define on
prompt Done.
