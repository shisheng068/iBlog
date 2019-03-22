ALTER TABLE `iblog`.`iblog_permission` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
INSERT INTO `iblog`.`iblog_permission` (`permissionid`, `permissionname`, `sn`, `state`, `showsysmenu`, `parentid`, `menuicon`, `menuurl`, `priority`) VALUES ('1', '首页', 'homepageNav', '1', '1', '0', 'am-icon-home', '/login/login.do', '9999');
INSERT INTO `iblog`.`iblog_permission` (`permissionid`, `permissionname`, `sn`, `state`, `showsysmenu`, `parentid`, `menuicon`, `menuurl`, `priority`) VALUES ('2', '文章', 'articleNav', '1', '1', '0', 'am-icon-file-text', 'http://www.baidu.com', '9998');
INSERT INTO `iblog`.`iblog_permission` (`permissionid`, `permissionname`, `sn`, `state`, `showsysmenu`, `parentid`, `menuicon`, `menuurl`, `priority`) VALUES ('3', '相册', 'albumNav', '1', '1', '0', 'am-icon-camera', 'http://www.baidu.com', '9997');
INSERT INTO `iblog`.`iblog_permission` (`permissionid`, `permissionname`, `sn`, `state`, `showsysmenu`, `parentid`, `menuicon`, `menuurl`, `priority`) VALUES ('4', '留言板', 'msgBoardNav', '1', '1', '0', 'am-icon-list', 'http://www.baidu.com', '9996');
INSERT INTO `iblog`.`iblog_permission` (`permissionid`, `permissionname`, `sn`, `state`, `showsysmenu`, `parentid`, `menuicon`, `menuurl`, `priority`) VALUES ('5', '个人中心', 'myCenterNav', '1', '1', '0', 'am-icon-cog', null, '9995');
INSERT INTO `iblog`.`iblog_permission` (`permissionid`, `permissionname`, `sn`, `state`, `showsysmenu`, `parentid`, `menuicon`, `menuurl`, `priority`) VALUES ('6', '个人信息', 'mySettingNav', '1', '1', '5', 'am-icon-info-circle', '/backer/myUserSetting', '9999');
INSERT INTO `iblog`.`iblog_permission` (`permissionid`, `permissionname`, `sn`, `state`, `showsysmenu`, `parentid`, `menuicon`, `menuurl`, `priority`) VALUES ('7', '修改密码', 'changePasswordNav', '1', '1', '5', 'am-icon-lock', 'http://www.baidu.com', '9998');

INSERT INTO `iblog`.`iblog_permission` (`permissionid`, `permissionname`, `sn`, `state`, `showsysmenu`, `parentid`, `menuicon`, `menuurl`, `priority`) VALUES ('8', '系统管理', 'sysSettingNav', '1', '1', '0', 'am-icon-cog', null, '9994');
INSERT INTO `iblog`.`iblog_permission` (`permissionid`, `permissionname`, `sn`, `state`, `showsysmenu`, `parentid`, `menuicon`, `menuurl`, `priority`) VALUES ('9', '用户管理', 'userMgrNav', '1', '1', '8', 'am-icon-lock', 'http://www.baidu.com', '9999');
INSERT INTO `iblog`.`iblog_permission` (`permissionid`, `permissionname`, `sn`, `state`, `showsysmenu`, `parentid`, `menuicon`, `menuurl`, `priority`) VALUES ('10', '角色管理', 'roleMgrNav', '1', '1', '8', 'am-icon-lock', 'http://www.baidu.com', '9998');
INSERT INTO `iblog`.`iblog_permission` (`permissionid`, `permissionname`, `sn`, `state`, `showsysmenu`, `parentid`, `menuicon`, `menuurl`, `priority`) VALUES ('11', '权限管理', 'pemissionMgrNav', '1', '1', '8', 'am-icon-lock', 'http://www.baidu.com', '9997');

ALTER TABLE `iblog`.`iblog_role` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
INSERT INTO `iblog`.`iblog_role` (`roleid`, `rolename`, `rolecode`, `state`, `introduce`) VALUES ('1', '超级管理员', 'admin', '1', '超级管理员，拥有绝对权限');

ALTER TABLE `iblog`.`iblog_rolepemission` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('1', '1', '1');
INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('2', '1', '2');
INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('3', '1', '3');
INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('4', '1', '4');
INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('5', '1', '5');
INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('6', '1', '6');
INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('7', '1', '7');
INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('8', '1', '8');
INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('9', '1', '9');
INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('10', '1', '10');
INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('11', '1', '11');

ALTER TABLE `iblog`.`iblog_userrole` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
INSERT INTO `iblog`.`iblog_userrole` (`userroleid`, `userid`, `roleid`) VALUES ('1', '1', '1');

INSERT INTO `iblog`.`iblog_role` (`roleid`, `rolename`, `rolecode`, `state`, `introduce`) VALUES ('2', '所有人都有权限', 'alluser', '1', '所有人都拥有的菜单权限');

INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('12', '2', '1');
INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('13', '2', '2');
INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('14', '2', '3');
INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('15', '2', '4');
INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('16', '2', '5');
INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('17', '2', '6');
INSERT INTO `iblog`.`iblog_rolepemission` (`rolepemissionid`, `roleid`, `permissionid`) VALUES ('18', '2', '7');