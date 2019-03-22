/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/6/12 22:38:53                           */
/*==============================================================*/
drop table if exists iblog_articlelable;

drop table if exists iblog_lable;

drop table if exists iblog_rolepemission;

drop table if exists iblog_permission;

drop table if exists iblog_userrole;

drop table if exists iblog_role;

drop table if exists iblog_log;

drop table if exists iblog_letter;

drop table if exists iblog_reply;

drop table if exists iblog_article;

drop table if exists iblog_config;

drop table if exists iblog_user;


/*==============================================================*/
/* Table: iblog_article                                         */
/*==============================================================*/
create table iblog_article
(
   articleid            int not null auto_increment,
   authorid             int,
   state                int not null default 0 comment '0.待发文章 1.发表文章 2.屏蔽文章',
   createtime           datetime,
   edittime             datetime,
   browse               int,
   lable                varchar(100) comment 'lableid 逗号分隔',
   title                text,
   content              text,
   primary key (articleid)
);
ALTER TABLE `iblog`.`iblog_article` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
/*==============================================================*/
/* Table: iblog_articlelable                                    */
/*==============================================================*/
create table iblog_articlelable
(
   articlelableid       int not null auto_increment,
   articleid            int,
   lableid              int,
   primary key (articlelableid)
);
ALTER TABLE `iblog`.`iblog_articlelable` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
/*==============================================================*/
/* Table: iblog_config                                          */
/*==============================================================*/
create table iblog_config
(
   configid             int not null auto_increment,
   confkey              varchar(100),
   confvalue            varchar(255),
   createtime           datetime,
   edittime             datetime,
   remark               text,
   primary key (configid)
);
ALTER TABLE `iblog`.`iblog_config` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
/*==============================================================*/
/* Index: Index_config_key                                      */
/*==============================================================*/
create unique index Index_config_key on iblog_config
(
   confkey
);

/*==============================================================*/
/* Table: iblog_lable                                           */
/*==============================================================*/
create table iblog_lable
(
   lableid              int not null auto_increment,
   lablename            varchar(100),
   parentid             int,
   sortnum              int,
   state                int not null comment '0.屏蔽标签 1.可用标签',
   primary key (lableid)
);
ALTER TABLE `iblog`.`iblog_lable` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
/*==============================================================*/
/* Table: iblog_letter                                          */
/*==============================================================*/
create table iblog_letter
(
   letterid             int not null auto_increment,
   userid               int,
   answertid            int,
   authorid             int,
   ip                   varchar(100),
   createtime           datetime,
   state                int not null default 1 comment '0.屏蔽评论  1.发表评论',
   content              text,
   primary key (letterid)
);
ALTER TABLE `iblog`.`iblog_letter` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
/*==============================================================*/
/* Table: iblog_log                                             */
/*==============================================================*/
create table iblog_log
(
   logid                int not null auto_increment,
   userid               int,
   createtime           datetime,
   optype               varchar(100),
   opobject             varchar(100),
   oplevel              int not null default 0 comment '0.调试信息 1.提示信息 2.警告信息 3.错误信息',
   content              text,
   primary key (logid)
);
ALTER TABLE `iblog`.`iblog_log` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
/*==============================================================*/
/* Table: iblog_reply                                           */
/*==============================================================*/
create table iblog_reply
(
   replyid              int not null auto_increment,
   articleid            int,
   answertid            int,
   authorid             int,
   ip                   varchar(100),
   createtime           datetime,
   state                int not null default 1 comment '0.屏蔽评论  1.发表评论',
   content              text,
   primary key (replyid)
);
ALTER TABLE `iblog`.`iblog_reply` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
/*==============================================================*/
/* Table: iblog_role                                            */
/*==============================================================*/
create table iblog_role
(
   roleid               int not null auto_increment,
   rolename             varchar(50),
   rolecode             varchar(20),
   state                int not null default 1 comment '0屏蔽 1可用',
   introduce            text,
   primary key (roleid)
);
ALTER TABLE `iblog`.`iblog_role` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
/*==============================================================*/
/* Table: iblog_rolepemission                                   */
/*==============================================================*/
create table iblog_rolepemission
(
   rolepemissionid      int not null auto_increment,
   roleid               int,
   permissionid         int,
   primary key (rolepemissionid)
);
ALTER TABLE `iblog`.`iblog_rolepemission` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
/*==============================================================*/
/* Table: iblog_user                                            */
/*==============================================================*/
create table iblog_user
(
   userid               int not null auto_increment,
   username             varchar(50),
   password             varchar(100),
   salt                 varchar(50),
   nickname             varchar(50),
   phone                varchar(30),
   email                varchar(50),
   createtime           datetime,
   loginstate           int not null default 1 comment '0.屏蔽登录   1.可登录',
   faceimgurl           varchar(200),
   primary key (userid)
);
ALTER TABLE `iblog`.`iblog_user` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
/*==============================================================*/
/* Index: Index_username                                        */
/*==============================================================*/
create unique index Index_username on iblog_user
(
   username
);

/*==============================================================*/
/* Table: iblog_userrole                                        */
/*==============================================================*/
create table iblog_userrole
(
   userroleid           int not null auto_increment,
   userid               int,
   roleid               int,
   primary key (userroleid)
);
ALTER TABLE `iblog`.`iblog_userrole` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
/*==============================================================*/
/* Table: permission                                            */
/*==============================================================*/
create table iblog_permission
(
   permissionid         int not null auto_increment,
   permissionname       varchar(100),
   sn                   varchar(20),
   state                int not null default 1 comment '0屏蔽权限  1可用权限',
   showsysmenu          int not null default 0 comment '0不展示在系统菜单中   1展示在系统菜单中',
   parentid             int,
   menuicon             varchar(200),
   menuurl              varchar(200),
   priority             int,
   primary key (permissionid)
);
ALTER TABLE `iblog`.`iblog_permission` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;

alter table iblog_article add constraint FK_authoridForArticle foreign key (authorid)
      references iblog_user (userid) on delete restrict on update restrict;

alter table iblog_articlelable add constraint FK_articleidForArticlelable foreign key (articleid)
      references iblog_article (articleid) on delete restrict on update restrict;

alter table iblog_articlelable add constraint FK_lableidForArticlelable foreign key (lableid)
      references iblog_lable (lableid) on delete restrict on update restrict;

alter table iblog_letter add constraint FK_answertidForLetter foreign key (answertid)
      references iblog_letter (letterid) on delete restrict on update restrict;

alter table iblog_letter add constraint FK_authoridForLetter foreign key (authorid)
      references iblog_user (userid) on delete restrict on update restrict;

alter table iblog_letter add constraint FK_useridForLetter foreign key (userid)
      references iblog_user (userid) on delete restrict on update restrict;

alter table iblog_log add constraint FK_useridForLog foreign key (userid)
      references iblog_user (userid) on delete restrict on update restrict;

alter table iblog_reply add constraint FK_answertidForReply foreign key (answertid)
      references iblog_reply (replyid) on delete restrict on update restrict;

alter table iblog_reply add constraint FK_articleidForReply foreign key (articleid)
      references iblog_article (articleid) on delete restrict on update restrict;

alter table iblog_reply add constraint FK_authoridForReply foreign key (authorid)
      references iblog_user (userid) on delete restrict on update restrict;

alter table iblog_rolepemission add constraint FK_pemissionidForRolePemission foreign key (permissionid)
      references iblog_permission (permissionid) on delete restrict on update restrict;

alter table iblog_rolepemission add constraint FK_roleidForRolePemission foreign key (roleid)
      references iblog_role (roleid) on delete restrict on update restrict;

alter table iblog_userrole add constraint FK_roleidForUserRole foreign key (roleid)
      references iblog_role (roleid) on delete restrict on update restrict;

alter table iblog_userrole add constraint FK_useridForUserRole foreign key (userid)
      references iblog_user (userid) on delete restrict on update restrict;

