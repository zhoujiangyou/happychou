/*
Navicat MySQL Data Transfer

Source Server         : happychou
Source Server Version : 50546
Source Host           : 192.168.12.200:3306
Source Database       : happychou

Target Server Type    : MYSQL
Target Server Version : 50546
File Encoding         : 65001

Date: 2016-04-22 17:36:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hc_ad
-- ----------------------------
DROP TABLE IF EXISTS `hc_ad`;
CREATE TABLE `hc_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) DEFAULT '0' COMMENT '广告图片',
  `url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT '0' COMMENT '广告描述',
  `type` tinyint(1) DEFAULT '0' COMMENT '广告类型 1首页幻灯片',
  `status` tinyint(4) DEFAULT '1',
  `sort` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of hc_ad
-- ----------------------------
INSERT INTO `hc_ad` VALUES ('1', '/uploads/a_1/20151229/happychou_1451377782278.png', '/User/login', '登录页面', '1', '1', '0');
INSERT INTO `hc_ad` VALUES ('2', '/uploads/a_1/20151229/happychou_1451377788767.png', '/User/login', '登录', '1', '1', '0');
INSERT INTO `hc_ad` VALUES ('3', '/uploads/a_1/20151229/happychou_1451377794277.png', 'http://www.baidu.com', '私募投2', '1', '1', '0');
INSERT INTO `hc_ad` VALUES ('4', '/uploads//20151120/happychou_1447986463234.png', 'http://www.yingkelawyer.com/', '盈科律师事务所', '2', '1', '0');
INSERT INTO `hc_ad` VALUES ('5', '/uploads//20151120/happychou_1447986490908.png', 'http://www.winteam500.com/', '瀛和律师机构', '2', '1', '0');
INSERT INTO `hc_ad` VALUES ('6', '/uploads//20151120/happychou_1447986558477.png', 'http://www.kaifund.com/', '凯富基金', '2', '1', '0');
INSERT INTO `hc_ad` VALUES ('7', '/uploads//20151120/happychou_1447986592313.png', 'http://www.jingsh.com/', '京师律师事务所', '2', '1', '0');

-- ----------------------------
-- Table structure for hc_admin_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `hc_admin_auth_group`;
CREATE TABLE `hc_admin_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(255) NOT NULL DEFAULT '',
  `describe` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='后台管理权限组';

-- ----------------------------
-- Records of hc_admin_auth_group
-- ----------------------------
INSERT INTO `hc_admin_auth_group` VALUES ('1', '超级管理员', '1', '1,13,22,66,11,3,4,5,6,7,8,9,10,12,52,53,54,55,64,65,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,57,58,60,61,71', '');

-- ----------------------------
-- Table structure for hc_admin_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `hc_admin_auth_group_access`;
CREATE TABLE `hc_admin_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台用户所属权限组';

-- ----------------------------
-- Records of hc_admin_auth_group_access
-- ----------------------------
INSERT INTO `hc_admin_auth_group_access` VALUES ('1', '1');
INSERT INTO `hc_admin_auth_group_access` VALUES ('2', '1');

-- ----------------------------
-- Table structure for hc_admin_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `hc_admin_auth_rule`;
CREATE TABLE `hc_admin_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(50) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `menu` tinyint(1) DEFAULT '0' COMMENT '0非菜单1是菜单',
  `pid` smallint(4) DEFAULT '0' COMMENT '0顶级菜单其它上级菜单ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of hc_admin_auth_rule
-- ----------------------------
INSERT INTO `hc_admin_auth_rule` VALUES ('1', 'Admin/Index/index', '后台首页', '1', '1', '', '1', '0');
INSERT INTO `hc_admin_auth_rule` VALUES ('13', 'Admin/User/index', '用户管理', '1', '1', '', '1', '0');
INSERT INTO `hc_admin_auth_rule` VALUES ('3', 'Admin/Auth/role', '角色管理', '1', '1', '', '1', '11');
INSERT INTO `hc_admin_auth_rule` VALUES ('4', 'Admin/Auth/node', '节点管理', '1', '1', '', '1', '11');
INSERT INTO `hc_admin_auth_rule` VALUES ('5', 'Admin/Auth/user', '管理员管理', '1', '1', '', '1', '11');
INSERT INTO `hc_admin_auth_rule` VALUES ('6', 'Admin/Auth/node_add', '创建节点', '1', '1', '', '0', '11');
INSERT INTO `hc_admin_auth_rule` VALUES ('7', 'Admin/Auth/node_edit', '节点编辑', '1', '1', '', '0', '11');
INSERT INTO `hc_admin_auth_rule` VALUES ('8', 'Admin/Auth/role_add', '创建角色', '1', '1', '', '0', '11');
INSERT INTO `hc_admin_auth_rule` VALUES ('9', 'Admin/Auth/role_node_select', '分配角色权限', '1', '1', '', '0', '11');
INSERT INTO `hc_admin_auth_rule` VALUES ('10', 'Admin/Auth/user_add', '管理员创建', '1', '1', '', '0', '11');
INSERT INTO `hc_admin_auth_rule` VALUES ('11', 'Admin/System/index', '系统配置', '1', '1', '', '1', '0');
INSERT INTO `hc_admin_auth_rule` VALUES ('12', 'Admin/System/uploadset', '上传配置', '1', '1', '', '1', '11');
INSERT INTO `hc_admin_auth_rule` VALUES ('14', 'Admin/News/index', '新闻资讯', '1', '1', '', '1', '0');
INSERT INTO `hc_admin_auth_rule` VALUES ('15', 'Admin/News/news_add', '创建新闻', '1', '1', '', '1', '14');
INSERT INTO `hc_admin_auth_rule` VALUES ('16', 'Admin/News/news_del', '删除新闻', '1', '1', '', '0', '14');
INSERT INTO `hc_admin_auth_rule` VALUES ('17', 'Admin/News/category', '新闻栏目', '1', '1', '', '1', '14');
INSERT INTO `hc_admin_auth_rule` VALUES ('18', 'Admin/News/category_add', '创建新闻栏目', '1', '1', '', '0', '14');
INSERT INTO `hc_admin_auth_rule` VALUES ('19', 'Admin/News/category_update', '编辑新闻栏目', '1', '1', '', '0', '14');
INSERT INTO `hc_admin_auth_rule` VALUES ('20', 'Admin/News/category_del', '删除新闻栏目', '1', '1', '', '0', '14');
INSERT INTO `hc_admin_auth_rule` VALUES ('21', 'Admin/News/news_edit', '编辑新闻', '1', '1', '', '0', '14');
INSERT INTO `hc_admin_auth_rule` VALUES ('22', 'Admin/User/user_attest', '实名认证列表', '1', '1', '', '1', '13');
INSERT INTO `hc_admin_auth_rule` VALUES ('23', 'Admin/News/page_list', '单页列表', '1', '1', '', '1', '14');
INSERT INTO `hc_admin_auth_rule` VALUES ('24', 'Admin/Item/index', '项目管理', '1', '1', '', '1', '0');
INSERT INTO `hc_admin_auth_rule` VALUES ('25', 'Admin/Item/item_add', '新增项目', '1', '1', '', '1', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('26', 'Admin/Item/item_category', '项目分类', '1', '1', '', '1', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('27', 'Admin/Item/item_category_add', '新增项目分类', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('28', 'Admin/Item/item_category_edit', '编辑项目分类', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('29', 'Admin/Item/tags', '项目标签', '1', '1', '', '1', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('30', 'Admin/Item/item_category_del', '删除项目分类', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('31', 'Admin/Item/tags_del', '标签删除', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('32', 'Admin/Item/get_category', '获取分类（Ajax）', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('33', 'Admin/Item/tags_edit', '编辑标签', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('34', 'Admin/Item/item_in', '发布项目（执行发布）', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('35', 'Admin/Item/item_in_two', '项目发布第二步', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('36', 'Admin/Item/item_in_third', '项目发布第三步', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('37', 'Admin/Item/interview', '约谈管理', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('38', 'Admin/Item/item_del', '删除项目', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('39', 'Admin/Item/item_editstatus', '修改项目进度和状态', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('40', 'Admin/Item/intervies_status', '修改约谈状态', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('41', 'Admin/Investor/interview_item', '约谈项目列表（投资人）', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('42', 'Admin/Investor/collect_item', '收藏的项目', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('43', 'Admin/Investor/with_item', '投资的项目列表', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('44', 'Admin/Investor/lead', '领投列表', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('45', 'Admin/Lead/lead_list', '读取领投规则', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('46', 'Admin/Lead/sub_lead', '修改领投规则', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('47', 'Admin/Lead/lead_user_define', '审核领投人操作', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('48', 'Admin/Lead/index', '查看领投列表（项目）', '1', '1', '', '0', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('49', 'Admin/Item/recycle', '项目回收站', '1', '1', '', '1', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('50', 'Admin/Funds/money_details', '资金明细', '1', '1', '', '1', '0');
INSERT INTO `hc_admin_auth_rule` VALUES ('51', 'Admin/Funds/makesure', '领投审核', '1', '1', '', '1', '50');
INSERT INTO `hc_admin_auth_rule` VALUES ('52', 'Admin/Auth/role_edit', '权限分配', '1', '1', '', '0', '11');
INSERT INTO `hc_admin_auth_rule` VALUES ('53', 'Admin/System/payment', '支付配置', '1', '1', '', '1', '11');
INSERT INTO `hc_admin_auth_rule` VALUES ('54', 'Admin/System/payment_set', '支付接口更新配置', '1', '1', '', '0', '11');
INSERT INTO `hc_admin_auth_rule` VALUES ('55', 'Admin/System/payment_status', '支付接口安装卸载', '1', '1', '', '0', '11');
INSERT INTO `hc_admin_auth_rule` VALUES ('56', 'Admin/Funds/withdrawals', '提现管理', '1', '1', '', '1', '50');
INSERT INTO `hc_admin_auth_rule` VALUES ('57', 'Admin/Nav/index', '网站导航', '1', '1', '', '1', '0');
INSERT INTO `hc_admin_auth_rule` VALUES ('58', 'Admin/Nav/nav_edit', '导航编辑', '1', '1', '', '0', '57');
INSERT INTO `hc_admin_auth_rule` VALUES ('59', 'Admin/Nav/nav_del', '删除菜单', '1', '1', '', '0', '57');
INSERT INTO `hc_admin_auth_rule` VALUES ('60', 'Admin/Ads/index', '相关图片管理', '1', '1', '', '1', '0');
INSERT INTO `hc_admin_auth_rule` VALUES ('61', 'Admin/Ads/ads_edit', '图片编辑', '1', '1', '', '0', '60');
INSERT INTO `hc_admin_auth_rule` VALUES ('62', 'Admin/Ads/ads_del', '删除图片', '1', '1', '', '0', '60');
INSERT INTO `hc_admin_auth_rule` VALUES ('63', 'Admin/Funds/zmlpay', '平台转账', '1', '1', '', '1', '50');
INSERT INTO `hc_admin_auth_rule` VALUES ('64', 'Admin/System/sms', '短信平台', '1', '1', '', '1', '11');
INSERT INTO `hc_admin_auth_rule` VALUES ('65', 'Admin/System/sms_config', '短信平台配置', '1', '1', '', '0', '11');
INSERT INTO `hc_admin_auth_rule` VALUES ('66', 'Admin/User/investor_attest', '投资人认证', '1', '1', '', '1', '13');
INSERT INTO `hc_admin_auth_rule` VALUES ('67', 'Admin/Questions/index', '项目问答', '1', '1', '', '1', '24');
INSERT INTO `hc_admin_auth_rule` VALUES ('71', 'Admin/FeedBack/ShowFeedBack', '用户反馈', '1', '1', '', '1', '0');

-- ----------------------------
-- Table structure for hc_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `hc_admin_user`;
CREATE TABLE `hc_admin_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `last_login_time` int(11) unsigned DEFAULT '0' COMMENT '登录时间',
  `last_login_ip` varchar(40) DEFAULT NULL COMMENT '登录IP',
  `login_count` mediumint(8) unsigned DEFAULT '0' COMMENT '登录次数',
  `login_key` varchar(255) DEFAULT NULL COMMENT '登录验证',
  `verify` varchar(32) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `update_time` int(11) unsigned DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='后台管理用户';

-- ----------------------------
-- Records of hc_admin_user
-- ----------------------------
INSERT INTO `hc_admin_user` VALUES ('1', 'admin', '超级管理员', 'a195dcea6060939cb251a69f01fee992', '1453267583', '0.0.0.0', '1138', 'a195dcea6060939cb251a69f01fee992', '8888', 'admin@admin.com', '备注信息', '1', '1445484868', '1222907803');
INSERT INTO `hc_admin_user` VALUES ('2', 'zhangliang', '张亮', 'a195dcea6060939cb251a69f01fee992', '1448438008', '192.168.12.196', '1102', '2243eaf66fbd94c0dfc8932e4f6a36bb', '8888', 'admin@admin.com', '备注信息', '1', '1445484868', '1222907803');

-- ----------------------------
-- Table structure for hc_item
-- ----------------------------
DROP TABLE IF EXISTS `hc_item`;
CREATE TABLE `hc_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '项目名称',
  `desc` text COMMENT '项目简介',
  `cid` int(10) unsigned DEFAULT '0' COMMENT '所属分类',
  `uin` int(11) NOT NULL DEFAULT '0' COMMENT '创建人UIN',
  `province` int(11) DEFAULT '0' COMMENT '项目省份',
  `city` int(11) DEFAULT '0' COMMENT '项目城市',
  `plan_file` varchar(255) DEFAULT '0' COMMENT '项目计划书',
  `cover_img` varchar(255) DEFAULT '0' COMMENT '封面图片',
  `raising_money` decimal(11,2) DEFAULT '0.00' COMMENT '融资总额',
  `has_investment` decimal(11,2) DEFAULT '0.00' COMMENT '项目方出资',
  `amount` int(11) DEFAULT '0' COMMENT '认购份数',
  `lowest_money` decimal(11,2) DEFAULT '0.00' COMMENT '最低出资金额',
  `investment_rate` int(10) DEFAULT '0' COMMENT '投资方占比',
  `project_rate` int(11) DEFAULT '0' COMMENT '项目方占比',
  `brokerage` int(11) DEFAULT '0' COMMENT '佣金比例',
  `start_time` int(11) DEFAULT '0' COMMENT '项目开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '项目结束时间',
  `payend_time` int(11) DEFAULT '0' COMMENT '支付结束时间',
  `content` text COMMENT '项目详情',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序号',
  `view` int(10) unsigned DEFAULT '0' COMMENT '浏览数',
  `attribute` int(10) DEFAULT '0' COMMENT '项目属性',
  `progress` int(10) DEFAULT '0' COMMENT '进度',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 -1 删除 0审核 1为正常',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '更新时间',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `isdel` tinyint(4) DEFAULT '0' COMMENT '0为正常1为已删除',
  `item_type` tinyint(4) DEFAULT '0' COMMENT '1:股权项目，2：产品项目',
  `invest_status` tinyint(4) DEFAULT '0' COMMENT '筹款状态，0：未确认，1：成功，2：失败',
  `left_money` int(11) DEFAULT '0' COMMENT '剩余款项',
  `weight` int(10) DEFAULT NULL COMMENT '项目权重字段',
  `detail_img` varchar(255) DEFAULT NULL COMMENT '项目详情封面',
  `report_file` varchar(255) DEFAULT NULL COMMENT '尽责报告调查表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='项目表';

-- ----------------------------
-- Records of hc_item
-- ----------------------------
INSERT INTO `hc_item` VALUES ('1', '海洋世界', '“神秘奇特的海洋世界包含诸如白鲸馆、鲨鱼馆、珊瑚礁鱼类馆、海底观光隧道等许多景观。\n嘉兆海洋城也有海洋世界。\n中国作为海洋大国，但大部分国土在内陆，通过海洋世界，可以让人们很好的了解到海洋的知识，理解海洋的全貌，更加珍惜海洋和保护海洋生物。', '1', '1', '420000', '420100', '/uploads/1/20151016/zmlcms_1444963374927.docx', '/uploads/a_1/20151127/happychou_1448603376707.jpg', '1000000.00', '100000.00', '199', '4522.61', '49', '51', '0', '1448640000', '1450972800', '0', '&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253887.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253997.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253943.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254993.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254262.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254928.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254142.png&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '0', '0', '5', '1', '1448604098', '1448604098', '0', '1', '0', '22613', '1', '/uploads/a_1/20151210/happychou_1449733052326.png', null);
INSERT INTO `hc_item` VALUES ('2', '三个爸爸', '投资三个爸爸，我们认为这是一个既有短期回报，又有大想象空间的项目，还有一个很牛逼的团队在做这个事。我们很高兴能作为领投人参与项目投资，助力公司发展。', '1', '10', '420000', '420100', '/uploads/1/20151016/zmlcms_1444965152692.docx', '/uploads/a_1/20151127/happychou_1448603376707.jpg', '2000000.00', '500000.00', '199', '7537.69', '49', '51', '0', '1449733033', '1450195200', '0', '&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735343578.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735343609.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735343621.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735343338.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735343415.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735343940.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735343436.png&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '0', '0', '5', '1', '1449735301', '1449735301', '0', '1', '0', '746231', '2', '/uploads/a_1/20151210/happychou_1449733052326.png', null);
INSERT INTO `hc_item` VALUES ('4', '中地水石', '中地水石项目', '1', '1', '420000', '420100', '/uploads//20151102/zmlcms_1446430150535.png', '/uploads/a_1/20151127/happychou_1448601186689.jpg', '1000000.00', '0.00', '10', '0.00', '70', '30', '0', '1448899200', '1449849600', '0', '&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253887.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253997.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253943.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254993.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254262.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254928.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254142.png&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '0', '0', '1', '1', '1448601174', '1448601174', '0', '1', '0', '0', '3', '/uploads/a_1/20151210/happychou_1449733052326.png', null);
INSERT INTO `hc_item` VALUES ('5', '三石科技', '三石科技，智能物流平台', '1', '1', '420000', '420100', '/uploads//20151102/zmlcms_1446430313384.png', '/uploads/a_1/20151127/happychou_1448601058276.jpg', '20000000.00', '10000000.00', '20', '500000.00', '50', '50', '0', '1448640000', '1449763200', '0', '&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253887.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253997.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253943.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254993.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254262.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254928.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254142.png&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '0', '0', '1', '1', '1448601769', '1448601769', '0', '1', '0', '0', '3', '/uploads/a_1/20151210/happychou_1449733052326.png', null);
INSERT INTO `hc_item` VALUES ('6', '悦享', '在线音乐分享', '1', '1', '420000', '420100', '/uploads//20151102/zmlcms_1446430440615.png', '/uploads/a_1/20151127/happychou_1448595389754.jpg', '3000000.00', '1000000.00', '20', '100000.00', '70', '30', '0', '1448553600', '1451404800', '0', '&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253887.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253997.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253943.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254993.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254262.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254928.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254142.png&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '0', '0', '1', '1', '1448595373', '1448595373', '0', '1', '0', '0', '4', '/uploads/a_1/20151210/happychou_1449733052326.png', null);
INSERT INTO `hc_item` VALUES ('7', 'grup 创意项目', 'grup 创意项目grup 创意项目grup 创意项目grup 创意项目grup 创意项目grup 创意项目', '1', '1', '420000', '420100', '/uploads//20151102/zmlcms_1446434212800.jpg', '/uploads/a_1/20151127/happychou_1448601932722.jpg', '20000000.00', '3000000.00', '100', '170000.00', '50', '50', '0', '1448553600', '1449676800', '0', '&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253887.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253997.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253943.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254993.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254262.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254928.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254142.png&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '0', '0', '2', '1', '1448601920', '1448601920', '0', '1', '0', '0', '4', '/uploads/a_1/20151210/happychou_1449733052326.png', null);
INSERT INTO `hc_item` VALUES ('8', '数字新媒体项目', '数字新媒体项目数字新媒体项目', '1', '1', '310000', '310200', '/uploads//20151102/zmlcms_1446434299237.jpg', '/uploads/a_1/20151127/happychou_1448603594705.jpg', '5000000.00', '2000000.00', '30', '100000.00', '50', '50', '0', '1448294400', '1448812800', '0', '&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253887.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253997.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253943.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254993.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254262.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254928.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254142.png&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '0', '0', '1', '1', '1448603583', '1448603583', '0', '1', '0', '0', '5', '/uploads/a_1/20151210/happychou_1449733052326.png', null);
INSERT INTO `hc_item` VALUES ('9', 'Glup游戏', 'Glup游戏Glup游戏Glup游戏Glup游戏', '4', '1', '120000', '120100', '/uploads//20151102/zmlcms_1446434381591.jpg', '/uploads/a_1/20151127/happychou_1448594574383.jpg', '6000000.00', '100000.00', '70', '84285.71', '40', '60', '0', '1449025636', '1452268800', '0', '&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253887.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253997.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253943.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254993.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254262.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254928.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254142.png&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '0', '0', '4', '1', '1449648911', '1449648911', '0', '1', '0', '0', '5', '/uploads/a_1/20151210/happychou_1449733052326.png', null);
INSERT INTO `hc_item` VALUES ('10', 'GUlpt Coffee', 'GUlpt CoffeeGUlpt CoffeeGUlpt CoffeeGUlpt Coffee', '1', '1', '110000', '110200', '/uploads//20151102/zmlcms_1446434454865.jpg', '/uploads/4/20151116/happychou_1447652877881.jpg', '6000000.00', '1000000.00', '100', '50000.00', '70', '30', '0', '1448294400', '1448812800', '0', '&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253887.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253997.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253943.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254993.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254262.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254928.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254142.png&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '0', '0', '1', '1', '1447652868', '1447652868', '0', '1', '0', '0', '5', '/uploads/a_1/20151210/happychou_1449733052326.png', null);
INSERT INTO `hc_item` VALUES ('11', '蘑菇先生', '蘑菇先生，分享好玩的新生事物', '2', '10', '120000', '120200', '/uploads//20151102/zmlcms_1446434612365.png', '/uploads/4/20151116/happychou_1447652778644.jpg', '1000000.00', '200000.00', '20', '40000.00', '70', '30', '0', '1447652766', '1447776000', '0', '&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253887.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253997.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253943.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254993.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254262.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254928.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254142.png&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '0', '0', '1', '1', '1447652768', '1447652768', '0', '1', '0', '760000', '5', '/uploads/a_1/20151210/happychou_1449733052326.png', null);
INSERT INTO `hc_item` VALUES ('35', '测试啊测试', '测试啊测试', '1', '26', '110000', '110100', '/uploads/26/20160118/happychou_1453102825429.docx', '/uploads/26/20160118/happychou_1453102683182.jpg', '1000000.00', '10.00', '100', '9999.90', '95', '5', '5', '1453100618', '1453187020', '0', '&lt;embed id=&quot;xunlei_com_thunder_helper_plugin_d462f475-c18e-46be-bd10-327458d045bd&quot; type=&quot;application/thunder_download_plugin&quot; height=&quot;0&quot; width=&quot;0&quot;/&gt;测试啊测试', '0', '0', '0', '0', '0', '1453102249', '1453102249', '0', '1', '0', '0', null, '/uploads/26/20160113/happychou_1452690064738.jpg', null);
INSERT INTO `hc_item` VALUES ('36', '123', '123123', '1', '3', '130000', '130200', '/uploads/a_1/20160118/happychou_1453120297263.doc', '/uploads/3/20151109/happychou_1447054028502.jpg', '123123.00', '0.00', '1', '123123.00', '0', '0', '5', '1453121078', '1455713078', '0', '&lt;p&gt;123123&lt;/p&gt;', '0', '0', '0', '0', '1', '1453121734', '1453121734', '0', '1', '0', '0', '1', null, null);
INSERT INTO `hc_item` VALUES ('37', 'xiangmu', 'asdasdasd', '2', '3', '130000', '130200', '0', '/uploads/3/20151109/happychou_1447054028502.jpg', '20.00', '0.00', '1', '20.00', '0', '0', '5', '0', '0', '0', '&lt;p&gt;qweqweqwe&lt;/p&gt;', '0', '0', '0', '0', '0', '1453254338', '1453254338', '0', '1', '0', '0', null, '/uploads/3/20151109/happychou_1447054028502.jpg', '/uploads/3/20160120/happychou_1453258785786.doc');
INSERT INTO `hc_item` VALUES ('33', '1111', '123123', '1', '10', '120000', '120100', '0', '/uploads/10/20151207/happychou_1449493643205.png', '123123123.00', '123.00', '123', '1001000.00', '99', '1', '1', '1450281600', '1451025918', '0', '&lt;p&gt;q&amp;#39;w&amp;#39;q&amp;#39;w&amp;#39;q&amp;#39;w&lt;/p&gt;', '0', '0', '0', '0', '0', '1450248521', '1450248521', '1', '1', '0', '0', '3', null, null);
INSERT INTO `hc_item` VALUES ('34', '16年测试', '请问请问请问', '1', '10', '420000', '420100', '/uploads/10/20160111/happychou_1452498998808.png', '/uploads/10/20151207/happychou_1449492131183.png', '2000002.00', '2.00', '1000', '2000.00', '95', '5', '1', '1452528000', '1454054113', '0', '&lt;p&gt;我企鹅去玩儿去玩儿&lt;/p&gt;', '0', '0', '0', '0', '0', '1452499517', '1452499517', '0', '1', '0', '1998000', '1', '/uploads/10/20151207/happychou_1449451022785.jpg', null);
INSERT INTO `hc_item` VALUES ('19', '范文芳', '千万人前往热情为人', '1', '4', '140000', '140200', '/uploads/4/20151130/happychou_1448854497766.jpg', '/uploads/4/20151130/happychou_1448854390384.jpg', '500000.00', '10000.00', '50', '9800.00', '50', '50', '1', '1448812800', '1449286222', '0', '&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253887.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253997.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735253943.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254993.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254262.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254928.jpg&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/a_1/20151210/happychou_1449735254142.png&quot; style=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '0', '0', '4', '1', '1450258111', '1450258111', '0', '1', '0', '0', '5', '/uploads/a_1/20151210/happychou_1449733052326.png', null);
INSERT INTO `hc_item` VALUES ('38', 'qweqwe', 'qweqwe', '1', '3', '130000', '130200', '0', '/uploads/3/20160120/happychou_1453259239709.png', '2222.00', '0.00', '2', '1111.00', '0', '0', '5', '0', '0', '0', '&lt;p&gt;qweqweqweqwe&lt;/p&gt;', '0', '0', '0', '0', '0', '1453259222', '1453259222', '0', '1', '0', '0', null, '/uploads/3/20160120/happychou_1453259251417.jpg', '/uploads/3/20160120/happychou_1453259276409.doc');
INSERT INTO `hc_item` VALUES ('39', 'qweqwe', 'qweqwe', '1', '3', '120000', '120100', '/uploads/3/20160120/happychou_1453259824467.doc', '/uploads/3/20151109/happychou_1447054028502.jpg', '222222.00', '0.00', '3', '74074.00', '0', '0', '5', '0', '0', '0', '&lt;p&gt;qweqweweqweqweqe&lt;/p&gt;', '0', '0', '0', '0', '0', '1453259540', '1453259540', '0', '1', '0', '0', null, '/uploads/3/20151109/happychou_1447054028502.jpg', '/uploads/3/20160120/happychou_1453259828585.doc');
INSERT INTO `hc_item` VALUES ('40', '11', '11', '1', '28', '130000', '130400', '/uploads/28/20160201/happychou_1454316929521.png', '/uploads/28/20160201/happychou_1454316315846.png', '11111.00', '0.00', '0', '0.00', '0', '0', '1', '1455465600', '1455612286', '0', '&lt;p&gt;&amp;lt;script&amp;gt;alert()&amp;lt;script&amp;gt;&lt;br/&gt;&lt;/p&gt;', '0', '0', '0', '0', '0', '1454316969', '1454316969', '0', '1', '0', '0', null, '/uploads/28/20160201/happychou_1454316431308.png', null);

-- ----------------------------
-- Table structure for hc_item_answers
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_answers`;
CREATE TABLE `hc_item_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uin` int(11) DEFAULT '0' COMMENT '回答人',
  `content` text COMMENT '回答内容',
  `time` int(10) DEFAULT '0' COMMENT '回答时间',
  `qid` int(11) DEFAULT '0' COMMENT '问题id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='项目问答回复表';

-- ----------------------------
-- Records of hc_item_answers
-- ----------------------------
INSERT INTO `hc_item_answers` VALUES ('3', '4', '就是这个回复，就是这个味!', '1447993479', '2');
INSERT INTO `hc_item_answers` VALUES ('5', '3', '再添加一次总是可以的撒!', '1447993627', '2');
INSERT INTO `hc_item_answers` VALUES ('6', '5', '123123123', '1448858375', '8');
INSERT INTO `hc_item_answers` VALUES ('7', '4', '测试回复内容', '1449565492', '13');
INSERT INTO `hc_item_answers` VALUES ('8', '10', '123123', '1449649207', '11');
INSERT INTO `hc_item_answers` VALUES ('4', null, '123', '1449723969', '0');
INSERT INTO `hc_item_answers` VALUES ('9', '4', '额呵呵呵 ', '1452561190', '16');

-- ----------------------------
-- Table structure for hc_item_category
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_category`;
CREATE TABLE `hc_item_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '分类名称',
  `sort` int(10) DEFAULT '0' COMMENT '排序号',
  `pid` int(10) DEFAULT '0' COMMENT '上级ID',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned DEFAULT '0' COMMENT '创建时间',
  `img` varchar(11) NOT NULL DEFAULT '0' COMMENT '栏目图片',
  `limit` int(10) DEFAULT '0' COMMENT '显示多少条',
  `status` tinyint(1) DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='项目分类';

-- ----------------------------
-- Records of hc_item_category
-- ----------------------------
INSERT INTO `hc_item_category` VALUES ('1', '科技', '0', '0', '1447652700', '1444962951', '0', '10', '1', '创意众筹', '创意众筹', '创意众筹');
INSERT INTO `hc_item_category` VALUES ('2', '医疗', '0', '0', '1447652707', '1446796762', '0', '10', '1', '科技类众筹', '科技类众筹', '科技类众筹');
INSERT INTO `hc_item_category` VALUES ('3', '知识产权', '0', '0', '1447652707', '1447652719', '0', '10', '1', '', '', '');
INSERT INTO `hc_item_category` VALUES ('4', '生鲜电商', '0', '0', '1447652707', '1447652737', '0', '10', '1', '', '', '');
INSERT INTO `hc_item_category` VALUES ('5', 'O2O', '0', '0', '1447652707', '1447652707', '0', '10', '1', '创意众筹', '创意众筹', '创意众筹');
INSERT INTO `hc_item_category` VALUES ('6', '企业服务', '0', '0', '1447652707', '1447652707', '0', '10', '1', '创意众筹', '创意众筹', '创意众筹');
INSERT INTO `hc_item_category` VALUES ('7', '在线教育', '0', '0', '1447652707', '1447652707', '0', '10', '1', '创意众筹', '创意众筹', '创意众筹');
INSERT INTO `hc_item_category` VALUES ('8', '互联网金融', '0', '0', '1447652707', '1447652707', '0', '10', '1', '创意众筹', '创意众筹', '创意众筹');

-- ----------------------------
-- Table structure for hc_item_collect
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_collect`;
CREATE TABLE `hc_item_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) DEFAULT '0' COMMENT '项目id',
  `uin` int(11) DEFAULT '0' COMMENT '收藏人',
  `type` int(11) DEFAULT '1' COMMENT '项目类型，1：股权项目，2产品项目',
  `time` int(10) DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='用户收藏项目表';

-- ----------------------------
-- Records of hc_item_collect
-- ----------------------------
INSERT INTO `hc_item_collect` VALUES ('1', '2', '1', '1', '1445066030');
INSERT INTO `hc_item_collect` VALUES ('2', '1', '1', '1', '1445132188');
INSERT INTO `hc_item_collect` VALUES ('25', '1', '4', '1', '1448857661');
INSERT INTO `hc_item_collect` VALUES ('4', '2', '3', '1', '1447665119');
INSERT INTO `hc_item_collect` VALUES ('5', '9', '4', '1', '1447722371');
INSERT INTO `hc_item_collect` VALUES ('21', '13', '3', '2', '1448528758');
INSERT INTO `hc_item_collect` VALUES ('39', '7', '10', '1', '1450867886');
INSERT INTO `hc_item_collect` VALUES ('26', '19', '4', '1', '1448858525');
INSERT INTO `hc_item_collect` VALUES ('27', '19', '10', '1', '1449108285');
INSERT INTO `hc_item_collect` VALUES ('38', '1', '10', '1', '1450176620');
INSERT INTO `hc_item_collect` VALUES ('29', '2', '10', '1', '1449315977');
INSERT INTO `hc_item_collect` VALUES ('30', '2', '4', '1', '1449563062');
INSERT INTO `hc_item_collect` VALUES ('31', '5', '10', '1', '1449629154');
INSERT INTO `hc_item_collect` VALUES ('32', '7', '4', '1', '1449725003');
INSERT INTO `hc_item_collect` VALUES ('33', '8', '4', '1', '1449725033');
INSERT INTO `hc_item_collect` VALUES ('34', '11', '4', '1', '1449725076');
INSERT INTO `hc_item_collect` VALUES ('35', '10', '4', '1', '1449725246');
INSERT INTO `hc_item_collect` VALUES ('36', '13', '4', '1', '1449725292');
INSERT INTO `hc_item_collect` VALUES ('37', '6', '4', '1', '1449825375');
INSERT INTO `hc_item_collect` VALUES ('40', '1', '18', '1', '1451529610');
INSERT INTO `hc_item_collect` VALUES ('41', '10', '3', '1', '1452138859');

-- ----------------------------
-- Table structure for hc_item_events
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_events`;
CREATE TABLE `hc_item_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL DEFAULT '0' COMMENT '项目id',
  `content` text COMMENT '内容',
  `time` int(11) DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='项目动态，大事记';

-- ----------------------------
-- Records of hc_item_events
-- ----------------------------
INSERT INTO `hc_item_events` VALUES ('3', '13', '我们的全新股权众筹平台要上线啦', '1448640000');
INSERT INTO `hc_item_events` VALUES ('2', '13', '开始测试啦', '1448640000');
INSERT INTO `hc_item_events` VALUES ('5', '11', '123123123', '1450886400');
INSERT INTO `hc_item_events` VALUES ('6', '2', '测试大纪事', '1450713600');
INSERT INTO `hc_item_events` VALUES ('7', '2', '大纪事第二单', '1451491200');

-- ----------------------------
-- Table structure for hc_item_interview
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_interview`;
CREATE TABLE `hc_item_interview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uin` int(11) DEFAULT '0' COMMENT '申请人',
  `itemid` int(11) DEFAULT '0' COMMENT '项目id',
  `content` text COMMENT '约谈内容',
  `status` tinyint(1) DEFAULT '0' COMMENT '0待处理，1已经约谈，2拒绝约谈',
  `time` int(10) DEFAULT '0' COMMENT '约谈时间',
  `yuetan_contact_user` varchar(255) DEFAULT NULL COMMENT '约谈人',
  `yuetan_contact` varchar(255) DEFAULT NULL COMMENT '约谈内容',
  `yuetan_location` varchar(255) DEFAULT NULL COMMENT '约谈地点',
  `yuetan_time` varchar(255) DEFAULT NULL COMMENT '约谈时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='项目约谈表';

-- ----------------------------
-- Records of hc_item_interview
-- ----------------------------
INSERT INTO `hc_item_interview` VALUES ('1', '1', '2', '约一下', '1', '1445066020', null, null, null, null);
INSERT INTO `hc_item_interview` VALUES ('2', '4', '19', '12312123', '1', '1447722368', null, null, null, null);
INSERT INTO `hc_item_interview` VALUES ('3', '4', '19', '123123', '2', '1448858529', null, null, null, null);
INSERT INTO `hc_item_interview` VALUES ('4', '4', '2', '123', '1', '1449662926', null, null, null, null);
INSERT INTO `hc_item_interview` VALUES ('5', '10', '1', '1.其实就是这个  关于这个内容的详细说法', '0', '1450176617', null, null, null, null);
INSERT INTO `hc_item_interview` VALUES ('6', '10', '11', '123', '2', '1450177839', null, null, null, null);
INSERT INTO `hc_item_interview` VALUES ('7', '4', '2', 'wer1234r34t234', '2', '1450257643', null, null, null, null);
INSERT INTO `hc_item_interview` VALUES ('8', '10', '34', '123', '0', '1452576754', null, null, null, null);
INSERT INTO `hc_item_interview` VALUES ('9', '25', '34', '123', '0', '1452576831', null, null, null, null);

-- ----------------------------
-- Table structure for hc_item_lead
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_lead`;
CREATE TABLE `hc_item_lead` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) DEFAULT '0' COMMENT '项目id',
  `manage_money` decimal(10,2) DEFAULT '0.00' COMMENT '领投人管理服务费',
  `manage_rate` smallint(2) DEFAULT '0' COMMENT '领头人收益比',
  `num` tinyint(1) DEFAULT '0' COMMENT '领头人数量',
  `do_what` text COMMENT '领头人需要做什么',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='项目领投表';

-- ----------------------------
-- Records of hc_item_lead
-- ----------------------------
INSERT INTO `hc_item_lead` VALUES ('1', '1', '2000000.00', '0', '50', '好多事情要做！！');
INSERT INTO `hc_item_lead` VALUES ('2', '2', '10000.00', '0', '50', '为王菲王菲');
INSERT INTO `hc_item_lead` VALUES ('3', '23', '123123.00', '0', '123', '123');
INSERT INTO `hc_item_lead` VALUES ('4', '19', '12.00', '0', '4', '123123123');
INSERT INTO `hc_item_lead` VALUES ('5', '20', '123.00', '0', '12', '123123');
INSERT INTO `hc_item_lead` VALUES ('6', '34', '200.00', '0', '2', 'suibian gamidna ');

-- ----------------------------
-- Table structure for hc_item_lead_user
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_lead_user`;
CREATE TABLE `hc_item_lead_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) DEFAULT '0' COMMENT '项目id',
  `uin` int(11) DEFAULT '0' COMMENT '申请领头人uin',
  `status` tinyint(1) DEFAULT '0' COMMENT '默认0 未审核',
  `user_desc` text COMMENT '领投用户简介',
  `time` int(10) DEFAULT '0' COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='领投用户信息';

-- ----------------------------
-- Records of hc_item_lead_user
-- ----------------------------
INSERT INTO `hc_item_lead_user` VALUES ('1', '2', '1', '1', '你好，我要领投', '1445065811');
INSERT INTO `hc_item_lead_user` VALUES ('2', '2', '10', '1', '123123', '1449220547');
INSERT INTO `hc_item_lead_user` VALUES ('5', '19', '4', '0', 't34y5345y', '1449642049');
INSERT INTO `hc_item_lead_user` VALUES ('6', '1', '4', '0', '慰问费', '1449735537');
INSERT INTO `hc_item_lead_user` VALUES ('7', '1', '10', '0', '就是任性', '1450176510');
INSERT INTO `hc_item_lead_user` VALUES ('8', '1', '10', '0', '就是任性', '1450176512');
INSERT INTO `hc_item_lead_user` VALUES ('9', '2', '4', '1', '123123', '1450324554');

-- ----------------------------
-- Table structure for hc_item_list
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_list`;
CREATE TABLE `hc_item_list` (
  `id` int(10) DEFAULT NULL COMMENT '省份邮政编码',
  `name` varchar(255) DEFAULT NULL COMMENT '省份列表名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_item_list
-- ----------------------------
INSERT INTO `hc_item_list` VALUES ('110000', '北京');
INSERT INTO `hc_item_list` VALUES ('310000', '上海');
INSERT INTO `hc_item_list` VALUES ('120000', '天津');
INSERT INTO `hc_item_list` VALUES ('500000', '重庆');
INSERT INTO `hc_item_list` VALUES ('510000', '广东');
INSERT INTO `hc_item_list` VALUES ('420000', '湖北');
INSERT INTO `hc_item_list` VALUES ('440300', '深圳');
INSERT INTO `hc_item_list` VALUES ('320000', '江苏');
INSERT INTO `hc_item_list` VALUES ('330000', '浙江');
INSERT INTO `hc_item_list` VALUES ('510000', '四川');
INSERT INTO `hc_item_list` VALUES ('370000', '山东');
INSERT INTO `hc_item_list` VALUES ('350000', '福建');
INSERT INTO `hc_item_list` VALUES ('430000', '湖南');

-- ----------------------------
-- Table structure for hc_item_log
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_log`;
CREATE TABLE `hc_item_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL COMMENT '跟进内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='项目进行日志';

-- ----------------------------
-- Records of hc_item_log
-- ----------------------------
INSERT INTO `hc_item_log` VALUES ('1', '1', '1444963641', '项目已被芝麻乐开源众筹系统审核通过');
INSERT INTO `hc_item_log` VALUES ('2', '1', '1444963992', '项目进入预热展示');
INSERT INTO `hc_item_log` VALUES ('3', '2', '1444965235', '项目已被芝麻乐开源众筹系统审核通过');
INSERT INTO `hc_item_log` VALUES ('4', '1', '1444967087', '项目进入项目路演');
INSERT INTO `hc_item_log` VALUES ('5', '1', '1444967093', '项目进入项目考察');
INSERT INTO `hc_item_log` VALUES ('6', '1', '1444967103', '项目进入融资对接');
INSERT INTO `hc_item_log` VALUES ('7', '1', '1444967343', '项目进入融资成功');
INSERT INTO `hc_item_log` VALUES ('8', '2', '1444967776', '项目进入预热展示');
INSERT INTO `hc_item_log` VALUES ('9', '2', '1445132610', '项目进入项目路演');
INSERT INTO `hc_item_log` VALUES ('10', '2', '1445132617', '项目进入项目考察');
INSERT INTO `hc_item_log` VALUES ('11', '2', '1445132624', '项目进入融资对接');
INSERT INTO `hc_item_log` VALUES ('12', '4', '1446430173', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('13', '4', '1446430182', '项目进入预热展示');
INSERT INTO `hc_item_log` VALUES ('14', '5', '1446430339', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('15', '5', '1446430348', '项目进入预热展示');
INSERT INTO `hc_item_log` VALUES ('16', '6', '1446430463', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('17', '6', '1446430468', '项目进入预热展示');
INSERT INTO `hc_item_log` VALUES ('18', '7', '1446434224', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('19', '7', '1446434229', '项目进入预热展示');
INSERT INTO `hc_item_log` VALUES ('20', '7', '1446434236', '项目进入项目路演');
INSERT INTO `hc_item_log` VALUES ('21', '8', '1446434306', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('22', '8', '1446434311', '项目进入预热展示');
INSERT INTO `hc_item_log` VALUES ('23', '9', '1446434389', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('24', '9', '1446434394', '项目进入预热展示');
INSERT INTO `hc_item_log` VALUES ('25', '10', '1446434462', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('26', '10', '1446434469', '项目进入预热展示');
INSERT INTO `hc_item_log` VALUES ('27', '11', '1446434619', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('28', '11', '1446434624', '项目进入预热展示');
INSERT INTO `hc_item_log` VALUES ('29', '13', '1447126126', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('30', '13', '1447139322', '项目进入预热展示');
INSERT INTO `hc_item_log` VALUES ('31', '13', '1447207564', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('32', '12', '1447208986', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('33', '12', '1447208995', '项目进入预热展示');
INSERT INTO `hc_item_log` VALUES ('34', '13', '1447233740', '项目进入项目路演');
INSERT INTO `hc_item_log` VALUES ('35', '15', '1447405474', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('36', '14', '1447642203', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('37', '14', '1447642219', '项目进入预热展示');
INSERT INTO `hc_item_log` VALUES ('38', '9', '1447721990', '项目进入项目路演');
INSERT INTO `hc_item_log` VALUES ('39', '9', '1447722012', '项目进入融资对接');
INSERT INTO `hc_item_log` VALUES ('40', '9', '1447722202', '项目进入实体考察');
INSERT INTO `hc_item_log` VALUES ('41', '17', '1447722907', '项目进入预热展示');
INSERT INTO `hc_item_log` VALUES ('42', '16', '1447741800', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('43', '19', '1448854543', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('44', '19', '1448854560', '项目进入预热展示');
INSERT INTO `hc_item_log` VALUES ('45', '19', '1448858112', '项目进入项目路演');
INSERT INTO `hc_item_log` VALUES ('46', '19', '1448858118', '项目进入融资对接');
INSERT INTO `hc_item_log` VALUES ('47', '19', '1448858146', '项目进入实体考察');
INSERT INTO `hc_item_log` VALUES ('48', '2', '1449649000', '项目进入融资成功');
INSERT INTO `hc_item_log` VALUES ('49', '28', '1449733441', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('50', '31', '1450167912', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('51', '31', '1450167923', '项目进入预热展示');
INSERT INTO `hc_item_log` VALUES ('52', '34', '1452499048', '项目已被悦筹审核通过');
INSERT INTO `hc_item_log` VALUES ('53', '34', '1452586556', '项目进入预热展示');
INSERT INTO `hc_item_log` VALUES ('54', '36', '1453120305', '项目已被悦筹审核通过');

-- ----------------------------
-- Table structure for hc_item_news
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_news`;
CREATE TABLE `hc_item_news` (
  `news_title` varchar(255) DEFAULT NULL COMMENT '股权项目详情新闻标题',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_content` varchar(255) DEFAULT NULL COMMENT '股权项目详情新闻内容',
  `news_time` varchar(255) DEFAULT NULL COMMENT '股权项目详情 新闻发布时间',
  `itemid` int(11) DEFAULT NULL COMMENT '股权项目 id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_item_news
-- ----------------------------
INSERT INTO `hc_item_news` VALUES ('哈哈哈 123123', '4', '这就是一个测试数据', '1449801837', '13');
INSERT INTO `hc_item_news` VALUES ('xinwen ceshi ', '5', 'hahahahhah', '1449806339', '11');
INSERT INTO `hc_item_news` VALUES ('新闻测试', '6', '明天来加班么', '1450886400', '2');

-- ----------------------------
-- Table structure for hc_item_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_pay_log`;
CREATE TABLE `hc_item_pay_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `money` decimal(20,2) NOT NULL,
  `create_time` int(11) NOT NULL,
  `log_info` text NOT NULL,
  `comissions` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '佣金',
  PRIMARY KEY (`id`),
  KEY `deal_id` (`item_id`),
  KEY `create_time` (`create_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='项目支持金额发放记录';

-- ----------------------------
-- Records of hc_item_pay_log
-- ----------------------------

-- ----------------------------
-- Table structure for hc_item_progress
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_progress`;
CREATE TABLE `hc_item_progress` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `name` varchar(255) DEFAULT '0' COMMENT '进度名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='项目进度名称';

-- ----------------------------
-- Records of hc_item_progress
-- ----------------------------
INSERT INTO `hc_item_progress` VALUES ('1', '预热展示');
INSERT INTO `hc_item_progress` VALUES ('2', '项目路演');
INSERT INTO `hc_item_progress` VALUES ('3', '融资对接');
INSERT INTO `hc_item_progress` VALUES ('4', '实体考察');
INSERT INTO `hc_item_progress` VALUES ('5', '融资成功');
INSERT INTO `hc_item_progress` VALUES ('6', '项目启动');
INSERT INTO `hc_item_progress` VALUES ('7', '市场运营');
INSERT INTO `hc_item_progress` VALUES ('8', '项目分红');
INSERT INTO `hc_item_progress` VALUES ('10', '准备上线');

-- ----------------------------
-- Table structure for hc_item_prove
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_prove`;
CREATE TABLE `hc_item_prove` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT '0' COMMENT '链接',
  `remark` varchar(128) DEFAULT '0' COMMENT '证件图片备注',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `itemid` int(11) DEFAULT '0' COMMENT '项目id',
  `time` int(10) DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='项目相关证件';

-- ----------------------------
-- Records of hc_item_prove
-- ----------------------------
INSERT INTO `hc_item_prove` VALUES ('63', '/uploads/1/20151016/zmlcms_1444963362155.png', '0', '0', '1', '1448604114');
INSERT INTO `hc_item_prove` VALUES ('86', '/uploads/1/20151016/zmlcms_1444965131611.jpg', '0', '0', '2', '1449735354');
INSERT INTO `hc_item_prove` VALUES ('85', '/uploads/1/20151016/zmlcms_1444965106822.jpg', '0', '0', '2', '1449735354');
INSERT INTO `hc_item_prove` VALUES ('54', '/uploads//20151102/zmlcms_1446430146934.png', '0', '0', '4', '1448601194');
INSERT INTO `hc_item_prove` VALUES ('56', '/uploads//20151102/zmlcms_1446430307202.png', '0', '0', '5', '1448601772');
INSERT INTO `hc_item_prove` VALUES ('46', '/uploads//20151102/zmlcms_1446430436427.png', '0', '0', '6', '1448595418');
INSERT INTO `hc_item_prove` VALUES ('57', '/uploads//20151102/zmlcms_1446434209907.jpg', '0', '0', '7', '1448601935');
INSERT INTO `hc_item_prove` VALUES ('61', '/uploads//20151102/zmlcms_1446434295749.jpg', '0', '0', '8', '1448603597');
INSERT INTO `hc_item_prove` VALUES ('45', '/uploads//20151102/zmlcms_1446434378791.jpg', '0', '0', '9', '1448594580');
INSERT INTO `hc_item_prove` VALUES ('36', '/uploads//20151102/zmlcms_1446434451992.jpg', '0', '0', '10', '1447652885');
INSERT INTO `hc_item_prove` VALUES ('34', '/uploads//20151102/zmlcms_1446434608617.png', '0', '0', '11', '1447652781');
INSERT INTO `hc_item_prove` VALUES ('25', '/uploads/4/20151105/happychou_1446713093715.png', '0', '0', '12', '1447297321');
INSERT INTO `hc_item_prove` VALUES ('64', '/uploads//1/20151017/zmlcms_1445061636694.png', '0', '0', '13', '1448606786');
INSERT INTO `hc_item_prove` VALUES ('55', '/uploads/3/20151113/happychou_1447404272564.jpg', '0', '0', '14', '1448601474');
INSERT INTO `hc_item_prove` VALUES ('31', '/uploads/3/20151113/happychou_1447404272564.jpg', '0', '0', '15', '1447404917');
INSERT INTO `hc_item_prove` VALUES ('65', '/uploads/4/20151130/happychou_1448854493587.jpg', '0', '0', '19', '1448854522');
INSERT INTO `hc_item_prove` VALUES ('68', '/uploads/a_1/20151204/happychou_1449206757622.jpg', '0', '0', '20', '1449207638');
INSERT INTO `hc_item_prove` VALUES ('76', '/uploads/10/20151203/happychou_1449127968360.jpg', '0', '0', '21', '1449644861');
INSERT INTO `hc_item_prove` VALUES ('73', '/uploads/10/20151207/happychou_1449451927936.png', '0', '0', '22', '1449452969');
INSERT INTO `hc_item_prove` VALUES ('74', '/uploads/10/20151207/happychou_1449452021739.png', '0', '0', '23', '1449453281');
INSERT INTO `hc_item_prove` VALUES ('77', '/uploads/3/20151117/cut_50_50_happychou_1447755125441.jpg', '0', '0', '29', '1449727772');
INSERT INTO `hc_item_prove` VALUES ('81', '/uploads/4/20151210/happychou_1449733389765.jpg', '0', '0', '28', '1449733519');
INSERT INTO `hc_item_prove` VALUES ('82', '/uploads/3/20151119/cut_120_120_happychou_1447908601701.jpg', '0', '0', '30', '1449734249');
INSERT INTO `hc_item_prove` VALUES ('87', '/uploads/17/20151215/happychou_1450164104198.jpg', '0', '0', '31', '1450167896');
INSERT INTO `hc_item_prove` VALUES ('88', '/uploads/17/20151215/happychou_1450164104198.jpg', '0', '0', '32', '1450169776');
INSERT INTO `hc_item_prove` VALUES ('89', '/uploads/10/20151211/cut_120_120_happychou_1449825449354.jpg', '0', '0', '33', '1450248671');
INSERT INTO `hc_item_prove` VALUES ('90', '/uploads/10/20160111/happychou_1452498991394.png', '0', '0', '34', '1452499001');
INSERT INTO `hc_item_prove` VALUES ('91', '/uploads/26/20160113/happychou_1452690242722.jpg', '0', '0', '35', '1453102832');
INSERT INTO `hc_item_prove` VALUES ('92', '/uploads/26/20160113/happychou_1452690245788.jpg', '0', '0', '35', '1453102832');
INSERT INTO `hc_item_prove` VALUES ('94', '/uploads/3/20151109/happychou_1447054048846.jpg', '0', '0', '36', '1453120793');
INSERT INTO `hc_item_prove` VALUES ('95', '/uploads/3/20151022/zmlcms_1445498332791.png', '0', '0', '37', '1453258795');
INSERT INTO `hc_item_prove` VALUES ('96', '/uploads/3/20160120/happychou_1453259259456.jpg', '0', '0', '38', '1453259282');
INSERT INTO `hc_item_prove` VALUES ('97', '/uploads/3/20151109/happychou_1447054028502.jpg', '0', '0', '39', '1453259842');
INSERT INTO `hc_item_prove` VALUES ('99', '/uploads/28/20160201/happychou_1454316447985.png', '0', '0', '40', '1454316974');

-- ----------------------------
-- Table structure for hc_item_questions
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_questions`;
CREATE TABLE `hc_item_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uin` int(11) DEFAULT '0' COMMENT '发起人',
  `itemid` int(11) DEFAULT '0' COMMENT '项目id',
  `content` text COMMENT '问题内容',
  `title` varchar(255) DEFAULT '0' COMMENT '问题标题',
  `time` int(10) DEFAULT '0' COMMENT '问题时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='项目问答表';

-- ----------------------------
-- Records of hc_item_questions
-- ----------------------------
INSERT INTO `hc_item_questions` VALUES ('6', '3', '8', '提个问题试下子', '提个问题试试', '1447995111');
INSERT INTO `hc_item_questions` VALUES ('2', '3', '14', '请问项目方，这个产品什么时候开发发售', '关于项目', '1447988578');
INSERT INTO `hc_item_questions` VALUES ('3', '3', '14', '再问一个问题哈', '再问一个问题', '1447989158');
INSERT INTO `hc_item_questions` VALUES ('7', '4', '5', '456456456', '456', '1448601141');
INSERT INTO `hc_item_questions` VALUES ('8', '4', '19', '234', '23', '1448858346');
INSERT INTO `hc_item_questions` VALUES ('9', '10', '2', '123', '123', '1449221148');
INSERT INTO `hc_item_questions` VALUES ('10', '10', '21', '嗯 还好', '就是这样', '1449452711');
INSERT INTO `hc_item_questions` VALUES ('11', '10', '2', '123', '123', '1449563394');
INSERT INTO `hc_item_questions` VALUES ('12', '4', '2', ' 23日34234', '23423423', '1449564369');
INSERT INTO `hc_item_questions` VALUES ('13', '4', '2', '我是测试问题我是测试问题我是测试问题', '我是测试问题', '1449565417');
INSERT INTO `hc_item_questions` VALUES ('14', '4', '19', '23r23', '23r23', '1449641561');
INSERT INTO `hc_item_questions` VALUES ('15', '4', '13', '我测试一下提问我测试一下提问我测试一下提问', '我测试一下提问', '1449735491');
INSERT INTO `hc_item_questions` VALUES ('16', '10', '1', '就只是一个测试而已', '这事什么鬼', '1450176492');

-- ----------------------------
-- Table structure for hc_item_return
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_return`;
CREATE TABLE `hc_item_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL DEFAULT '0' COMMENT '项目id',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支持金额',
  `support_count` int(11) NOT NULL DEFAULT '0' COMMENT '支持者数量',
  `support_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支持总额',
  `description` text COMMENT '回报描述',
  `is_delivery` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否需要配送',
  `delivery_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `is_limit_user` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否限购',
  `limit_user` int(11) NOT NULL DEFAULT '0' COMMENT '限购几人',
  `repaid_day` int(11) NOT NULL DEFAULT '0' COMMENT '成功后回报天数',
  `virtual_person` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟购买人数',
  `is_share` int(11) NOT NULL DEFAULT '0' COMMENT '是否分红',
  `share_fee` int(11) NOT NULL DEFAULT '0' COMMENT '分红金额',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0：产品回报，1：无私奉献',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='产品项目回报表';

-- ----------------------------
-- Records of hc_item_return
-- ----------------------------
INSERT INTO `hc_item_return` VALUES ('7', '13', '11.00', '0', '0.00', '但是我', '0', '0.00', '0', '0', '11', '0', '0', '0', '1');
INSERT INTO `hc_item_return` VALUES ('8', '13', '11.00', '0', '0.00', '11', '0', '0.00', '0', '0', '1', '0', '0', '0', '1');
INSERT INTO `hc_item_return` VALUES ('9', '13', '12.00', '0', '0.00', '这项回报可以解决你目前的生存问题', '0', '0.00', '0', '0', '15', '3', '0', '0', '0');
INSERT INTO `hc_item_return` VALUES ('10', '13', '11.00', '1', '0.00', '这项回报可以解决你目前的生存问题，请多多关注', '0', '0.00', '1', '3', '13', '0', '0', '0', '0');
INSERT INTO `hc_item_return` VALUES ('17', '15', '100.00', '0', '0.00', '支持就有奖励', '0', '0.00', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `hc_item_return` VALUES ('15', '15', '20.00', '0', '0.00', '一个心意，送上一份祝福\n1、优先免费预定2晚床位 ，并可免费使用厨房，自由发挥厨艺，体验高原做菜的乐趣（需提前一个星期电话预约）\n2、每一个赞助者寄送总价值25元西藏风景明信片一盒及鸡血藤手镯一个\n3、将您的小头像放在客栈的赞助者区（可自由选择）', '0', '0.00', '0', '0', '10', '0', '0', '0', '0');
INSERT INTO `hc_item_return` VALUES ('16', '15', '10.00', '0', '0.00', '的士速递', '0', '0.00', '0', '0', '10', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for hc_item_return_image
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_return_image`;
CREATE TABLE `hc_item_return_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目id',
  `item_return_id` int(11) NOT NULL DEFAULT '0' COMMENT '回报项id',
  `image` varchar(50) NOT NULL DEFAULT '0' COMMENT '回报项海报',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='产品项目回报海报';

-- ----------------------------
-- Records of hc_item_return_image
-- ----------------------------
INSERT INTO `hc_item_return_image` VALUES ('1', '13', '3', '/uploads//1/20151016/cut_640_240_zmlcms_1444965106');
INSERT INTO `hc_item_return_image` VALUES ('5', '13', '7', '/uploads//1/20151016/zmlcms_1444965106822.jpg');
INSERT INTO `hc_item_return_image` VALUES ('6', '13', '8', '/uploads//1/20151016/zmlcms_1444965131611.jpg');
INSERT INTO `hc_item_return_image` VALUES ('15', '13', '9', '/uploads//1/20151016/zmlcms_1444963362155.png');
INSERT INTO `hc_item_return_image` VALUES ('22', '13', '10', '/uploads//1/20151016/zmlcms_1444965162722.jpg');
INSERT INTO `hc_item_return_image` VALUES ('19', '0', '15', '/uploads/3/20151119/cut_120_120_happychou_14479079');
INSERT INTO `hc_item_return_image` VALUES ('20', '0', '16', '/uploads/3/20151119/cut_120_120_happychou_14479079');
INSERT INTO `hc_item_return_image` VALUES ('21', '15', '17', '/uploads/3/20151120/happychou_1448004296529.jpg');

-- ----------------------------
-- Table structure for hc_item_submit
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_submit`;
CREATE TABLE `hc_item_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uin` int(11) NOT NULL DEFAULT '0' COMMENT '创业者id',
  `itemid` int(11) NOT NULL DEFAULT '0' COMMENT '项目id',
  `invest_uin` int(11) NOT NULL DEFAULT '0' COMMENT '投资人id',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '提交时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='创业者向投资人提交项目表';

-- ----------------------------
-- Records of hc_item_submit
-- ----------------------------
INSERT INTO `hc_item_submit` VALUES ('3', '10', '2', '4', '1449816856');
INSERT INTO `hc_item_submit` VALUES ('4', '4', '19', '4', '1449818366');
INSERT INTO `hc_item_submit` VALUES ('5', '4', '19', '3', '1450254695');
INSERT INTO `hc_item_submit` VALUES ('6', '4', '19', '3', '1450254720');
INSERT INTO `hc_item_submit` VALUES ('7', '4', '2', '5', '1450274427');
INSERT INTO `hc_item_submit` VALUES ('8', '3', '2', '5', '1450410925');
INSERT INTO `hc_item_submit` VALUES ('9', '3', '13', '10', '1452138904');
INSERT INTO `hc_item_submit` VALUES ('10', '10', '34', '4', '1452499208');
INSERT INTO `hc_item_submit` VALUES ('11', '10', '2', '4', '1452499211');

-- ----------------------------
-- Table structure for hc_item_tag
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_tag`;
CREATE TABLE `hc_item_tag` (
  `itemid` int(11) NOT NULL,
  `tagid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='项目标签表';

-- ----------------------------
-- Records of hc_item_tag
-- ----------------------------
INSERT INTO `hc_item_tag` VALUES ('1', '4');
INSERT INTO `hc_item_tag` VALUES ('2', '2');
INSERT INTO `hc_item_tag` VALUES ('3', '2');
INSERT INTO `hc_item_tag` VALUES ('4', '2');
INSERT INTO `hc_item_tag` VALUES ('5', '2');
INSERT INTO `hc_item_tag` VALUES ('6', '2');
INSERT INTO `hc_item_tag` VALUES ('7', '2');
INSERT INTO `hc_item_tag` VALUES ('8', '2');
INSERT INTO `hc_item_tag` VALUES ('9', '2');
INSERT INTO `hc_item_tag` VALUES ('10', '2');
INSERT INTO `hc_item_tag` VALUES ('11', '2');
INSERT INTO `hc_item_tag` VALUES ('12', '3');
INSERT INTO `hc_item_tag` VALUES ('13', '2');
INSERT INTO `hc_item_tag` VALUES ('13', '1');
INSERT INTO `hc_item_tag` VALUES ('14', '3');
INSERT INTO `hc_item_tag` VALUES ('14', '2');
INSERT INTO `hc_item_tag` VALUES ('14', '1');
INSERT INTO `hc_item_tag` VALUES ('15', '3');
INSERT INTO `hc_item_tag` VALUES ('15', '2');
INSERT INTO `hc_item_tag` VALUES ('15', '1');
INSERT INTO `hc_item_tag` VALUES ('16', '1');
INSERT INTO `hc_item_tag` VALUES ('17', '2');
INSERT INTO `hc_item_tag` VALUES ('18', '4');
INSERT INTO `hc_item_tag` VALUES ('18', '3');
INSERT INTO `hc_item_tag` VALUES ('18', '1');
INSERT INTO `hc_item_tag` VALUES ('19', '3');
INSERT INTO `hc_item_tag` VALUES ('19', '2');
INSERT INTO `hc_item_tag` VALUES ('19', '1');
INSERT INTO `hc_item_tag` VALUES ('20', '4');
INSERT INTO `hc_item_tag` VALUES ('20', '2');
INSERT INTO `hc_item_tag` VALUES ('20', '1');
INSERT INTO `hc_item_tag` VALUES ('21', '1');
INSERT INTO `hc_item_tag` VALUES ('22', '1');
INSERT INTO `hc_item_tag` VALUES ('23', '2');
INSERT INTO `hc_item_tag` VALUES ('23', '1');
INSERT INTO `hc_item_tag` VALUES ('24', '1');
INSERT INTO `hc_item_tag` VALUES ('24', '2');
INSERT INTO `hc_item_tag` VALUES ('25', '2');
INSERT INTO `hc_item_tag` VALUES ('25', '1');
INSERT INTO `hc_item_tag` VALUES ('26', '0');
INSERT INTO `hc_item_tag` VALUES ('27', '1');
INSERT INTO `hc_item_tag` VALUES ('28', '3');
INSERT INTO `hc_item_tag` VALUES ('28', '2');
INSERT INTO `hc_item_tag` VALUES ('28', '1');
INSERT INTO `hc_item_tag` VALUES ('29', '1');
INSERT INTO `hc_item_tag` VALUES ('30', '2');
INSERT INTO `hc_item_tag` VALUES ('31', '2');
INSERT INTO `hc_item_tag` VALUES ('31', '1');
INSERT INTO `hc_item_tag` VALUES ('32', '2');
INSERT INTO `hc_item_tag` VALUES ('32', '1');
INSERT INTO `hc_item_tag` VALUES ('33', '1');
INSERT INTO `hc_item_tag` VALUES ('34', '2');
INSERT INTO `hc_item_tag` VALUES ('34', '1');
INSERT INTO `hc_item_tag` VALUES ('35', '4');
INSERT INTO `hc_item_tag` VALUES ('35', '2');
INSERT INTO `hc_item_tag` VALUES ('35', '1');
INSERT INTO `hc_item_tag` VALUES ('36', '4');
INSERT INTO `hc_item_tag` VALUES ('36', '1');
INSERT INTO `hc_item_tag` VALUES ('37', '1');
INSERT INTO `hc_item_tag` VALUES ('38', '1');
INSERT INTO `hc_item_tag` VALUES ('38', '2');
INSERT INTO `hc_item_tag` VALUES ('39', '1');
INSERT INTO `hc_item_tag` VALUES ('40', '2');

-- ----------------------------
-- Table structure for hc_item_team
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_team`;
CREATE TABLE `hc_item_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL DEFAULT '0' COMMENT '项目id',
  `uin` int(11) NOT NULL DEFAULT '0' COMMENT '项目成员uid',
  `phone` varchar(250) NOT NULL DEFAULT '0' COMMENT '手机号',
  `title` varchar(300) NOT NULL DEFAULT '0' COMMENT '成员职称',
  `status` varchar(300) NOT NULL DEFAULT '0' COMMENT '是否通过请求，0：否，1：通过',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='项目团队介绍表';

-- ----------------------------
-- Records of hc_item_team
-- ----------------------------
INSERT INTO `hc_item_team` VALUES ('13', '13', '3', '18771064815', 'CTO', '0');
INSERT INTO `hc_item_team` VALUES ('15', '13', '4', '18771927650', 'CEO', '0');

-- ----------------------------
-- Table structure for hc_item_video
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_video`;
CREATE TABLE `hc_item_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) DEFAULT '0' COMMENT '项目',
  `url` varchar(255) DEFAULT '0' COMMENT '视频连接',
  `type` tinyint(1) DEFAULT '0' COMMENT '状态id',
  `time` int(10) DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='项目视频表';

-- ----------------------------
-- Records of hc_item_video
-- ----------------------------

-- ----------------------------
-- Table structure for hc_item_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_visit_log`;
CREATE TABLE `hc_item_visit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL COMMENT '项目id',
  `client_ip` varchar(255) NOT NULL COMMENT 'ip地址',
  `create_time` int(11) NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`),
  KEY `deal_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录';

-- ----------------------------
-- Records of hc_item_visit_log
-- ----------------------------

-- ----------------------------
-- Table structure for hc_item_with_order
-- ----------------------------
DROP TABLE IF EXISTS `hc_item_with_order`;
CREATE TABLE `hc_item_with_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uin` int(11) NOT NULL COMMENT '投资人UIN',
  `itemid` int(11) NOT NULL DEFAULT '0' COMMENT '项目ID',
  `item_return_id` int(11) NOT NULL DEFAULT '0' COMMENT '回报项id',
  `amount` int(11) NOT NULL DEFAULT '0' COMMENT '认购份数',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '投资资金',
  `item_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '项目费用',
  `payment_id` int(11) NOT NULL DEFAULT '0' COMMENT '支出id',
  `item_name` varchar(225) NOT NULL DEFAULT '0' COMMENT '项目名称',
  `mark` text COMMENT '备注',
  `delivery_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `consignee` varchar(225) DEFAULT NULL COMMENT '收货人',
  `zip` varchar(225) DEFAULT NULL COMMENT '邮编',
  `mobile` varchar(225) DEFAULT NULL COMMENT '手机号',
  `province` varchar(225) DEFAULT NULL COMMENT '省份',
  `city` varchar(225) DEFAULT NULL COMMENT '城市',
  `address` varchar(225) DEFAULT NULL COMMENT '详细地址',
  `is_success` varchar(225) DEFAULT NULL COMMENT '是否收货',
  `repay_time` int(11) DEFAULT NULL COMMENT '回报更新时间',
  `repay_memo` text COMMENT '回报备注，由发起人更新',
  `type` tinyint(4) DEFAULT '0' COMMENT '订单类型 0表示股权众筹 1表示产品众筹 2表示无私奉献',
  `share_fee` decimal(10,2) DEFAULT '0.00' COMMENT '分红金额',
  `share_status` decimal(10,2) DEFAULT '0.00' COMMENT '分红是否发放：0未发放，1已发',
  `status` tinyint(1) DEFAULT '1' COMMENT '0:未支付 1:已支付(过期) 2:已支付(无库存) 3:成功',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '投资时间',
  `card_holder` varchar(255) DEFAULT NULL COMMENT '账户持有人',
  `account` varchar(255) DEFAULT NULL COMMENT '账户信息',
  `bank_feedback` varchar(255) DEFAULT NULL COMMENT '银行回执信息',
  PRIMARY KEY (`id`),
  KEY `itemid` (`itemid`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='用户投资订单表';

-- ----------------------------
-- Records of hc_item_with_order
-- ----------------------------
INSERT INTO `hc_item_with_order` VALUES ('1', '1', '2', '0', '1', '7537.69', '0.00', '0', '0', '这个项目不错', '0.00', '0.00', '0.00', null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '0', '1445137730', null, null, '123123');
INSERT INTO `hc_item_with_order` VALUES ('2', '3', '2', '0', '5', '22613.07', '0.00', '33', '0', '这个项目不错', '0.00', '0.00', '0.00', null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '1450011404', '1447292115', null, null, null);
INSERT INTO `hc_item_with_order` VALUES ('3', '4', '9', '0', '60', '5057142.60', '0.00', '6', 'Glup游戏', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '0', '1447722438', null, null, null);
INSERT INTO `hc_item_with_order` VALUES ('4', '3', '13', '10', '4', '64.00', '0.00', '10', '三只松鼠', null, '0.00', null, null, null, null, null, null, null, null, null, '1', '0.00', '0.00', '1', '1448588845', '1448588755', null, null, '123123123');
INSERT INTO `hc_item_with_order` VALUES ('5', '4', '19', '0', '9', '88200.00', '0.00', '14', '范文芳', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '1449643700', '1448858157', null, null, null);
INSERT INTO `hc_item_with_order` VALUES ('6', '10', '2', '0', '151', '90452.28', '0.00', '40', '三个爸爸', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '1450862896', '1449221379', null, null, null);
INSERT INTO `hc_item_with_order` VALUES ('7', '4', '2', '0', '12', '60301.52', '0.00', '38', '三个爸爸', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '1450324560', '1449649064', '1231231', '123', null);
INSERT INTO `hc_item_with_order` VALUES ('8', '4', '1', '0', '4', '18090.44', '0.00', '26', '海洋世界', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '1449735545', '1449662521', '123123', '123', null);
INSERT INTO `hc_item_with_order` VALUES ('9', '10', '2', '0', '11', '82914.59', '0.00', '0', '三个爸爸', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '0', '1449813879', '鹅鹅鹅饿饿', '13123123123123123123123', null);
INSERT INTO `hc_item_with_order` VALUES ('10', '10', '2', '0', '1', '7537.69', '0.00', '0', '三个爸爸', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '0', '1449814186', '1111111111', '123123123123123123213', null);
INSERT INTO `hc_item_with_order` VALUES ('11', '10', '2', '0', '1', '7537.69', '0.00', '0', '三个爸爸', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '0', '1449814487', '22222222', '111111111', null);
INSERT INTO `hc_item_with_order` VALUES ('12', '10', '2', '0', '5', '37688.45', '0.00', '0', '三个爸爸', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '0', '1449814678', '213213213', '123131231', null);
INSERT INTO `hc_item_with_order` VALUES ('13', '3', '2', '0', '1', '7537.69', '0.00', '0', '三个爸爸', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '0', '1450011404', '234234', '24234', null);
INSERT INTO `hc_item_with_order` VALUES ('14', '17', '2', '0', '1', '7537.69', '0.00', '34', '三个爸爸', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '0', '1450171310', '123123', '123123', null);
INSERT INTO `hc_item_with_order` VALUES ('15', '10', '1', '0', '195', '4522.61', '0.00', '41', '海洋世界', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '1450866985', '1450176528', '周海天', '12312313213213', null);
INSERT INTO `hc_item_with_order` VALUES ('16', '10', '11', '0', '1', '40000.00', '0.00', '36', '蘑菇先生', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '0', '1450177846', '123', '123', null);
INSERT INTO `hc_item_with_order` VALUES ('17', '4', '2', '0', '3', '22613.07', '0.00', '0', '三个爸爸', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '0', '1450257664', '234234234', '234', null);
INSERT INTO `hc_item_with_order` VALUES ('18', '4', '2', '0', '1', '7537.69', '0.00', '0', '三个爸爸', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '0', '1450324560', '123123', '123123', null);
INSERT INTO `hc_item_with_order` VALUES ('19', '10', '5', '0', '20', '10000000.00', '0.00', '39', '三石科技', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '0', '1450862717', '123', '123', null);
INSERT INTO `hc_item_with_order` VALUES ('20', '10', '2', '0', '100', '753769.00', '0.00', '0', '三个爸爸', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '0', '1450862896', '123123123', '1231231', null);
INSERT INTO `hc_item_with_order` VALUES ('21', '10', '1', '0', '194', '877386.34', '0.00', '0', '海洋世界', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '0', '1450866985', '123123', '123123', null);
INSERT INTO `hc_item_with_order` VALUES ('22', '10', '7', '0', '100', '17000000.00', '0.00', '42', 'grup 创意项目', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '0', '1450867834', '123', '123', null);
INSERT INTO `hc_item_with_order` VALUES ('23', '10', '34', '0', '1', '2000.00', '0.00', '43', '16年测试', null, '0.00', null, null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '1', '0', '1452499170', '123123', '13132123', null);

-- ----------------------------
-- Table structure for hc_nav
-- ----------------------------
DROP TABLE IF EXISTS `hc_nav`;
CREATE TABLE `hc_nav` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) DEFAULT '0' COMMENT '上级id',
  `name` varchar(255) DEFAULT '0' COMMENT '导航名字',
  `url` varchar(255) DEFAULT '0' COMMENT '导航链接',
  `type` tinyint(1) DEFAULT '1' COMMENT '1顶部导航，2底部导航',
  `status` tinyint(1) DEFAULT '1',
  `time` int(10) DEFAULT '0' COMMENT '更新时间',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='导航表';

-- ----------------------------
-- Records of hc_nav
-- ----------------------------
INSERT INTO `hc_nav` VALUES ('1', '0', '关于我们', '#', '2', '1', '0', '0');
INSERT INTO `hc_nav` VALUES ('3', '0', '企业资质', '#', '2', '1', '0', '0');
INSERT INTO `hc_nav` VALUES ('5', '0', '帮助中心', '#', '2', '1', '0', '0');
INSERT INTO `hc_nav` VALUES ('7', '0', '操作说明', '#', '2', '1', '0', '0');
INSERT INTO `hc_nav` VALUES ('8', '0', '免责声明', '#', '2', '1', '0', '0');
INSERT INTO `hc_nav` VALUES ('9', '0', '联系我们', '#', '2', '1', '0', '0');

-- ----------------------------
-- Table structure for hc_news
-- ----------------------------
DROP TABLE IF EXISTS `hc_news`;
CREATE TABLE `hc_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL DEFAULT '0' COMMENT '标题',
  `cid` int(10) unsigned DEFAULT '0' COMMENT '所属分类',
  `desc` text COMMENT '简介',
  `img` varchar(255) DEFAULT NULL COMMENT '封面图片',
  `content` text COMMENT '内容',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序号',
  `view` int(10) unsigned DEFAULT '0' COMMENT '浏览数',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '更新时间',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 -1 删除 0审核 1为正常',
  `ispage` tinyint(4) DEFAULT '0' COMMENT '0是新闻1是单页',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- ----------------------------
-- Records of hc_news
-- ----------------------------
INSERT INTO `hc_news` VALUES ('1', '省委常委、贵阳市委书记陈刚主持召开筹备工作会', '1', '', '', '&lt;p style=&quot;margin-top: 12px; margin-bottom: 12px; white-space: normal; padding: 0px; font-family: 微软雅黑; line-height: 28.8px; text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;本报讯10月15日，省委常委、贵阳市委书记陈刚主持召开筹备工作会，对2015世界众筹大会筹备工作进行安排部署。&lt;/p&gt;&lt;p style=&quot;margin-top: 12px; margin-bottom: 12px; white-space: normal; padding: 0px; font-family: 微软雅黑; line-height: 28.8px; text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;贵阳市委副书记、市长刘文新讲话，市委副书记张平，市领导陈少荣、兰义彤、庞鸿、聂雪松、吉宁峰、刘春成、王玉祥、陈小刚参加会议。&lt;/p&gt;&lt;p style=&quot;margin-top: 12px; margin-bottom: 12px; white-space: normal; padding: 0px; font-family: 微软雅黑; line-height: 28.8px; text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;世界众筹大会将于10月23日至26日在贵阳举行，目前各项筹备工作进展顺利。&lt;/p&gt;&lt;p style=&quot;margin-top: 12px; margin-bottom: 12px; white-space: normal; padding: 0px; font-family: 微软雅黑; line-height: 28.8px; text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;在听取相关工作情况汇报后，陈刚对各项筹备工作进展给予肯定。他说，2015世界众筹大会有几个鲜明特征：一是前沿性强，将对我国众筹业态发展探索方向、寻求路径起到引领作用，对确立贵阳在大数据领域的优势地位、推动贵阳互联网金融发展起到促进作用。二是内涵丰富，特别是围绕“互联网+”“大众创业、万众创新”、众筹业发展等主题举办的各项分论坛，主题鲜明、内容新颖，必将为产业发展带来新的思考。三是参与面广，来自机构、企业、院校的各方嘉宾，将广泛参与大会讨论，为会议提供了良好的社会基础和产业基础，在贵阳播下全国众筹业发展的第一批种子，为众筹业在贵阳加快聚集创造有利条件。四是起点很高，在宣传报道上，将与人民日报展开全媒体合作，在组织形式上，企业、各行业协会等主体都积极参与。&lt;/p&gt;&lt;p style=&quot;margin-top: 12px; margin-bottom: 12px; white-space: normal; padding: 0px; font-family: 微软雅黑; line-height: 28.8px; text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;陈刚强调，各项筹备工作已经进入冲刺阶段，全市各级各部门务必统一思想、群策群力，抓好各项筹备工作落实。全市各级领导干部要提高思想认识，细化分工、明确责任，确保会议成功举办。要突出问题导向，做实重要嘉宾邀请，合理安排会议议程；做细开幕式方案，使其真正成为政、学、商各界百家争鸣的平台，为受众带来一场思想盛宴；做好重要嘉宾参会安排工作，主动加强沟通对接，积极争取上级部门支持。要强化统筹调度，营造上下联动、相互补位、密切合作的工作机制，切实推进各项工作有序开展。要加大宣传力度，打破传统报道模式，用好全媒体平台，善于运用群众喜闻乐见的形式开展宣传。要营造良好社会环境，以高度的政治责任感抓好会议期间的安全生产、信访维稳、整脏治乱等工作，确保大会办出水平、办出影响、办出成效。&lt;/p&gt;&lt;p style=&quot;margin-top: 12px; margin-bottom: 12px; white-space: normal; padding: 0px; font-family: 微软雅黑; line-height: 28.8px; text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;刘文新指出，大会筹备工作已进入最后冲刺阶段，各级各部门要以高度的责任感和使命感推进各项工作。要按照“三符合”“三加强”和“细致、精致、极致”的要求，高标准、高水平做好筹备工作，确保大会成功举办、精彩出彩。要加大统筹协调力度，在项目引进、规则制定、平台搭建等方面形成合力，高效有序推进。要通过大会举办，积极抢抓机遇，谋划成果运用，引进一批资源，让一批实实在在的项目落户贵阳，推动金融业快速健康发展。&lt;/p&gt;&lt;p style=&quot;margin-top: 12px; margin-bottom: 12px; white-space: normal; padding: 0px; font-family: 微软雅黑; line-height: 28.8px; text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;市直相关部门、各区（市、县）、相关单位负责人参加会议。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '0', '超级管理员', '0', '1445062169', '1', '0');
INSERT INTO `hc_news` VALUES ('2', '123123', '0', '123123', '/uploads/10/20151208/cut_90_90_happychou_1449560354903.jpg', '&lt;p&gt;123123&lt;/p&gt;', '0', '0', '超级管理员', '0', '1450783801', '1', '1');

-- ----------------------------
-- Table structure for hc_news_category
-- ----------------------------
DROP TABLE IF EXISTS `hc_news_category`;
CREATE TABLE `hc_news_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '分类名称',
  `sort` int(10) DEFAULT '0' COMMENT '排序号',
  `pid` int(10) DEFAULT '0' COMMENT '上级ID',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `limit` int(11) DEFAULT '0' COMMENT '调用多少条新闻',
  `status` tinyint(1) DEFAULT '1',
  `title` varchar(128) DEFAULT '0' COMMENT 'seo标题',
  `keywords` varchar(255) DEFAULT '0' COMMENT 'seo 关键词',
  `description` varchar(255) DEFAULT '0' COMMENT 'seo描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='新闻分类';

-- ----------------------------
-- Records of hc_news_category
-- ----------------------------
INSERT INTO `hc_news_category` VALUES ('1', '相关新闻', '0', '0', '0', '1445061708', '10', '1', '股权私募众筹相关新闻', '股权私募众筹', '股权私募众筹相关新闻');

-- ----------------------------
-- Table structure for hc_pay
-- ----------------------------
DROP TABLE IF EXISTS `hc_pay`;
CREATE TABLE `hc_pay` (
  `out_trade_no` varchar(100) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `callback` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL COMMENT '同步URL',
  `param` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`out_trade_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='支付表';

-- ----------------------------
-- Records of hc_pay
-- ----------------------------
INSERT INTO `hc_pay` VALUES ('151018110704598496', '10000.00', '1', 'User/Payment/pay', '/User/Index/index.html', 'a:2:{s:3:\"uin\";s:1:\"1\";s:8:\"order_id\";s:2:\"11\";}', '1445137624', '1445137637');
INSERT INTO `hc_pay` VALUES ('151018110538994068', '10000.00', '0', 'User/Payment/pay', '/User/Index/index.html', 'a:2:{s:3:\"uin\";s:1:\"1\";s:8:\"order_id\";s:2:\"10\";}', '1445137538', '1445137538');
INSERT INTO `hc_pay` VALUES ('151018110448953670', '100000.00', '0', 'User/Payment/pay', '/User/Index/index.html', 'a:2:{s:3:\"uin\";s:1:\"1\";s:8:\"order_id\";s:1:\"9\";}', '1445137488', '1445137488');
INSERT INTO `hc_pay` VALUES ('151018110342782453', '1000000.00', '0', 'User/Payment/pay', '/User/Index/index.html', 'a:2:{s:3:\"uin\";s:1:\"1\";s:8:\"order_id\";s:1:\"8\";}', '1445137422', '1445137422');
INSERT INTO `hc_pay` VALUES ('151018110141789313', '100000.00', '0', 'User/Payment/pay', '/User/Index/index.html', 'a:2:{s:3:\"uin\";s:1:\"1\";s:8:\"order_id\";s:1:\"7\";}', '1445137301', '1445137301');
INSERT INTO `hc_pay` VALUES ('151018110044741200', '1000000.00', '0', 'User/Payment/pay', '/User/Index/index.html', 'a:2:{s:3:\"uin\";s:1:\"1\";s:8:\"order_id\";s:1:\"6\";}', '1445137244', '1445137244');
INSERT INTO `hc_pay` VALUES ('151018110036839711', '10000000.00', '0', 'User/Payment/pay', '/User/Index/index.html', 'a:2:{s:3:\"uin\";s:1:\"1\";s:8:\"order_id\";s:1:\"5\";}', '1445137236', '1445137236');
INSERT INTO `hc_pay` VALUES ('151018105946549271', '1000000.00', '0', 'User/Payment/pay', '/User/Index/index.html', 'a:2:{s:3:\"uin\";s:1:\"1\";s:8:\"order_id\";s:1:\"4\";}', '1445137186', '1445137186');
INSERT INTO `hc_pay` VALUES ('151018105814686530', '1000000.00', '0', 'User/Payment/pay', '/User/Index/index.html', 'a:2:{s:3:\"uin\";s:1:\"1\";s:8:\"order_id\";s:1:\"3\";}', '1445137094', '1445137094');
INSERT INTO `hc_pay` VALUES ('151018105802754519', '1000000.00', '0', 'User/Payment/pay', '/User/Index/index.html', 'a:2:{s:3:\"uin\";s:1:\"1\";s:8:\"order_id\";s:1:\"2\";}', '1445137082', '1445137082');
INSERT INTO `hc_pay` VALUES ('151018092432834668', '100.00', '0', 'User/Payment/pay', '/User/Index/index.html', 'a:2:{s:3:\"uin\";s:1:\"1\";s:8:\"order_id\";s:1:\"1\";}', '1445131472', '1445131472');
INSERT INTO `hc_pay` VALUES ('151022145452298925', '1.00', '0', 'User/Payment/pay', '/User/Index/index.html', 'a:2:{s:3:\"uin\";s:1:\"3\";s:8:\"order_id\";s:2:\"12\";}', '1445496892', '1445496892');

-- ----------------------------
-- Table structure for hc_region
-- ----------------------------
DROP TABLE IF EXISTS `hc_region`;
CREATE TABLE `hc_region` (
  `id` mediumint(6) NOT NULL,
  `pid` mediumint(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` tinyint(1) NOT NULL,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='地区代码表';

-- ----------------------------
-- Records of hc_region
-- ----------------------------
INSERT INTO `hc_region` VALUES ('110000', '0', '北京市', '0');
INSERT INTO `hc_region` VALUES ('110100', '110000', '市辖区', '1');
INSERT INTO `hc_region` VALUES ('110101', '110100', '东城区', '2');
INSERT INTO `hc_region` VALUES ('110102', '110100', '西城区', '2');
INSERT INTO `hc_region` VALUES ('110105', '110100', '朝阳区', '2');
INSERT INTO `hc_region` VALUES ('110106', '110100', '丰台区', '2');
INSERT INTO `hc_region` VALUES ('110107', '110100', '石景山区', '2');
INSERT INTO `hc_region` VALUES ('110108', '110100', '海淀区', '2');
INSERT INTO `hc_region` VALUES ('110109', '110100', '门头沟区', '2');
INSERT INTO `hc_region` VALUES ('110111', '110100', '房山区', '2');
INSERT INTO `hc_region` VALUES ('110112', '110100', '通州区', '2');
INSERT INTO `hc_region` VALUES ('110113', '110100', '顺义区', '2');
INSERT INTO `hc_region` VALUES ('110114', '110100', '昌平区', '2');
INSERT INTO `hc_region` VALUES ('110115', '110100', '大兴区', '2');
INSERT INTO `hc_region` VALUES ('110116', '110100', '怀柔区', '2');
INSERT INTO `hc_region` VALUES ('110117', '110100', '平谷区', '2');
INSERT INTO `hc_region` VALUES ('110200', '110000', '县', '1');
INSERT INTO `hc_region` VALUES ('110228', '110200', '密云县', '2');
INSERT INTO `hc_region` VALUES ('110229', '110200', '延庆县', '2');
INSERT INTO `hc_region` VALUES ('120000', '0', '天津市', '0');
INSERT INTO `hc_region` VALUES ('120100', '120000', '市辖区', '1');
INSERT INTO `hc_region` VALUES ('120101', '120100', '和平区', '2');
INSERT INTO `hc_region` VALUES ('120102', '120100', '河东区', '2');
INSERT INTO `hc_region` VALUES ('120103', '120100', '河西区', '2');
INSERT INTO `hc_region` VALUES ('120104', '120100', '南开区', '2');
INSERT INTO `hc_region` VALUES ('120105', '120100', '河北区', '2');
INSERT INTO `hc_region` VALUES ('120106', '120100', '红桥区', '2');
INSERT INTO `hc_region` VALUES ('120110', '120100', '东丽区', '2');
INSERT INTO `hc_region` VALUES ('120111', '120100', '西青区', '2');
INSERT INTO `hc_region` VALUES ('120112', '120100', '津南区', '2');
INSERT INTO `hc_region` VALUES ('120113', '120100', '北辰区', '2');
INSERT INTO `hc_region` VALUES ('120114', '120100', '武清区', '2');
INSERT INTO `hc_region` VALUES ('120115', '120100', '宝坻区', '2');
INSERT INTO `hc_region` VALUES ('120116', '120100', '滨海新区', '2');
INSERT INTO `hc_region` VALUES ('120200', '120000', '县', '1');
INSERT INTO `hc_region` VALUES ('120221', '120200', '宁河县', '2');
INSERT INTO `hc_region` VALUES ('120223', '120200', '静海县', '2');
INSERT INTO `hc_region` VALUES ('120225', '120200', '蓟县', '2');
INSERT INTO `hc_region` VALUES ('130000', '0', '河北省', '0');
INSERT INTO `hc_region` VALUES ('130100', '130000', '石家庄市', '1');
INSERT INTO `hc_region` VALUES ('130101', '130100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('130102', '130100', '长安区', '2');
INSERT INTO `hc_region` VALUES ('130104', '130100', '桥西区', '2');
INSERT INTO `hc_region` VALUES ('130105', '130100', '新华区', '2');
INSERT INTO `hc_region` VALUES ('130107', '130100', '井陉矿区', '2');
INSERT INTO `hc_region` VALUES ('130108', '130100', '裕华区', '2');
INSERT INTO `hc_region` VALUES ('130109', '130100', '藁城区', '2');
INSERT INTO `hc_region` VALUES ('130110', '130100', '鹿泉区', '2');
INSERT INTO `hc_region` VALUES ('130111', '130100', '栾城区', '2');
INSERT INTO `hc_region` VALUES ('130121', '130100', '井陉县', '2');
INSERT INTO `hc_region` VALUES ('130123', '130100', '正定县', '2');
INSERT INTO `hc_region` VALUES ('130125', '130100', '行唐县', '2');
INSERT INTO `hc_region` VALUES ('130126', '130100', '灵寿县', '2');
INSERT INTO `hc_region` VALUES ('130127', '130100', '高邑县', '2');
INSERT INTO `hc_region` VALUES ('130128', '130100', '深泽县', '2');
INSERT INTO `hc_region` VALUES ('130129', '130100', '赞皇县', '2');
INSERT INTO `hc_region` VALUES ('130130', '130100', '无极县', '2');
INSERT INTO `hc_region` VALUES ('130131', '130100', '平山县', '2');
INSERT INTO `hc_region` VALUES ('130132', '130100', '元氏县', '2');
INSERT INTO `hc_region` VALUES ('130133', '130100', '赵县', '2');
INSERT INTO `hc_region` VALUES ('130183', '130100', '晋州市', '2');
INSERT INTO `hc_region` VALUES ('130184', '130100', '新乐市', '2');
INSERT INTO `hc_region` VALUES ('130200', '130000', '唐山市', '1');
INSERT INTO `hc_region` VALUES ('130201', '130200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('130202', '130200', '路南区', '2');
INSERT INTO `hc_region` VALUES ('130203', '130200', '路北区', '2');
INSERT INTO `hc_region` VALUES ('130204', '130200', '古冶区', '2');
INSERT INTO `hc_region` VALUES ('130205', '130200', '开平区', '2');
INSERT INTO `hc_region` VALUES ('130207', '130200', '丰南区', '2');
INSERT INTO `hc_region` VALUES ('130208', '130200', '丰润区', '2');
INSERT INTO `hc_region` VALUES ('130209', '130200', '曹妃甸区', '2');
INSERT INTO `hc_region` VALUES ('130223', '130200', '滦县', '2');
INSERT INTO `hc_region` VALUES ('130224', '130200', '滦南县', '2');
INSERT INTO `hc_region` VALUES ('130225', '130200', '乐亭县', '2');
INSERT INTO `hc_region` VALUES ('130227', '130200', '迁西县', '2');
INSERT INTO `hc_region` VALUES ('130229', '130200', '玉田县', '2');
INSERT INTO `hc_region` VALUES ('130281', '130200', '遵化市', '2');
INSERT INTO `hc_region` VALUES ('130283', '130200', '迁安市', '2');
INSERT INTO `hc_region` VALUES ('130300', '130000', '秦皇岛市', '1');
INSERT INTO `hc_region` VALUES ('130301', '130300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('130302', '130300', '海港区', '2');
INSERT INTO `hc_region` VALUES ('130303', '130300', '山海关区', '2');
INSERT INTO `hc_region` VALUES ('130304', '130300', '北戴河区', '2');
INSERT INTO `hc_region` VALUES ('130321', '130300', '青龙满族自治县', '2');
INSERT INTO `hc_region` VALUES ('130322', '130300', '昌黎县', '2');
INSERT INTO `hc_region` VALUES ('130323', '130300', '抚宁县', '2');
INSERT INTO `hc_region` VALUES ('130324', '130300', '卢龙县', '2');
INSERT INTO `hc_region` VALUES ('130400', '130000', '邯郸市', '1');
INSERT INTO `hc_region` VALUES ('130401', '130400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('130402', '130400', '邯山区', '2');
INSERT INTO `hc_region` VALUES ('130403', '130400', '丛台区', '2');
INSERT INTO `hc_region` VALUES ('130404', '130400', '复兴区', '2');
INSERT INTO `hc_region` VALUES ('130406', '130400', '峰峰矿区', '2');
INSERT INTO `hc_region` VALUES ('130421', '130400', '邯郸县', '2');
INSERT INTO `hc_region` VALUES ('130423', '130400', '临漳县', '2');
INSERT INTO `hc_region` VALUES ('130424', '130400', '成安县', '2');
INSERT INTO `hc_region` VALUES ('130425', '130400', '大名县', '2');
INSERT INTO `hc_region` VALUES ('130426', '130400', '涉县', '2');
INSERT INTO `hc_region` VALUES ('130427', '130400', '磁县', '2');
INSERT INTO `hc_region` VALUES ('130428', '130400', '肥乡县', '2');
INSERT INTO `hc_region` VALUES ('130429', '130400', '永年县', '2');
INSERT INTO `hc_region` VALUES ('130430', '130400', '邱县', '2');
INSERT INTO `hc_region` VALUES ('130431', '130400', '鸡泽县', '2');
INSERT INTO `hc_region` VALUES ('130432', '130400', '广平县', '2');
INSERT INTO `hc_region` VALUES ('130433', '130400', '馆陶县', '2');
INSERT INTO `hc_region` VALUES ('130434', '130400', '魏县', '2');
INSERT INTO `hc_region` VALUES ('130435', '130400', '曲周县', '2');
INSERT INTO `hc_region` VALUES ('130481', '130400', '武安市', '2');
INSERT INTO `hc_region` VALUES ('130500', '130000', '邢台市', '1');
INSERT INTO `hc_region` VALUES ('130501', '130500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('130502', '130500', '桥东区', '2');
INSERT INTO `hc_region` VALUES ('130503', '130500', '桥西区', '2');
INSERT INTO `hc_region` VALUES ('130521', '130500', '邢台县', '2');
INSERT INTO `hc_region` VALUES ('130522', '130500', '临城县', '2');
INSERT INTO `hc_region` VALUES ('130523', '130500', '内丘县', '2');
INSERT INTO `hc_region` VALUES ('130524', '130500', '柏乡县', '2');
INSERT INTO `hc_region` VALUES ('130525', '130500', '隆尧县', '2');
INSERT INTO `hc_region` VALUES ('130526', '130500', '任县', '2');
INSERT INTO `hc_region` VALUES ('130527', '130500', '南和县', '2');
INSERT INTO `hc_region` VALUES ('130528', '130500', '宁晋县', '2');
INSERT INTO `hc_region` VALUES ('130529', '130500', '巨鹿县', '2');
INSERT INTO `hc_region` VALUES ('130530', '130500', '新河县', '2');
INSERT INTO `hc_region` VALUES ('130531', '130500', '广宗县', '2');
INSERT INTO `hc_region` VALUES ('130532', '130500', '平乡县', '2');
INSERT INTO `hc_region` VALUES ('130533', '130500', '威县', '2');
INSERT INTO `hc_region` VALUES ('130534', '130500', '清河县', '2');
INSERT INTO `hc_region` VALUES ('130535', '130500', '临西县', '2');
INSERT INTO `hc_region` VALUES ('130581', '130500', '南宫市', '2');
INSERT INTO `hc_region` VALUES ('130582', '130500', '沙河市', '2');
INSERT INTO `hc_region` VALUES ('130600', '130000', '保定市', '1');
INSERT INTO `hc_region` VALUES ('130601', '130600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('130602', '130600', '新市区', '2');
INSERT INTO `hc_region` VALUES ('130603', '130600', '北市区', '2');
INSERT INTO `hc_region` VALUES ('130604', '130600', '南市区', '2');
INSERT INTO `hc_region` VALUES ('130621', '130600', '满城县', '2');
INSERT INTO `hc_region` VALUES ('130622', '130600', '清苑县', '2');
INSERT INTO `hc_region` VALUES ('130623', '130600', '涞水县', '2');
INSERT INTO `hc_region` VALUES ('130624', '130600', '阜平县', '2');
INSERT INTO `hc_region` VALUES ('130625', '130600', '徐水县', '2');
INSERT INTO `hc_region` VALUES ('130626', '130600', '定兴县', '2');
INSERT INTO `hc_region` VALUES ('130627', '130600', '唐县', '2');
INSERT INTO `hc_region` VALUES ('130628', '130600', '高阳县', '2');
INSERT INTO `hc_region` VALUES ('130629', '130600', '容城县', '2');
INSERT INTO `hc_region` VALUES ('130630', '130600', '涞源县', '2');
INSERT INTO `hc_region` VALUES ('130631', '130600', '望都县', '2');
INSERT INTO `hc_region` VALUES ('130632', '130600', '安新县', '2');
INSERT INTO `hc_region` VALUES ('130633', '130600', '易县', '2');
INSERT INTO `hc_region` VALUES ('130634', '130600', '曲阳县', '2');
INSERT INTO `hc_region` VALUES ('130635', '130600', '蠡县', '2');
INSERT INTO `hc_region` VALUES ('130636', '130600', '顺平县', '2');
INSERT INTO `hc_region` VALUES ('130637', '130600', '博野县', '2');
INSERT INTO `hc_region` VALUES ('130638', '130600', '雄县', '2');
INSERT INTO `hc_region` VALUES ('130681', '130600', '涿州市', '2');
INSERT INTO `hc_region` VALUES ('130683', '130600', '安国市', '2');
INSERT INTO `hc_region` VALUES ('130684', '130600', '高碑店市', '2');
INSERT INTO `hc_region` VALUES ('130700', '130000', '张家口市', '1');
INSERT INTO `hc_region` VALUES ('130701', '130700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('130702', '130700', '桥东区', '2');
INSERT INTO `hc_region` VALUES ('130703', '130700', '桥西区', '2');
INSERT INTO `hc_region` VALUES ('130705', '130700', '宣化区', '2');
INSERT INTO `hc_region` VALUES ('130706', '130700', '下花园区', '2');
INSERT INTO `hc_region` VALUES ('130721', '130700', '宣化县', '2');
INSERT INTO `hc_region` VALUES ('130722', '130700', '张北县', '2');
INSERT INTO `hc_region` VALUES ('130723', '130700', '康保县', '2');
INSERT INTO `hc_region` VALUES ('130724', '130700', '沽源县', '2');
INSERT INTO `hc_region` VALUES ('130725', '130700', '尚义县', '2');
INSERT INTO `hc_region` VALUES ('130726', '130700', '蔚县', '2');
INSERT INTO `hc_region` VALUES ('130727', '130700', '阳原县', '2');
INSERT INTO `hc_region` VALUES ('130728', '130700', '怀安县', '2');
INSERT INTO `hc_region` VALUES ('130729', '130700', '万全县', '2');
INSERT INTO `hc_region` VALUES ('130730', '130700', '怀来县', '2');
INSERT INTO `hc_region` VALUES ('130731', '130700', '涿鹿县', '2');
INSERT INTO `hc_region` VALUES ('130732', '130700', '赤城县', '2');
INSERT INTO `hc_region` VALUES ('130733', '130700', '崇礼县', '2');
INSERT INTO `hc_region` VALUES ('130800', '130000', '承德市', '1');
INSERT INTO `hc_region` VALUES ('130801', '130800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('130802', '130800', '双桥区', '2');
INSERT INTO `hc_region` VALUES ('130803', '130800', '双滦区', '2');
INSERT INTO `hc_region` VALUES ('130804', '130800', '鹰手营子矿区', '2');
INSERT INTO `hc_region` VALUES ('130821', '130800', '承德县', '2');
INSERT INTO `hc_region` VALUES ('130822', '130800', '兴隆县', '2');
INSERT INTO `hc_region` VALUES ('130823', '130800', '平泉县', '2');
INSERT INTO `hc_region` VALUES ('130824', '130800', '滦平县', '2');
INSERT INTO `hc_region` VALUES ('130825', '130800', '隆化县', '2');
INSERT INTO `hc_region` VALUES ('130826', '130800', '丰宁满族自治县', '2');
INSERT INTO `hc_region` VALUES ('130827', '130800', '宽城满族自治县', '2');
INSERT INTO `hc_region` VALUES ('130828', '130800', '围场满族蒙古族自治县', '2');
INSERT INTO `hc_region` VALUES ('130900', '130000', '沧州市', '1');
INSERT INTO `hc_region` VALUES ('130901', '130900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('130902', '130900', '新华区', '2');
INSERT INTO `hc_region` VALUES ('130903', '130900', '运河区', '2');
INSERT INTO `hc_region` VALUES ('130921', '130900', '沧县', '2');
INSERT INTO `hc_region` VALUES ('130922', '130900', '青县', '2');
INSERT INTO `hc_region` VALUES ('130923', '130900', '东光县', '2');
INSERT INTO `hc_region` VALUES ('130924', '130900', '海兴县', '2');
INSERT INTO `hc_region` VALUES ('130925', '130900', '盐山县', '2');
INSERT INTO `hc_region` VALUES ('130926', '130900', '肃宁县', '2');
INSERT INTO `hc_region` VALUES ('130927', '130900', '南皮县', '2');
INSERT INTO `hc_region` VALUES ('130928', '130900', '吴桥县', '2');
INSERT INTO `hc_region` VALUES ('130929', '130900', '献县', '2');
INSERT INTO `hc_region` VALUES ('130930', '130900', '孟村回族自治县', '2');
INSERT INTO `hc_region` VALUES ('130981', '130900', '泊头市', '2');
INSERT INTO `hc_region` VALUES ('130982', '130900', '任丘市', '2');
INSERT INTO `hc_region` VALUES ('130983', '130900', '黄骅市', '2');
INSERT INTO `hc_region` VALUES ('130984', '130900', '河间市', '2');
INSERT INTO `hc_region` VALUES ('131000', '130000', '廊坊市', '1');
INSERT INTO `hc_region` VALUES ('131001', '131000', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('131002', '131000', '安次区', '2');
INSERT INTO `hc_region` VALUES ('131003', '131000', '广阳区', '2');
INSERT INTO `hc_region` VALUES ('131022', '131000', '固安县', '2');
INSERT INTO `hc_region` VALUES ('131023', '131000', '永清县', '2');
INSERT INTO `hc_region` VALUES ('131024', '131000', '香河县', '2');
INSERT INTO `hc_region` VALUES ('131025', '131000', '大城县', '2');
INSERT INTO `hc_region` VALUES ('131026', '131000', '文安县', '2');
INSERT INTO `hc_region` VALUES ('131028', '131000', '大厂回族自治县', '2');
INSERT INTO `hc_region` VALUES ('131081', '131000', '霸州市', '2');
INSERT INTO `hc_region` VALUES ('131082', '131000', '三河市', '2');
INSERT INTO `hc_region` VALUES ('131100', '130000', '衡水市', '1');
INSERT INTO `hc_region` VALUES ('131101', '131100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('131102', '131100', '桃城区', '2');
INSERT INTO `hc_region` VALUES ('131121', '131100', '枣强县', '2');
INSERT INTO `hc_region` VALUES ('131122', '131100', '武邑县', '2');
INSERT INTO `hc_region` VALUES ('131123', '131100', '武强县', '2');
INSERT INTO `hc_region` VALUES ('131124', '131100', '饶阳县', '2');
INSERT INTO `hc_region` VALUES ('131125', '131100', '安平县', '2');
INSERT INTO `hc_region` VALUES ('131126', '131100', '故城县', '2');
INSERT INTO `hc_region` VALUES ('131127', '131100', '景县', '2');
INSERT INTO `hc_region` VALUES ('131128', '131100', '阜城县', '2');
INSERT INTO `hc_region` VALUES ('131181', '131100', '冀州市', '2');
INSERT INTO `hc_region` VALUES ('131182', '131100', '深州市', '2');
INSERT INTO `hc_region` VALUES ('139000', '130000', '省直辖县级行政区划', '1');
INSERT INTO `hc_region` VALUES ('139001', '139000', '定州市', '2');
INSERT INTO `hc_region` VALUES ('139002', '139000', '辛集市', '2');
INSERT INTO `hc_region` VALUES ('140000', '0', '山西省', '0');
INSERT INTO `hc_region` VALUES ('140100', '140000', '太原市', '1');
INSERT INTO `hc_region` VALUES ('140101', '140100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('140105', '140100', '小店区', '2');
INSERT INTO `hc_region` VALUES ('140106', '140100', '迎泽区', '2');
INSERT INTO `hc_region` VALUES ('140107', '140100', '杏花岭区', '2');
INSERT INTO `hc_region` VALUES ('140108', '140100', '尖草坪区', '2');
INSERT INTO `hc_region` VALUES ('140109', '140100', '万柏林区', '2');
INSERT INTO `hc_region` VALUES ('140110', '140100', '晋源区', '2');
INSERT INTO `hc_region` VALUES ('140121', '140100', '清徐县', '2');
INSERT INTO `hc_region` VALUES ('140122', '140100', '阳曲县', '2');
INSERT INTO `hc_region` VALUES ('140123', '140100', '娄烦县', '2');
INSERT INTO `hc_region` VALUES ('140181', '140100', '古交市', '2');
INSERT INTO `hc_region` VALUES ('140200', '140000', '大同市', '1');
INSERT INTO `hc_region` VALUES ('140201', '140200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('140202', '140200', '城区', '2');
INSERT INTO `hc_region` VALUES ('140203', '140200', '矿区', '2');
INSERT INTO `hc_region` VALUES ('140211', '140200', '南郊区', '2');
INSERT INTO `hc_region` VALUES ('140212', '140200', '新荣区', '2');
INSERT INTO `hc_region` VALUES ('140221', '140200', '阳高县', '2');
INSERT INTO `hc_region` VALUES ('140222', '140200', '天镇县', '2');
INSERT INTO `hc_region` VALUES ('140223', '140200', '广灵县', '2');
INSERT INTO `hc_region` VALUES ('140224', '140200', '灵丘县', '2');
INSERT INTO `hc_region` VALUES ('140225', '140200', '浑源县', '2');
INSERT INTO `hc_region` VALUES ('140226', '140200', '左云县', '2');
INSERT INTO `hc_region` VALUES ('140227', '140200', '大同县', '2');
INSERT INTO `hc_region` VALUES ('140300', '140000', '阳泉市', '1');
INSERT INTO `hc_region` VALUES ('140301', '140300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('140302', '140300', '城区', '2');
INSERT INTO `hc_region` VALUES ('140303', '140300', '矿区', '2');
INSERT INTO `hc_region` VALUES ('140311', '140300', '郊区', '2');
INSERT INTO `hc_region` VALUES ('140321', '140300', '平定县', '2');
INSERT INTO `hc_region` VALUES ('140322', '140300', '盂县', '2');
INSERT INTO `hc_region` VALUES ('140400', '140000', '长治市', '1');
INSERT INTO `hc_region` VALUES ('140401', '140400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('140402', '140400', '城区', '2');
INSERT INTO `hc_region` VALUES ('140411', '140400', '郊区', '2');
INSERT INTO `hc_region` VALUES ('140421', '140400', '长治县', '2');
INSERT INTO `hc_region` VALUES ('140423', '140400', '襄垣县', '2');
INSERT INTO `hc_region` VALUES ('140424', '140400', '屯留县', '2');
INSERT INTO `hc_region` VALUES ('140425', '140400', '平顺县', '2');
INSERT INTO `hc_region` VALUES ('140426', '140400', '黎城县', '2');
INSERT INTO `hc_region` VALUES ('140427', '140400', '壶关县', '2');
INSERT INTO `hc_region` VALUES ('140428', '140400', '长子县', '2');
INSERT INTO `hc_region` VALUES ('140429', '140400', '武乡县', '2');
INSERT INTO `hc_region` VALUES ('140430', '140400', '沁县', '2');
INSERT INTO `hc_region` VALUES ('140431', '140400', '沁源县', '2');
INSERT INTO `hc_region` VALUES ('140481', '140400', '潞城市', '2');
INSERT INTO `hc_region` VALUES ('140500', '140000', '晋城市', '1');
INSERT INTO `hc_region` VALUES ('140501', '140500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('140502', '140500', '城区', '2');
INSERT INTO `hc_region` VALUES ('140521', '140500', '沁水县', '2');
INSERT INTO `hc_region` VALUES ('140522', '140500', '阳城县', '2');
INSERT INTO `hc_region` VALUES ('140524', '140500', '陵川县', '2');
INSERT INTO `hc_region` VALUES ('140525', '140500', '泽州县', '2');
INSERT INTO `hc_region` VALUES ('140581', '140500', '高平市', '2');
INSERT INTO `hc_region` VALUES ('140600', '140000', '朔州市', '1');
INSERT INTO `hc_region` VALUES ('140601', '140600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('140602', '140600', '朔城区', '2');
INSERT INTO `hc_region` VALUES ('140603', '140600', '平鲁区', '2');
INSERT INTO `hc_region` VALUES ('140621', '140600', '山阴县', '2');
INSERT INTO `hc_region` VALUES ('140622', '140600', '应县', '2');
INSERT INTO `hc_region` VALUES ('140623', '140600', '右玉县', '2');
INSERT INTO `hc_region` VALUES ('140624', '140600', '怀仁县', '2');
INSERT INTO `hc_region` VALUES ('140700', '140000', '晋中市', '1');
INSERT INTO `hc_region` VALUES ('140701', '140700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('140702', '140700', '榆次区', '2');
INSERT INTO `hc_region` VALUES ('140721', '140700', '榆社县', '2');
INSERT INTO `hc_region` VALUES ('140722', '140700', '左权县', '2');
INSERT INTO `hc_region` VALUES ('140723', '140700', '和顺县', '2');
INSERT INTO `hc_region` VALUES ('140724', '140700', '昔阳县', '2');
INSERT INTO `hc_region` VALUES ('140725', '140700', '寿阳县', '2');
INSERT INTO `hc_region` VALUES ('140726', '140700', '太谷县', '2');
INSERT INTO `hc_region` VALUES ('140727', '140700', '祁县', '2');
INSERT INTO `hc_region` VALUES ('140728', '140700', '平遥县', '2');
INSERT INTO `hc_region` VALUES ('140729', '140700', '灵石县', '2');
INSERT INTO `hc_region` VALUES ('140781', '140700', '介休市', '2');
INSERT INTO `hc_region` VALUES ('140800', '140000', '运城市', '1');
INSERT INTO `hc_region` VALUES ('140801', '140800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('140802', '140800', '盐湖区', '2');
INSERT INTO `hc_region` VALUES ('140821', '140800', '临猗县', '2');
INSERT INTO `hc_region` VALUES ('140822', '140800', '万荣县', '2');
INSERT INTO `hc_region` VALUES ('140823', '140800', '闻喜县', '2');
INSERT INTO `hc_region` VALUES ('140824', '140800', '稷山县', '2');
INSERT INTO `hc_region` VALUES ('140825', '140800', '新绛县', '2');
INSERT INTO `hc_region` VALUES ('140826', '140800', '绛县', '2');
INSERT INTO `hc_region` VALUES ('140827', '140800', '垣曲县', '2');
INSERT INTO `hc_region` VALUES ('140828', '140800', '夏县', '2');
INSERT INTO `hc_region` VALUES ('140829', '140800', '平陆县', '2');
INSERT INTO `hc_region` VALUES ('140830', '140800', '芮城县', '2');
INSERT INTO `hc_region` VALUES ('140881', '140800', '永济市', '2');
INSERT INTO `hc_region` VALUES ('140882', '140800', '河津市', '2');
INSERT INTO `hc_region` VALUES ('140900', '140000', '忻州市', '1');
INSERT INTO `hc_region` VALUES ('140901', '140900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('140902', '140900', '忻府区', '2');
INSERT INTO `hc_region` VALUES ('140921', '140900', '定襄县', '2');
INSERT INTO `hc_region` VALUES ('140922', '140900', '五台县', '2');
INSERT INTO `hc_region` VALUES ('140923', '140900', '代县', '2');
INSERT INTO `hc_region` VALUES ('140924', '140900', '繁峙县', '2');
INSERT INTO `hc_region` VALUES ('140925', '140900', '宁武县', '2');
INSERT INTO `hc_region` VALUES ('140926', '140900', '静乐县', '2');
INSERT INTO `hc_region` VALUES ('140927', '140900', '神池县', '2');
INSERT INTO `hc_region` VALUES ('140928', '140900', '五寨县', '2');
INSERT INTO `hc_region` VALUES ('140929', '140900', '岢岚县', '2');
INSERT INTO `hc_region` VALUES ('140930', '140900', '河曲县', '2');
INSERT INTO `hc_region` VALUES ('140931', '140900', '保德县', '2');
INSERT INTO `hc_region` VALUES ('140932', '140900', '偏关县', '2');
INSERT INTO `hc_region` VALUES ('140981', '140900', '原平市', '2');
INSERT INTO `hc_region` VALUES ('141000', '140000', '临汾市', '1');
INSERT INTO `hc_region` VALUES ('141001', '141000', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('141002', '141000', '尧都区', '2');
INSERT INTO `hc_region` VALUES ('141021', '141000', '曲沃县', '2');
INSERT INTO `hc_region` VALUES ('141022', '141000', '翼城县', '2');
INSERT INTO `hc_region` VALUES ('141023', '141000', '襄汾县', '2');
INSERT INTO `hc_region` VALUES ('141024', '141000', '洪洞县', '2');
INSERT INTO `hc_region` VALUES ('141025', '141000', '古县', '2');
INSERT INTO `hc_region` VALUES ('141026', '141000', '安泽县', '2');
INSERT INTO `hc_region` VALUES ('141027', '141000', '浮山县', '2');
INSERT INTO `hc_region` VALUES ('141028', '141000', '吉县', '2');
INSERT INTO `hc_region` VALUES ('141029', '141000', '乡宁县', '2');
INSERT INTO `hc_region` VALUES ('141030', '141000', '大宁县', '2');
INSERT INTO `hc_region` VALUES ('141031', '141000', '隰县', '2');
INSERT INTO `hc_region` VALUES ('141032', '141000', '永和县', '2');
INSERT INTO `hc_region` VALUES ('141033', '141000', '蒲县', '2');
INSERT INTO `hc_region` VALUES ('141034', '141000', '汾西县', '2');
INSERT INTO `hc_region` VALUES ('141081', '141000', '侯马市', '2');
INSERT INTO `hc_region` VALUES ('141082', '141000', '霍州市', '2');
INSERT INTO `hc_region` VALUES ('141100', '140000', '吕梁市', '1');
INSERT INTO `hc_region` VALUES ('141101', '141100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('141102', '141100', '离石区', '2');
INSERT INTO `hc_region` VALUES ('141121', '141100', '文水县', '2');
INSERT INTO `hc_region` VALUES ('141122', '141100', '交城县', '2');
INSERT INTO `hc_region` VALUES ('141123', '141100', '兴县', '2');
INSERT INTO `hc_region` VALUES ('141124', '141100', '临县', '2');
INSERT INTO `hc_region` VALUES ('141125', '141100', '柳林县', '2');
INSERT INTO `hc_region` VALUES ('141126', '141100', '石楼县', '2');
INSERT INTO `hc_region` VALUES ('141127', '141100', '岚县', '2');
INSERT INTO `hc_region` VALUES ('141128', '141100', '方山县', '2');
INSERT INTO `hc_region` VALUES ('141129', '141100', '中阳县', '2');
INSERT INTO `hc_region` VALUES ('141130', '141100', '交口县', '2');
INSERT INTO `hc_region` VALUES ('141181', '141100', '孝义市', '2');
INSERT INTO `hc_region` VALUES ('141182', '141100', '汾阳市', '2');
INSERT INTO `hc_region` VALUES ('150000', '0', '内蒙古自治区', '0');
INSERT INTO `hc_region` VALUES ('150100', '150000', '呼和浩特市', '1');
INSERT INTO `hc_region` VALUES ('150101', '150100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('150102', '150100', '新城区', '2');
INSERT INTO `hc_region` VALUES ('150103', '150100', '回民区', '2');
INSERT INTO `hc_region` VALUES ('150104', '150100', '玉泉区', '2');
INSERT INTO `hc_region` VALUES ('150105', '150100', '赛罕区', '2');
INSERT INTO `hc_region` VALUES ('150121', '150100', '土默特左旗', '2');
INSERT INTO `hc_region` VALUES ('150122', '150100', '托克托县', '2');
INSERT INTO `hc_region` VALUES ('150123', '150100', '和林格尔县', '2');
INSERT INTO `hc_region` VALUES ('150124', '150100', '清水河县', '2');
INSERT INTO `hc_region` VALUES ('150125', '150100', '武川县', '2');
INSERT INTO `hc_region` VALUES ('150200', '150000', '包头市', '1');
INSERT INTO `hc_region` VALUES ('150201', '150200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('150202', '150200', '东河区', '2');
INSERT INTO `hc_region` VALUES ('150203', '150200', '昆都仑区', '2');
INSERT INTO `hc_region` VALUES ('150204', '150200', '青山区', '2');
INSERT INTO `hc_region` VALUES ('150205', '150200', '石拐区', '2');
INSERT INTO `hc_region` VALUES ('150206', '150200', '白云鄂博矿区', '2');
INSERT INTO `hc_region` VALUES ('150207', '150200', '九原区', '2');
INSERT INTO `hc_region` VALUES ('150221', '150200', '土默特右旗', '2');
INSERT INTO `hc_region` VALUES ('150222', '150200', '固阳县', '2');
INSERT INTO `hc_region` VALUES ('150223', '150200', '达尔罕茂明安联合旗', '2');
INSERT INTO `hc_region` VALUES ('150300', '150000', '乌海市', '1');
INSERT INTO `hc_region` VALUES ('150301', '150300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('150302', '150300', '海勃湾区', '2');
INSERT INTO `hc_region` VALUES ('150303', '150300', '海南区', '2');
INSERT INTO `hc_region` VALUES ('150304', '150300', '乌达区', '2');
INSERT INTO `hc_region` VALUES ('150400', '150000', '赤峰市', '1');
INSERT INTO `hc_region` VALUES ('150401', '150400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('150402', '150400', '红山区', '2');
INSERT INTO `hc_region` VALUES ('150403', '150400', '元宝山区', '2');
INSERT INTO `hc_region` VALUES ('150404', '150400', '松山区', '2');
INSERT INTO `hc_region` VALUES ('150421', '150400', '阿鲁科尔沁旗', '2');
INSERT INTO `hc_region` VALUES ('150422', '150400', '巴林左旗', '2');
INSERT INTO `hc_region` VALUES ('150423', '150400', '巴林右旗', '2');
INSERT INTO `hc_region` VALUES ('150424', '150400', '林西县', '2');
INSERT INTO `hc_region` VALUES ('150425', '150400', '克什克腾旗', '2');
INSERT INTO `hc_region` VALUES ('150426', '150400', '翁牛特旗', '2');
INSERT INTO `hc_region` VALUES ('150428', '150400', '喀喇沁旗', '2');
INSERT INTO `hc_region` VALUES ('150429', '150400', '宁城县', '2');
INSERT INTO `hc_region` VALUES ('150430', '150400', '敖汉旗', '2');
INSERT INTO `hc_region` VALUES ('150500', '150000', '通辽市', '1');
INSERT INTO `hc_region` VALUES ('150501', '150500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('150502', '150500', '科尔沁区', '2');
INSERT INTO `hc_region` VALUES ('150521', '150500', '科尔沁左翼中旗', '2');
INSERT INTO `hc_region` VALUES ('150522', '150500', '科尔沁左翼后旗', '2');
INSERT INTO `hc_region` VALUES ('150523', '150500', '开鲁县', '2');
INSERT INTO `hc_region` VALUES ('150524', '150500', '库伦旗', '2');
INSERT INTO `hc_region` VALUES ('150525', '150500', '奈曼旗', '2');
INSERT INTO `hc_region` VALUES ('150526', '150500', '扎鲁特旗', '2');
INSERT INTO `hc_region` VALUES ('150581', '150500', '霍林郭勒市', '2');
INSERT INTO `hc_region` VALUES ('150600', '150000', '鄂尔多斯市', '1');
INSERT INTO `hc_region` VALUES ('150601', '150600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('150602', '150600', '东胜区', '2');
INSERT INTO `hc_region` VALUES ('150621', '150600', '达拉特旗', '2');
INSERT INTO `hc_region` VALUES ('150622', '150600', '准格尔旗', '2');
INSERT INTO `hc_region` VALUES ('150623', '150600', '鄂托克前旗', '2');
INSERT INTO `hc_region` VALUES ('150624', '150600', '鄂托克旗', '2');
INSERT INTO `hc_region` VALUES ('150625', '150600', '杭锦旗', '2');
INSERT INTO `hc_region` VALUES ('150626', '150600', '乌审旗', '2');
INSERT INTO `hc_region` VALUES ('150627', '150600', '伊金霍洛旗', '2');
INSERT INTO `hc_region` VALUES ('150700', '150000', '呼伦贝尔市', '1');
INSERT INTO `hc_region` VALUES ('150701', '150700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('150702', '150700', '海拉尔区', '2');
INSERT INTO `hc_region` VALUES ('150703', '150700', '扎赉诺尔区', '2');
INSERT INTO `hc_region` VALUES ('150721', '150700', '阿荣旗', '2');
INSERT INTO `hc_region` VALUES ('150722', '150700', '莫力达瓦达斡尔族自治旗', '2');
INSERT INTO `hc_region` VALUES ('150723', '150700', '鄂伦春自治旗', '2');
INSERT INTO `hc_region` VALUES ('150724', '150700', '鄂温克族自治旗', '2');
INSERT INTO `hc_region` VALUES ('150725', '150700', '陈巴尔虎旗', '2');
INSERT INTO `hc_region` VALUES ('150726', '150700', '新巴尔虎左旗', '2');
INSERT INTO `hc_region` VALUES ('150727', '150700', '新巴尔虎右旗', '2');
INSERT INTO `hc_region` VALUES ('150781', '150700', '满洲里市', '2');
INSERT INTO `hc_region` VALUES ('150782', '150700', '牙克石市', '2');
INSERT INTO `hc_region` VALUES ('150783', '150700', '扎兰屯市', '2');
INSERT INTO `hc_region` VALUES ('150784', '150700', '额尔古纳市', '2');
INSERT INTO `hc_region` VALUES ('150785', '150700', '根河市', '2');
INSERT INTO `hc_region` VALUES ('150800', '150000', '巴彦淖尔市', '1');
INSERT INTO `hc_region` VALUES ('150801', '150800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('150802', '150800', '临河区', '2');
INSERT INTO `hc_region` VALUES ('150821', '150800', '五原县', '2');
INSERT INTO `hc_region` VALUES ('150822', '150800', '磴口县', '2');
INSERT INTO `hc_region` VALUES ('150823', '150800', '乌拉特前旗', '2');
INSERT INTO `hc_region` VALUES ('150824', '150800', '乌拉特中旗', '2');
INSERT INTO `hc_region` VALUES ('150825', '150800', '乌拉特后旗', '2');
INSERT INTO `hc_region` VALUES ('150826', '150800', '杭锦后旗', '2');
INSERT INTO `hc_region` VALUES ('150900', '150000', '乌兰察布市', '1');
INSERT INTO `hc_region` VALUES ('150901', '150900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('150902', '150900', '集宁区', '2');
INSERT INTO `hc_region` VALUES ('150921', '150900', '卓资县', '2');
INSERT INTO `hc_region` VALUES ('150922', '150900', '化德县', '2');
INSERT INTO `hc_region` VALUES ('150923', '150900', '商都县', '2');
INSERT INTO `hc_region` VALUES ('150924', '150900', '兴和县', '2');
INSERT INTO `hc_region` VALUES ('150925', '150900', '凉城县', '2');
INSERT INTO `hc_region` VALUES ('150926', '150900', '察哈尔右翼前旗', '2');
INSERT INTO `hc_region` VALUES ('150927', '150900', '察哈尔右翼中旗', '2');
INSERT INTO `hc_region` VALUES ('150928', '150900', '察哈尔右翼后旗', '2');
INSERT INTO `hc_region` VALUES ('150929', '150900', '四子王旗', '2');
INSERT INTO `hc_region` VALUES ('150981', '150900', '丰镇市', '2');
INSERT INTO `hc_region` VALUES ('152200', '150000', '兴安盟', '1');
INSERT INTO `hc_region` VALUES ('152201', '152200', '乌兰浩特市', '2');
INSERT INTO `hc_region` VALUES ('152202', '152200', '阿尔山市', '2');
INSERT INTO `hc_region` VALUES ('152221', '152200', '科尔沁右翼前旗', '2');
INSERT INTO `hc_region` VALUES ('152222', '152200', '科尔沁右翼中旗', '2');
INSERT INTO `hc_region` VALUES ('152223', '152200', '扎赉特旗', '2');
INSERT INTO `hc_region` VALUES ('152224', '152200', '突泉县', '2');
INSERT INTO `hc_region` VALUES ('152500', '150000', '锡林郭勒盟', '1');
INSERT INTO `hc_region` VALUES ('152501', '152500', '二连浩特市', '2');
INSERT INTO `hc_region` VALUES ('152502', '152500', '锡林浩特市', '2');
INSERT INTO `hc_region` VALUES ('152522', '152500', '阿巴嘎旗', '2');
INSERT INTO `hc_region` VALUES ('152523', '152500', '苏尼特左旗', '2');
INSERT INTO `hc_region` VALUES ('152524', '152500', '苏尼特右旗', '2');
INSERT INTO `hc_region` VALUES ('152525', '152500', '东乌珠穆沁旗', '2');
INSERT INTO `hc_region` VALUES ('152526', '152500', '西乌珠穆沁旗', '2');
INSERT INTO `hc_region` VALUES ('152527', '152500', '太仆寺旗', '2');
INSERT INTO `hc_region` VALUES ('152528', '152500', '镶黄旗', '2');
INSERT INTO `hc_region` VALUES ('152529', '152500', '正镶白旗', '2');
INSERT INTO `hc_region` VALUES ('152530', '152500', '正蓝旗', '2');
INSERT INTO `hc_region` VALUES ('152531', '152500', '多伦县', '2');
INSERT INTO `hc_region` VALUES ('152900', '150000', '阿拉善盟', '1');
INSERT INTO `hc_region` VALUES ('152921', '152900', '阿拉善左旗', '2');
INSERT INTO `hc_region` VALUES ('152922', '152900', '阿拉善右旗', '2');
INSERT INTO `hc_region` VALUES ('152923', '152900', '额济纳旗', '2');
INSERT INTO `hc_region` VALUES ('210000', '0', '辽宁省', '0');
INSERT INTO `hc_region` VALUES ('210100', '210000', '沈阳市', '1');
INSERT INTO `hc_region` VALUES ('210101', '210100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('210102', '210100', '和平区', '2');
INSERT INTO `hc_region` VALUES ('210103', '210100', '沈河区', '2');
INSERT INTO `hc_region` VALUES ('210104', '210100', '大东区', '2');
INSERT INTO `hc_region` VALUES ('210105', '210100', '皇姑区', '2');
INSERT INTO `hc_region` VALUES ('210106', '210100', '铁西区', '2');
INSERT INTO `hc_region` VALUES ('210111', '210100', '苏家屯区', '2');
INSERT INTO `hc_region` VALUES ('210112', '210100', '浑南区', '2');
INSERT INTO `hc_region` VALUES ('210113', '210100', '沈北新区', '2');
INSERT INTO `hc_region` VALUES ('210114', '210100', '于洪区', '2');
INSERT INTO `hc_region` VALUES ('210122', '210100', '辽中县', '2');
INSERT INTO `hc_region` VALUES ('210123', '210100', '康平县', '2');
INSERT INTO `hc_region` VALUES ('210124', '210100', '法库县', '2');
INSERT INTO `hc_region` VALUES ('210181', '210100', '新民市', '2');
INSERT INTO `hc_region` VALUES ('210200', '210000', '大连市', '1');
INSERT INTO `hc_region` VALUES ('210201', '210200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('210202', '210200', '中山区', '2');
INSERT INTO `hc_region` VALUES ('210203', '210200', '西岗区', '2');
INSERT INTO `hc_region` VALUES ('210204', '210200', '沙河口区', '2');
INSERT INTO `hc_region` VALUES ('210211', '210200', '甘井子区', '2');
INSERT INTO `hc_region` VALUES ('210212', '210200', '旅顺口区', '2');
INSERT INTO `hc_region` VALUES ('210213', '210200', '金州区', '2');
INSERT INTO `hc_region` VALUES ('210224', '210200', '长海县', '2');
INSERT INTO `hc_region` VALUES ('210281', '210200', '瓦房店市', '2');
INSERT INTO `hc_region` VALUES ('210282', '210200', '普兰店市', '2');
INSERT INTO `hc_region` VALUES ('210283', '210200', '庄河市', '2');
INSERT INTO `hc_region` VALUES ('210300', '210000', '鞍山市', '1');
INSERT INTO `hc_region` VALUES ('210301', '210300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('210302', '210300', '铁东区', '2');
INSERT INTO `hc_region` VALUES ('210303', '210300', '铁西区', '2');
INSERT INTO `hc_region` VALUES ('210304', '210300', '立山区', '2');
INSERT INTO `hc_region` VALUES ('210311', '210300', '千山区', '2');
INSERT INTO `hc_region` VALUES ('210321', '210300', '台安县', '2');
INSERT INTO `hc_region` VALUES ('210323', '210300', '岫岩满族自治县', '2');
INSERT INTO `hc_region` VALUES ('210381', '210300', '海城市', '2');
INSERT INTO `hc_region` VALUES ('210400', '210000', '抚顺市', '1');
INSERT INTO `hc_region` VALUES ('210401', '210400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('210402', '210400', '新抚区', '2');
INSERT INTO `hc_region` VALUES ('210403', '210400', '东洲区', '2');
INSERT INTO `hc_region` VALUES ('210404', '210400', '望花区', '2');
INSERT INTO `hc_region` VALUES ('210411', '210400', '顺城区', '2');
INSERT INTO `hc_region` VALUES ('210421', '210400', '抚顺县', '2');
INSERT INTO `hc_region` VALUES ('210422', '210400', '新宾满族自治县', '2');
INSERT INTO `hc_region` VALUES ('210423', '210400', '清原满族自治县', '2');
INSERT INTO `hc_region` VALUES ('210500', '210000', '本溪市', '1');
INSERT INTO `hc_region` VALUES ('210501', '210500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('210502', '210500', '平山区', '2');
INSERT INTO `hc_region` VALUES ('210503', '210500', '溪湖区', '2');
INSERT INTO `hc_region` VALUES ('210504', '210500', '明山区', '2');
INSERT INTO `hc_region` VALUES ('210505', '210500', '南芬区', '2');
INSERT INTO `hc_region` VALUES ('210521', '210500', '本溪满族自治县', '2');
INSERT INTO `hc_region` VALUES ('210522', '210500', '桓仁满族自治县', '2');
INSERT INTO `hc_region` VALUES ('210600', '210000', '丹东市', '1');
INSERT INTO `hc_region` VALUES ('210601', '210600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('210602', '210600', '元宝区', '2');
INSERT INTO `hc_region` VALUES ('210603', '210600', '振兴区', '2');
INSERT INTO `hc_region` VALUES ('210604', '210600', '振安区', '2');
INSERT INTO `hc_region` VALUES ('210624', '210600', '宽甸满族自治县', '2');
INSERT INTO `hc_region` VALUES ('210681', '210600', '东港市', '2');
INSERT INTO `hc_region` VALUES ('210682', '210600', '凤城市', '2');
INSERT INTO `hc_region` VALUES ('210700', '210000', '锦州市', '1');
INSERT INTO `hc_region` VALUES ('210701', '210700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('210702', '210700', '古塔区', '2');
INSERT INTO `hc_region` VALUES ('210703', '210700', '凌河区', '2');
INSERT INTO `hc_region` VALUES ('210711', '210700', '太和区', '2');
INSERT INTO `hc_region` VALUES ('210726', '210700', '黑山县', '2');
INSERT INTO `hc_region` VALUES ('210727', '210700', '义县', '2');
INSERT INTO `hc_region` VALUES ('210781', '210700', '凌海市', '2');
INSERT INTO `hc_region` VALUES ('210782', '210700', '北镇市', '2');
INSERT INTO `hc_region` VALUES ('210800', '210000', '营口市', '1');
INSERT INTO `hc_region` VALUES ('210801', '210800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('210802', '210800', '站前区', '2');
INSERT INTO `hc_region` VALUES ('210803', '210800', '西市区', '2');
INSERT INTO `hc_region` VALUES ('210804', '210800', '鲅鱼圈区', '2');
INSERT INTO `hc_region` VALUES ('210811', '210800', '老边区', '2');
INSERT INTO `hc_region` VALUES ('210881', '210800', '盖州市', '2');
INSERT INTO `hc_region` VALUES ('210882', '210800', '大石桥市', '2');
INSERT INTO `hc_region` VALUES ('210900', '210000', '阜新市', '1');
INSERT INTO `hc_region` VALUES ('210901', '210900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('210902', '210900', '海州区', '2');
INSERT INTO `hc_region` VALUES ('210903', '210900', '新邱区', '2');
INSERT INTO `hc_region` VALUES ('210904', '210900', '太平区', '2');
INSERT INTO `hc_region` VALUES ('210905', '210900', '清河门区', '2');
INSERT INTO `hc_region` VALUES ('210911', '210900', '细河区', '2');
INSERT INTO `hc_region` VALUES ('210921', '210900', '阜新蒙古族自治县', '2');
INSERT INTO `hc_region` VALUES ('210922', '210900', '彰武县', '2');
INSERT INTO `hc_region` VALUES ('211000', '210000', '辽阳市', '1');
INSERT INTO `hc_region` VALUES ('211001', '211000', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('211002', '211000', '白塔区', '2');
INSERT INTO `hc_region` VALUES ('211003', '211000', '文圣区', '2');
INSERT INTO `hc_region` VALUES ('211004', '211000', '宏伟区', '2');
INSERT INTO `hc_region` VALUES ('211005', '211000', '弓长岭区', '2');
INSERT INTO `hc_region` VALUES ('211011', '211000', '太子河区', '2');
INSERT INTO `hc_region` VALUES ('211021', '211000', '辽阳县', '2');
INSERT INTO `hc_region` VALUES ('211081', '211000', '灯塔市', '2');
INSERT INTO `hc_region` VALUES ('211100', '210000', '盘锦市', '1');
INSERT INTO `hc_region` VALUES ('211101', '211100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('211102', '211100', '双台子区', '2');
INSERT INTO `hc_region` VALUES ('211103', '211100', '兴隆台区', '2');
INSERT INTO `hc_region` VALUES ('211121', '211100', '大洼县', '2');
INSERT INTO `hc_region` VALUES ('211122', '211100', '盘山县', '2');
INSERT INTO `hc_region` VALUES ('211200', '210000', '铁岭市', '1');
INSERT INTO `hc_region` VALUES ('211201', '211200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('211202', '211200', '银州区', '2');
INSERT INTO `hc_region` VALUES ('211204', '211200', '清河区', '2');
INSERT INTO `hc_region` VALUES ('211221', '211200', '铁岭县', '2');
INSERT INTO `hc_region` VALUES ('211223', '211200', '西丰县', '2');
INSERT INTO `hc_region` VALUES ('211224', '211200', '昌图县', '2');
INSERT INTO `hc_region` VALUES ('211281', '211200', '调兵山市', '2');
INSERT INTO `hc_region` VALUES ('211282', '211200', '开原市', '2');
INSERT INTO `hc_region` VALUES ('211300', '210000', '朝阳市', '1');
INSERT INTO `hc_region` VALUES ('211301', '211300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('211302', '211300', '双塔区', '2');
INSERT INTO `hc_region` VALUES ('211303', '211300', '龙城区', '2');
INSERT INTO `hc_region` VALUES ('211321', '211300', '朝阳县', '2');
INSERT INTO `hc_region` VALUES ('211322', '211300', '建平县', '2');
INSERT INTO `hc_region` VALUES ('211324', '211300', '喀喇沁左翼蒙古族自治县', '2');
INSERT INTO `hc_region` VALUES ('211381', '211300', '北票市', '2');
INSERT INTO `hc_region` VALUES ('211382', '211300', '凌源市', '2');
INSERT INTO `hc_region` VALUES ('211400', '210000', '葫芦岛市', '1');
INSERT INTO `hc_region` VALUES ('211401', '211400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('211402', '211400', '连山区', '2');
INSERT INTO `hc_region` VALUES ('211403', '211400', '龙港区', '2');
INSERT INTO `hc_region` VALUES ('211404', '211400', '南票区', '2');
INSERT INTO `hc_region` VALUES ('211421', '211400', '绥中县', '2');
INSERT INTO `hc_region` VALUES ('211422', '211400', '建昌县', '2');
INSERT INTO `hc_region` VALUES ('211481', '211400', '兴城市', '2');
INSERT INTO `hc_region` VALUES ('220000', '0', '吉林省', '0');
INSERT INTO `hc_region` VALUES ('220100', '220000', '长春市', '1');
INSERT INTO `hc_region` VALUES ('220101', '220100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('220102', '220100', '南关区', '2');
INSERT INTO `hc_region` VALUES ('220103', '220100', '宽城区', '2');
INSERT INTO `hc_region` VALUES ('220104', '220100', '朝阳区', '2');
INSERT INTO `hc_region` VALUES ('220105', '220100', '二道区', '2');
INSERT INTO `hc_region` VALUES ('220106', '220100', '绿园区', '2');
INSERT INTO `hc_region` VALUES ('220112', '220100', '双阳区', '2');
INSERT INTO `hc_region` VALUES ('220113', '220100', '九台区', '2');
INSERT INTO `hc_region` VALUES ('220122', '220100', '农安县', '2');
INSERT INTO `hc_region` VALUES ('220182', '220100', '榆树市', '2');
INSERT INTO `hc_region` VALUES ('220183', '220100', '德惠市', '2');
INSERT INTO `hc_region` VALUES ('220200', '220000', '吉林市', '1');
INSERT INTO `hc_region` VALUES ('220201', '220200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('220202', '220200', '昌邑区', '2');
INSERT INTO `hc_region` VALUES ('220203', '220200', '龙潭区', '2');
INSERT INTO `hc_region` VALUES ('220204', '220200', '船营区', '2');
INSERT INTO `hc_region` VALUES ('220211', '220200', '丰满区', '2');
INSERT INTO `hc_region` VALUES ('220221', '220200', '永吉县', '2');
INSERT INTO `hc_region` VALUES ('220281', '220200', '蛟河市', '2');
INSERT INTO `hc_region` VALUES ('220282', '220200', '桦甸市', '2');
INSERT INTO `hc_region` VALUES ('220283', '220200', '舒兰市', '2');
INSERT INTO `hc_region` VALUES ('220284', '220200', '磐石市', '2');
INSERT INTO `hc_region` VALUES ('220300', '220000', '四平市', '1');
INSERT INTO `hc_region` VALUES ('220301', '220300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('220302', '220300', '铁西区', '2');
INSERT INTO `hc_region` VALUES ('220303', '220300', '铁东区', '2');
INSERT INTO `hc_region` VALUES ('220322', '220300', '梨树县', '2');
INSERT INTO `hc_region` VALUES ('220323', '220300', '伊通满族自治县', '2');
INSERT INTO `hc_region` VALUES ('220381', '220300', '公主岭市', '2');
INSERT INTO `hc_region` VALUES ('220382', '220300', '双辽市', '2');
INSERT INTO `hc_region` VALUES ('220400', '220000', '辽源市', '1');
INSERT INTO `hc_region` VALUES ('220401', '220400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('220402', '220400', '龙山区', '2');
INSERT INTO `hc_region` VALUES ('220403', '220400', '西安区', '2');
INSERT INTO `hc_region` VALUES ('220421', '220400', '东丰县', '2');
INSERT INTO `hc_region` VALUES ('220422', '220400', '东辽县', '2');
INSERT INTO `hc_region` VALUES ('220500', '220000', '通化市', '1');
INSERT INTO `hc_region` VALUES ('220501', '220500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('220502', '220500', '东昌区', '2');
INSERT INTO `hc_region` VALUES ('220503', '220500', '二道江区', '2');
INSERT INTO `hc_region` VALUES ('220521', '220500', '通化县', '2');
INSERT INTO `hc_region` VALUES ('220523', '220500', '辉南县', '2');
INSERT INTO `hc_region` VALUES ('220524', '220500', '柳河县', '2');
INSERT INTO `hc_region` VALUES ('220581', '220500', '梅河口市', '2');
INSERT INTO `hc_region` VALUES ('220582', '220500', '集安市', '2');
INSERT INTO `hc_region` VALUES ('220600', '220000', '白山市', '1');
INSERT INTO `hc_region` VALUES ('220601', '220600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('220602', '220600', '浑江区', '2');
INSERT INTO `hc_region` VALUES ('220605', '220600', '江源区', '2');
INSERT INTO `hc_region` VALUES ('220621', '220600', '抚松县', '2');
INSERT INTO `hc_region` VALUES ('220622', '220600', '靖宇县', '2');
INSERT INTO `hc_region` VALUES ('220623', '220600', '长白朝鲜族自治县', '2');
INSERT INTO `hc_region` VALUES ('220681', '220600', '临江市', '2');
INSERT INTO `hc_region` VALUES ('220700', '220000', '松原市', '1');
INSERT INTO `hc_region` VALUES ('220701', '220700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('220702', '220700', '宁江区', '2');
INSERT INTO `hc_region` VALUES ('220721', '220700', '前郭尔罗斯蒙古族自治县', '2');
INSERT INTO `hc_region` VALUES ('220722', '220700', '长岭县', '2');
INSERT INTO `hc_region` VALUES ('220723', '220700', '乾安县', '2');
INSERT INTO `hc_region` VALUES ('220781', '220700', '扶余市', '2');
INSERT INTO `hc_region` VALUES ('220800', '220000', '白城市', '1');
INSERT INTO `hc_region` VALUES ('220801', '220800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('220802', '220800', '洮北区', '2');
INSERT INTO `hc_region` VALUES ('220821', '220800', '镇赉县', '2');
INSERT INTO `hc_region` VALUES ('220822', '220800', '通榆县', '2');
INSERT INTO `hc_region` VALUES ('220881', '220800', '洮南市', '2');
INSERT INTO `hc_region` VALUES ('220882', '220800', '大安市', '2');
INSERT INTO `hc_region` VALUES ('222400', '220000', '延边朝鲜族自治州', '1');
INSERT INTO `hc_region` VALUES ('222401', '222400', '延吉市', '2');
INSERT INTO `hc_region` VALUES ('222402', '222400', '图们市', '2');
INSERT INTO `hc_region` VALUES ('222403', '222400', '敦化市', '2');
INSERT INTO `hc_region` VALUES ('222404', '222400', '珲春市', '2');
INSERT INTO `hc_region` VALUES ('222405', '222400', '龙井市', '2');
INSERT INTO `hc_region` VALUES ('222406', '222400', '和龙市', '2');
INSERT INTO `hc_region` VALUES ('222424', '222400', '汪清县', '2');
INSERT INTO `hc_region` VALUES ('222426', '222400', '安图县', '2');
INSERT INTO `hc_region` VALUES ('230000', '0', '黑龙江省', '0');
INSERT INTO `hc_region` VALUES ('230100', '230000', '哈尔滨市', '1');
INSERT INTO `hc_region` VALUES ('230101', '230100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('230102', '230100', '道里区', '2');
INSERT INTO `hc_region` VALUES ('230103', '230100', '南岗区', '2');
INSERT INTO `hc_region` VALUES ('230104', '230100', '道外区', '2');
INSERT INTO `hc_region` VALUES ('230108', '230100', '平房区', '2');
INSERT INTO `hc_region` VALUES ('230109', '230100', '松北区', '2');
INSERT INTO `hc_region` VALUES ('230110', '230100', '香坊区', '2');
INSERT INTO `hc_region` VALUES ('230111', '230100', '呼兰区', '2');
INSERT INTO `hc_region` VALUES ('230112', '230100', '阿城区', '2');
INSERT INTO `hc_region` VALUES ('230123', '230100', '依兰县', '2');
INSERT INTO `hc_region` VALUES ('230124', '230100', '方正县', '2');
INSERT INTO `hc_region` VALUES ('230125', '230100', '宾县', '2');
INSERT INTO `hc_region` VALUES ('230126', '230100', '巴彦县', '2');
INSERT INTO `hc_region` VALUES ('230127', '230100', '木兰县', '2');
INSERT INTO `hc_region` VALUES ('230128', '230100', '通河县', '2');
INSERT INTO `hc_region` VALUES ('230129', '230100', '延寿县', '2');
INSERT INTO `hc_region` VALUES ('230182', '230100', '双城市', '2');
INSERT INTO `hc_region` VALUES ('230183', '230100', '尚志市', '2');
INSERT INTO `hc_region` VALUES ('230184', '230100', '五常市', '2');
INSERT INTO `hc_region` VALUES ('230200', '230000', '齐齐哈尔市', '1');
INSERT INTO `hc_region` VALUES ('230201', '230200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('230202', '230200', '龙沙区', '2');
INSERT INTO `hc_region` VALUES ('230203', '230200', '建华区', '2');
INSERT INTO `hc_region` VALUES ('230204', '230200', '铁锋区', '2');
INSERT INTO `hc_region` VALUES ('230205', '230200', '昂昂溪区', '2');
INSERT INTO `hc_region` VALUES ('230206', '230200', '富拉尔基区', '2');
INSERT INTO `hc_region` VALUES ('230207', '230200', '碾子山区', '2');
INSERT INTO `hc_region` VALUES ('230208', '230200', '梅里斯达斡尔族区', '2');
INSERT INTO `hc_region` VALUES ('230221', '230200', '龙江县', '2');
INSERT INTO `hc_region` VALUES ('230223', '230200', '依安县', '2');
INSERT INTO `hc_region` VALUES ('230224', '230200', '泰来县', '2');
INSERT INTO `hc_region` VALUES ('230225', '230200', '甘南县', '2');
INSERT INTO `hc_region` VALUES ('230227', '230200', '富裕县', '2');
INSERT INTO `hc_region` VALUES ('230229', '230200', '克山县', '2');
INSERT INTO `hc_region` VALUES ('230230', '230200', '克东县', '2');
INSERT INTO `hc_region` VALUES ('230231', '230200', '拜泉县', '2');
INSERT INTO `hc_region` VALUES ('230281', '230200', '讷河市', '2');
INSERT INTO `hc_region` VALUES ('230300', '230000', '鸡西市', '1');
INSERT INTO `hc_region` VALUES ('230301', '230300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('230302', '230300', '鸡冠区', '2');
INSERT INTO `hc_region` VALUES ('230303', '230300', '恒山区', '2');
INSERT INTO `hc_region` VALUES ('230304', '230300', '滴道区', '2');
INSERT INTO `hc_region` VALUES ('230305', '230300', '梨树区', '2');
INSERT INTO `hc_region` VALUES ('230306', '230300', '城子河区', '2');
INSERT INTO `hc_region` VALUES ('230307', '230300', '麻山区', '2');
INSERT INTO `hc_region` VALUES ('230321', '230300', '鸡东县', '2');
INSERT INTO `hc_region` VALUES ('230381', '230300', '虎林市', '2');
INSERT INTO `hc_region` VALUES ('230382', '230300', '密山市', '2');
INSERT INTO `hc_region` VALUES ('230400', '230000', '鹤岗市', '1');
INSERT INTO `hc_region` VALUES ('230401', '230400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('230402', '230400', '向阳区', '2');
INSERT INTO `hc_region` VALUES ('230403', '230400', '工农区', '2');
INSERT INTO `hc_region` VALUES ('230404', '230400', '南山区', '2');
INSERT INTO `hc_region` VALUES ('230405', '230400', '兴安区', '2');
INSERT INTO `hc_region` VALUES ('230406', '230400', '东山区', '2');
INSERT INTO `hc_region` VALUES ('230407', '230400', '兴山区', '2');
INSERT INTO `hc_region` VALUES ('230421', '230400', '萝北县', '2');
INSERT INTO `hc_region` VALUES ('230422', '230400', '绥滨县', '2');
INSERT INTO `hc_region` VALUES ('230500', '230000', '双鸭山市', '1');
INSERT INTO `hc_region` VALUES ('230501', '230500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('230502', '230500', '尖山区', '2');
INSERT INTO `hc_region` VALUES ('230503', '230500', '岭东区', '2');
INSERT INTO `hc_region` VALUES ('230505', '230500', '四方台区', '2');
INSERT INTO `hc_region` VALUES ('230506', '230500', '宝山区', '2');
INSERT INTO `hc_region` VALUES ('230521', '230500', '集贤县', '2');
INSERT INTO `hc_region` VALUES ('230522', '230500', '友谊县', '2');
INSERT INTO `hc_region` VALUES ('230523', '230500', '宝清县', '2');
INSERT INTO `hc_region` VALUES ('230524', '230500', '饶河县', '2');
INSERT INTO `hc_region` VALUES ('230600', '230000', '大庆市', '1');
INSERT INTO `hc_region` VALUES ('230601', '230600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('230602', '230600', '萨尔图区', '2');
INSERT INTO `hc_region` VALUES ('230603', '230600', '龙凤区', '2');
INSERT INTO `hc_region` VALUES ('230604', '230600', '让胡路区', '2');
INSERT INTO `hc_region` VALUES ('230605', '230600', '红岗区', '2');
INSERT INTO `hc_region` VALUES ('230606', '230600', '大同区', '2');
INSERT INTO `hc_region` VALUES ('230621', '230600', '肇州县', '2');
INSERT INTO `hc_region` VALUES ('230622', '230600', '肇源县', '2');
INSERT INTO `hc_region` VALUES ('230623', '230600', '林甸县', '2');
INSERT INTO `hc_region` VALUES ('230624', '230600', '杜尔伯特蒙古族自治县', '2');
INSERT INTO `hc_region` VALUES ('230700', '230000', '伊春市', '1');
INSERT INTO `hc_region` VALUES ('230701', '230700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('230702', '230700', '伊春区', '2');
INSERT INTO `hc_region` VALUES ('230703', '230700', '南岔区', '2');
INSERT INTO `hc_region` VALUES ('230704', '230700', '友好区', '2');
INSERT INTO `hc_region` VALUES ('230705', '230700', '西林区', '2');
INSERT INTO `hc_region` VALUES ('230706', '230700', '翠峦区', '2');
INSERT INTO `hc_region` VALUES ('230707', '230700', '新青区', '2');
INSERT INTO `hc_region` VALUES ('230708', '230700', '美溪区', '2');
INSERT INTO `hc_region` VALUES ('230709', '230700', '金山屯区', '2');
INSERT INTO `hc_region` VALUES ('230710', '230700', '五营区', '2');
INSERT INTO `hc_region` VALUES ('230711', '230700', '乌马河区', '2');
INSERT INTO `hc_region` VALUES ('230712', '230700', '汤旺河区', '2');
INSERT INTO `hc_region` VALUES ('230713', '230700', '带岭区', '2');
INSERT INTO `hc_region` VALUES ('230714', '230700', '乌伊岭区', '2');
INSERT INTO `hc_region` VALUES ('230715', '230700', '红星区', '2');
INSERT INTO `hc_region` VALUES ('230716', '230700', '上甘岭区', '2');
INSERT INTO `hc_region` VALUES ('230722', '230700', '嘉荫县', '2');
INSERT INTO `hc_region` VALUES ('230781', '230700', '铁力市', '2');
INSERT INTO `hc_region` VALUES ('230800', '230000', '佳木斯市', '1');
INSERT INTO `hc_region` VALUES ('230801', '230800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('230803', '230800', '向阳区', '2');
INSERT INTO `hc_region` VALUES ('230804', '230800', '前进区', '2');
INSERT INTO `hc_region` VALUES ('230805', '230800', '东风区', '2');
INSERT INTO `hc_region` VALUES ('230811', '230800', '郊区', '2');
INSERT INTO `hc_region` VALUES ('230822', '230800', '桦南县', '2');
INSERT INTO `hc_region` VALUES ('230826', '230800', '桦川县', '2');
INSERT INTO `hc_region` VALUES ('230828', '230800', '汤原县', '2');
INSERT INTO `hc_region` VALUES ('230833', '230800', '抚远县', '2');
INSERT INTO `hc_region` VALUES ('230881', '230800', '同江市', '2');
INSERT INTO `hc_region` VALUES ('230882', '230800', '富锦市', '2');
INSERT INTO `hc_region` VALUES ('230900', '230000', '七台河市', '1');
INSERT INTO `hc_region` VALUES ('230901', '230900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('230902', '230900', '新兴区', '2');
INSERT INTO `hc_region` VALUES ('230903', '230900', '桃山区', '2');
INSERT INTO `hc_region` VALUES ('230904', '230900', '茄子河区', '2');
INSERT INTO `hc_region` VALUES ('230921', '230900', '勃利县', '2');
INSERT INTO `hc_region` VALUES ('231000', '230000', '牡丹江市', '1');
INSERT INTO `hc_region` VALUES ('231001', '231000', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('231002', '231000', '东安区', '2');
INSERT INTO `hc_region` VALUES ('231003', '231000', '阳明区', '2');
INSERT INTO `hc_region` VALUES ('231004', '231000', '爱民区', '2');
INSERT INTO `hc_region` VALUES ('231005', '231000', '西安区', '2');
INSERT INTO `hc_region` VALUES ('231024', '231000', '东宁县', '2');
INSERT INTO `hc_region` VALUES ('231025', '231000', '林口县', '2');
INSERT INTO `hc_region` VALUES ('231081', '231000', '绥芬河市', '2');
INSERT INTO `hc_region` VALUES ('231083', '231000', '海林市', '2');
INSERT INTO `hc_region` VALUES ('231084', '231000', '宁安市', '2');
INSERT INTO `hc_region` VALUES ('231085', '231000', '穆棱市', '2');
INSERT INTO `hc_region` VALUES ('231100', '230000', '黑河市', '1');
INSERT INTO `hc_region` VALUES ('231101', '231100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('231102', '231100', '爱辉区', '2');
INSERT INTO `hc_region` VALUES ('231121', '231100', '嫩江县', '2');
INSERT INTO `hc_region` VALUES ('231123', '231100', '逊克县', '2');
INSERT INTO `hc_region` VALUES ('231124', '231100', '孙吴县', '2');
INSERT INTO `hc_region` VALUES ('231181', '231100', '北安市', '2');
INSERT INTO `hc_region` VALUES ('231182', '231100', '五大连池市', '2');
INSERT INTO `hc_region` VALUES ('231200', '230000', '绥化市', '1');
INSERT INTO `hc_region` VALUES ('231201', '231200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('231202', '231200', '北林区', '2');
INSERT INTO `hc_region` VALUES ('231221', '231200', '望奎县', '2');
INSERT INTO `hc_region` VALUES ('231222', '231200', '兰西县', '2');
INSERT INTO `hc_region` VALUES ('231223', '231200', '青冈县', '2');
INSERT INTO `hc_region` VALUES ('231224', '231200', '庆安县', '2');
INSERT INTO `hc_region` VALUES ('231225', '231200', '明水县', '2');
INSERT INTO `hc_region` VALUES ('231226', '231200', '绥棱县', '2');
INSERT INTO `hc_region` VALUES ('231281', '231200', '安达市', '2');
INSERT INTO `hc_region` VALUES ('231282', '231200', '肇东市', '2');
INSERT INTO `hc_region` VALUES ('231283', '231200', '海伦市', '2');
INSERT INTO `hc_region` VALUES ('232700', '230000', '大兴安岭地区', '1');
INSERT INTO `hc_region` VALUES ('232721', '232700', '呼玛县', '2');
INSERT INTO `hc_region` VALUES ('232722', '232700', '塔河县', '2');
INSERT INTO `hc_region` VALUES ('232723', '232700', '漠河县', '2');
INSERT INTO `hc_region` VALUES ('310000', '0', '上海市', '0');
INSERT INTO `hc_region` VALUES ('310100', '310000', '市辖区', '1');
INSERT INTO `hc_region` VALUES ('310101', '310100', '黄浦区', '2');
INSERT INTO `hc_region` VALUES ('310104', '310100', '徐汇区', '2');
INSERT INTO `hc_region` VALUES ('310105', '310100', '长宁区', '2');
INSERT INTO `hc_region` VALUES ('310106', '310100', '静安区', '2');
INSERT INTO `hc_region` VALUES ('310107', '310100', '普陀区', '2');
INSERT INTO `hc_region` VALUES ('310108', '310100', '闸北区', '2');
INSERT INTO `hc_region` VALUES ('310109', '310100', '虹口区', '2');
INSERT INTO `hc_region` VALUES ('310110', '310100', '杨浦区', '2');
INSERT INTO `hc_region` VALUES ('310112', '310100', '闵行区', '2');
INSERT INTO `hc_region` VALUES ('310113', '310100', '宝山区', '2');
INSERT INTO `hc_region` VALUES ('310114', '310100', '嘉定区', '2');
INSERT INTO `hc_region` VALUES ('310115', '310100', '浦东新区', '2');
INSERT INTO `hc_region` VALUES ('310116', '310100', '金山区', '2');
INSERT INTO `hc_region` VALUES ('310117', '310100', '松江区', '2');
INSERT INTO `hc_region` VALUES ('310118', '310100', '青浦区', '2');
INSERT INTO `hc_region` VALUES ('310120', '310100', '奉贤区', '2');
INSERT INTO `hc_region` VALUES ('310200', '310000', '县', '1');
INSERT INTO `hc_region` VALUES ('310230', '310200', '崇明县', '2');
INSERT INTO `hc_region` VALUES ('320000', '0', '江苏省', '0');
INSERT INTO `hc_region` VALUES ('320100', '320000', '南京市', '1');
INSERT INTO `hc_region` VALUES ('320101', '320100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('320102', '320100', '玄武区', '2');
INSERT INTO `hc_region` VALUES ('320104', '320100', '秦淮区', '2');
INSERT INTO `hc_region` VALUES ('320105', '320100', '建邺区', '2');
INSERT INTO `hc_region` VALUES ('320106', '320100', '鼓楼区', '2');
INSERT INTO `hc_region` VALUES ('320111', '320100', '浦口区', '2');
INSERT INTO `hc_region` VALUES ('320113', '320100', '栖霞区', '2');
INSERT INTO `hc_region` VALUES ('320114', '320100', '雨花台区', '2');
INSERT INTO `hc_region` VALUES ('320115', '320100', '江宁区', '2');
INSERT INTO `hc_region` VALUES ('320116', '320100', '六合区', '2');
INSERT INTO `hc_region` VALUES ('320117', '320100', '溧水区', '2');
INSERT INTO `hc_region` VALUES ('320118', '320100', '高淳区', '2');
INSERT INTO `hc_region` VALUES ('320200', '320000', '无锡市', '1');
INSERT INTO `hc_region` VALUES ('320201', '320200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('320202', '320200', '崇安区', '2');
INSERT INTO `hc_region` VALUES ('320203', '320200', '南长区', '2');
INSERT INTO `hc_region` VALUES ('320204', '320200', '北塘区', '2');
INSERT INTO `hc_region` VALUES ('320205', '320200', '锡山区', '2');
INSERT INTO `hc_region` VALUES ('320206', '320200', '惠山区', '2');
INSERT INTO `hc_region` VALUES ('320211', '320200', '滨湖区', '2');
INSERT INTO `hc_region` VALUES ('320281', '320200', '江阴市', '2');
INSERT INTO `hc_region` VALUES ('320282', '320200', '宜兴市', '2');
INSERT INTO `hc_region` VALUES ('320300', '320000', '徐州市', '1');
INSERT INTO `hc_region` VALUES ('320301', '320300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('320302', '320300', '鼓楼区', '2');
INSERT INTO `hc_region` VALUES ('320303', '320300', '云龙区', '2');
INSERT INTO `hc_region` VALUES ('320305', '320300', '贾汪区', '2');
INSERT INTO `hc_region` VALUES ('320311', '320300', '泉山区', '2');
INSERT INTO `hc_region` VALUES ('320312', '320300', '铜山区', '2');
INSERT INTO `hc_region` VALUES ('320321', '320300', '丰县', '2');
INSERT INTO `hc_region` VALUES ('320322', '320300', '沛县', '2');
INSERT INTO `hc_region` VALUES ('320324', '320300', '睢宁县', '2');
INSERT INTO `hc_region` VALUES ('320381', '320300', '新沂市', '2');
INSERT INTO `hc_region` VALUES ('320382', '320300', '邳州市', '2');
INSERT INTO `hc_region` VALUES ('320400', '320000', '常州市', '1');
INSERT INTO `hc_region` VALUES ('320401', '320400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('320402', '320400', '天宁区', '2');
INSERT INTO `hc_region` VALUES ('320404', '320400', '钟楼区', '2');
INSERT INTO `hc_region` VALUES ('320405', '320400', '戚墅堰区', '2');
INSERT INTO `hc_region` VALUES ('320411', '320400', '新北区', '2');
INSERT INTO `hc_region` VALUES ('320412', '320400', '武进区', '2');
INSERT INTO `hc_region` VALUES ('320481', '320400', '溧阳市', '2');
INSERT INTO `hc_region` VALUES ('320482', '320400', '金坛市', '2');
INSERT INTO `hc_region` VALUES ('320500', '320000', '苏州市', '1');
INSERT INTO `hc_region` VALUES ('320501', '320500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('320505', '320500', '虎丘区', '2');
INSERT INTO `hc_region` VALUES ('320506', '320500', '吴中区', '2');
INSERT INTO `hc_region` VALUES ('320507', '320500', '相城区', '2');
INSERT INTO `hc_region` VALUES ('320508', '320500', '姑苏区', '2');
INSERT INTO `hc_region` VALUES ('320509', '320500', '吴江区', '2');
INSERT INTO `hc_region` VALUES ('320581', '320500', '常熟市', '2');
INSERT INTO `hc_region` VALUES ('320582', '320500', '张家港市', '2');
INSERT INTO `hc_region` VALUES ('320583', '320500', '昆山市', '2');
INSERT INTO `hc_region` VALUES ('320585', '320500', '太仓市', '2');
INSERT INTO `hc_region` VALUES ('320600', '320000', '南通市', '1');
INSERT INTO `hc_region` VALUES ('320601', '320600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('320602', '320600', '崇川区', '2');
INSERT INTO `hc_region` VALUES ('320611', '320600', '港闸区', '2');
INSERT INTO `hc_region` VALUES ('320612', '320600', '通州区', '2');
INSERT INTO `hc_region` VALUES ('320621', '320600', '海安县', '2');
INSERT INTO `hc_region` VALUES ('320623', '320600', '如东县', '2');
INSERT INTO `hc_region` VALUES ('320681', '320600', '启东市', '2');
INSERT INTO `hc_region` VALUES ('320682', '320600', '如皋市', '2');
INSERT INTO `hc_region` VALUES ('320684', '320600', '海门市', '2');
INSERT INTO `hc_region` VALUES ('320700', '320000', '连云港市', '1');
INSERT INTO `hc_region` VALUES ('320701', '320700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('320703', '320700', '连云区', '2');
INSERT INTO `hc_region` VALUES ('320706', '320700', '海州区', '2');
INSERT INTO `hc_region` VALUES ('320707', '320700', '赣榆区', '2');
INSERT INTO `hc_region` VALUES ('320722', '320700', '东海县', '2');
INSERT INTO `hc_region` VALUES ('320723', '320700', '灌云县', '2');
INSERT INTO `hc_region` VALUES ('320724', '320700', '灌南县', '2');
INSERT INTO `hc_region` VALUES ('320800', '320000', '淮安市', '1');
INSERT INTO `hc_region` VALUES ('320801', '320800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('320802', '320800', '清河区', '2');
INSERT INTO `hc_region` VALUES ('320803', '320800', '淮安区', '2');
INSERT INTO `hc_region` VALUES ('320804', '320800', '淮阴区', '2');
INSERT INTO `hc_region` VALUES ('320811', '320800', '清浦区', '2');
INSERT INTO `hc_region` VALUES ('320826', '320800', '涟水县', '2');
INSERT INTO `hc_region` VALUES ('320829', '320800', '洪泽县', '2');
INSERT INTO `hc_region` VALUES ('320830', '320800', '盱眙县', '2');
INSERT INTO `hc_region` VALUES ('320831', '320800', '金湖县', '2');
INSERT INTO `hc_region` VALUES ('320900', '320000', '盐城市', '1');
INSERT INTO `hc_region` VALUES ('320901', '320900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('320902', '320900', '亭湖区', '2');
INSERT INTO `hc_region` VALUES ('320903', '320900', '盐都区', '2');
INSERT INTO `hc_region` VALUES ('320921', '320900', '响水县', '2');
INSERT INTO `hc_region` VALUES ('320922', '320900', '滨海县', '2');
INSERT INTO `hc_region` VALUES ('320923', '320900', '阜宁县', '2');
INSERT INTO `hc_region` VALUES ('320924', '320900', '射阳县', '2');
INSERT INTO `hc_region` VALUES ('320925', '320900', '建湖县', '2');
INSERT INTO `hc_region` VALUES ('320981', '320900', '东台市', '2');
INSERT INTO `hc_region` VALUES ('320982', '320900', '大丰市', '2');
INSERT INTO `hc_region` VALUES ('321000', '320000', '扬州市', '1');
INSERT INTO `hc_region` VALUES ('321001', '321000', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('321002', '321000', '广陵区', '2');
INSERT INTO `hc_region` VALUES ('321003', '321000', '邗江区', '2');
INSERT INTO `hc_region` VALUES ('321012', '321000', '江都区', '2');
INSERT INTO `hc_region` VALUES ('321023', '321000', '宝应县', '2');
INSERT INTO `hc_region` VALUES ('321081', '321000', '仪征市', '2');
INSERT INTO `hc_region` VALUES ('321084', '321000', '高邮市', '2');
INSERT INTO `hc_region` VALUES ('321100', '320000', '镇江市', '1');
INSERT INTO `hc_region` VALUES ('321101', '321100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('321102', '321100', '京口区', '2');
INSERT INTO `hc_region` VALUES ('321111', '321100', '润州区', '2');
INSERT INTO `hc_region` VALUES ('321112', '321100', '丹徒区', '2');
INSERT INTO `hc_region` VALUES ('321181', '321100', '丹阳市', '2');
INSERT INTO `hc_region` VALUES ('321182', '321100', '扬中市', '2');
INSERT INTO `hc_region` VALUES ('321183', '321100', '句容市', '2');
INSERT INTO `hc_region` VALUES ('321200', '320000', '泰州市', '1');
INSERT INTO `hc_region` VALUES ('321201', '321200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('321202', '321200', '海陵区', '2');
INSERT INTO `hc_region` VALUES ('321203', '321200', '高港区', '2');
INSERT INTO `hc_region` VALUES ('321204', '321200', '姜堰区', '2');
INSERT INTO `hc_region` VALUES ('321281', '321200', '兴化市', '2');
INSERT INTO `hc_region` VALUES ('321282', '321200', '靖江市', '2');
INSERT INTO `hc_region` VALUES ('321283', '321200', '泰兴市', '2');
INSERT INTO `hc_region` VALUES ('321300', '320000', '宿迁市', '1');
INSERT INTO `hc_region` VALUES ('321301', '321300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('321302', '321300', '宿城区', '2');
INSERT INTO `hc_region` VALUES ('321311', '321300', '宿豫区', '2');
INSERT INTO `hc_region` VALUES ('321322', '321300', '沭阳县', '2');
INSERT INTO `hc_region` VALUES ('321323', '321300', '泗阳县', '2');
INSERT INTO `hc_region` VALUES ('321324', '321300', '泗洪县', '2');
INSERT INTO `hc_region` VALUES ('330000', '0', '浙江省', '0');
INSERT INTO `hc_region` VALUES ('330100', '330000', '杭州市', '1');
INSERT INTO `hc_region` VALUES ('330101', '330100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('330102', '330100', '上城区', '2');
INSERT INTO `hc_region` VALUES ('330103', '330100', '下城区', '2');
INSERT INTO `hc_region` VALUES ('330104', '330100', '江干区', '2');
INSERT INTO `hc_region` VALUES ('330105', '330100', '拱墅区', '2');
INSERT INTO `hc_region` VALUES ('330106', '330100', '西湖区', '2');
INSERT INTO `hc_region` VALUES ('330108', '330100', '滨江区', '2');
INSERT INTO `hc_region` VALUES ('330109', '330100', '萧山区', '2');
INSERT INTO `hc_region` VALUES ('330110', '330100', '余杭区', '2');
INSERT INTO `hc_region` VALUES ('330122', '330100', '桐庐县', '2');
INSERT INTO `hc_region` VALUES ('330127', '330100', '淳安县', '2');
INSERT INTO `hc_region` VALUES ('330182', '330100', '建德市', '2');
INSERT INTO `hc_region` VALUES ('330183', '330100', '富阳市', '2');
INSERT INTO `hc_region` VALUES ('330185', '330100', '临安市', '2');
INSERT INTO `hc_region` VALUES ('330200', '330000', '宁波市', '1');
INSERT INTO `hc_region` VALUES ('330201', '330200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('330203', '330200', '海曙区', '2');
INSERT INTO `hc_region` VALUES ('330204', '330200', '江东区', '2');
INSERT INTO `hc_region` VALUES ('330205', '330200', '江北区', '2');
INSERT INTO `hc_region` VALUES ('330206', '330200', '北仑区', '2');
INSERT INTO `hc_region` VALUES ('330211', '330200', '镇海区', '2');
INSERT INTO `hc_region` VALUES ('330212', '330200', '鄞州区', '2');
INSERT INTO `hc_region` VALUES ('330225', '330200', '象山县', '2');
INSERT INTO `hc_region` VALUES ('330226', '330200', '宁海县', '2');
INSERT INTO `hc_region` VALUES ('330281', '330200', '余姚市', '2');
INSERT INTO `hc_region` VALUES ('330282', '330200', '慈溪市', '2');
INSERT INTO `hc_region` VALUES ('330283', '330200', '奉化市', '2');
INSERT INTO `hc_region` VALUES ('330300', '330000', '温州市', '1');
INSERT INTO `hc_region` VALUES ('330301', '330300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('330302', '330300', '鹿城区', '2');
INSERT INTO `hc_region` VALUES ('330303', '330300', '龙湾区', '2');
INSERT INTO `hc_region` VALUES ('330304', '330300', '瓯海区', '2');
INSERT INTO `hc_region` VALUES ('330322', '330300', '洞头县', '2');
INSERT INTO `hc_region` VALUES ('330324', '330300', '永嘉县', '2');
INSERT INTO `hc_region` VALUES ('330326', '330300', '平阳县', '2');
INSERT INTO `hc_region` VALUES ('330327', '330300', '苍南县', '2');
INSERT INTO `hc_region` VALUES ('330328', '330300', '文成县', '2');
INSERT INTO `hc_region` VALUES ('330329', '330300', '泰顺县', '2');
INSERT INTO `hc_region` VALUES ('330381', '330300', '瑞安市', '2');
INSERT INTO `hc_region` VALUES ('330382', '330300', '乐清市', '2');
INSERT INTO `hc_region` VALUES ('330400', '330000', '嘉兴市', '1');
INSERT INTO `hc_region` VALUES ('330401', '330400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('330402', '330400', '南湖区', '2');
INSERT INTO `hc_region` VALUES ('330411', '330400', '秀洲区', '2');
INSERT INTO `hc_region` VALUES ('330421', '330400', '嘉善县', '2');
INSERT INTO `hc_region` VALUES ('330424', '330400', '海盐县', '2');
INSERT INTO `hc_region` VALUES ('330481', '330400', '海宁市', '2');
INSERT INTO `hc_region` VALUES ('330482', '330400', '平湖市', '2');
INSERT INTO `hc_region` VALUES ('330483', '330400', '桐乡市', '2');
INSERT INTO `hc_region` VALUES ('330500', '330000', '湖州市', '1');
INSERT INTO `hc_region` VALUES ('330501', '330500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('330502', '330500', '吴兴区', '2');
INSERT INTO `hc_region` VALUES ('330503', '330500', '南浔区', '2');
INSERT INTO `hc_region` VALUES ('330521', '330500', '德清县', '2');
INSERT INTO `hc_region` VALUES ('330522', '330500', '长兴县', '2');
INSERT INTO `hc_region` VALUES ('330523', '330500', '安吉县', '2');
INSERT INTO `hc_region` VALUES ('330600', '330000', '绍兴市', '1');
INSERT INTO `hc_region` VALUES ('330601', '330600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('330602', '330600', '越城区', '2');
INSERT INTO `hc_region` VALUES ('330603', '330600', '柯桥区', '2');
INSERT INTO `hc_region` VALUES ('330604', '330600', '上虞区', '2');
INSERT INTO `hc_region` VALUES ('330624', '330600', '新昌县', '2');
INSERT INTO `hc_region` VALUES ('330681', '330600', '诸暨市', '2');
INSERT INTO `hc_region` VALUES ('330683', '330600', '嵊州市', '2');
INSERT INTO `hc_region` VALUES ('330700', '330000', '金华市', '1');
INSERT INTO `hc_region` VALUES ('330701', '330700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('330702', '330700', '婺城区', '2');
INSERT INTO `hc_region` VALUES ('330703', '330700', '金东区', '2');
INSERT INTO `hc_region` VALUES ('330723', '330700', '武义县', '2');
INSERT INTO `hc_region` VALUES ('330726', '330700', '浦江县', '2');
INSERT INTO `hc_region` VALUES ('330727', '330700', '磐安县', '2');
INSERT INTO `hc_region` VALUES ('330781', '330700', '兰溪市', '2');
INSERT INTO `hc_region` VALUES ('330782', '330700', '义乌市', '2');
INSERT INTO `hc_region` VALUES ('330783', '330700', '东阳市', '2');
INSERT INTO `hc_region` VALUES ('330784', '330700', '永康市', '2');
INSERT INTO `hc_region` VALUES ('330800', '330000', '衢州市', '1');
INSERT INTO `hc_region` VALUES ('330801', '330800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('330802', '330800', '柯城区', '2');
INSERT INTO `hc_region` VALUES ('330803', '330800', '衢江区', '2');
INSERT INTO `hc_region` VALUES ('330822', '330800', '常山县', '2');
INSERT INTO `hc_region` VALUES ('330824', '330800', '开化县', '2');
INSERT INTO `hc_region` VALUES ('330825', '330800', '龙游县', '2');
INSERT INTO `hc_region` VALUES ('330881', '330800', '江山市', '2');
INSERT INTO `hc_region` VALUES ('330900', '330000', '舟山市', '1');
INSERT INTO `hc_region` VALUES ('330901', '330900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('330902', '330900', '定海区', '2');
INSERT INTO `hc_region` VALUES ('330903', '330900', '普陀区', '2');
INSERT INTO `hc_region` VALUES ('330921', '330900', '岱山县', '2');
INSERT INTO `hc_region` VALUES ('330922', '330900', '嵊泗县', '2');
INSERT INTO `hc_region` VALUES ('331000', '330000', '台州市', '1');
INSERT INTO `hc_region` VALUES ('331001', '331000', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('331002', '331000', '椒江区', '2');
INSERT INTO `hc_region` VALUES ('331003', '331000', '黄岩区', '2');
INSERT INTO `hc_region` VALUES ('331004', '331000', '路桥区', '2');
INSERT INTO `hc_region` VALUES ('331021', '331000', '玉环县', '2');
INSERT INTO `hc_region` VALUES ('331022', '331000', '三门县', '2');
INSERT INTO `hc_region` VALUES ('331023', '331000', '天台县', '2');
INSERT INTO `hc_region` VALUES ('331024', '331000', '仙居县', '2');
INSERT INTO `hc_region` VALUES ('331081', '331000', '温岭市', '2');
INSERT INTO `hc_region` VALUES ('331082', '331000', '临海市', '2');
INSERT INTO `hc_region` VALUES ('331100', '330000', '丽水市', '1');
INSERT INTO `hc_region` VALUES ('331101', '331100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('331102', '331100', '莲都区', '2');
INSERT INTO `hc_region` VALUES ('331121', '331100', '青田县', '2');
INSERT INTO `hc_region` VALUES ('331122', '331100', '缙云县', '2');
INSERT INTO `hc_region` VALUES ('331123', '331100', '遂昌县', '2');
INSERT INTO `hc_region` VALUES ('331124', '331100', '松阳县', '2');
INSERT INTO `hc_region` VALUES ('331125', '331100', '云和县', '2');
INSERT INTO `hc_region` VALUES ('331126', '331100', '庆元县', '2');
INSERT INTO `hc_region` VALUES ('331127', '331100', '景宁畲族自治县', '2');
INSERT INTO `hc_region` VALUES ('331181', '331100', '龙泉市', '2');
INSERT INTO `hc_region` VALUES ('340000', '0', '安徽省', '0');
INSERT INTO `hc_region` VALUES ('340100', '340000', '合肥市', '1');
INSERT INTO `hc_region` VALUES ('340101', '340100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('340102', '340100', '瑶海区', '2');
INSERT INTO `hc_region` VALUES ('340103', '340100', '庐阳区', '2');
INSERT INTO `hc_region` VALUES ('340104', '340100', '蜀山区', '2');
INSERT INTO `hc_region` VALUES ('340111', '340100', '包河区', '2');
INSERT INTO `hc_region` VALUES ('340121', '340100', '长丰县', '2');
INSERT INTO `hc_region` VALUES ('340122', '340100', '肥东县', '2');
INSERT INTO `hc_region` VALUES ('340123', '340100', '肥西县', '2');
INSERT INTO `hc_region` VALUES ('340124', '340100', '庐江县', '2');
INSERT INTO `hc_region` VALUES ('340181', '340100', '巢湖市', '2');
INSERT INTO `hc_region` VALUES ('340200', '340000', '芜湖市', '1');
INSERT INTO `hc_region` VALUES ('340201', '340200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('340202', '340200', '镜湖区', '2');
INSERT INTO `hc_region` VALUES ('340203', '340200', '弋江区', '2');
INSERT INTO `hc_region` VALUES ('340207', '340200', '鸠江区', '2');
INSERT INTO `hc_region` VALUES ('340208', '340200', '三山区', '2');
INSERT INTO `hc_region` VALUES ('340221', '340200', '芜湖县', '2');
INSERT INTO `hc_region` VALUES ('340222', '340200', '繁昌县', '2');
INSERT INTO `hc_region` VALUES ('340223', '340200', '南陵县', '2');
INSERT INTO `hc_region` VALUES ('340225', '340200', '无为县', '2');
INSERT INTO `hc_region` VALUES ('340300', '340000', '蚌埠市', '1');
INSERT INTO `hc_region` VALUES ('340301', '340300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('340302', '340300', '龙子湖区', '2');
INSERT INTO `hc_region` VALUES ('340303', '340300', '蚌山区', '2');
INSERT INTO `hc_region` VALUES ('340304', '340300', '禹会区', '2');
INSERT INTO `hc_region` VALUES ('340311', '340300', '淮上区', '2');
INSERT INTO `hc_region` VALUES ('340321', '340300', '怀远县', '2');
INSERT INTO `hc_region` VALUES ('340322', '340300', '五河县', '2');
INSERT INTO `hc_region` VALUES ('340323', '340300', '固镇县', '2');
INSERT INTO `hc_region` VALUES ('340400', '340000', '淮南市', '1');
INSERT INTO `hc_region` VALUES ('340401', '340400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('340402', '340400', '大通区', '2');
INSERT INTO `hc_region` VALUES ('340403', '340400', '田家庵区', '2');
INSERT INTO `hc_region` VALUES ('340404', '340400', '谢家集区', '2');
INSERT INTO `hc_region` VALUES ('340405', '340400', '八公山区', '2');
INSERT INTO `hc_region` VALUES ('340406', '340400', '潘集区', '2');
INSERT INTO `hc_region` VALUES ('340421', '340400', '凤台县', '2');
INSERT INTO `hc_region` VALUES ('340500', '340000', '马鞍山市', '1');
INSERT INTO `hc_region` VALUES ('340501', '340500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('340503', '340500', '花山区', '2');
INSERT INTO `hc_region` VALUES ('340504', '340500', '雨山区', '2');
INSERT INTO `hc_region` VALUES ('340506', '340500', '博望区', '2');
INSERT INTO `hc_region` VALUES ('340521', '340500', '当涂县', '2');
INSERT INTO `hc_region` VALUES ('340522', '340500', '含山县', '2');
INSERT INTO `hc_region` VALUES ('340523', '340500', '和县', '2');
INSERT INTO `hc_region` VALUES ('340600', '340000', '淮北市', '1');
INSERT INTO `hc_region` VALUES ('340601', '340600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('340602', '340600', '杜集区', '2');
INSERT INTO `hc_region` VALUES ('340603', '340600', '相山区', '2');
INSERT INTO `hc_region` VALUES ('340604', '340600', '烈山区', '2');
INSERT INTO `hc_region` VALUES ('340621', '340600', '濉溪县', '2');
INSERT INTO `hc_region` VALUES ('340700', '340000', '铜陵市', '1');
INSERT INTO `hc_region` VALUES ('340701', '340700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('340702', '340700', '铜官山区', '2');
INSERT INTO `hc_region` VALUES ('340703', '340700', '狮子山区', '2');
INSERT INTO `hc_region` VALUES ('340711', '340700', '郊区', '2');
INSERT INTO `hc_region` VALUES ('340721', '340700', '铜陵县', '2');
INSERT INTO `hc_region` VALUES ('340800', '340000', '安庆市', '1');
INSERT INTO `hc_region` VALUES ('340801', '340800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('340802', '340800', '迎江区', '2');
INSERT INTO `hc_region` VALUES ('340803', '340800', '大观区', '2');
INSERT INTO `hc_region` VALUES ('340811', '340800', '宜秀区', '2');
INSERT INTO `hc_region` VALUES ('340822', '340800', '怀宁县', '2');
INSERT INTO `hc_region` VALUES ('340823', '340800', '枞阳县', '2');
INSERT INTO `hc_region` VALUES ('340824', '340800', '潜山县', '2');
INSERT INTO `hc_region` VALUES ('340825', '340800', '太湖县', '2');
INSERT INTO `hc_region` VALUES ('340826', '340800', '宿松县', '2');
INSERT INTO `hc_region` VALUES ('340827', '340800', '望江县', '2');
INSERT INTO `hc_region` VALUES ('340828', '340800', '岳西县', '2');
INSERT INTO `hc_region` VALUES ('340881', '340800', '桐城市', '2');
INSERT INTO `hc_region` VALUES ('341000', '340000', '黄山市', '1');
INSERT INTO `hc_region` VALUES ('341001', '341000', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('341002', '341000', '屯溪区', '2');
INSERT INTO `hc_region` VALUES ('341003', '341000', '黄山区', '2');
INSERT INTO `hc_region` VALUES ('341004', '341000', '徽州区', '2');
INSERT INTO `hc_region` VALUES ('341021', '341000', '歙县', '2');
INSERT INTO `hc_region` VALUES ('341022', '341000', '休宁县', '2');
INSERT INTO `hc_region` VALUES ('341023', '341000', '黟县', '2');
INSERT INTO `hc_region` VALUES ('341024', '341000', '祁门县', '2');
INSERT INTO `hc_region` VALUES ('341100', '340000', '滁州市', '1');
INSERT INTO `hc_region` VALUES ('341101', '341100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('341102', '341100', '琅琊区', '2');
INSERT INTO `hc_region` VALUES ('341103', '341100', '南谯区', '2');
INSERT INTO `hc_region` VALUES ('341122', '341100', '来安县', '2');
INSERT INTO `hc_region` VALUES ('341124', '341100', '全椒县', '2');
INSERT INTO `hc_region` VALUES ('341125', '341100', '定远县', '2');
INSERT INTO `hc_region` VALUES ('341126', '341100', '凤阳县', '2');
INSERT INTO `hc_region` VALUES ('341181', '341100', '天长市', '2');
INSERT INTO `hc_region` VALUES ('341182', '341100', '明光市', '2');
INSERT INTO `hc_region` VALUES ('341200', '340000', '阜阳市', '1');
INSERT INTO `hc_region` VALUES ('341201', '341200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('341202', '341200', '颍州区', '2');
INSERT INTO `hc_region` VALUES ('341203', '341200', '颍东区', '2');
INSERT INTO `hc_region` VALUES ('341204', '341200', '颍泉区', '2');
INSERT INTO `hc_region` VALUES ('341221', '341200', '临泉县', '2');
INSERT INTO `hc_region` VALUES ('341222', '341200', '太和县', '2');
INSERT INTO `hc_region` VALUES ('341225', '341200', '阜南县', '2');
INSERT INTO `hc_region` VALUES ('341226', '341200', '颍上县', '2');
INSERT INTO `hc_region` VALUES ('341282', '341200', '界首市', '2');
INSERT INTO `hc_region` VALUES ('341300', '340000', '宿州市', '1');
INSERT INTO `hc_region` VALUES ('341301', '341300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('341302', '341300', '埇桥区', '2');
INSERT INTO `hc_region` VALUES ('341321', '341300', '砀山县', '2');
INSERT INTO `hc_region` VALUES ('341322', '341300', '萧县', '2');
INSERT INTO `hc_region` VALUES ('341323', '341300', '灵璧县', '2');
INSERT INTO `hc_region` VALUES ('341324', '341300', '泗县', '2');
INSERT INTO `hc_region` VALUES ('341500', '340000', '六安市', '1');
INSERT INTO `hc_region` VALUES ('341501', '341500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('341502', '341500', '金安区', '2');
INSERT INTO `hc_region` VALUES ('341503', '341500', '裕安区', '2');
INSERT INTO `hc_region` VALUES ('341521', '341500', '寿县', '2');
INSERT INTO `hc_region` VALUES ('341522', '341500', '霍邱县', '2');
INSERT INTO `hc_region` VALUES ('341523', '341500', '舒城县', '2');
INSERT INTO `hc_region` VALUES ('341524', '341500', '金寨县', '2');
INSERT INTO `hc_region` VALUES ('341525', '341500', '霍山县', '2');
INSERT INTO `hc_region` VALUES ('341600', '340000', '亳州市', '1');
INSERT INTO `hc_region` VALUES ('341601', '341600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('341602', '341600', '谯城区', '2');
INSERT INTO `hc_region` VALUES ('341621', '341600', '涡阳县', '2');
INSERT INTO `hc_region` VALUES ('341622', '341600', '蒙城县', '2');
INSERT INTO `hc_region` VALUES ('341623', '341600', '利辛县', '2');
INSERT INTO `hc_region` VALUES ('341700', '340000', '池州市', '1');
INSERT INTO `hc_region` VALUES ('341701', '341700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('341702', '341700', '贵池区', '2');
INSERT INTO `hc_region` VALUES ('341721', '341700', '东至县', '2');
INSERT INTO `hc_region` VALUES ('341722', '341700', '石台县', '2');
INSERT INTO `hc_region` VALUES ('341723', '341700', '青阳县', '2');
INSERT INTO `hc_region` VALUES ('341800', '340000', '宣城市', '1');
INSERT INTO `hc_region` VALUES ('341801', '341800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('341802', '341800', '宣州区', '2');
INSERT INTO `hc_region` VALUES ('341821', '341800', '郎溪县', '2');
INSERT INTO `hc_region` VALUES ('341822', '341800', '广德县', '2');
INSERT INTO `hc_region` VALUES ('341823', '341800', '泾县', '2');
INSERT INTO `hc_region` VALUES ('341824', '341800', '绩溪县', '2');
INSERT INTO `hc_region` VALUES ('341825', '341800', '旌德县', '2');
INSERT INTO `hc_region` VALUES ('341881', '341800', '宁国市', '2');
INSERT INTO `hc_region` VALUES ('350000', '0', '福建省', '0');
INSERT INTO `hc_region` VALUES ('350100', '350000', '福州市', '1');
INSERT INTO `hc_region` VALUES ('350101', '350100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('350102', '350100', '鼓楼区', '2');
INSERT INTO `hc_region` VALUES ('350103', '350100', '台江区', '2');
INSERT INTO `hc_region` VALUES ('350104', '350100', '仓山区', '2');
INSERT INTO `hc_region` VALUES ('350105', '350100', '马尾区', '2');
INSERT INTO `hc_region` VALUES ('350111', '350100', '晋安区', '2');
INSERT INTO `hc_region` VALUES ('350121', '350100', '闽侯县', '2');
INSERT INTO `hc_region` VALUES ('350122', '350100', '连江县', '2');
INSERT INTO `hc_region` VALUES ('350123', '350100', '罗源县', '2');
INSERT INTO `hc_region` VALUES ('350124', '350100', '闽清县', '2');
INSERT INTO `hc_region` VALUES ('350125', '350100', '永泰县', '2');
INSERT INTO `hc_region` VALUES ('350128', '350100', '平潭县', '2');
INSERT INTO `hc_region` VALUES ('350181', '350100', '福清市', '2');
INSERT INTO `hc_region` VALUES ('350182', '350100', '长乐市', '2');
INSERT INTO `hc_region` VALUES ('350200', '350000', '厦门市', '1');
INSERT INTO `hc_region` VALUES ('350201', '350200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('350203', '350200', '思明区', '2');
INSERT INTO `hc_region` VALUES ('350205', '350200', '海沧区', '2');
INSERT INTO `hc_region` VALUES ('350206', '350200', '湖里区', '2');
INSERT INTO `hc_region` VALUES ('350211', '350200', '集美区', '2');
INSERT INTO `hc_region` VALUES ('350212', '350200', '同安区', '2');
INSERT INTO `hc_region` VALUES ('350213', '350200', '翔安区', '2');
INSERT INTO `hc_region` VALUES ('350300', '350000', '莆田市', '1');
INSERT INTO `hc_region` VALUES ('350301', '350300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('350302', '350300', '城厢区', '2');
INSERT INTO `hc_region` VALUES ('350303', '350300', '涵江区', '2');
INSERT INTO `hc_region` VALUES ('350304', '350300', '荔城区', '2');
INSERT INTO `hc_region` VALUES ('350305', '350300', '秀屿区', '2');
INSERT INTO `hc_region` VALUES ('350322', '350300', '仙游县', '2');
INSERT INTO `hc_region` VALUES ('350400', '350000', '三明市', '1');
INSERT INTO `hc_region` VALUES ('350401', '350400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('350402', '350400', '梅列区', '2');
INSERT INTO `hc_region` VALUES ('350403', '350400', '三元区', '2');
INSERT INTO `hc_region` VALUES ('350421', '350400', '明溪县', '2');
INSERT INTO `hc_region` VALUES ('350423', '350400', '清流县', '2');
INSERT INTO `hc_region` VALUES ('350424', '350400', '宁化县', '2');
INSERT INTO `hc_region` VALUES ('350425', '350400', '大田县', '2');
INSERT INTO `hc_region` VALUES ('350426', '350400', '尤溪县', '2');
INSERT INTO `hc_region` VALUES ('350427', '350400', '沙县', '2');
INSERT INTO `hc_region` VALUES ('350428', '350400', '将乐县', '2');
INSERT INTO `hc_region` VALUES ('350429', '350400', '泰宁县', '2');
INSERT INTO `hc_region` VALUES ('350430', '350400', '建宁县', '2');
INSERT INTO `hc_region` VALUES ('350481', '350400', '永安市', '2');
INSERT INTO `hc_region` VALUES ('350500', '350000', '泉州市', '1');
INSERT INTO `hc_region` VALUES ('350501', '350500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('350502', '350500', '鲤城区', '2');
INSERT INTO `hc_region` VALUES ('350503', '350500', '丰泽区', '2');
INSERT INTO `hc_region` VALUES ('350504', '350500', '洛江区', '2');
INSERT INTO `hc_region` VALUES ('350505', '350500', '泉港区', '2');
INSERT INTO `hc_region` VALUES ('350521', '350500', '惠安县', '2');
INSERT INTO `hc_region` VALUES ('350524', '350500', '安溪县', '2');
INSERT INTO `hc_region` VALUES ('350525', '350500', '永春县', '2');
INSERT INTO `hc_region` VALUES ('350526', '350500', '德化县', '2');
INSERT INTO `hc_region` VALUES ('350527', '350500', '金门县', '2');
INSERT INTO `hc_region` VALUES ('350581', '350500', '石狮市', '2');
INSERT INTO `hc_region` VALUES ('350582', '350500', '晋江市', '2');
INSERT INTO `hc_region` VALUES ('350583', '350500', '南安市', '2');
INSERT INTO `hc_region` VALUES ('350600', '350000', '漳州市', '1');
INSERT INTO `hc_region` VALUES ('350601', '350600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('350602', '350600', '芗城区', '2');
INSERT INTO `hc_region` VALUES ('350603', '350600', '龙文区', '2');
INSERT INTO `hc_region` VALUES ('350622', '350600', '云霄县', '2');
INSERT INTO `hc_region` VALUES ('350623', '350600', '漳浦县', '2');
INSERT INTO `hc_region` VALUES ('350624', '350600', '诏安县', '2');
INSERT INTO `hc_region` VALUES ('350625', '350600', '长泰县', '2');
INSERT INTO `hc_region` VALUES ('350626', '350600', '东山县', '2');
INSERT INTO `hc_region` VALUES ('350627', '350600', '南靖县', '2');
INSERT INTO `hc_region` VALUES ('350628', '350600', '平和县', '2');
INSERT INTO `hc_region` VALUES ('350629', '350600', '华安县', '2');
INSERT INTO `hc_region` VALUES ('350681', '350600', '龙海市', '2');
INSERT INTO `hc_region` VALUES ('350700', '350000', '南平市', '1');
INSERT INTO `hc_region` VALUES ('350701', '350700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('350702', '350700', '延平区', '2');
INSERT INTO `hc_region` VALUES ('350721', '350700', '顺昌县', '2');
INSERT INTO `hc_region` VALUES ('350722', '350700', '浦城县', '2');
INSERT INTO `hc_region` VALUES ('350723', '350700', '光泽县', '2');
INSERT INTO `hc_region` VALUES ('350724', '350700', '松溪县', '2');
INSERT INTO `hc_region` VALUES ('350725', '350700', '政和县', '2');
INSERT INTO `hc_region` VALUES ('350781', '350700', '邵武市', '2');
INSERT INTO `hc_region` VALUES ('350782', '350700', '武夷山市', '2');
INSERT INTO `hc_region` VALUES ('350783', '350700', '建瓯市', '2');
INSERT INTO `hc_region` VALUES ('350784', '350700', '建阳市', '2');
INSERT INTO `hc_region` VALUES ('350800', '350000', '龙岩市', '1');
INSERT INTO `hc_region` VALUES ('350801', '350800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('350802', '350800', '新罗区', '2');
INSERT INTO `hc_region` VALUES ('350821', '350800', '长汀县', '2');
INSERT INTO `hc_region` VALUES ('350822', '350800', '永定县', '2');
INSERT INTO `hc_region` VALUES ('350823', '350800', '上杭县', '2');
INSERT INTO `hc_region` VALUES ('350824', '350800', '武平县', '2');
INSERT INTO `hc_region` VALUES ('350825', '350800', '连城县', '2');
INSERT INTO `hc_region` VALUES ('350881', '350800', '漳平市', '2');
INSERT INTO `hc_region` VALUES ('350900', '350000', '宁德市', '1');
INSERT INTO `hc_region` VALUES ('350901', '350900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('350902', '350900', '蕉城区', '2');
INSERT INTO `hc_region` VALUES ('350921', '350900', '霞浦县', '2');
INSERT INTO `hc_region` VALUES ('350922', '350900', '古田县', '2');
INSERT INTO `hc_region` VALUES ('350923', '350900', '屏南县', '2');
INSERT INTO `hc_region` VALUES ('350924', '350900', '寿宁县', '2');
INSERT INTO `hc_region` VALUES ('350925', '350900', '周宁县', '2');
INSERT INTO `hc_region` VALUES ('350926', '350900', '柘荣县', '2');
INSERT INTO `hc_region` VALUES ('350981', '350900', '福安市', '2');
INSERT INTO `hc_region` VALUES ('350982', '350900', '福鼎市', '2');
INSERT INTO `hc_region` VALUES ('360000', '0', '江西省', '0');
INSERT INTO `hc_region` VALUES ('360100', '360000', '南昌市', '1');
INSERT INTO `hc_region` VALUES ('360101', '360100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('360102', '360100', '东湖区', '2');
INSERT INTO `hc_region` VALUES ('360103', '360100', '西湖区', '2');
INSERT INTO `hc_region` VALUES ('360104', '360100', '青云谱区', '2');
INSERT INTO `hc_region` VALUES ('360105', '360100', '湾里区', '2');
INSERT INTO `hc_region` VALUES ('360111', '360100', '青山湖区', '2');
INSERT INTO `hc_region` VALUES ('360121', '360100', '南昌县', '2');
INSERT INTO `hc_region` VALUES ('360122', '360100', '新建县', '2');
INSERT INTO `hc_region` VALUES ('360123', '360100', '安义县', '2');
INSERT INTO `hc_region` VALUES ('360124', '360100', '进贤县', '2');
INSERT INTO `hc_region` VALUES ('360200', '360000', '景德镇市', '1');
INSERT INTO `hc_region` VALUES ('360201', '360200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('360202', '360200', '昌江区', '2');
INSERT INTO `hc_region` VALUES ('360203', '360200', '珠山区', '2');
INSERT INTO `hc_region` VALUES ('360222', '360200', '浮梁县', '2');
INSERT INTO `hc_region` VALUES ('360281', '360200', '乐平市', '2');
INSERT INTO `hc_region` VALUES ('360300', '360000', '萍乡市', '1');
INSERT INTO `hc_region` VALUES ('360301', '360300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('360302', '360300', '安源区', '2');
INSERT INTO `hc_region` VALUES ('360313', '360300', '湘东区', '2');
INSERT INTO `hc_region` VALUES ('360321', '360300', '莲花县', '2');
INSERT INTO `hc_region` VALUES ('360322', '360300', '上栗县', '2');
INSERT INTO `hc_region` VALUES ('360323', '360300', '芦溪县', '2');
INSERT INTO `hc_region` VALUES ('360400', '360000', '九江市', '1');
INSERT INTO `hc_region` VALUES ('360401', '360400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('360402', '360400', '庐山区', '2');
INSERT INTO `hc_region` VALUES ('360403', '360400', '浔阳区', '2');
INSERT INTO `hc_region` VALUES ('360421', '360400', '九江县', '2');
INSERT INTO `hc_region` VALUES ('360423', '360400', '武宁县', '2');
INSERT INTO `hc_region` VALUES ('360424', '360400', '修水县', '2');
INSERT INTO `hc_region` VALUES ('360425', '360400', '永修县', '2');
INSERT INTO `hc_region` VALUES ('360426', '360400', '德安县', '2');
INSERT INTO `hc_region` VALUES ('360427', '360400', '星子县', '2');
INSERT INTO `hc_region` VALUES ('360428', '360400', '都昌县', '2');
INSERT INTO `hc_region` VALUES ('360429', '360400', '湖口县', '2');
INSERT INTO `hc_region` VALUES ('360430', '360400', '彭泽县', '2');
INSERT INTO `hc_region` VALUES ('360481', '360400', '瑞昌市', '2');
INSERT INTO `hc_region` VALUES ('360482', '360400', '共青城市', '2');
INSERT INTO `hc_region` VALUES ('360500', '360000', '新余市', '1');
INSERT INTO `hc_region` VALUES ('360501', '360500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('360502', '360500', '渝水区', '2');
INSERT INTO `hc_region` VALUES ('360521', '360500', '分宜县', '2');
INSERT INTO `hc_region` VALUES ('360600', '360000', '鹰潭市', '1');
INSERT INTO `hc_region` VALUES ('360601', '360600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('360602', '360600', '月湖区', '2');
INSERT INTO `hc_region` VALUES ('360622', '360600', '余江县', '2');
INSERT INTO `hc_region` VALUES ('360681', '360600', '贵溪市', '2');
INSERT INTO `hc_region` VALUES ('360700', '360000', '赣州市', '1');
INSERT INTO `hc_region` VALUES ('360701', '360700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('360702', '360700', '章贡区', '2');
INSERT INTO `hc_region` VALUES ('360703', '360700', '南康区', '2');
INSERT INTO `hc_region` VALUES ('360721', '360700', '赣县', '2');
INSERT INTO `hc_region` VALUES ('360722', '360700', '信丰县', '2');
INSERT INTO `hc_region` VALUES ('360723', '360700', '大余县', '2');
INSERT INTO `hc_region` VALUES ('360724', '360700', '上犹县', '2');
INSERT INTO `hc_region` VALUES ('360725', '360700', '崇义县', '2');
INSERT INTO `hc_region` VALUES ('360726', '360700', '安远县', '2');
INSERT INTO `hc_region` VALUES ('360727', '360700', '龙南县', '2');
INSERT INTO `hc_region` VALUES ('360728', '360700', '定南县', '2');
INSERT INTO `hc_region` VALUES ('360729', '360700', '全南县', '2');
INSERT INTO `hc_region` VALUES ('360730', '360700', '宁都县', '2');
INSERT INTO `hc_region` VALUES ('360731', '360700', '于都县', '2');
INSERT INTO `hc_region` VALUES ('360732', '360700', '兴国县', '2');
INSERT INTO `hc_region` VALUES ('360733', '360700', '会昌县', '2');
INSERT INTO `hc_region` VALUES ('360734', '360700', '寻乌县', '2');
INSERT INTO `hc_region` VALUES ('360735', '360700', '石城县', '2');
INSERT INTO `hc_region` VALUES ('360781', '360700', '瑞金市', '2');
INSERT INTO `hc_region` VALUES ('360800', '360000', '吉安市', '1');
INSERT INTO `hc_region` VALUES ('360801', '360800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('360802', '360800', '吉州区', '2');
INSERT INTO `hc_region` VALUES ('360803', '360800', '青原区', '2');
INSERT INTO `hc_region` VALUES ('360821', '360800', '吉安县', '2');
INSERT INTO `hc_region` VALUES ('360822', '360800', '吉水县', '2');
INSERT INTO `hc_region` VALUES ('360823', '360800', '峡江县', '2');
INSERT INTO `hc_region` VALUES ('360824', '360800', '新干县', '2');
INSERT INTO `hc_region` VALUES ('360825', '360800', '永丰县', '2');
INSERT INTO `hc_region` VALUES ('360826', '360800', '泰和县', '2');
INSERT INTO `hc_region` VALUES ('360827', '360800', '遂川县', '2');
INSERT INTO `hc_region` VALUES ('360828', '360800', '万安县', '2');
INSERT INTO `hc_region` VALUES ('360829', '360800', '安福县', '2');
INSERT INTO `hc_region` VALUES ('360830', '360800', '永新县', '2');
INSERT INTO `hc_region` VALUES ('360881', '360800', '井冈山市', '2');
INSERT INTO `hc_region` VALUES ('360900', '360000', '宜春市', '1');
INSERT INTO `hc_region` VALUES ('360901', '360900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('360902', '360900', '袁州区', '2');
INSERT INTO `hc_region` VALUES ('360921', '360900', '奉新县', '2');
INSERT INTO `hc_region` VALUES ('360922', '360900', '万载县', '2');
INSERT INTO `hc_region` VALUES ('360923', '360900', '上高县', '2');
INSERT INTO `hc_region` VALUES ('360924', '360900', '宜丰县', '2');
INSERT INTO `hc_region` VALUES ('360925', '360900', '靖安县', '2');
INSERT INTO `hc_region` VALUES ('360926', '360900', '铜鼓县', '2');
INSERT INTO `hc_region` VALUES ('360981', '360900', '丰城市', '2');
INSERT INTO `hc_region` VALUES ('360982', '360900', '樟树市', '2');
INSERT INTO `hc_region` VALUES ('360983', '360900', '高安市', '2');
INSERT INTO `hc_region` VALUES ('361000', '360000', '抚州市', '1');
INSERT INTO `hc_region` VALUES ('361001', '361000', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('361002', '361000', '临川区', '2');
INSERT INTO `hc_region` VALUES ('361021', '361000', '南城县', '2');
INSERT INTO `hc_region` VALUES ('361022', '361000', '黎川县', '2');
INSERT INTO `hc_region` VALUES ('361023', '361000', '南丰县', '2');
INSERT INTO `hc_region` VALUES ('361024', '361000', '崇仁县', '2');
INSERT INTO `hc_region` VALUES ('361025', '361000', '乐安县', '2');
INSERT INTO `hc_region` VALUES ('361026', '361000', '宜黄县', '2');
INSERT INTO `hc_region` VALUES ('361027', '361000', '金溪县', '2');
INSERT INTO `hc_region` VALUES ('361028', '361000', '资溪县', '2');
INSERT INTO `hc_region` VALUES ('361029', '361000', '东乡县', '2');
INSERT INTO `hc_region` VALUES ('361030', '361000', '广昌县', '2');
INSERT INTO `hc_region` VALUES ('361100', '360000', '上饶市', '1');
INSERT INTO `hc_region` VALUES ('361101', '361100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('361102', '361100', '信州区', '2');
INSERT INTO `hc_region` VALUES ('361121', '361100', '上饶县', '2');
INSERT INTO `hc_region` VALUES ('361122', '361100', '广丰县', '2');
INSERT INTO `hc_region` VALUES ('361123', '361100', '玉山县', '2');
INSERT INTO `hc_region` VALUES ('361124', '361100', '铅山县', '2');
INSERT INTO `hc_region` VALUES ('361125', '361100', '横峰县', '2');
INSERT INTO `hc_region` VALUES ('361126', '361100', '弋阳县', '2');
INSERT INTO `hc_region` VALUES ('361127', '361100', '余干县', '2');
INSERT INTO `hc_region` VALUES ('361128', '361100', '鄱阳县', '2');
INSERT INTO `hc_region` VALUES ('361129', '361100', '万年县', '2');
INSERT INTO `hc_region` VALUES ('361130', '361100', '婺源县', '2');
INSERT INTO `hc_region` VALUES ('361181', '361100', '德兴市', '2');
INSERT INTO `hc_region` VALUES ('370000', '0', '山东省', '0');
INSERT INTO `hc_region` VALUES ('370100', '370000', '济南市', '1');
INSERT INTO `hc_region` VALUES ('370101', '370100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('370102', '370100', '历下区', '2');
INSERT INTO `hc_region` VALUES ('370103', '370100', '市中区', '2');
INSERT INTO `hc_region` VALUES ('370104', '370100', '槐荫区', '2');
INSERT INTO `hc_region` VALUES ('370105', '370100', '天桥区', '2');
INSERT INTO `hc_region` VALUES ('370112', '370100', '历城区', '2');
INSERT INTO `hc_region` VALUES ('370113', '370100', '长清区', '2');
INSERT INTO `hc_region` VALUES ('370124', '370100', '平阴县', '2');
INSERT INTO `hc_region` VALUES ('370125', '370100', '济阳县', '2');
INSERT INTO `hc_region` VALUES ('370126', '370100', '商河县', '2');
INSERT INTO `hc_region` VALUES ('370181', '370100', '章丘市', '2');
INSERT INTO `hc_region` VALUES ('370200', '370000', '青岛市', '1');
INSERT INTO `hc_region` VALUES ('370201', '370200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('370202', '370200', '市南区', '2');
INSERT INTO `hc_region` VALUES ('370203', '370200', '市北区', '2');
INSERT INTO `hc_region` VALUES ('370211', '370200', '黄岛区', '2');
INSERT INTO `hc_region` VALUES ('370212', '370200', '崂山区', '2');
INSERT INTO `hc_region` VALUES ('370213', '370200', '李沧区', '2');
INSERT INTO `hc_region` VALUES ('370214', '370200', '城阳区', '2');
INSERT INTO `hc_region` VALUES ('370281', '370200', '胶州市', '2');
INSERT INTO `hc_region` VALUES ('370282', '370200', '即墨市', '2');
INSERT INTO `hc_region` VALUES ('370283', '370200', '平度市', '2');
INSERT INTO `hc_region` VALUES ('370285', '370200', '莱西市', '2');
INSERT INTO `hc_region` VALUES ('370300', '370000', '淄博市', '1');
INSERT INTO `hc_region` VALUES ('370301', '370300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('370302', '370300', '淄川区', '2');
INSERT INTO `hc_region` VALUES ('370303', '370300', '张店区', '2');
INSERT INTO `hc_region` VALUES ('370304', '370300', '博山区', '2');
INSERT INTO `hc_region` VALUES ('370305', '370300', '临淄区', '2');
INSERT INTO `hc_region` VALUES ('370306', '370300', '周村区', '2');
INSERT INTO `hc_region` VALUES ('370321', '370300', '桓台县', '2');
INSERT INTO `hc_region` VALUES ('370322', '370300', '高青县', '2');
INSERT INTO `hc_region` VALUES ('370323', '370300', '沂源县', '2');
INSERT INTO `hc_region` VALUES ('370400', '370000', '枣庄市', '1');
INSERT INTO `hc_region` VALUES ('370401', '370400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('370402', '370400', '市中区', '2');
INSERT INTO `hc_region` VALUES ('370403', '370400', '薛城区', '2');
INSERT INTO `hc_region` VALUES ('370404', '370400', '峄城区', '2');
INSERT INTO `hc_region` VALUES ('370405', '370400', '台儿庄区', '2');
INSERT INTO `hc_region` VALUES ('370406', '370400', '山亭区', '2');
INSERT INTO `hc_region` VALUES ('370481', '370400', '滕州市', '2');
INSERT INTO `hc_region` VALUES ('370500', '370000', '东营市', '1');
INSERT INTO `hc_region` VALUES ('370501', '370500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('370502', '370500', '东营区', '2');
INSERT INTO `hc_region` VALUES ('370503', '370500', '河口区', '2');
INSERT INTO `hc_region` VALUES ('370521', '370500', '垦利县', '2');
INSERT INTO `hc_region` VALUES ('370522', '370500', '利津县', '2');
INSERT INTO `hc_region` VALUES ('370523', '370500', '广饶县', '2');
INSERT INTO `hc_region` VALUES ('370600', '370000', '烟台市', '1');
INSERT INTO `hc_region` VALUES ('370601', '370600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('370602', '370600', '芝罘区', '2');
INSERT INTO `hc_region` VALUES ('370611', '370600', '福山区', '2');
INSERT INTO `hc_region` VALUES ('370612', '370600', '牟平区', '2');
INSERT INTO `hc_region` VALUES ('370613', '370600', '莱山区', '2');
INSERT INTO `hc_region` VALUES ('370634', '370600', '长岛县', '2');
INSERT INTO `hc_region` VALUES ('370681', '370600', '龙口市', '2');
INSERT INTO `hc_region` VALUES ('370682', '370600', '莱阳市', '2');
INSERT INTO `hc_region` VALUES ('370683', '370600', '莱州市', '2');
INSERT INTO `hc_region` VALUES ('370684', '370600', '蓬莱市', '2');
INSERT INTO `hc_region` VALUES ('370685', '370600', '招远市', '2');
INSERT INTO `hc_region` VALUES ('370686', '370600', '栖霞市', '2');
INSERT INTO `hc_region` VALUES ('370687', '370600', '海阳市', '2');
INSERT INTO `hc_region` VALUES ('370700', '370000', '潍坊市', '1');
INSERT INTO `hc_region` VALUES ('370701', '370700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('370702', '370700', '潍城区', '2');
INSERT INTO `hc_region` VALUES ('370703', '370700', '寒亭区', '2');
INSERT INTO `hc_region` VALUES ('370704', '370700', '坊子区', '2');
INSERT INTO `hc_region` VALUES ('370705', '370700', '奎文区', '2');
INSERT INTO `hc_region` VALUES ('370724', '370700', '临朐县', '2');
INSERT INTO `hc_region` VALUES ('370725', '370700', '昌乐县', '2');
INSERT INTO `hc_region` VALUES ('370781', '370700', '青州市', '2');
INSERT INTO `hc_region` VALUES ('370782', '370700', '诸城市', '2');
INSERT INTO `hc_region` VALUES ('370783', '370700', '寿光市', '2');
INSERT INTO `hc_region` VALUES ('370784', '370700', '安丘市', '2');
INSERT INTO `hc_region` VALUES ('370785', '370700', '高密市', '2');
INSERT INTO `hc_region` VALUES ('370786', '370700', '昌邑市', '2');
INSERT INTO `hc_region` VALUES ('370800', '370000', '济宁市', '1');
INSERT INTO `hc_region` VALUES ('370801', '370800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('370811', '370800', '任城区', '2');
INSERT INTO `hc_region` VALUES ('370812', '370800', '兖州区', '2');
INSERT INTO `hc_region` VALUES ('370826', '370800', '微山县', '2');
INSERT INTO `hc_region` VALUES ('370827', '370800', '鱼台县', '2');
INSERT INTO `hc_region` VALUES ('370828', '370800', '金乡县', '2');
INSERT INTO `hc_region` VALUES ('370829', '370800', '嘉祥县', '2');
INSERT INTO `hc_region` VALUES ('370830', '370800', '汶上县', '2');
INSERT INTO `hc_region` VALUES ('370831', '370800', '泗水县', '2');
INSERT INTO `hc_region` VALUES ('370832', '370800', '梁山县', '2');
INSERT INTO `hc_region` VALUES ('370881', '370800', '曲阜市', '2');
INSERT INTO `hc_region` VALUES ('370883', '370800', '邹城市', '2');
INSERT INTO `hc_region` VALUES ('370900', '370000', '泰安市', '1');
INSERT INTO `hc_region` VALUES ('370901', '370900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('370902', '370900', '泰山区', '2');
INSERT INTO `hc_region` VALUES ('370911', '370900', '岱岳区', '2');
INSERT INTO `hc_region` VALUES ('370921', '370900', '宁阳县', '2');
INSERT INTO `hc_region` VALUES ('370923', '370900', '东平县', '2');
INSERT INTO `hc_region` VALUES ('370982', '370900', '新泰市', '2');
INSERT INTO `hc_region` VALUES ('370983', '370900', '肥城市', '2');
INSERT INTO `hc_region` VALUES ('371000', '370000', '威海市', '1');
INSERT INTO `hc_region` VALUES ('371001', '371000', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('371002', '371000', '环翠区', '2');
INSERT INTO `hc_region` VALUES ('371003', '371000', '文登区', '2');
INSERT INTO `hc_region` VALUES ('371082', '371000', '荣成市', '2');
INSERT INTO `hc_region` VALUES ('371083', '371000', '乳山市', '2');
INSERT INTO `hc_region` VALUES ('371100', '370000', '日照市', '1');
INSERT INTO `hc_region` VALUES ('371101', '371100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('371102', '371100', '东港区', '2');
INSERT INTO `hc_region` VALUES ('371103', '371100', '岚山区', '2');
INSERT INTO `hc_region` VALUES ('371121', '371100', '五莲县', '2');
INSERT INTO `hc_region` VALUES ('371122', '371100', '莒县', '2');
INSERT INTO `hc_region` VALUES ('371200', '370000', '莱芜市', '1');
INSERT INTO `hc_region` VALUES ('371201', '371200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('371202', '371200', '莱城区', '2');
INSERT INTO `hc_region` VALUES ('371203', '371200', '钢城区', '2');
INSERT INTO `hc_region` VALUES ('371300', '370000', '临沂市', '1');
INSERT INTO `hc_region` VALUES ('371301', '371300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('371302', '371300', '兰山区', '2');
INSERT INTO `hc_region` VALUES ('371311', '371300', '罗庄区', '2');
INSERT INTO `hc_region` VALUES ('371312', '371300', '河东区', '2');
INSERT INTO `hc_region` VALUES ('371321', '371300', '沂南县', '2');
INSERT INTO `hc_region` VALUES ('371322', '371300', '郯城县', '2');
INSERT INTO `hc_region` VALUES ('371323', '371300', '沂水县', '2');
INSERT INTO `hc_region` VALUES ('371324', '371300', '兰陵县', '2');
INSERT INTO `hc_region` VALUES ('371325', '371300', '费县', '2');
INSERT INTO `hc_region` VALUES ('371326', '371300', '平邑县', '2');
INSERT INTO `hc_region` VALUES ('371327', '371300', '莒南县', '2');
INSERT INTO `hc_region` VALUES ('371328', '371300', '蒙阴县', '2');
INSERT INTO `hc_region` VALUES ('371329', '371300', '临沭县', '2');
INSERT INTO `hc_region` VALUES ('371400', '370000', '德州市', '1');
INSERT INTO `hc_region` VALUES ('371401', '371400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('371402', '371400', '德城区', '2');
INSERT INTO `hc_region` VALUES ('371403', '371400', '陵城区', '2');
INSERT INTO `hc_region` VALUES ('371422', '371400', '宁津县', '2');
INSERT INTO `hc_region` VALUES ('371423', '371400', '庆云县', '2');
INSERT INTO `hc_region` VALUES ('371424', '371400', '临邑县', '2');
INSERT INTO `hc_region` VALUES ('371425', '371400', '齐河县', '2');
INSERT INTO `hc_region` VALUES ('371426', '371400', '平原县', '2');
INSERT INTO `hc_region` VALUES ('371427', '371400', '夏津县', '2');
INSERT INTO `hc_region` VALUES ('371428', '371400', '武城县', '2');
INSERT INTO `hc_region` VALUES ('371481', '371400', '乐陵市', '2');
INSERT INTO `hc_region` VALUES ('371482', '371400', '禹城市', '2');
INSERT INTO `hc_region` VALUES ('371500', '370000', '聊城市', '1');
INSERT INTO `hc_region` VALUES ('371501', '371500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('371502', '371500', '东昌府区', '2');
INSERT INTO `hc_region` VALUES ('371521', '371500', '阳谷县', '2');
INSERT INTO `hc_region` VALUES ('371522', '371500', '莘县', '2');
INSERT INTO `hc_region` VALUES ('371523', '371500', '茌平县', '2');
INSERT INTO `hc_region` VALUES ('371524', '371500', '东阿县', '2');
INSERT INTO `hc_region` VALUES ('371525', '371500', '冠县', '2');
INSERT INTO `hc_region` VALUES ('371526', '371500', '高唐县', '2');
INSERT INTO `hc_region` VALUES ('371581', '371500', '临清市', '2');
INSERT INTO `hc_region` VALUES ('371600', '370000', '滨州市', '1');
INSERT INTO `hc_region` VALUES ('371601', '371600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('371602', '371600', '滨城区', '2');
INSERT INTO `hc_region` VALUES ('371603', '371600', '沾化区', '2');
INSERT INTO `hc_region` VALUES ('371621', '371600', '惠民县', '2');
INSERT INTO `hc_region` VALUES ('371622', '371600', '阳信县', '2');
INSERT INTO `hc_region` VALUES ('371623', '371600', '无棣县', '2');
INSERT INTO `hc_region` VALUES ('371625', '371600', '博兴县', '2');
INSERT INTO `hc_region` VALUES ('371626', '371600', '邹平县', '2');
INSERT INTO `hc_region` VALUES ('371700', '370000', '菏泽市', '1');
INSERT INTO `hc_region` VALUES ('371701', '371700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('371702', '371700', '牡丹区', '2');
INSERT INTO `hc_region` VALUES ('371721', '371700', '曹县', '2');
INSERT INTO `hc_region` VALUES ('371722', '371700', '单县', '2');
INSERT INTO `hc_region` VALUES ('371723', '371700', '成武县', '2');
INSERT INTO `hc_region` VALUES ('371724', '371700', '巨野县', '2');
INSERT INTO `hc_region` VALUES ('371725', '371700', '郓城县', '2');
INSERT INTO `hc_region` VALUES ('371726', '371700', '鄄城县', '2');
INSERT INTO `hc_region` VALUES ('371727', '371700', '定陶县', '2');
INSERT INTO `hc_region` VALUES ('371728', '371700', '东明县', '2');
INSERT INTO `hc_region` VALUES ('410000', '0', '河南省', '0');
INSERT INTO `hc_region` VALUES ('410100', '410000', '郑州市', '1');
INSERT INTO `hc_region` VALUES ('410101', '410100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('410102', '410100', '中原区', '2');
INSERT INTO `hc_region` VALUES ('410103', '410100', '二七区', '2');
INSERT INTO `hc_region` VALUES ('410104', '410100', '管城回族区', '2');
INSERT INTO `hc_region` VALUES ('410105', '410100', '金水区', '2');
INSERT INTO `hc_region` VALUES ('410106', '410100', '上街区', '2');
INSERT INTO `hc_region` VALUES ('410108', '410100', '惠济区', '2');
INSERT INTO `hc_region` VALUES ('410122', '410100', '中牟县', '2');
INSERT INTO `hc_region` VALUES ('410181', '410100', '巩义市', '2');
INSERT INTO `hc_region` VALUES ('410182', '410100', '荥阳市', '2');
INSERT INTO `hc_region` VALUES ('410183', '410100', '新密市', '2');
INSERT INTO `hc_region` VALUES ('410184', '410100', '新郑市', '2');
INSERT INTO `hc_region` VALUES ('410185', '410100', '登封市', '2');
INSERT INTO `hc_region` VALUES ('410200', '410000', '开封市', '1');
INSERT INTO `hc_region` VALUES ('410201', '410200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('410202', '410200', '龙亭区', '2');
INSERT INTO `hc_region` VALUES ('410203', '410200', '顺河回族区', '2');
INSERT INTO `hc_region` VALUES ('410204', '410200', '鼓楼区', '2');
INSERT INTO `hc_region` VALUES ('410205', '410200', '禹王台区', '2');
INSERT INTO `hc_region` VALUES ('410211', '410200', '金明区', '2');
INSERT INTO `hc_region` VALUES ('410221', '410200', '杞县', '2');
INSERT INTO `hc_region` VALUES ('410222', '410200', '通许县', '2');
INSERT INTO `hc_region` VALUES ('410223', '410200', '尉氏县', '2');
INSERT INTO `hc_region` VALUES ('410224', '410200', '开封县', '2');
INSERT INTO `hc_region` VALUES ('410225', '410200', '兰考县', '2');
INSERT INTO `hc_region` VALUES ('410300', '410000', '洛阳市', '1');
INSERT INTO `hc_region` VALUES ('410301', '410300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('410302', '410300', '老城区', '2');
INSERT INTO `hc_region` VALUES ('410303', '410300', '西工区', '2');
INSERT INTO `hc_region` VALUES ('410304', '410300', '瀍河回族区', '2');
INSERT INTO `hc_region` VALUES ('410305', '410300', '涧西区', '2');
INSERT INTO `hc_region` VALUES ('410306', '410300', '吉利区', '2');
INSERT INTO `hc_region` VALUES ('410311', '410300', '洛龙区', '2');
INSERT INTO `hc_region` VALUES ('410322', '410300', '孟津县', '2');
INSERT INTO `hc_region` VALUES ('410323', '410300', '新安县', '2');
INSERT INTO `hc_region` VALUES ('410324', '410300', '栾川县', '2');
INSERT INTO `hc_region` VALUES ('410325', '410300', '嵩县', '2');
INSERT INTO `hc_region` VALUES ('410326', '410300', '汝阳县', '2');
INSERT INTO `hc_region` VALUES ('410327', '410300', '宜阳县', '2');
INSERT INTO `hc_region` VALUES ('410328', '410300', '洛宁县', '2');
INSERT INTO `hc_region` VALUES ('410329', '410300', '伊川县', '2');
INSERT INTO `hc_region` VALUES ('410381', '410300', '偃师市', '2');
INSERT INTO `hc_region` VALUES ('410400', '410000', '平顶山市', '1');
INSERT INTO `hc_region` VALUES ('410401', '410400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('410402', '410400', '新华区', '2');
INSERT INTO `hc_region` VALUES ('410403', '410400', '卫东区', '2');
INSERT INTO `hc_region` VALUES ('410404', '410400', '石龙区', '2');
INSERT INTO `hc_region` VALUES ('410411', '410400', '湛河区', '2');
INSERT INTO `hc_region` VALUES ('410421', '410400', '宝丰县', '2');
INSERT INTO `hc_region` VALUES ('410422', '410400', '叶县', '2');
INSERT INTO `hc_region` VALUES ('410423', '410400', '鲁山县', '2');
INSERT INTO `hc_region` VALUES ('410425', '410400', '郏县', '2');
INSERT INTO `hc_region` VALUES ('410481', '410400', '舞钢市', '2');
INSERT INTO `hc_region` VALUES ('410482', '410400', '汝州市', '2');
INSERT INTO `hc_region` VALUES ('410500', '410000', '安阳市', '1');
INSERT INTO `hc_region` VALUES ('410501', '410500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('410502', '410500', '文峰区', '2');
INSERT INTO `hc_region` VALUES ('410503', '410500', '北关区', '2');
INSERT INTO `hc_region` VALUES ('410505', '410500', '殷都区', '2');
INSERT INTO `hc_region` VALUES ('410506', '410500', '龙安区', '2');
INSERT INTO `hc_region` VALUES ('410522', '410500', '安阳县', '2');
INSERT INTO `hc_region` VALUES ('410523', '410500', '汤阴县', '2');
INSERT INTO `hc_region` VALUES ('410526', '410500', '滑县', '2');
INSERT INTO `hc_region` VALUES ('410527', '410500', '内黄县', '2');
INSERT INTO `hc_region` VALUES ('410581', '410500', '林州市', '2');
INSERT INTO `hc_region` VALUES ('410600', '410000', '鹤壁市', '1');
INSERT INTO `hc_region` VALUES ('410601', '410600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('410602', '410600', '鹤山区', '2');
INSERT INTO `hc_region` VALUES ('410603', '410600', '山城区', '2');
INSERT INTO `hc_region` VALUES ('410611', '410600', '淇滨区', '2');
INSERT INTO `hc_region` VALUES ('410621', '410600', '浚县', '2');
INSERT INTO `hc_region` VALUES ('410622', '410600', '淇县', '2');
INSERT INTO `hc_region` VALUES ('410700', '410000', '新乡市', '1');
INSERT INTO `hc_region` VALUES ('410701', '410700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('410702', '410700', '红旗区', '2');
INSERT INTO `hc_region` VALUES ('410703', '410700', '卫滨区', '2');
INSERT INTO `hc_region` VALUES ('410704', '410700', '凤泉区', '2');
INSERT INTO `hc_region` VALUES ('410711', '410700', '牧野区', '2');
INSERT INTO `hc_region` VALUES ('410721', '410700', '新乡县', '2');
INSERT INTO `hc_region` VALUES ('410724', '410700', '获嘉县', '2');
INSERT INTO `hc_region` VALUES ('410725', '410700', '原阳县', '2');
INSERT INTO `hc_region` VALUES ('410726', '410700', '延津县', '2');
INSERT INTO `hc_region` VALUES ('410727', '410700', '封丘县', '2');
INSERT INTO `hc_region` VALUES ('410728', '410700', '长垣县', '2');
INSERT INTO `hc_region` VALUES ('410781', '410700', '卫辉市', '2');
INSERT INTO `hc_region` VALUES ('410782', '410700', '辉县市', '2');
INSERT INTO `hc_region` VALUES ('410800', '410000', '焦作市', '1');
INSERT INTO `hc_region` VALUES ('410801', '410800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('410802', '410800', '解放区', '2');
INSERT INTO `hc_region` VALUES ('410803', '410800', '中站区', '2');
INSERT INTO `hc_region` VALUES ('410804', '410800', '马村区', '2');
INSERT INTO `hc_region` VALUES ('410811', '410800', '山阳区', '2');
INSERT INTO `hc_region` VALUES ('410821', '410800', '修武县', '2');
INSERT INTO `hc_region` VALUES ('410822', '410800', '博爱县', '2');
INSERT INTO `hc_region` VALUES ('410823', '410800', '武陟县', '2');
INSERT INTO `hc_region` VALUES ('410825', '410800', '温县', '2');
INSERT INTO `hc_region` VALUES ('410882', '410800', '沁阳市', '2');
INSERT INTO `hc_region` VALUES ('410883', '410800', '孟州市', '2');
INSERT INTO `hc_region` VALUES ('410900', '410000', '濮阳市', '1');
INSERT INTO `hc_region` VALUES ('410901', '410900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('410902', '410900', '华龙区', '2');
INSERT INTO `hc_region` VALUES ('410922', '410900', '清丰县', '2');
INSERT INTO `hc_region` VALUES ('410923', '410900', '南乐县', '2');
INSERT INTO `hc_region` VALUES ('410926', '410900', '范县', '2');
INSERT INTO `hc_region` VALUES ('410927', '410900', '台前县', '2');
INSERT INTO `hc_region` VALUES ('410928', '410900', '濮阳县', '2');
INSERT INTO `hc_region` VALUES ('411000', '410000', '许昌市', '1');
INSERT INTO `hc_region` VALUES ('411001', '411000', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('411002', '411000', '魏都区', '2');
INSERT INTO `hc_region` VALUES ('411023', '411000', '许昌县', '2');
INSERT INTO `hc_region` VALUES ('411024', '411000', '鄢陵县', '2');
INSERT INTO `hc_region` VALUES ('411025', '411000', '襄城县', '2');
INSERT INTO `hc_region` VALUES ('411081', '411000', '禹州市', '2');
INSERT INTO `hc_region` VALUES ('411082', '411000', '长葛市', '2');
INSERT INTO `hc_region` VALUES ('411100', '410000', '漯河市', '1');
INSERT INTO `hc_region` VALUES ('411101', '411100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('411102', '411100', '源汇区', '2');
INSERT INTO `hc_region` VALUES ('411103', '411100', '郾城区', '2');
INSERT INTO `hc_region` VALUES ('411104', '411100', '召陵区', '2');
INSERT INTO `hc_region` VALUES ('411121', '411100', '舞阳县', '2');
INSERT INTO `hc_region` VALUES ('411122', '411100', '临颍县', '2');
INSERT INTO `hc_region` VALUES ('411200', '410000', '三门峡市', '1');
INSERT INTO `hc_region` VALUES ('411201', '411200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('411202', '411200', '湖滨区', '2');
INSERT INTO `hc_region` VALUES ('411221', '411200', '渑池县', '2');
INSERT INTO `hc_region` VALUES ('411222', '411200', '陕县', '2');
INSERT INTO `hc_region` VALUES ('411224', '411200', '卢氏县', '2');
INSERT INTO `hc_region` VALUES ('411281', '411200', '义马市', '2');
INSERT INTO `hc_region` VALUES ('411282', '411200', '灵宝市', '2');
INSERT INTO `hc_region` VALUES ('411300', '410000', '南阳市', '1');
INSERT INTO `hc_region` VALUES ('411301', '411300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('411302', '411300', '宛城区', '2');
INSERT INTO `hc_region` VALUES ('411303', '411300', '卧龙区', '2');
INSERT INTO `hc_region` VALUES ('411321', '411300', '南召县', '2');
INSERT INTO `hc_region` VALUES ('411322', '411300', '方城县', '2');
INSERT INTO `hc_region` VALUES ('411323', '411300', '西峡县', '2');
INSERT INTO `hc_region` VALUES ('411324', '411300', '镇平县', '2');
INSERT INTO `hc_region` VALUES ('411325', '411300', '内乡县', '2');
INSERT INTO `hc_region` VALUES ('411326', '411300', '淅川县', '2');
INSERT INTO `hc_region` VALUES ('411327', '411300', '社旗县', '2');
INSERT INTO `hc_region` VALUES ('411328', '411300', '唐河县', '2');
INSERT INTO `hc_region` VALUES ('411329', '411300', '新野县', '2');
INSERT INTO `hc_region` VALUES ('411330', '411300', '桐柏县', '2');
INSERT INTO `hc_region` VALUES ('411381', '411300', '邓州市', '2');
INSERT INTO `hc_region` VALUES ('411400', '410000', '商丘市', '1');
INSERT INTO `hc_region` VALUES ('411401', '411400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('411402', '411400', '梁园区', '2');
INSERT INTO `hc_region` VALUES ('411403', '411400', '睢阳区', '2');
INSERT INTO `hc_region` VALUES ('411421', '411400', '民权县', '2');
INSERT INTO `hc_region` VALUES ('411422', '411400', '睢县', '2');
INSERT INTO `hc_region` VALUES ('411423', '411400', '宁陵县', '2');
INSERT INTO `hc_region` VALUES ('411424', '411400', '柘城县', '2');
INSERT INTO `hc_region` VALUES ('411425', '411400', '虞城县', '2');
INSERT INTO `hc_region` VALUES ('411426', '411400', '夏邑县', '2');
INSERT INTO `hc_region` VALUES ('411481', '411400', '永城市', '2');
INSERT INTO `hc_region` VALUES ('411500', '410000', '信阳市', '1');
INSERT INTO `hc_region` VALUES ('411501', '411500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('411502', '411500', '浉河区', '2');
INSERT INTO `hc_region` VALUES ('411503', '411500', '平桥区', '2');
INSERT INTO `hc_region` VALUES ('411521', '411500', '罗山县', '2');
INSERT INTO `hc_region` VALUES ('411522', '411500', '光山县', '2');
INSERT INTO `hc_region` VALUES ('411523', '411500', '新县', '2');
INSERT INTO `hc_region` VALUES ('411524', '411500', '商城县', '2');
INSERT INTO `hc_region` VALUES ('411525', '411500', '固始县', '2');
INSERT INTO `hc_region` VALUES ('411526', '411500', '潢川县', '2');
INSERT INTO `hc_region` VALUES ('411527', '411500', '淮滨县', '2');
INSERT INTO `hc_region` VALUES ('411528', '411500', '息县', '2');
INSERT INTO `hc_region` VALUES ('411600', '410000', '周口市', '1');
INSERT INTO `hc_region` VALUES ('411601', '411600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('411602', '411600', '川汇区', '2');
INSERT INTO `hc_region` VALUES ('411621', '411600', '扶沟县', '2');
INSERT INTO `hc_region` VALUES ('411622', '411600', '西华县', '2');
INSERT INTO `hc_region` VALUES ('411623', '411600', '商水县', '2');
INSERT INTO `hc_region` VALUES ('411624', '411600', '沈丘县', '2');
INSERT INTO `hc_region` VALUES ('411625', '411600', '郸城县', '2');
INSERT INTO `hc_region` VALUES ('411626', '411600', '淮阳县', '2');
INSERT INTO `hc_region` VALUES ('411627', '411600', '太康县', '2');
INSERT INTO `hc_region` VALUES ('411628', '411600', '鹿邑县', '2');
INSERT INTO `hc_region` VALUES ('411681', '411600', '项城市', '2');
INSERT INTO `hc_region` VALUES ('411700', '410000', '驻马店市', '1');
INSERT INTO `hc_region` VALUES ('411701', '411700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('411702', '411700', '驿城区', '2');
INSERT INTO `hc_region` VALUES ('411721', '411700', '西平县', '2');
INSERT INTO `hc_region` VALUES ('411722', '411700', '上蔡县', '2');
INSERT INTO `hc_region` VALUES ('411723', '411700', '平舆县', '2');
INSERT INTO `hc_region` VALUES ('411724', '411700', '正阳县', '2');
INSERT INTO `hc_region` VALUES ('411725', '411700', '确山县', '2');
INSERT INTO `hc_region` VALUES ('411726', '411700', '泌阳县', '2');
INSERT INTO `hc_region` VALUES ('411727', '411700', '汝南县', '2');
INSERT INTO `hc_region` VALUES ('411728', '411700', '遂平县', '2');
INSERT INTO `hc_region` VALUES ('411729', '411700', '新蔡县', '2');
INSERT INTO `hc_region` VALUES ('419000', '410000', '省直辖县级行政区划', '1');
INSERT INTO `hc_region` VALUES ('419001', '419000', '济源市', '2');
INSERT INTO `hc_region` VALUES ('420000', '0', '湖北省', '0');
INSERT INTO `hc_region` VALUES ('420100', '420000', '武汉市', '1');
INSERT INTO `hc_region` VALUES ('420101', '420100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('420102', '420100', '江岸区', '2');
INSERT INTO `hc_region` VALUES ('420103', '420100', '江汉区', '2');
INSERT INTO `hc_region` VALUES ('420104', '420100', '硚口区', '2');
INSERT INTO `hc_region` VALUES ('420105', '420100', '汉阳区', '2');
INSERT INTO `hc_region` VALUES ('420106', '420100', '武昌区', '2');
INSERT INTO `hc_region` VALUES ('420107', '420100', '青山区', '2');
INSERT INTO `hc_region` VALUES ('420111', '420100', '洪山区', '2');
INSERT INTO `hc_region` VALUES ('420112', '420100', '东西湖区', '2');
INSERT INTO `hc_region` VALUES ('420113', '420100', '汉南区', '2');
INSERT INTO `hc_region` VALUES ('420114', '420100', '蔡甸区', '2');
INSERT INTO `hc_region` VALUES ('420115', '420100', '江夏区', '2');
INSERT INTO `hc_region` VALUES ('420116', '420100', '黄陂区', '2');
INSERT INTO `hc_region` VALUES ('420117', '420100', '新洲区', '2');
INSERT INTO `hc_region` VALUES ('420200', '420000', '黄石市', '1');
INSERT INTO `hc_region` VALUES ('420201', '420200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('420202', '420200', '黄石港区', '2');
INSERT INTO `hc_region` VALUES ('420203', '420200', '西塞山区', '2');
INSERT INTO `hc_region` VALUES ('420204', '420200', '下陆区', '2');
INSERT INTO `hc_region` VALUES ('420205', '420200', '铁山区', '2');
INSERT INTO `hc_region` VALUES ('420222', '420200', '阳新县', '2');
INSERT INTO `hc_region` VALUES ('420281', '420200', '大冶市', '2');
INSERT INTO `hc_region` VALUES ('420300', '420000', '十堰市', '1');
INSERT INTO `hc_region` VALUES ('420301', '420300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('420302', '420300', '茅箭区', '2');
INSERT INTO `hc_region` VALUES ('420303', '420300', '张湾区', '2');
INSERT INTO `hc_region` VALUES ('420304', '420300', '郧阳区', '2');
INSERT INTO `hc_region` VALUES ('420322', '420300', '郧西县', '2');
INSERT INTO `hc_region` VALUES ('420323', '420300', '竹山县', '2');
INSERT INTO `hc_region` VALUES ('420324', '420300', '竹溪县', '2');
INSERT INTO `hc_region` VALUES ('420325', '420300', '房县', '2');
INSERT INTO `hc_region` VALUES ('420381', '420300', '丹江口市', '2');
INSERT INTO `hc_region` VALUES ('420500', '420000', '宜昌市', '1');
INSERT INTO `hc_region` VALUES ('420501', '420500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('420502', '420500', '西陵区', '2');
INSERT INTO `hc_region` VALUES ('420503', '420500', '伍家岗区', '2');
INSERT INTO `hc_region` VALUES ('420504', '420500', '点军区', '2');
INSERT INTO `hc_region` VALUES ('420505', '420500', '猇亭区', '2');
INSERT INTO `hc_region` VALUES ('420506', '420500', '夷陵区', '2');
INSERT INTO `hc_region` VALUES ('420525', '420500', '远安县', '2');
INSERT INTO `hc_region` VALUES ('420526', '420500', '兴山县', '2');
INSERT INTO `hc_region` VALUES ('420527', '420500', '秭归县', '2');
INSERT INTO `hc_region` VALUES ('420528', '420500', '长阳土家族自治县', '2');
INSERT INTO `hc_region` VALUES ('420529', '420500', '五峰土家族自治县', '2');
INSERT INTO `hc_region` VALUES ('420581', '420500', '宜都市', '2');
INSERT INTO `hc_region` VALUES ('420582', '420500', '当阳市', '2');
INSERT INTO `hc_region` VALUES ('420583', '420500', '枝江市', '2');
INSERT INTO `hc_region` VALUES ('420600', '420000', '襄阳市', '1');
INSERT INTO `hc_region` VALUES ('420601', '420600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('420602', '420600', '襄城区', '2');
INSERT INTO `hc_region` VALUES ('420606', '420600', '樊城区', '2');
INSERT INTO `hc_region` VALUES ('420607', '420600', '襄州区', '2');
INSERT INTO `hc_region` VALUES ('420624', '420600', '南漳县', '2');
INSERT INTO `hc_region` VALUES ('420625', '420600', '谷城县', '2');
INSERT INTO `hc_region` VALUES ('420626', '420600', '保康县', '2');
INSERT INTO `hc_region` VALUES ('420682', '420600', '老河口市', '2');
INSERT INTO `hc_region` VALUES ('420683', '420600', '枣阳市', '2');
INSERT INTO `hc_region` VALUES ('420684', '420600', '宜城市', '2');
INSERT INTO `hc_region` VALUES ('420700', '420000', '鄂州市', '1');
INSERT INTO `hc_region` VALUES ('420701', '420700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('420702', '420700', '梁子湖区', '2');
INSERT INTO `hc_region` VALUES ('420703', '420700', '华容区', '2');
INSERT INTO `hc_region` VALUES ('420704', '420700', '鄂城区', '2');
INSERT INTO `hc_region` VALUES ('420800', '420000', '荆门市', '1');
INSERT INTO `hc_region` VALUES ('420801', '420800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('420802', '420800', '东宝区', '2');
INSERT INTO `hc_region` VALUES ('420804', '420800', '掇刀区', '2');
INSERT INTO `hc_region` VALUES ('420821', '420800', '京山县', '2');
INSERT INTO `hc_region` VALUES ('420822', '420800', '沙洋县', '2');
INSERT INTO `hc_region` VALUES ('420881', '420800', '钟祥市', '2');
INSERT INTO `hc_region` VALUES ('420900', '420000', '孝感市', '1');
INSERT INTO `hc_region` VALUES ('420901', '420900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('420902', '420900', '孝南区', '2');
INSERT INTO `hc_region` VALUES ('420921', '420900', '孝昌县', '2');
INSERT INTO `hc_region` VALUES ('420922', '420900', '大悟县', '2');
INSERT INTO `hc_region` VALUES ('420923', '420900', '云梦县', '2');
INSERT INTO `hc_region` VALUES ('420981', '420900', '应城市', '2');
INSERT INTO `hc_region` VALUES ('420982', '420900', '安陆市', '2');
INSERT INTO `hc_region` VALUES ('420984', '420900', '汉川市', '2');
INSERT INTO `hc_region` VALUES ('421000', '420000', '荆州市', '1');
INSERT INTO `hc_region` VALUES ('421001', '421000', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('421002', '421000', '沙市区', '2');
INSERT INTO `hc_region` VALUES ('421003', '421000', '荆州区', '2');
INSERT INTO `hc_region` VALUES ('421022', '421000', '公安县', '2');
INSERT INTO `hc_region` VALUES ('421023', '421000', '监利县', '2');
INSERT INTO `hc_region` VALUES ('421024', '421000', '江陵县', '2');
INSERT INTO `hc_region` VALUES ('421081', '421000', '石首市', '2');
INSERT INTO `hc_region` VALUES ('421083', '421000', '洪湖市', '2');
INSERT INTO `hc_region` VALUES ('421087', '421000', '松滋市', '2');
INSERT INTO `hc_region` VALUES ('421100', '420000', '黄冈市', '1');
INSERT INTO `hc_region` VALUES ('421101', '421100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('421102', '421100', '黄州区', '2');
INSERT INTO `hc_region` VALUES ('421121', '421100', '团风县', '2');
INSERT INTO `hc_region` VALUES ('421122', '421100', '红安县', '2');
INSERT INTO `hc_region` VALUES ('421123', '421100', '罗田县', '2');
INSERT INTO `hc_region` VALUES ('421124', '421100', '英山县', '2');
INSERT INTO `hc_region` VALUES ('421125', '421100', '浠水县', '2');
INSERT INTO `hc_region` VALUES ('421126', '421100', '蕲春县', '2');
INSERT INTO `hc_region` VALUES ('421127', '421100', '黄梅县', '2');
INSERT INTO `hc_region` VALUES ('421181', '421100', '麻城市', '2');
INSERT INTO `hc_region` VALUES ('421182', '421100', '武穴市', '2');
INSERT INTO `hc_region` VALUES ('421200', '420000', '咸宁市', '1');
INSERT INTO `hc_region` VALUES ('421201', '421200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('421202', '421200', '咸安区', '2');
INSERT INTO `hc_region` VALUES ('421221', '421200', '嘉鱼县', '2');
INSERT INTO `hc_region` VALUES ('421222', '421200', '通城县', '2');
INSERT INTO `hc_region` VALUES ('421223', '421200', '崇阳县', '2');
INSERT INTO `hc_region` VALUES ('421224', '421200', '通山县', '2');
INSERT INTO `hc_region` VALUES ('421281', '421200', '赤壁市', '2');
INSERT INTO `hc_region` VALUES ('421300', '420000', '随州市', '1');
INSERT INTO `hc_region` VALUES ('421301', '421300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('421303', '421300', '曾都区', '2');
INSERT INTO `hc_region` VALUES ('421321', '421300', '随县', '2');
INSERT INTO `hc_region` VALUES ('421381', '421300', '广水市', '2');
INSERT INTO `hc_region` VALUES ('422800', '420000', '恩施土家族苗族自治州', '1');
INSERT INTO `hc_region` VALUES ('422801', '422800', '恩施市', '2');
INSERT INTO `hc_region` VALUES ('422802', '422800', '利川市', '2');
INSERT INTO `hc_region` VALUES ('422822', '422800', '建始县', '2');
INSERT INTO `hc_region` VALUES ('422823', '422800', '巴东县', '2');
INSERT INTO `hc_region` VALUES ('422825', '422800', '宣恩县', '2');
INSERT INTO `hc_region` VALUES ('422826', '422800', '咸丰县', '2');
INSERT INTO `hc_region` VALUES ('422827', '422800', '来凤县', '2');
INSERT INTO `hc_region` VALUES ('422828', '422800', '鹤峰县', '2');
INSERT INTO `hc_region` VALUES ('429000', '420000', '省直辖县级行政区划', '1');
INSERT INTO `hc_region` VALUES ('429004', '429000', '仙桃市', '2');
INSERT INTO `hc_region` VALUES ('429005', '429000', '潜江市', '2');
INSERT INTO `hc_region` VALUES ('429006', '429000', '天门市', '2');
INSERT INTO `hc_region` VALUES ('429021', '429000', '神农架林区', '2');
INSERT INTO `hc_region` VALUES ('430000', '0', '湖南省', '0');
INSERT INTO `hc_region` VALUES ('430100', '430000', '长沙市', '1');
INSERT INTO `hc_region` VALUES ('430101', '430100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('430102', '430100', '芙蓉区', '2');
INSERT INTO `hc_region` VALUES ('430103', '430100', '天心区', '2');
INSERT INTO `hc_region` VALUES ('430104', '430100', '岳麓区', '2');
INSERT INTO `hc_region` VALUES ('430105', '430100', '开福区', '2');
INSERT INTO `hc_region` VALUES ('430111', '430100', '雨花区', '2');
INSERT INTO `hc_region` VALUES ('430112', '430100', '望城区', '2');
INSERT INTO `hc_region` VALUES ('430121', '430100', '长沙县', '2');
INSERT INTO `hc_region` VALUES ('430124', '430100', '宁乡县', '2');
INSERT INTO `hc_region` VALUES ('430181', '430100', '浏阳市', '2');
INSERT INTO `hc_region` VALUES ('430200', '430000', '株洲市', '1');
INSERT INTO `hc_region` VALUES ('430201', '430200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('430202', '430200', '荷塘区', '2');
INSERT INTO `hc_region` VALUES ('430203', '430200', '芦淞区', '2');
INSERT INTO `hc_region` VALUES ('430204', '430200', '石峰区', '2');
INSERT INTO `hc_region` VALUES ('430211', '430200', '天元区', '2');
INSERT INTO `hc_region` VALUES ('430221', '430200', '株洲县', '2');
INSERT INTO `hc_region` VALUES ('430223', '430200', '攸县', '2');
INSERT INTO `hc_region` VALUES ('430224', '430200', '茶陵县', '2');
INSERT INTO `hc_region` VALUES ('430225', '430200', '炎陵县', '2');
INSERT INTO `hc_region` VALUES ('430281', '430200', '醴陵市', '2');
INSERT INTO `hc_region` VALUES ('430300', '430000', '湘潭市', '1');
INSERT INTO `hc_region` VALUES ('430301', '430300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('430302', '430300', '雨湖区', '2');
INSERT INTO `hc_region` VALUES ('430304', '430300', '岳塘区', '2');
INSERT INTO `hc_region` VALUES ('430321', '430300', '湘潭县', '2');
INSERT INTO `hc_region` VALUES ('430381', '430300', '湘乡市', '2');
INSERT INTO `hc_region` VALUES ('430382', '430300', '韶山市', '2');
INSERT INTO `hc_region` VALUES ('430400', '430000', '衡阳市', '1');
INSERT INTO `hc_region` VALUES ('430401', '430400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('430405', '430400', '珠晖区', '2');
INSERT INTO `hc_region` VALUES ('430406', '430400', '雁峰区', '2');
INSERT INTO `hc_region` VALUES ('430407', '430400', '石鼓区', '2');
INSERT INTO `hc_region` VALUES ('430408', '430400', '蒸湘区', '2');
INSERT INTO `hc_region` VALUES ('430412', '430400', '南岳区', '2');
INSERT INTO `hc_region` VALUES ('430421', '430400', '衡阳县', '2');
INSERT INTO `hc_region` VALUES ('430422', '430400', '衡南县', '2');
INSERT INTO `hc_region` VALUES ('430423', '430400', '衡山县', '2');
INSERT INTO `hc_region` VALUES ('430424', '430400', '衡东县', '2');
INSERT INTO `hc_region` VALUES ('430426', '430400', '祁东县', '2');
INSERT INTO `hc_region` VALUES ('430481', '430400', '耒阳市', '2');
INSERT INTO `hc_region` VALUES ('430482', '430400', '常宁市', '2');
INSERT INTO `hc_region` VALUES ('430500', '430000', '邵阳市', '1');
INSERT INTO `hc_region` VALUES ('430501', '430500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('430502', '430500', '双清区', '2');
INSERT INTO `hc_region` VALUES ('430503', '430500', '大祥区', '2');
INSERT INTO `hc_region` VALUES ('430511', '430500', '北塔区', '2');
INSERT INTO `hc_region` VALUES ('430521', '430500', '邵东县', '2');
INSERT INTO `hc_region` VALUES ('430522', '430500', '新邵县', '2');
INSERT INTO `hc_region` VALUES ('430523', '430500', '邵阳县', '2');
INSERT INTO `hc_region` VALUES ('430524', '430500', '隆回县', '2');
INSERT INTO `hc_region` VALUES ('430525', '430500', '洞口县', '2');
INSERT INTO `hc_region` VALUES ('430527', '430500', '绥宁县', '2');
INSERT INTO `hc_region` VALUES ('430528', '430500', '新宁县', '2');
INSERT INTO `hc_region` VALUES ('430529', '430500', '城步苗族自治县', '2');
INSERT INTO `hc_region` VALUES ('430581', '430500', '武冈市', '2');
INSERT INTO `hc_region` VALUES ('430600', '430000', '岳阳市', '1');
INSERT INTO `hc_region` VALUES ('430601', '430600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('430602', '430600', '岳阳楼区', '2');
INSERT INTO `hc_region` VALUES ('430603', '430600', '云溪区', '2');
INSERT INTO `hc_region` VALUES ('430611', '430600', '君山区', '2');
INSERT INTO `hc_region` VALUES ('430621', '430600', '岳阳县', '2');
INSERT INTO `hc_region` VALUES ('430623', '430600', '华容县', '2');
INSERT INTO `hc_region` VALUES ('430624', '430600', '湘阴县', '2');
INSERT INTO `hc_region` VALUES ('430626', '430600', '平江县', '2');
INSERT INTO `hc_region` VALUES ('430681', '430600', '汨罗市', '2');
INSERT INTO `hc_region` VALUES ('430682', '430600', '临湘市', '2');
INSERT INTO `hc_region` VALUES ('430700', '430000', '常德市', '1');
INSERT INTO `hc_region` VALUES ('430701', '430700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('430702', '430700', '武陵区', '2');
INSERT INTO `hc_region` VALUES ('430703', '430700', '鼎城区', '2');
INSERT INTO `hc_region` VALUES ('430721', '430700', '安乡县', '2');
INSERT INTO `hc_region` VALUES ('430722', '430700', '汉寿县', '2');
INSERT INTO `hc_region` VALUES ('430723', '430700', '澧县', '2');
INSERT INTO `hc_region` VALUES ('430724', '430700', '临澧县', '2');
INSERT INTO `hc_region` VALUES ('430725', '430700', '桃源县', '2');
INSERT INTO `hc_region` VALUES ('430726', '430700', '石门县', '2');
INSERT INTO `hc_region` VALUES ('430781', '430700', '津市市', '2');
INSERT INTO `hc_region` VALUES ('430800', '430000', '张家界市', '1');
INSERT INTO `hc_region` VALUES ('430801', '430800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('430802', '430800', '永定区', '2');
INSERT INTO `hc_region` VALUES ('430811', '430800', '武陵源区', '2');
INSERT INTO `hc_region` VALUES ('430821', '430800', '慈利县', '2');
INSERT INTO `hc_region` VALUES ('430822', '430800', '桑植县', '2');
INSERT INTO `hc_region` VALUES ('430900', '430000', '益阳市', '1');
INSERT INTO `hc_region` VALUES ('430901', '430900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('430902', '430900', '资阳区', '2');
INSERT INTO `hc_region` VALUES ('430903', '430900', '赫山区', '2');
INSERT INTO `hc_region` VALUES ('430921', '430900', '南县', '2');
INSERT INTO `hc_region` VALUES ('430922', '430900', '桃江县', '2');
INSERT INTO `hc_region` VALUES ('430923', '430900', '安化县', '2');
INSERT INTO `hc_region` VALUES ('430981', '430900', '沅江市', '2');
INSERT INTO `hc_region` VALUES ('431000', '430000', '郴州市', '1');
INSERT INTO `hc_region` VALUES ('431001', '431000', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('431002', '431000', '北湖区', '2');
INSERT INTO `hc_region` VALUES ('431003', '431000', '苏仙区', '2');
INSERT INTO `hc_region` VALUES ('431021', '431000', '桂阳县', '2');
INSERT INTO `hc_region` VALUES ('431022', '431000', '宜章县', '2');
INSERT INTO `hc_region` VALUES ('431023', '431000', '永兴县', '2');
INSERT INTO `hc_region` VALUES ('431024', '431000', '嘉禾县', '2');
INSERT INTO `hc_region` VALUES ('431025', '431000', '临武县', '2');
INSERT INTO `hc_region` VALUES ('431026', '431000', '汝城县', '2');
INSERT INTO `hc_region` VALUES ('431027', '431000', '桂东县', '2');
INSERT INTO `hc_region` VALUES ('431028', '431000', '安仁县', '2');
INSERT INTO `hc_region` VALUES ('431081', '431000', '资兴市', '2');
INSERT INTO `hc_region` VALUES ('431100', '430000', '永州市', '1');
INSERT INTO `hc_region` VALUES ('431101', '431100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('431102', '431100', '零陵区', '2');
INSERT INTO `hc_region` VALUES ('431103', '431100', '冷水滩区', '2');
INSERT INTO `hc_region` VALUES ('431121', '431100', '祁阳县', '2');
INSERT INTO `hc_region` VALUES ('431122', '431100', '东安县', '2');
INSERT INTO `hc_region` VALUES ('431123', '431100', '双牌县', '2');
INSERT INTO `hc_region` VALUES ('431124', '431100', '道县', '2');
INSERT INTO `hc_region` VALUES ('431125', '431100', '江永县', '2');
INSERT INTO `hc_region` VALUES ('431126', '431100', '宁远县', '2');
INSERT INTO `hc_region` VALUES ('431127', '431100', '蓝山县', '2');
INSERT INTO `hc_region` VALUES ('431128', '431100', '新田县', '2');
INSERT INTO `hc_region` VALUES ('431129', '431100', '江华瑶族自治县', '2');
INSERT INTO `hc_region` VALUES ('431200', '430000', '怀化市', '1');
INSERT INTO `hc_region` VALUES ('431201', '431200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('431202', '431200', '鹤城区', '2');
INSERT INTO `hc_region` VALUES ('431221', '431200', '中方县', '2');
INSERT INTO `hc_region` VALUES ('431222', '431200', '沅陵县', '2');
INSERT INTO `hc_region` VALUES ('431223', '431200', '辰溪县', '2');
INSERT INTO `hc_region` VALUES ('431224', '431200', '溆浦县', '2');
INSERT INTO `hc_region` VALUES ('431225', '431200', '会同县', '2');
INSERT INTO `hc_region` VALUES ('431226', '431200', '麻阳苗族自治县', '2');
INSERT INTO `hc_region` VALUES ('431227', '431200', '新晃侗族自治县', '2');
INSERT INTO `hc_region` VALUES ('431228', '431200', '芷江侗族自治县', '2');
INSERT INTO `hc_region` VALUES ('431229', '431200', '靖州苗族侗族自治县', '2');
INSERT INTO `hc_region` VALUES ('431230', '431200', '通道侗族自治县', '2');
INSERT INTO `hc_region` VALUES ('431281', '431200', '洪江市', '2');
INSERT INTO `hc_region` VALUES ('431300', '430000', '娄底市', '1');
INSERT INTO `hc_region` VALUES ('431301', '431300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('431302', '431300', '娄星区', '2');
INSERT INTO `hc_region` VALUES ('431321', '431300', '双峰县', '2');
INSERT INTO `hc_region` VALUES ('431322', '431300', '新化县', '2');
INSERT INTO `hc_region` VALUES ('431381', '431300', '冷水江市', '2');
INSERT INTO `hc_region` VALUES ('431382', '431300', '涟源市', '2');
INSERT INTO `hc_region` VALUES ('433100', '430000', '湘西土家族苗族自治州', '1');
INSERT INTO `hc_region` VALUES ('433101', '433100', '吉首市', '2');
INSERT INTO `hc_region` VALUES ('433122', '433100', '泸溪县', '2');
INSERT INTO `hc_region` VALUES ('433123', '433100', '凤凰县', '2');
INSERT INTO `hc_region` VALUES ('433124', '433100', '花垣县', '2');
INSERT INTO `hc_region` VALUES ('433125', '433100', '保靖县', '2');
INSERT INTO `hc_region` VALUES ('433126', '433100', '古丈县', '2');
INSERT INTO `hc_region` VALUES ('433127', '433100', '永顺县', '2');
INSERT INTO `hc_region` VALUES ('433130', '433100', '龙山县', '2');
INSERT INTO `hc_region` VALUES ('440000', '0', '广东省', '0');
INSERT INTO `hc_region` VALUES ('440100', '440000', '广州市', '1');
INSERT INTO `hc_region` VALUES ('440101', '440100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('440103', '440100', '荔湾区', '2');
INSERT INTO `hc_region` VALUES ('440104', '440100', '越秀区', '2');
INSERT INTO `hc_region` VALUES ('440105', '440100', '海珠区', '2');
INSERT INTO `hc_region` VALUES ('440106', '440100', '天河区', '2');
INSERT INTO `hc_region` VALUES ('440111', '440100', '白云区', '2');
INSERT INTO `hc_region` VALUES ('440112', '440100', '黄埔区', '2');
INSERT INTO `hc_region` VALUES ('440113', '440100', '番禺区', '2');
INSERT INTO `hc_region` VALUES ('440114', '440100', '花都区', '2');
INSERT INTO `hc_region` VALUES ('440115', '440100', '南沙区', '2');
INSERT INTO `hc_region` VALUES ('440116', '440100', '萝岗区', '2');
INSERT INTO `hc_region` VALUES ('440117', '440100', '从化区', '2');
INSERT INTO `hc_region` VALUES ('440118', '440100', '增城区', '2');
INSERT INTO `hc_region` VALUES ('440200', '440000', '韶关市', '1');
INSERT INTO `hc_region` VALUES ('440201', '440200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('440203', '440200', '武江区', '2');
INSERT INTO `hc_region` VALUES ('440204', '440200', '浈江区', '2');
INSERT INTO `hc_region` VALUES ('440205', '440200', '曲江区', '2');
INSERT INTO `hc_region` VALUES ('440222', '440200', '始兴县', '2');
INSERT INTO `hc_region` VALUES ('440224', '440200', '仁化县', '2');
INSERT INTO `hc_region` VALUES ('440229', '440200', '翁源县', '2');
INSERT INTO `hc_region` VALUES ('440232', '440200', '乳源瑶族自治县', '2');
INSERT INTO `hc_region` VALUES ('440233', '440200', '新丰县', '2');
INSERT INTO `hc_region` VALUES ('440281', '440200', '乐昌市', '2');
INSERT INTO `hc_region` VALUES ('440282', '440200', '南雄市', '2');
INSERT INTO `hc_region` VALUES ('440300', '440000', '深圳市', '1');
INSERT INTO `hc_region` VALUES ('440301', '440300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('440303', '440300', '罗湖区', '2');
INSERT INTO `hc_region` VALUES ('440304', '440300', '福田区', '2');
INSERT INTO `hc_region` VALUES ('440305', '440300', '南山区', '2');
INSERT INTO `hc_region` VALUES ('440306', '440300', '宝安区', '2');
INSERT INTO `hc_region` VALUES ('440307', '440300', '龙岗区', '2');
INSERT INTO `hc_region` VALUES ('440308', '440300', '盐田区', '2');
INSERT INTO `hc_region` VALUES ('440400', '440000', '珠海市', '1');
INSERT INTO `hc_region` VALUES ('440401', '440400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('440402', '440400', '香洲区', '2');
INSERT INTO `hc_region` VALUES ('440403', '440400', '斗门区', '2');
INSERT INTO `hc_region` VALUES ('440404', '440400', '金湾区', '2');
INSERT INTO `hc_region` VALUES ('440500', '440000', '汕头市', '1');
INSERT INTO `hc_region` VALUES ('440501', '440500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('440507', '440500', '龙湖区', '2');
INSERT INTO `hc_region` VALUES ('440511', '440500', '金平区', '2');
INSERT INTO `hc_region` VALUES ('440512', '440500', '濠江区', '2');
INSERT INTO `hc_region` VALUES ('440513', '440500', '潮阳区', '2');
INSERT INTO `hc_region` VALUES ('440514', '440500', '潮南区', '2');
INSERT INTO `hc_region` VALUES ('440515', '440500', '澄海区', '2');
INSERT INTO `hc_region` VALUES ('440523', '440500', '南澳县', '2');
INSERT INTO `hc_region` VALUES ('440600', '440000', '佛山市', '1');
INSERT INTO `hc_region` VALUES ('440601', '440600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('440604', '440600', '禅城区', '2');
INSERT INTO `hc_region` VALUES ('440605', '440600', '南海区', '2');
INSERT INTO `hc_region` VALUES ('440606', '440600', '顺德区', '2');
INSERT INTO `hc_region` VALUES ('440607', '440600', '三水区', '2');
INSERT INTO `hc_region` VALUES ('440608', '440600', '高明区', '2');
INSERT INTO `hc_region` VALUES ('440700', '440000', '江门市', '1');
INSERT INTO `hc_region` VALUES ('440701', '440700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('440703', '440700', '蓬江区', '2');
INSERT INTO `hc_region` VALUES ('440704', '440700', '江海区', '2');
INSERT INTO `hc_region` VALUES ('440705', '440700', '新会区', '2');
INSERT INTO `hc_region` VALUES ('440781', '440700', '台山市', '2');
INSERT INTO `hc_region` VALUES ('440783', '440700', '开平市', '2');
INSERT INTO `hc_region` VALUES ('440784', '440700', '鹤山市', '2');
INSERT INTO `hc_region` VALUES ('440785', '440700', '恩平市', '2');
INSERT INTO `hc_region` VALUES ('440800', '440000', '湛江市', '1');
INSERT INTO `hc_region` VALUES ('440801', '440800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('440802', '440800', '赤坎区', '2');
INSERT INTO `hc_region` VALUES ('440803', '440800', '霞山区', '2');
INSERT INTO `hc_region` VALUES ('440804', '440800', '坡头区', '2');
INSERT INTO `hc_region` VALUES ('440811', '440800', '麻章区', '2');
INSERT INTO `hc_region` VALUES ('440823', '440800', '遂溪县', '2');
INSERT INTO `hc_region` VALUES ('440825', '440800', '徐闻县', '2');
INSERT INTO `hc_region` VALUES ('440881', '440800', '廉江市', '2');
INSERT INTO `hc_region` VALUES ('440882', '440800', '雷州市', '2');
INSERT INTO `hc_region` VALUES ('440883', '440800', '吴川市', '2');
INSERT INTO `hc_region` VALUES ('440900', '440000', '茂名市', '1');
INSERT INTO `hc_region` VALUES ('440901', '440900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('440902', '440900', '茂南区', '2');
INSERT INTO `hc_region` VALUES ('440904', '440900', '电白区', '2');
INSERT INTO `hc_region` VALUES ('440981', '440900', '高州市', '2');
INSERT INTO `hc_region` VALUES ('440982', '440900', '化州市', '2');
INSERT INTO `hc_region` VALUES ('440983', '440900', '信宜市', '2');
INSERT INTO `hc_region` VALUES ('441200', '440000', '肇庆市', '1');
INSERT INTO `hc_region` VALUES ('441201', '441200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('441202', '441200', '端州区', '2');
INSERT INTO `hc_region` VALUES ('441203', '441200', '鼎湖区', '2');
INSERT INTO `hc_region` VALUES ('441223', '441200', '广宁县', '2');
INSERT INTO `hc_region` VALUES ('441224', '441200', '怀集县', '2');
INSERT INTO `hc_region` VALUES ('441225', '441200', '封开县', '2');
INSERT INTO `hc_region` VALUES ('441226', '441200', '德庆县', '2');
INSERT INTO `hc_region` VALUES ('441283', '441200', '高要市', '2');
INSERT INTO `hc_region` VALUES ('441284', '441200', '四会市', '2');
INSERT INTO `hc_region` VALUES ('441300', '440000', '惠州市', '1');
INSERT INTO `hc_region` VALUES ('441301', '441300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('441302', '441300', '惠城区', '2');
INSERT INTO `hc_region` VALUES ('441303', '441300', '惠阳区', '2');
INSERT INTO `hc_region` VALUES ('441322', '441300', '博罗县', '2');
INSERT INTO `hc_region` VALUES ('441323', '441300', '惠东县', '2');
INSERT INTO `hc_region` VALUES ('441324', '441300', '龙门县', '2');
INSERT INTO `hc_region` VALUES ('441400', '440000', '梅州市', '1');
INSERT INTO `hc_region` VALUES ('441401', '441400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('441402', '441400', '梅江区', '2');
INSERT INTO `hc_region` VALUES ('441403', '441400', '梅县区', '2');
INSERT INTO `hc_region` VALUES ('441422', '441400', '大埔县', '2');
INSERT INTO `hc_region` VALUES ('441423', '441400', '丰顺县', '2');
INSERT INTO `hc_region` VALUES ('441424', '441400', '五华县', '2');
INSERT INTO `hc_region` VALUES ('441426', '441400', '平远县', '2');
INSERT INTO `hc_region` VALUES ('441427', '441400', '蕉岭县', '2');
INSERT INTO `hc_region` VALUES ('441481', '441400', '兴宁市', '2');
INSERT INTO `hc_region` VALUES ('441500', '440000', '汕尾市', '1');
INSERT INTO `hc_region` VALUES ('441501', '441500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('441502', '441500', '城区', '2');
INSERT INTO `hc_region` VALUES ('441521', '441500', '海丰县', '2');
INSERT INTO `hc_region` VALUES ('441523', '441500', '陆河县', '2');
INSERT INTO `hc_region` VALUES ('441581', '441500', '陆丰市', '2');
INSERT INTO `hc_region` VALUES ('441600', '440000', '河源市', '1');
INSERT INTO `hc_region` VALUES ('441601', '441600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('441602', '441600', '源城区', '2');
INSERT INTO `hc_region` VALUES ('441621', '441600', '紫金县', '2');
INSERT INTO `hc_region` VALUES ('441622', '441600', '龙川县', '2');
INSERT INTO `hc_region` VALUES ('441623', '441600', '连平县', '2');
INSERT INTO `hc_region` VALUES ('441624', '441600', '和平县', '2');
INSERT INTO `hc_region` VALUES ('441625', '441600', '东源县', '2');
INSERT INTO `hc_region` VALUES ('441700', '440000', '阳江市', '1');
INSERT INTO `hc_region` VALUES ('441701', '441700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('441702', '441700', '江城区', '2');
INSERT INTO `hc_region` VALUES ('441721', '441700', '阳西县', '2');
INSERT INTO `hc_region` VALUES ('441723', '441700', '阳东县', '2');
INSERT INTO `hc_region` VALUES ('441781', '441700', '阳春市', '2');
INSERT INTO `hc_region` VALUES ('441800', '440000', '清远市', '1');
INSERT INTO `hc_region` VALUES ('441801', '441800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('441802', '441800', '清城区', '2');
INSERT INTO `hc_region` VALUES ('441803', '441800', '清新区', '2');
INSERT INTO `hc_region` VALUES ('441821', '441800', '佛冈县', '2');
INSERT INTO `hc_region` VALUES ('441823', '441800', '阳山县', '2');
INSERT INTO `hc_region` VALUES ('441825', '441800', '连山壮族瑶族自治县', '2');
INSERT INTO `hc_region` VALUES ('441826', '441800', '连南瑶族自治县', '2');
INSERT INTO `hc_region` VALUES ('441881', '441800', '英德市', '2');
INSERT INTO `hc_region` VALUES ('441882', '441800', '连州市', '2');
INSERT INTO `hc_region` VALUES ('441900', '440000', '东莞市', '1');
INSERT INTO `hc_region` VALUES ('442000', '440000', '中山市', '1');
INSERT INTO `hc_region` VALUES ('445100', '440000', '潮州市', '1');
INSERT INTO `hc_region` VALUES ('445101', '445100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('445102', '445100', '湘桥区', '2');
INSERT INTO `hc_region` VALUES ('445103', '445100', '潮安区', '2');
INSERT INTO `hc_region` VALUES ('445122', '445100', '饶平县', '2');
INSERT INTO `hc_region` VALUES ('445200', '440000', '揭阳市', '1');
INSERT INTO `hc_region` VALUES ('445201', '445200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('445202', '445200', '榕城区', '2');
INSERT INTO `hc_region` VALUES ('445203', '445200', '揭东区', '2');
INSERT INTO `hc_region` VALUES ('445222', '445200', '揭西县', '2');
INSERT INTO `hc_region` VALUES ('445224', '445200', '惠来县', '2');
INSERT INTO `hc_region` VALUES ('445281', '445200', '普宁市', '2');
INSERT INTO `hc_region` VALUES ('445300', '440000', '云浮市', '1');
INSERT INTO `hc_region` VALUES ('445301', '445300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('445302', '445300', '云城区', '2');
INSERT INTO `hc_region` VALUES ('445303', '445300', '云安区', '2');
INSERT INTO `hc_region` VALUES ('445321', '445300', '新兴县', '2');
INSERT INTO `hc_region` VALUES ('445322', '445300', '郁南县', '2');
INSERT INTO `hc_region` VALUES ('445381', '445300', '罗定市', '2');
INSERT INTO `hc_region` VALUES ('450000', '0', '广西壮族自治区', '0');
INSERT INTO `hc_region` VALUES ('450100', '450000', '南宁市', '1');
INSERT INTO `hc_region` VALUES ('450101', '450100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('450102', '450100', '兴宁区', '2');
INSERT INTO `hc_region` VALUES ('450103', '450100', '青秀区', '2');
INSERT INTO `hc_region` VALUES ('450105', '450100', '江南区', '2');
INSERT INTO `hc_region` VALUES ('450107', '450100', '西乡塘区', '2');
INSERT INTO `hc_region` VALUES ('450108', '450100', '良庆区', '2');
INSERT INTO `hc_region` VALUES ('450109', '450100', '邕宁区', '2');
INSERT INTO `hc_region` VALUES ('450122', '450100', '武鸣县', '2');
INSERT INTO `hc_region` VALUES ('450123', '450100', '隆安县', '2');
INSERT INTO `hc_region` VALUES ('450124', '450100', '马山县', '2');
INSERT INTO `hc_region` VALUES ('450125', '450100', '上林县', '2');
INSERT INTO `hc_region` VALUES ('450126', '450100', '宾阳县', '2');
INSERT INTO `hc_region` VALUES ('450127', '450100', '横县', '2');
INSERT INTO `hc_region` VALUES ('450200', '450000', '柳州市', '1');
INSERT INTO `hc_region` VALUES ('450201', '450200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('450202', '450200', '城中区', '2');
INSERT INTO `hc_region` VALUES ('450203', '450200', '鱼峰区', '2');
INSERT INTO `hc_region` VALUES ('450204', '450200', '柳南区', '2');
INSERT INTO `hc_region` VALUES ('450205', '450200', '柳北区', '2');
INSERT INTO `hc_region` VALUES ('450221', '450200', '柳江县', '2');
INSERT INTO `hc_region` VALUES ('450222', '450200', '柳城县', '2');
INSERT INTO `hc_region` VALUES ('450223', '450200', '鹿寨县', '2');
INSERT INTO `hc_region` VALUES ('450224', '450200', '融安县', '2');
INSERT INTO `hc_region` VALUES ('450225', '450200', '融水苗族自治县', '2');
INSERT INTO `hc_region` VALUES ('450226', '450200', '三江侗族自治县', '2');
INSERT INTO `hc_region` VALUES ('450300', '450000', '桂林市', '1');
INSERT INTO `hc_region` VALUES ('450301', '450300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('450302', '450300', '秀峰区', '2');
INSERT INTO `hc_region` VALUES ('450303', '450300', '叠彩区', '2');
INSERT INTO `hc_region` VALUES ('450304', '450300', '象山区', '2');
INSERT INTO `hc_region` VALUES ('450305', '450300', '七星区', '2');
INSERT INTO `hc_region` VALUES ('450311', '450300', '雁山区', '2');
INSERT INTO `hc_region` VALUES ('450312', '450300', '临桂区', '2');
INSERT INTO `hc_region` VALUES ('450321', '450300', '阳朔县', '2');
INSERT INTO `hc_region` VALUES ('450323', '450300', '灵川县', '2');
INSERT INTO `hc_region` VALUES ('450324', '450300', '全州县', '2');
INSERT INTO `hc_region` VALUES ('450325', '450300', '兴安县', '2');
INSERT INTO `hc_region` VALUES ('450326', '450300', '永福县', '2');
INSERT INTO `hc_region` VALUES ('450327', '450300', '灌阳县', '2');
INSERT INTO `hc_region` VALUES ('450328', '450300', '龙胜各族自治县', '2');
INSERT INTO `hc_region` VALUES ('450329', '450300', '资源县', '2');
INSERT INTO `hc_region` VALUES ('450330', '450300', '平乐县', '2');
INSERT INTO `hc_region` VALUES ('450331', '450300', '荔浦县', '2');
INSERT INTO `hc_region` VALUES ('450332', '450300', '恭城瑶族自治县', '2');
INSERT INTO `hc_region` VALUES ('450400', '450000', '梧州市', '1');
INSERT INTO `hc_region` VALUES ('450401', '450400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('450403', '450400', '万秀区', '2');
INSERT INTO `hc_region` VALUES ('450405', '450400', '长洲区', '2');
INSERT INTO `hc_region` VALUES ('450406', '450400', '龙圩区', '2');
INSERT INTO `hc_region` VALUES ('450421', '450400', '苍梧县', '2');
INSERT INTO `hc_region` VALUES ('450422', '450400', '藤县', '2');
INSERT INTO `hc_region` VALUES ('450423', '450400', '蒙山县', '2');
INSERT INTO `hc_region` VALUES ('450481', '450400', '岑溪市', '2');
INSERT INTO `hc_region` VALUES ('450500', '450000', '北海市', '1');
INSERT INTO `hc_region` VALUES ('450501', '450500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('450502', '450500', '海城区', '2');
INSERT INTO `hc_region` VALUES ('450503', '450500', '银海区', '2');
INSERT INTO `hc_region` VALUES ('450512', '450500', '铁山港区', '2');
INSERT INTO `hc_region` VALUES ('450521', '450500', '合浦县', '2');
INSERT INTO `hc_region` VALUES ('450600', '450000', '防城港市', '1');
INSERT INTO `hc_region` VALUES ('450601', '450600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('450602', '450600', '港口区', '2');
INSERT INTO `hc_region` VALUES ('450603', '450600', '防城区', '2');
INSERT INTO `hc_region` VALUES ('450621', '450600', '上思县', '2');
INSERT INTO `hc_region` VALUES ('450681', '450600', '东兴市', '2');
INSERT INTO `hc_region` VALUES ('450700', '450000', '钦州市', '1');
INSERT INTO `hc_region` VALUES ('450701', '450700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('450702', '450700', '钦南区', '2');
INSERT INTO `hc_region` VALUES ('450703', '450700', '钦北区', '2');
INSERT INTO `hc_region` VALUES ('450721', '450700', '灵山县', '2');
INSERT INTO `hc_region` VALUES ('450722', '450700', '浦北县', '2');
INSERT INTO `hc_region` VALUES ('450800', '450000', '贵港市', '1');
INSERT INTO `hc_region` VALUES ('450801', '450800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('450802', '450800', '港北区', '2');
INSERT INTO `hc_region` VALUES ('450803', '450800', '港南区', '2');
INSERT INTO `hc_region` VALUES ('450804', '450800', '覃塘区', '2');
INSERT INTO `hc_region` VALUES ('450821', '450800', '平南县', '2');
INSERT INTO `hc_region` VALUES ('450881', '450800', '桂平市', '2');
INSERT INTO `hc_region` VALUES ('450900', '450000', '玉林市', '1');
INSERT INTO `hc_region` VALUES ('450901', '450900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('450902', '450900', '玉州区', '2');
INSERT INTO `hc_region` VALUES ('450903', '450900', '福绵区', '2');
INSERT INTO `hc_region` VALUES ('450921', '450900', '容县', '2');
INSERT INTO `hc_region` VALUES ('450922', '450900', '陆川县', '2');
INSERT INTO `hc_region` VALUES ('450923', '450900', '博白县', '2');
INSERT INTO `hc_region` VALUES ('450924', '450900', '兴业县', '2');
INSERT INTO `hc_region` VALUES ('450981', '450900', '北流市', '2');
INSERT INTO `hc_region` VALUES ('451000', '450000', '百色市', '1');
INSERT INTO `hc_region` VALUES ('451001', '451000', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('451002', '451000', '右江区', '2');
INSERT INTO `hc_region` VALUES ('451021', '451000', '田阳县', '2');
INSERT INTO `hc_region` VALUES ('451022', '451000', '田东县', '2');
INSERT INTO `hc_region` VALUES ('451023', '451000', '平果县', '2');
INSERT INTO `hc_region` VALUES ('451024', '451000', '德保县', '2');
INSERT INTO `hc_region` VALUES ('451025', '451000', '靖西县', '2');
INSERT INTO `hc_region` VALUES ('451026', '451000', '那坡县', '2');
INSERT INTO `hc_region` VALUES ('451027', '451000', '凌云县', '2');
INSERT INTO `hc_region` VALUES ('451028', '451000', '乐业县', '2');
INSERT INTO `hc_region` VALUES ('451029', '451000', '田林县', '2');
INSERT INTO `hc_region` VALUES ('451030', '451000', '西林县', '2');
INSERT INTO `hc_region` VALUES ('451031', '451000', '隆林各族自治县', '2');
INSERT INTO `hc_region` VALUES ('451100', '450000', '贺州市', '1');
INSERT INTO `hc_region` VALUES ('451101', '451100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('451102', '451100', '八步区', '2');
INSERT INTO `hc_region` VALUES ('451121', '451100', '昭平县', '2');
INSERT INTO `hc_region` VALUES ('451122', '451100', '钟山县', '2');
INSERT INTO `hc_region` VALUES ('451123', '451100', '富川瑶族自治县', '2');
INSERT INTO `hc_region` VALUES ('451200', '450000', '河池市', '1');
INSERT INTO `hc_region` VALUES ('451201', '451200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('451202', '451200', '金城江区', '2');
INSERT INTO `hc_region` VALUES ('451221', '451200', '南丹县', '2');
INSERT INTO `hc_region` VALUES ('451222', '451200', '天峨县', '2');
INSERT INTO `hc_region` VALUES ('451223', '451200', '凤山县', '2');
INSERT INTO `hc_region` VALUES ('451224', '451200', '东兰县', '2');
INSERT INTO `hc_region` VALUES ('451225', '451200', '罗城仫佬族自治县', '2');
INSERT INTO `hc_region` VALUES ('451226', '451200', '环江毛南族自治县', '2');
INSERT INTO `hc_region` VALUES ('451227', '451200', '巴马瑶族自治县', '2');
INSERT INTO `hc_region` VALUES ('451228', '451200', '都安瑶族自治县', '2');
INSERT INTO `hc_region` VALUES ('451229', '451200', '大化瑶族自治县', '2');
INSERT INTO `hc_region` VALUES ('451281', '451200', '宜州市', '2');
INSERT INTO `hc_region` VALUES ('451300', '450000', '来宾市', '1');
INSERT INTO `hc_region` VALUES ('451301', '451300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('451302', '451300', '兴宾区', '2');
INSERT INTO `hc_region` VALUES ('451321', '451300', '忻城县', '2');
INSERT INTO `hc_region` VALUES ('451322', '451300', '象州县', '2');
INSERT INTO `hc_region` VALUES ('451323', '451300', '武宣县', '2');
INSERT INTO `hc_region` VALUES ('451324', '451300', '金秀瑶族自治县', '2');
INSERT INTO `hc_region` VALUES ('451381', '451300', '合山市', '2');
INSERT INTO `hc_region` VALUES ('451400', '450000', '崇左市', '1');
INSERT INTO `hc_region` VALUES ('451401', '451400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('451402', '451400', '江州区', '2');
INSERT INTO `hc_region` VALUES ('451421', '451400', '扶绥县', '2');
INSERT INTO `hc_region` VALUES ('451422', '451400', '宁明县', '2');
INSERT INTO `hc_region` VALUES ('451423', '451400', '龙州县', '2');
INSERT INTO `hc_region` VALUES ('451424', '451400', '大新县', '2');
INSERT INTO `hc_region` VALUES ('451425', '451400', '天等县', '2');
INSERT INTO `hc_region` VALUES ('451481', '451400', '凭祥市', '2');
INSERT INTO `hc_region` VALUES ('460000', '0', '海南省', '0');
INSERT INTO `hc_region` VALUES ('460100', '460000', '海口市', '1');
INSERT INTO `hc_region` VALUES ('460101', '460100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('460105', '460100', '秀英区', '2');
INSERT INTO `hc_region` VALUES ('460106', '460100', '龙华区', '2');
INSERT INTO `hc_region` VALUES ('460107', '460100', '琼山区', '2');
INSERT INTO `hc_region` VALUES ('460108', '460100', '美兰区', '2');
INSERT INTO `hc_region` VALUES ('460200', '460000', '三亚市', '1');
INSERT INTO `hc_region` VALUES ('460201', '460200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('460202', '460200', '海棠区', '2');
INSERT INTO `hc_region` VALUES ('460203', '460200', '吉阳区', '2');
INSERT INTO `hc_region` VALUES ('460204', '460200', '天涯区', '2');
INSERT INTO `hc_region` VALUES ('460205', '460200', '崖州区', '2');
INSERT INTO `hc_region` VALUES ('460300', '460000', '三沙市', '1');
INSERT INTO `hc_region` VALUES ('469000', '460000', '省直辖县级行政区划', '1');
INSERT INTO `hc_region` VALUES ('469001', '469000', '五指山市', '2');
INSERT INTO `hc_region` VALUES ('469002', '469000', '琼海市', '2');
INSERT INTO `hc_region` VALUES ('469003', '469000', '儋州市', '2');
INSERT INTO `hc_region` VALUES ('469005', '469000', '文昌市', '2');
INSERT INTO `hc_region` VALUES ('469006', '469000', '万宁市', '2');
INSERT INTO `hc_region` VALUES ('469007', '469000', '东方市', '2');
INSERT INTO `hc_region` VALUES ('469021', '469000', '定安县', '2');
INSERT INTO `hc_region` VALUES ('469022', '469000', '屯昌县', '2');
INSERT INTO `hc_region` VALUES ('469023', '469000', '澄迈县', '2');
INSERT INTO `hc_region` VALUES ('469024', '469000', '临高县', '2');
INSERT INTO `hc_region` VALUES ('469025', '469000', '白沙黎族自治县', '2');
INSERT INTO `hc_region` VALUES ('469026', '469000', '昌江黎族自治县', '2');
INSERT INTO `hc_region` VALUES ('469027', '469000', '乐东黎族自治县', '2');
INSERT INTO `hc_region` VALUES ('469028', '469000', '陵水黎族自治县', '2');
INSERT INTO `hc_region` VALUES ('469029', '469000', '保亭黎族苗族自治县', '2');
INSERT INTO `hc_region` VALUES ('469030', '469000', '琼中黎族苗族自治县', '2');
INSERT INTO `hc_region` VALUES ('500000', '0', '重庆市', '0');
INSERT INTO `hc_region` VALUES ('500100', '500000', '市辖区', '1');
INSERT INTO `hc_region` VALUES ('500101', '500100', '万州区', '2');
INSERT INTO `hc_region` VALUES ('500102', '500100', '涪陵区', '2');
INSERT INTO `hc_region` VALUES ('500103', '500100', '渝中区', '2');
INSERT INTO `hc_region` VALUES ('500104', '500100', '大渡口区', '2');
INSERT INTO `hc_region` VALUES ('500105', '500100', '江北区', '2');
INSERT INTO `hc_region` VALUES ('500106', '500100', '沙坪坝区', '2');
INSERT INTO `hc_region` VALUES ('500107', '500100', '九龙坡区', '2');
INSERT INTO `hc_region` VALUES ('500108', '500100', '南岸区', '2');
INSERT INTO `hc_region` VALUES ('500109', '500100', '北碚区', '2');
INSERT INTO `hc_region` VALUES ('500110', '500100', '綦江区', '2');
INSERT INTO `hc_region` VALUES ('500111', '500100', '大足区', '2');
INSERT INTO `hc_region` VALUES ('500112', '500100', '渝北区', '2');
INSERT INTO `hc_region` VALUES ('500113', '500100', '巴南区', '2');
INSERT INTO `hc_region` VALUES ('500114', '500100', '黔江区', '2');
INSERT INTO `hc_region` VALUES ('500115', '500100', '长寿区', '2');
INSERT INTO `hc_region` VALUES ('500116', '500100', '江津区', '2');
INSERT INTO `hc_region` VALUES ('500117', '500100', '合川区', '2');
INSERT INTO `hc_region` VALUES ('500118', '500100', '永川区', '2');
INSERT INTO `hc_region` VALUES ('500119', '500100', '南川区', '2');
INSERT INTO `hc_region` VALUES ('500120', '500100', '璧山区', '2');
INSERT INTO `hc_region` VALUES ('500151', '500100', '铜梁区', '2');
INSERT INTO `hc_region` VALUES ('500200', '500000', '县', '1');
INSERT INTO `hc_region` VALUES ('500223', '500200', '潼南县', '2');
INSERT INTO `hc_region` VALUES ('500226', '500200', '荣昌县', '2');
INSERT INTO `hc_region` VALUES ('500228', '500200', '梁平县', '2');
INSERT INTO `hc_region` VALUES ('500229', '500200', '城口县', '2');
INSERT INTO `hc_region` VALUES ('500230', '500200', '丰都县', '2');
INSERT INTO `hc_region` VALUES ('500231', '500200', '垫江县', '2');
INSERT INTO `hc_region` VALUES ('500232', '500200', '武隆县', '2');
INSERT INTO `hc_region` VALUES ('500233', '500200', '忠县', '2');
INSERT INTO `hc_region` VALUES ('500234', '500200', '开县', '2');
INSERT INTO `hc_region` VALUES ('500235', '500200', '云阳县', '2');
INSERT INTO `hc_region` VALUES ('500236', '500200', '奉节县', '2');
INSERT INTO `hc_region` VALUES ('500237', '500200', '巫山县', '2');
INSERT INTO `hc_region` VALUES ('500238', '500200', '巫溪县', '2');
INSERT INTO `hc_region` VALUES ('500240', '500200', '石柱土家族自治县', '2');
INSERT INTO `hc_region` VALUES ('500241', '500200', '秀山土家族苗族自治县', '2');
INSERT INTO `hc_region` VALUES ('500242', '500200', '酉阳土家族苗族自治县', '2');
INSERT INTO `hc_region` VALUES ('500243', '500200', '彭水苗族土家族自治县', '2');
INSERT INTO `hc_region` VALUES ('510000', '0', '四川省', '0');
INSERT INTO `hc_region` VALUES ('510100', '510000', '成都市', '1');
INSERT INTO `hc_region` VALUES ('510101', '510100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('510104', '510100', '锦江区', '2');
INSERT INTO `hc_region` VALUES ('510105', '510100', '青羊区', '2');
INSERT INTO `hc_region` VALUES ('510106', '510100', '金牛区', '2');
INSERT INTO `hc_region` VALUES ('510107', '510100', '武侯区', '2');
INSERT INTO `hc_region` VALUES ('510108', '510100', '成华区', '2');
INSERT INTO `hc_region` VALUES ('510112', '510100', '龙泉驿区', '2');
INSERT INTO `hc_region` VALUES ('510113', '510100', '青白江区', '2');
INSERT INTO `hc_region` VALUES ('510114', '510100', '新都区', '2');
INSERT INTO `hc_region` VALUES ('510115', '510100', '温江区', '2');
INSERT INTO `hc_region` VALUES ('510121', '510100', '金堂县', '2');
INSERT INTO `hc_region` VALUES ('510122', '510100', '双流县', '2');
INSERT INTO `hc_region` VALUES ('510124', '510100', '郫县', '2');
INSERT INTO `hc_region` VALUES ('510129', '510100', '大邑县', '2');
INSERT INTO `hc_region` VALUES ('510131', '510100', '蒲江县', '2');
INSERT INTO `hc_region` VALUES ('510132', '510100', '新津县', '2');
INSERT INTO `hc_region` VALUES ('510181', '510100', '都江堰市', '2');
INSERT INTO `hc_region` VALUES ('510182', '510100', '彭州市', '2');
INSERT INTO `hc_region` VALUES ('510183', '510100', '邛崃市', '2');
INSERT INTO `hc_region` VALUES ('510184', '510100', '崇州市', '2');
INSERT INTO `hc_region` VALUES ('510300', '510000', '自贡市', '1');
INSERT INTO `hc_region` VALUES ('510301', '510300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('510302', '510300', '自流井区', '2');
INSERT INTO `hc_region` VALUES ('510303', '510300', '贡井区', '2');
INSERT INTO `hc_region` VALUES ('510304', '510300', '大安区', '2');
INSERT INTO `hc_region` VALUES ('510311', '510300', '沿滩区', '2');
INSERT INTO `hc_region` VALUES ('510321', '510300', '荣县', '2');
INSERT INTO `hc_region` VALUES ('510322', '510300', '富顺县', '2');
INSERT INTO `hc_region` VALUES ('510400', '510000', '攀枝花市', '1');
INSERT INTO `hc_region` VALUES ('510401', '510400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('510402', '510400', '东区', '2');
INSERT INTO `hc_region` VALUES ('510403', '510400', '西区', '2');
INSERT INTO `hc_region` VALUES ('510411', '510400', '仁和区', '2');
INSERT INTO `hc_region` VALUES ('510421', '510400', '米易县', '2');
INSERT INTO `hc_region` VALUES ('510422', '510400', '盐边县', '2');
INSERT INTO `hc_region` VALUES ('510500', '510000', '泸州市', '1');
INSERT INTO `hc_region` VALUES ('510501', '510500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('510502', '510500', '江阳区', '2');
INSERT INTO `hc_region` VALUES ('510503', '510500', '纳溪区', '2');
INSERT INTO `hc_region` VALUES ('510504', '510500', '龙马潭区', '2');
INSERT INTO `hc_region` VALUES ('510521', '510500', '泸县', '2');
INSERT INTO `hc_region` VALUES ('510522', '510500', '合江县', '2');
INSERT INTO `hc_region` VALUES ('510524', '510500', '叙永县', '2');
INSERT INTO `hc_region` VALUES ('510525', '510500', '古蔺县', '2');
INSERT INTO `hc_region` VALUES ('510600', '510000', '德阳市', '1');
INSERT INTO `hc_region` VALUES ('510601', '510600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('510603', '510600', '旌阳区', '2');
INSERT INTO `hc_region` VALUES ('510623', '510600', '中江县', '2');
INSERT INTO `hc_region` VALUES ('510626', '510600', '罗江县', '2');
INSERT INTO `hc_region` VALUES ('510681', '510600', '广汉市', '2');
INSERT INTO `hc_region` VALUES ('510682', '510600', '什邡市', '2');
INSERT INTO `hc_region` VALUES ('510683', '510600', '绵竹市', '2');
INSERT INTO `hc_region` VALUES ('510700', '510000', '绵阳市', '1');
INSERT INTO `hc_region` VALUES ('510701', '510700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('510703', '510700', '涪城区', '2');
INSERT INTO `hc_region` VALUES ('510704', '510700', '游仙区', '2');
INSERT INTO `hc_region` VALUES ('510722', '510700', '三台县', '2');
INSERT INTO `hc_region` VALUES ('510723', '510700', '盐亭县', '2');
INSERT INTO `hc_region` VALUES ('510724', '510700', '安县', '2');
INSERT INTO `hc_region` VALUES ('510725', '510700', '梓潼县', '2');
INSERT INTO `hc_region` VALUES ('510726', '510700', '北川羌族自治县', '2');
INSERT INTO `hc_region` VALUES ('510727', '510700', '平武县', '2');
INSERT INTO `hc_region` VALUES ('510781', '510700', '江油市', '2');
INSERT INTO `hc_region` VALUES ('510800', '510000', '广元市', '1');
INSERT INTO `hc_region` VALUES ('510801', '510800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('510802', '510800', '利州区', '2');
INSERT INTO `hc_region` VALUES ('510811', '510800', '昭化区', '2');
INSERT INTO `hc_region` VALUES ('510812', '510800', '朝天区', '2');
INSERT INTO `hc_region` VALUES ('510821', '510800', '旺苍县', '2');
INSERT INTO `hc_region` VALUES ('510822', '510800', '青川县', '2');
INSERT INTO `hc_region` VALUES ('510823', '510800', '剑阁县', '2');
INSERT INTO `hc_region` VALUES ('510824', '510800', '苍溪县', '2');
INSERT INTO `hc_region` VALUES ('510900', '510000', '遂宁市', '1');
INSERT INTO `hc_region` VALUES ('510901', '510900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('510903', '510900', '船山区', '2');
INSERT INTO `hc_region` VALUES ('510904', '510900', '安居区', '2');
INSERT INTO `hc_region` VALUES ('510921', '510900', '蓬溪县', '2');
INSERT INTO `hc_region` VALUES ('510922', '510900', '射洪县', '2');
INSERT INTO `hc_region` VALUES ('510923', '510900', '大英县', '2');
INSERT INTO `hc_region` VALUES ('511000', '510000', '内江市', '1');
INSERT INTO `hc_region` VALUES ('511001', '511000', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('511002', '511000', '市中区', '2');
INSERT INTO `hc_region` VALUES ('511011', '511000', '东兴区', '2');
INSERT INTO `hc_region` VALUES ('511024', '511000', '威远县', '2');
INSERT INTO `hc_region` VALUES ('511025', '511000', '资中县', '2');
INSERT INTO `hc_region` VALUES ('511028', '511000', '隆昌县', '2');
INSERT INTO `hc_region` VALUES ('511100', '510000', '乐山市', '1');
INSERT INTO `hc_region` VALUES ('511101', '511100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('511102', '511100', '市中区', '2');
INSERT INTO `hc_region` VALUES ('511111', '511100', '沙湾区', '2');
INSERT INTO `hc_region` VALUES ('511112', '511100', '五通桥区', '2');
INSERT INTO `hc_region` VALUES ('511113', '511100', '金口河区', '2');
INSERT INTO `hc_region` VALUES ('511123', '511100', '犍为县', '2');
INSERT INTO `hc_region` VALUES ('511124', '511100', '井研县', '2');
INSERT INTO `hc_region` VALUES ('511126', '511100', '夹江县', '2');
INSERT INTO `hc_region` VALUES ('511129', '511100', '沐川县', '2');
INSERT INTO `hc_region` VALUES ('511132', '511100', '峨边彝族自治县', '2');
INSERT INTO `hc_region` VALUES ('511133', '511100', '马边彝族自治县', '2');
INSERT INTO `hc_region` VALUES ('511181', '511100', '峨眉山市', '2');
INSERT INTO `hc_region` VALUES ('511300', '510000', '南充市', '1');
INSERT INTO `hc_region` VALUES ('511301', '511300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('511302', '511300', '顺庆区', '2');
INSERT INTO `hc_region` VALUES ('511303', '511300', '高坪区', '2');
INSERT INTO `hc_region` VALUES ('511304', '511300', '嘉陵区', '2');
INSERT INTO `hc_region` VALUES ('511321', '511300', '南部县', '2');
INSERT INTO `hc_region` VALUES ('511322', '511300', '营山县', '2');
INSERT INTO `hc_region` VALUES ('511323', '511300', '蓬安县', '2');
INSERT INTO `hc_region` VALUES ('511324', '511300', '仪陇县', '2');
INSERT INTO `hc_region` VALUES ('511325', '511300', '西充县', '2');
INSERT INTO `hc_region` VALUES ('511381', '511300', '阆中市', '2');
INSERT INTO `hc_region` VALUES ('511400', '510000', '眉山市', '1');
INSERT INTO `hc_region` VALUES ('511401', '511400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('511402', '511400', '东坡区', '2');
INSERT INTO `hc_region` VALUES ('511421', '511400', '仁寿县', '2');
INSERT INTO `hc_region` VALUES ('511422', '511400', '彭山县', '2');
INSERT INTO `hc_region` VALUES ('511423', '511400', '洪雅县', '2');
INSERT INTO `hc_region` VALUES ('511424', '511400', '丹棱县', '2');
INSERT INTO `hc_region` VALUES ('511425', '511400', '青神县', '2');
INSERT INTO `hc_region` VALUES ('511500', '510000', '宜宾市', '1');
INSERT INTO `hc_region` VALUES ('511501', '511500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('511502', '511500', '翠屏区', '2');
INSERT INTO `hc_region` VALUES ('511503', '511500', '南溪区', '2');
INSERT INTO `hc_region` VALUES ('511521', '511500', '宜宾县', '2');
INSERT INTO `hc_region` VALUES ('511523', '511500', '江安县', '2');
INSERT INTO `hc_region` VALUES ('511524', '511500', '长宁县', '2');
INSERT INTO `hc_region` VALUES ('511525', '511500', '高县', '2');
INSERT INTO `hc_region` VALUES ('511526', '511500', '珙县', '2');
INSERT INTO `hc_region` VALUES ('511527', '511500', '筠连县', '2');
INSERT INTO `hc_region` VALUES ('511528', '511500', '兴文县', '2');
INSERT INTO `hc_region` VALUES ('511529', '511500', '屏山县', '2');
INSERT INTO `hc_region` VALUES ('511600', '510000', '广安市', '1');
INSERT INTO `hc_region` VALUES ('511601', '511600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('511602', '511600', '广安区', '2');
INSERT INTO `hc_region` VALUES ('511603', '511600', '前锋区', '2');
INSERT INTO `hc_region` VALUES ('511621', '511600', '岳池县', '2');
INSERT INTO `hc_region` VALUES ('511622', '511600', '武胜县', '2');
INSERT INTO `hc_region` VALUES ('511623', '511600', '邻水县', '2');
INSERT INTO `hc_region` VALUES ('511681', '511600', '华蓥市', '2');
INSERT INTO `hc_region` VALUES ('511700', '510000', '达州市', '1');
INSERT INTO `hc_region` VALUES ('511701', '511700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('511702', '511700', '通川区', '2');
INSERT INTO `hc_region` VALUES ('511703', '511700', '达川区', '2');
INSERT INTO `hc_region` VALUES ('511722', '511700', '宣汉县', '2');
INSERT INTO `hc_region` VALUES ('511723', '511700', '开江县', '2');
INSERT INTO `hc_region` VALUES ('511724', '511700', '大竹县', '2');
INSERT INTO `hc_region` VALUES ('511725', '511700', '渠县', '2');
INSERT INTO `hc_region` VALUES ('511781', '511700', '万源市', '2');
INSERT INTO `hc_region` VALUES ('511800', '510000', '雅安市', '1');
INSERT INTO `hc_region` VALUES ('511801', '511800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('511802', '511800', '雨城区', '2');
INSERT INTO `hc_region` VALUES ('511803', '511800', '名山区', '2');
INSERT INTO `hc_region` VALUES ('511822', '511800', '荥经县', '2');
INSERT INTO `hc_region` VALUES ('511823', '511800', '汉源县', '2');
INSERT INTO `hc_region` VALUES ('511824', '511800', '石棉县', '2');
INSERT INTO `hc_region` VALUES ('511825', '511800', '天全县', '2');
INSERT INTO `hc_region` VALUES ('511826', '511800', '芦山县', '2');
INSERT INTO `hc_region` VALUES ('511827', '511800', '宝兴县', '2');
INSERT INTO `hc_region` VALUES ('511900', '510000', '巴中市', '1');
INSERT INTO `hc_region` VALUES ('511901', '511900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('511902', '511900', '巴州区', '2');
INSERT INTO `hc_region` VALUES ('511903', '511900', '恩阳区', '2');
INSERT INTO `hc_region` VALUES ('511921', '511900', '通江县', '2');
INSERT INTO `hc_region` VALUES ('511922', '511900', '南江县', '2');
INSERT INTO `hc_region` VALUES ('511923', '511900', '平昌县', '2');
INSERT INTO `hc_region` VALUES ('512000', '510000', '资阳市', '1');
INSERT INTO `hc_region` VALUES ('512001', '512000', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('512002', '512000', '雁江区', '2');
INSERT INTO `hc_region` VALUES ('512021', '512000', '安岳县', '2');
INSERT INTO `hc_region` VALUES ('512022', '512000', '乐至县', '2');
INSERT INTO `hc_region` VALUES ('512081', '512000', '简阳市', '2');
INSERT INTO `hc_region` VALUES ('513200', '510000', '阿坝藏族羌族自治州', '1');
INSERT INTO `hc_region` VALUES ('513221', '513200', '汶川县', '2');
INSERT INTO `hc_region` VALUES ('513222', '513200', '理县', '2');
INSERT INTO `hc_region` VALUES ('513223', '513200', '茂县', '2');
INSERT INTO `hc_region` VALUES ('513224', '513200', '松潘县', '2');
INSERT INTO `hc_region` VALUES ('513225', '513200', '九寨沟县', '2');
INSERT INTO `hc_region` VALUES ('513226', '513200', '金川县', '2');
INSERT INTO `hc_region` VALUES ('513227', '513200', '小金县', '2');
INSERT INTO `hc_region` VALUES ('513228', '513200', '黑水县', '2');
INSERT INTO `hc_region` VALUES ('513229', '513200', '马尔康县', '2');
INSERT INTO `hc_region` VALUES ('513230', '513200', '壤塘县', '2');
INSERT INTO `hc_region` VALUES ('513231', '513200', '阿坝县', '2');
INSERT INTO `hc_region` VALUES ('513232', '513200', '若尔盖县', '2');
INSERT INTO `hc_region` VALUES ('513233', '513200', '红原县', '2');
INSERT INTO `hc_region` VALUES ('513300', '510000', '甘孜藏族自治州', '1');
INSERT INTO `hc_region` VALUES ('513321', '513300', '康定县', '2');
INSERT INTO `hc_region` VALUES ('513322', '513300', '泸定县', '2');
INSERT INTO `hc_region` VALUES ('513323', '513300', '丹巴县', '2');
INSERT INTO `hc_region` VALUES ('513324', '513300', '九龙县', '2');
INSERT INTO `hc_region` VALUES ('513325', '513300', '雅江县', '2');
INSERT INTO `hc_region` VALUES ('513326', '513300', '道孚县', '2');
INSERT INTO `hc_region` VALUES ('513327', '513300', '炉霍县', '2');
INSERT INTO `hc_region` VALUES ('513328', '513300', '甘孜县', '2');
INSERT INTO `hc_region` VALUES ('513329', '513300', '新龙县', '2');
INSERT INTO `hc_region` VALUES ('513330', '513300', '德格县', '2');
INSERT INTO `hc_region` VALUES ('513331', '513300', '白玉县', '2');
INSERT INTO `hc_region` VALUES ('513332', '513300', '石渠县', '2');
INSERT INTO `hc_region` VALUES ('513333', '513300', '色达县', '2');
INSERT INTO `hc_region` VALUES ('513334', '513300', '理塘县', '2');
INSERT INTO `hc_region` VALUES ('513335', '513300', '巴塘县', '2');
INSERT INTO `hc_region` VALUES ('513336', '513300', '乡城县', '2');
INSERT INTO `hc_region` VALUES ('513337', '513300', '稻城县', '2');
INSERT INTO `hc_region` VALUES ('513338', '513300', '得荣县', '2');
INSERT INTO `hc_region` VALUES ('513400', '510000', '凉山彝族自治州', '1');
INSERT INTO `hc_region` VALUES ('513401', '513400', '西昌市', '2');
INSERT INTO `hc_region` VALUES ('513422', '513400', '木里藏族自治县', '2');
INSERT INTO `hc_region` VALUES ('513423', '513400', '盐源县', '2');
INSERT INTO `hc_region` VALUES ('513424', '513400', '德昌县', '2');
INSERT INTO `hc_region` VALUES ('513425', '513400', '会理县', '2');
INSERT INTO `hc_region` VALUES ('513426', '513400', '会东县', '2');
INSERT INTO `hc_region` VALUES ('513427', '513400', '宁南县', '2');
INSERT INTO `hc_region` VALUES ('513428', '513400', '普格县', '2');
INSERT INTO `hc_region` VALUES ('513429', '513400', '布拖县', '2');
INSERT INTO `hc_region` VALUES ('513430', '513400', '金阳县', '2');
INSERT INTO `hc_region` VALUES ('513431', '513400', '昭觉县', '2');
INSERT INTO `hc_region` VALUES ('513432', '513400', '喜德县', '2');
INSERT INTO `hc_region` VALUES ('513433', '513400', '冕宁县', '2');
INSERT INTO `hc_region` VALUES ('513434', '513400', '越西县', '2');
INSERT INTO `hc_region` VALUES ('513435', '513400', '甘洛县', '2');
INSERT INTO `hc_region` VALUES ('513436', '513400', '美姑县', '2');
INSERT INTO `hc_region` VALUES ('513437', '513400', '雷波县', '2');
INSERT INTO `hc_region` VALUES ('520000', '0', '贵州省', '0');
INSERT INTO `hc_region` VALUES ('520100', '520000', '贵阳市', '1');
INSERT INTO `hc_region` VALUES ('520101', '520100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('520102', '520100', '南明区', '2');
INSERT INTO `hc_region` VALUES ('520103', '520100', '云岩区', '2');
INSERT INTO `hc_region` VALUES ('520111', '520100', '花溪区', '2');
INSERT INTO `hc_region` VALUES ('520112', '520100', '乌当区', '2');
INSERT INTO `hc_region` VALUES ('520113', '520100', '白云区', '2');
INSERT INTO `hc_region` VALUES ('520115', '520100', '观山湖区', '2');
INSERT INTO `hc_region` VALUES ('520121', '520100', '开阳县', '2');
INSERT INTO `hc_region` VALUES ('520122', '520100', '息烽县', '2');
INSERT INTO `hc_region` VALUES ('520123', '520100', '修文县', '2');
INSERT INTO `hc_region` VALUES ('520181', '520100', '清镇市', '2');
INSERT INTO `hc_region` VALUES ('520200', '520000', '六盘水市', '1');
INSERT INTO `hc_region` VALUES ('520201', '520200', '钟山区', '2');
INSERT INTO `hc_region` VALUES ('520203', '520200', '六枝特区', '2');
INSERT INTO `hc_region` VALUES ('520221', '520200', '水城县', '2');
INSERT INTO `hc_region` VALUES ('520222', '520200', '盘县', '2');
INSERT INTO `hc_region` VALUES ('520300', '520000', '遵义市', '1');
INSERT INTO `hc_region` VALUES ('520301', '520300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('520302', '520300', '红花岗区', '2');
INSERT INTO `hc_region` VALUES ('520303', '520300', '汇川区', '2');
INSERT INTO `hc_region` VALUES ('520321', '520300', '遵义县', '2');
INSERT INTO `hc_region` VALUES ('520322', '520300', '桐梓县', '2');
INSERT INTO `hc_region` VALUES ('520323', '520300', '绥阳县', '2');
INSERT INTO `hc_region` VALUES ('520324', '520300', '正安县', '2');
INSERT INTO `hc_region` VALUES ('520325', '520300', '道真仡佬族苗族自治县', '2');
INSERT INTO `hc_region` VALUES ('520326', '520300', '务川仡佬族苗族自治县', '2');
INSERT INTO `hc_region` VALUES ('520327', '520300', '凤冈县', '2');
INSERT INTO `hc_region` VALUES ('520328', '520300', '湄潭县', '2');
INSERT INTO `hc_region` VALUES ('520329', '520300', '余庆县', '2');
INSERT INTO `hc_region` VALUES ('520330', '520300', '习水县', '2');
INSERT INTO `hc_region` VALUES ('520381', '520300', '赤水市', '2');
INSERT INTO `hc_region` VALUES ('520382', '520300', '仁怀市', '2');
INSERT INTO `hc_region` VALUES ('520400', '520000', '安顺市', '1');
INSERT INTO `hc_region` VALUES ('520401', '520400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('520402', '520400', '西秀区', '2');
INSERT INTO `hc_region` VALUES ('520421', '520400', '平坝县', '2');
INSERT INTO `hc_region` VALUES ('520422', '520400', '普定县', '2');
INSERT INTO `hc_region` VALUES ('520423', '520400', '镇宁布依族苗族自治县', '2');
INSERT INTO `hc_region` VALUES ('520424', '520400', '关岭布依族苗族自治县', '2');
INSERT INTO `hc_region` VALUES ('520425', '520400', '紫云苗族布依族自治县', '2');
INSERT INTO `hc_region` VALUES ('520500', '520000', '毕节市', '1');
INSERT INTO `hc_region` VALUES ('520501', '520500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('520502', '520500', '七星关区', '2');
INSERT INTO `hc_region` VALUES ('520521', '520500', '大方县', '2');
INSERT INTO `hc_region` VALUES ('520522', '520500', '黔西县', '2');
INSERT INTO `hc_region` VALUES ('520523', '520500', '金沙县', '2');
INSERT INTO `hc_region` VALUES ('520524', '520500', '织金县', '2');
INSERT INTO `hc_region` VALUES ('520525', '520500', '纳雍县', '2');
INSERT INTO `hc_region` VALUES ('520526', '520500', '威宁彝族回族苗族自治县', '2');
INSERT INTO `hc_region` VALUES ('520527', '520500', '赫章县', '2');
INSERT INTO `hc_region` VALUES ('520600', '520000', '铜仁市', '1');
INSERT INTO `hc_region` VALUES ('520601', '520600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('520602', '520600', '碧江区', '2');
INSERT INTO `hc_region` VALUES ('520603', '520600', '万山区', '2');
INSERT INTO `hc_region` VALUES ('520621', '520600', '江口县', '2');
INSERT INTO `hc_region` VALUES ('520622', '520600', '玉屏侗族自治县', '2');
INSERT INTO `hc_region` VALUES ('520623', '520600', '石阡县', '2');
INSERT INTO `hc_region` VALUES ('520624', '520600', '思南县', '2');
INSERT INTO `hc_region` VALUES ('520625', '520600', '印江土家族苗族自治县', '2');
INSERT INTO `hc_region` VALUES ('520626', '520600', '德江县', '2');
INSERT INTO `hc_region` VALUES ('520627', '520600', '沿河土家族自治县', '2');
INSERT INTO `hc_region` VALUES ('520628', '520600', '松桃苗族自治县', '2');
INSERT INTO `hc_region` VALUES ('522300', '520000', '黔西南布依族苗族自治州', '1');
INSERT INTO `hc_region` VALUES ('522301', '522300', '兴义市', '2');
INSERT INTO `hc_region` VALUES ('522322', '522300', '兴仁县', '2');
INSERT INTO `hc_region` VALUES ('522323', '522300', '普安县', '2');
INSERT INTO `hc_region` VALUES ('522324', '522300', '晴隆县', '2');
INSERT INTO `hc_region` VALUES ('522325', '522300', '贞丰县', '2');
INSERT INTO `hc_region` VALUES ('522326', '522300', '望谟县', '2');
INSERT INTO `hc_region` VALUES ('522327', '522300', '册亨县', '2');
INSERT INTO `hc_region` VALUES ('522328', '522300', '安龙县', '2');
INSERT INTO `hc_region` VALUES ('522600', '520000', '黔东南苗族侗族自治州', '1');
INSERT INTO `hc_region` VALUES ('522601', '522600', '凯里市', '2');
INSERT INTO `hc_region` VALUES ('522622', '522600', '黄平县', '2');
INSERT INTO `hc_region` VALUES ('522623', '522600', '施秉县', '2');
INSERT INTO `hc_region` VALUES ('522624', '522600', '三穗县', '2');
INSERT INTO `hc_region` VALUES ('522625', '522600', '镇远县', '2');
INSERT INTO `hc_region` VALUES ('522626', '522600', '岑巩县', '2');
INSERT INTO `hc_region` VALUES ('522627', '522600', '天柱县', '2');
INSERT INTO `hc_region` VALUES ('522628', '522600', '锦屏县', '2');
INSERT INTO `hc_region` VALUES ('522629', '522600', '剑河县', '2');
INSERT INTO `hc_region` VALUES ('522630', '522600', '台江县', '2');
INSERT INTO `hc_region` VALUES ('522631', '522600', '黎平县', '2');
INSERT INTO `hc_region` VALUES ('522632', '522600', '榕江县', '2');
INSERT INTO `hc_region` VALUES ('522633', '522600', '从江县', '2');
INSERT INTO `hc_region` VALUES ('522634', '522600', '雷山县', '2');
INSERT INTO `hc_region` VALUES ('522635', '522600', '麻江县', '2');
INSERT INTO `hc_region` VALUES ('522636', '522600', '丹寨县', '2');
INSERT INTO `hc_region` VALUES ('522700', '520000', '黔南布依族苗族自治州', '1');
INSERT INTO `hc_region` VALUES ('522701', '522700', '都匀市', '2');
INSERT INTO `hc_region` VALUES ('522702', '522700', '福泉市', '2');
INSERT INTO `hc_region` VALUES ('522722', '522700', '荔波县', '2');
INSERT INTO `hc_region` VALUES ('522723', '522700', '贵定县', '2');
INSERT INTO `hc_region` VALUES ('522725', '522700', '瓮安县', '2');
INSERT INTO `hc_region` VALUES ('522726', '522700', '独山县', '2');
INSERT INTO `hc_region` VALUES ('522727', '522700', '平塘县', '2');
INSERT INTO `hc_region` VALUES ('522728', '522700', '罗甸县', '2');
INSERT INTO `hc_region` VALUES ('522729', '522700', '长顺县', '2');
INSERT INTO `hc_region` VALUES ('522730', '522700', '龙里县', '2');
INSERT INTO `hc_region` VALUES ('522731', '522700', '惠水县', '2');
INSERT INTO `hc_region` VALUES ('522732', '522700', '三都水族自治县', '2');
INSERT INTO `hc_region` VALUES ('530000', '0', '云南省', '0');
INSERT INTO `hc_region` VALUES ('530100', '530000', '昆明市', '1');
INSERT INTO `hc_region` VALUES ('530101', '530100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('530102', '530100', '五华区', '2');
INSERT INTO `hc_region` VALUES ('530103', '530100', '盘龙区', '2');
INSERT INTO `hc_region` VALUES ('530111', '530100', '官渡区', '2');
INSERT INTO `hc_region` VALUES ('530112', '530100', '西山区', '2');
INSERT INTO `hc_region` VALUES ('530113', '530100', '东川区', '2');
INSERT INTO `hc_region` VALUES ('530114', '530100', '呈贡区', '2');
INSERT INTO `hc_region` VALUES ('530122', '530100', '晋宁县', '2');
INSERT INTO `hc_region` VALUES ('530124', '530100', '富民县', '2');
INSERT INTO `hc_region` VALUES ('530125', '530100', '宜良县', '2');
INSERT INTO `hc_region` VALUES ('530126', '530100', '石林彝族自治县', '2');
INSERT INTO `hc_region` VALUES ('530127', '530100', '嵩明县', '2');
INSERT INTO `hc_region` VALUES ('530128', '530100', '禄劝彝族苗族自治县', '2');
INSERT INTO `hc_region` VALUES ('530129', '530100', '寻甸回族彝族自治县', '2');
INSERT INTO `hc_region` VALUES ('530181', '530100', '安宁市', '2');
INSERT INTO `hc_region` VALUES ('530300', '530000', '曲靖市', '1');
INSERT INTO `hc_region` VALUES ('530301', '530300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('530302', '530300', '麒麟区', '2');
INSERT INTO `hc_region` VALUES ('530321', '530300', '马龙县', '2');
INSERT INTO `hc_region` VALUES ('530322', '530300', '陆良县', '2');
INSERT INTO `hc_region` VALUES ('530323', '530300', '师宗县', '2');
INSERT INTO `hc_region` VALUES ('530324', '530300', '罗平县', '2');
INSERT INTO `hc_region` VALUES ('530325', '530300', '富源县', '2');
INSERT INTO `hc_region` VALUES ('530326', '530300', '会泽县', '2');
INSERT INTO `hc_region` VALUES ('530328', '530300', '沾益县', '2');
INSERT INTO `hc_region` VALUES ('530381', '530300', '宣威市', '2');
INSERT INTO `hc_region` VALUES ('530400', '530000', '玉溪市', '1');
INSERT INTO `hc_region` VALUES ('530401', '530400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('530402', '530400', '红塔区', '2');
INSERT INTO `hc_region` VALUES ('530421', '530400', '江川县', '2');
INSERT INTO `hc_region` VALUES ('530422', '530400', '澄江县', '2');
INSERT INTO `hc_region` VALUES ('530423', '530400', '通海县', '2');
INSERT INTO `hc_region` VALUES ('530424', '530400', '华宁县', '2');
INSERT INTO `hc_region` VALUES ('530425', '530400', '易门县', '2');
INSERT INTO `hc_region` VALUES ('530426', '530400', '峨山彝族自治县', '2');
INSERT INTO `hc_region` VALUES ('530427', '530400', '新平彝族傣族自治县', '2');
INSERT INTO `hc_region` VALUES ('530428', '530400', '元江哈尼族彝族傣族自治县', '2');
INSERT INTO `hc_region` VALUES ('530500', '530000', '保山市', '1');
INSERT INTO `hc_region` VALUES ('530501', '530500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('530502', '530500', '隆阳区', '2');
INSERT INTO `hc_region` VALUES ('530521', '530500', '施甸县', '2');
INSERT INTO `hc_region` VALUES ('530522', '530500', '腾冲县', '2');
INSERT INTO `hc_region` VALUES ('530523', '530500', '龙陵县', '2');
INSERT INTO `hc_region` VALUES ('530524', '530500', '昌宁县', '2');
INSERT INTO `hc_region` VALUES ('530600', '530000', '昭通市', '1');
INSERT INTO `hc_region` VALUES ('530601', '530600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('530602', '530600', '昭阳区', '2');
INSERT INTO `hc_region` VALUES ('530621', '530600', '鲁甸县', '2');
INSERT INTO `hc_region` VALUES ('530622', '530600', '巧家县', '2');
INSERT INTO `hc_region` VALUES ('530623', '530600', '盐津县', '2');
INSERT INTO `hc_region` VALUES ('530624', '530600', '大关县', '2');
INSERT INTO `hc_region` VALUES ('530625', '530600', '永善县', '2');
INSERT INTO `hc_region` VALUES ('530626', '530600', '绥江县', '2');
INSERT INTO `hc_region` VALUES ('530627', '530600', '镇雄县', '2');
INSERT INTO `hc_region` VALUES ('530628', '530600', '彝良县', '2');
INSERT INTO `hc_region` VALUES ('530629', '530600', '威信县', '2');
INSERT INTO `hc_region` VALUES ('530630', '530600', '水富县', '2');
INSERT INTO `hc_region` VALUES ('530700', '530000', '丽江市', '1');
INSERT INTO `hc_region` VALUES ('530701', '530700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('530702', '530700', '古城区', '2');
INSERT INTO `hc_region` VALUES ('530721', '530700', '玉龙纳西族自治县', '2');
INSERT INTO `hc_region` VALUES ('530722', '530700', '永胜县', '2');
INSERT INTO `hc_region` VALUES ('530723', '530700', '华坪县', '2');
INSERT INTO `hc_region` VALUES ('530724', '530700', '宁蒗彝族自治县', '2');
INSERT INTO `hc_region` VALUES ('530800', '530000', '普洱市', '1');
INSERT INTO `hc_region` VALUES ('530801', '530800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('530802', '530800', '思茅区', '2');
INSERT INTO `hc_region` VALUES ('530821', '530800', '宁洱哈尼族彝族自治县', '2');
INSERT INTO `hc_region` VALUES ('530822', '530800', '墨江哈尼族自治县', '2');
INSERT INTO `hc_region` VALUES ('530823', '530800', '景东彝族自治县', '2');
INSERT INTO `hc_region` VALUES ('530824', '530800', '景谷傣族彝族自治县', '2');
INSERT INTO `hc_region` VALUES ('530825', '530800', '镇沅彝族哈尼族拉祜族自治县', '2');
INSERT INTO `hc_region` VALUES ('530826', '530800', '江城哈尼族彝族自治县', '2');
INSERT INTO `hc_region` VALUES ('530827', '530800', '孟连傣族拉祜族佤族自治县', '2');
INSERT INTO `hc_region` VALUES ('530828', '530800', '澜沧拉祜族自治县', '2');
INSERT INTO `hc_region` VALUES ('530829', '530800', '西盟佤族自治县', '2');
INSERT INTO `hc_region` VALUES ('530900', '530000', '临沧市', '1');
INSERT INTO `hc_region` VALUES ('530901', '530900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('530902', '530900', '临翔区', '2');
INSERT INTO `hc_region` VALUES ('530921', '530900', '凤庆县', '2');
INSERT INTO `hc_region` VALUES ('530922', '530900', '云县', '2');
INSERT INTO `hc_region` VALUES ('530923', '530900', '永德县', '2');
INSERT INTO `hc_region` VALUES ('530924', '530900', '镇康县', '2');
INSERT INTO `hc_region` VALUES ('530925', '530900', '双江拉祜族佤族布朗族傣族自治县', '2');
INSERT INTO `hc_region` VALUES ('530926', '530900', '耿马傣族佤族自治县', '2');
INSERT INTO `hc_region` VALUES ('530927', '530900', '沧源佤族自治县', '2');
INSERT INTO `hc_region` VALUES ('532300', '530000', '楚雄彝族自治州', '1');
INSERT INTO `hc_region` VALUES ('532301', '532300', '楚雄市', '2');
INSERT INTO `hc_region` VALUES ('532322', '532300', '双柏县', '2');
INSERT INTO `hc_region` VALUES ('532323', '532300', '牟定县', '2');
INSERT INTO `hc_region` VALUES ('532324', '532300', '南华县', '2');
INSERT INTO `hc_region` VALUES ('532325', '532300', '姚安县', '2');
INSERT INTO `hc_region` VALUES ('532326', '532300', '大姚县', '2');
INSERT INTO `hc_region` VALUES ('532327', '532300', '永仁县', '2');
INSERT INTO `hc_region` VALUES ('532328', '532300', '元谋县', '2');
INSERT INTO `hc_region` VALUES ('532329', '532300', '武定县', '2');
INSERT INTO `hc_region` VALUES ('532331', '532300', '禄丰县', '2');
INSERT INTO `hc_region` VALUES ('532500', '530000', '红河哈尼族彝族自治州', '1');
INSERT INTO `hc_region` VALUES ('532501', '532500', '个旧市', '2');
INSERT INTO `hc_region` VALUES ('532502', '532500', '开远市', '2');
INSERT INTO `hc_region` VALUES ('532503', '532500', '蒙自市', '2');
INSERT INTO `hc_region` VALUES ('532504', '532500', '弥勒市', '2');
INSERT INTO `hc_region` VALUES ('532523', '532500', '屏边苗族自治县', '2');
INSERT INTO `hc_region` VALUES ('532524', '532500', '建水县', '2');
INSERT INTO `hc_region` VALUES ('532525', '532500', '石屏县', '2');
INSERT INTO `hc_region` VALUES ('532527', '532500', '泸西县', '2');
INSERT INTO `hc_region` VALUES ('532528', '532500', '元阳县', '2');
INSERT INTO `hc_region` VALUES ('532529', '532500', '红河县', '2');
INSERT INTO `hc_region` VALUES ('532530', '532500', '金平苗族瑶族傣族自治县', '2');
INSERT INTO `hc_region` VALUES ('532531', '532500', '绿春县', '2');
INSERT INTO `hc_region` VALUES ('532532', '532500', '河口瑶族自治县', '2');
INSERT INTO `hc_region` VALUES ('532600', '530000', '文山壮族苗族自治州', '1');
INSERT INTO `hc_region` VALUES ('532601', '532600', '文山市', '2');
INSERT INTO `hc_region` VALUES ('532622', '532600', '砚山县', '2');
INSERT INTO `hc_region` VALUES ('532623', '532600', '西畴县', '2');
INSERT INTO `hc_region` VALUES ('532624', '532600', '麻栗坡县', '2');
INSERT INTO `hc_region` VALUES ('532625', '532600', '马关县', '2');
INSERT INTO `hc_region` VALUES ('532626', '532600', '丘北县', '2');
INSERT INTO `hc_region` VALUES ('532627', '532600', '广南县', '2');
INSERT INTO `hc_region` VALUES ('532628', '532600', '富宁县', '2');
INSERT INTO `hc_region` VALUES ('532800', '530000', '西双版纳傣族自治州', '1');
INSERT INTO `hc_region` VALUES ('532801', '532800', '景洪市', '2');
INSERT INTO `hc_region` VALUES ('532822', '532800', '勐海县', '2');
INSERT INTO `hc_region` VALUES ('532823', '532800', '勐腊县', '2');
INSERT INTO `hc_region` VALUES ('532900', '530000', '大理白族自治州', '1');
INSERT INTO `hc_region` VALUES ('532901', '532900', '大理市', '2');
INSERT INTO `hc_region` VALUES ('532922', '532900', '漾濞彝族自治县', '2');
INSERT INTO `hc_region` VALUES ('532923', '532900', '祥云县', '2');
INSERT INTO `hc_region` VALUES ('532924', '532900', '宾川县', '2');
INSERT INTO `hc_region` VALUES ('532925', '532900', '弥渡县', '2');
INSERT INTO `hc_region` VALUES ('532926', '532900', '南涧彝族自治县', '2');
INSERT INTO `hc_region` VALUES ('532927', '532900', '巍山彝族回族自治县', '2');
INSERT INTO `hc_region` VALUES ('532928', '532900', '永平县', '2');
INSERT INTO `hc_region` VALUES ('532929', '532900', '云龙县', '2');
INSERT INTO `hc_region` VALUES ('532930', '532900', '洱源县', '2');
INSERT INTO `hc_region` VALUES ('532931', '532900', '剑川县', '2');
INSERT INTO `hc_region` VALUES ('532932', '532900', '鹤庆县', '2');
INSERT INTO `hc_region` VALUES ('533100', '530000', '德宏傣族景颇族自治州', '1');
INSERT INTO `hc_region` VALUES ('533102', '533100', '瑞丽市', '2');
INSERT INTO `hc_region` VALUES ('533103', '533100', '芒市', '2');
INSERT INTO `hc_region` VALUES ('533122', '533100', '梁河县', '2');
INSERT INTO `hc_region` VALUES ('533123', '533100', '盈江县', '2');
INSERT INTO `hc_region` VALUES ('533124', '533100', '陇川县', '2');
INSERT INTO `hc_region` VALUES ('533300', '530000', '怒江傈僳族自治州', '1');
INSERT INTO `hc_region` VALUES ('533321', '533300', '泸水县', '2');
INSERT INTO `hc_region` VALUES ('533323', '533300', '福贡县', '2');
INSERT INTO `hc_region` VALUES ('533324', '533300', '贡山独龙族怒族自治县', '2');
INSERT INTO `hc_region` VALUES ('533325', '533300', '兰坪白族普米族自治县', '2');
INSERT INTO `hc_region` VALUES ('533400', '530000', '迪庆藏族自治州', '1');
INSERT INTO `hc_region` VALUES ('533421', '533400', '香格里拉县', '2');
INSERT INTO `hc_region` VALUES ('533422', '533400', '德钦县', '2');
INSERT INTO `hc_region` VALUES ('533423', '533400', '维西傈僳族自治县', '2');
INSERT INTO `hc_region` VALUES ('540000', '0', '西藏自治区', '0');
INSERT INTO `hc_region` VALUES ('540100', '540000', '拉萨市', '1');
INSERT INTO `hc_region` VALUES ('540101', '540100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('540102', '540100', '城关区', '2');
INSERT INTO `hc_region` VALUES ('540121', '540100', '林周县', '2');
INSERT INTO `hc_region` VALUES ('540122', '540100', '当雄县', '2');
INSERT INTO `hc_region` VALUES ('540123', '540100', '尼木县', '2');
INSERT INTO `hc_region` VALUES ('540124', '540100', '曲水县', '2');
INSERT INTO `hc_region` VALUES ('540125', '540100', '堆龙德庆县', '2');
INSERT INTO `hc_region` VALUES ('540126', '540100', '达孜县', '2');
INSERT INTO `hc_region` VALUES ('540127', '540100', '墨竹工卡县', '2');
INSERT INTO `hc_region` VALUES ('540200', '540000', '日喀则市', '1');
INSERT INTO `hc_region` VALUES ('540202', '540200', '桑珠孜区', '2');
INSERT INTO `hc_region` VALUES ('540221', '540200', '南木林县', '2');
INSERT INTO `hc_region` VALUES ('540222', '540200', '江孜县', '2');
INSERT INTO `hc_region` VALUES ('540223', '540200', '定日县', '2');
INSERT INTO `hc_region` VALUES ('540224', '540200', '萨迦县', '2');
INSERT INTO `hc_region` VALUES ('540225', '540200', '拉孜县', '2');
INSERT INTO `hc_region` VALUES ('540226', '540200', '昂仁县', '2');
INSERT INTO `hc_region` VALUES ('540227', '540200', '谢通门县', '2');
INSERT INTO `hc_region` VALUES ('540228', '540200', '白朗县', '2');
INSERT INTO `hc_region` VALUES ('540229', '540200', '仁布县', '2');
INSERT INTO `hc_region` VALUES ('540230', '540200', '康马县', '2');
INSERT INTO `hc_region` VALUES ('540231', '540200', '定结县', '2');
INSERT INTO `hc_region` VALUES ('540232', '540200', '仲巴县', '2');
INSERT INTO `hc_region` VALUES ('540233', '540200', '亚东县', '2');
INSERT INTO `hc_region` VALUES ('540234', '540200', '吉隆县', '2');
INSERT INTO `hc_region` VALUES ('540235', '540200', '聂拉木县', '2');
INSERT INTO `hc_region` VALUES ('540236', '540200', '萨嘎县', '2');
INSERT INTO `hc_region` VALUES ('540237', '540200', '岗巴县', '2');
INSERT INTO `hc_region` VALUES ('542100', '540000', '昌都地区', '1');
INSERT INTO `hc_region` VALUES ('542121', '542100', '昌都县', '2');
INSERT INTO `hc_region` VALUES ('542122', '542100', '江达县', '2');
INSERT INTO `hc_region` VALUES ('542123', '542100', '贡觉县', '2');
INSERT INTO `hc_region` VALUES ('542124', '542100', '类乌齐县', '2');
INSERT INTO `hc_region` VALUES ('542125', '542100', '丁青县', '2');
INSERT INTO `hc_region` VALUES ('542126', '542100', '察雅县', '2');
INSERT INTO `hc_region` VALUES ('542127', '542100', '八宿县', '2');
INSERT INTO `hc_region` VALUES ('542128', '542100', '左贡县', '2');
INSERT INTO `hc_region` VALUES ('542129', '542100', '芒康县', '2');
INSERT INTO `hc_region` VALUES ('542132', '542100', '洛隆县', '2');
INSERT INTO `hc_region` VALUES ('542133', '542100', '边坝县', '2');
INSERT INTO `hc_region` VALUES ('542200', '540000', '山南地区', '1');
INSERT INTO `hc_region` VALUES ('542221', '542200', '乃东县', '2');
INSERT INTO `hc_region` VALUES ('542222', '542200', '扎囊县', '2');
INSERT INTO `hc_region` VALUES ('542223', '542200', '贡嘎县', '2');
INSERT INTO `hc_region` VALUES ('542224', '542200', '桑日县', '2');
INSERT INTO `hc_region` VALUES ('542225', '542200', '琼结县', '2');
INSERT INTO `hc_region` VALUES ('542226', '542200', '曲松县', '2');
INSERT INTO `hc_region` VALUES ('542227', '542200', '措美县', '2');
INSERT INTO `hc_region` VALUES ('542228', '542200', '洛扎县', '2');
INSERT INTO `hc_region` VALUES ('542229', '542200', '加查县', '2');
INSERT INTO `hc_region` VALUES ('542231', '542200', '隆子县', '2');
INSERT INTO `hc_region` VALUES ('542232', '542200', '错那县', '2');
INSERT INTO `hc_region` VALUES ('542233', '542200', '浪卡子县', '2');
INSERT INTO `hc_region` VALUES ('542400', '540000', '那曲地区', '1');
INSERT INTO `hc_region` VALUES ('542421', '542400', '那曲县', '2');
INSERT INTO `hc_region` VALUES ('542422', '542400', '嘉黎县', '2');
INSERT INTO `hc_region` VALUES ('542423', '542400', '比如县', '2');
INSERT INTO `hc_region` VALUES ('542424', '542400', '聂荣县', '2');
INSERT INTO `hc_region` VALUES ('542425', '542400', '安多县', '2');
INSERT INTO `hc_region` VALUES ('542426', '542400', '申扎县', '2');
INSERT INTO `hc_region` VALUES ('542427', '542400', '索县', '2');
INSERT INTO `hc_region` VALUES ('542428', '542400', '班戈县', '2');
INSERT INTO `hc_region` VALUES ('542429', '542400', '巴青县', '2');
INSERT INTO `hc_region` VALUES ('542430', '542400', '尼玛县', '2');
INSERT INTO `hc_region` VALUES ('542431', '542400', '双湖县', '2');
INSERT INTO `hc_region` VALUES ('542500', '540000', '阿里地区', '1');
INSERT INTO `hc_region` VALUES ('542521', '542500', '普兰县', '2');
INSERT INTO `hc_region` VALUES ('542522', '542500', '札达县', '2');
INSERT INTO `hc_region` VALUES ('542523', '542500', '噶尔县', '2');
INSERT INTO `hc_region` VALUES ('542524', '542500', '日土县', '2');
INSERT INTO `hc_region` VALUES ('542525', '542500', '革吉县', '2');
INSERT INTO `hc_region` VALUES ('542526', '542500', '改则县', '2');
INSERT INTO `hc_region` VALUES ('542527', '542500', '措勤县', '2');
INSERT INTO `hc_region` VALUES ('542600', '540000', '林芝地区', '1');
INSERT INTO `hc_region` VALUES ('542621', '542600', '林芝县', '2');
INSERT INTO `hc_region` VALUES ('542622', '542600', '工布江达县', '2');
INSERT INTO `hc_region` VALUES ('542623', '542600', '米林县', '2');
INSERT INTO `hc_region` VALUES ('542624', '542600', '墨脱县', '2');
INSERT INTO `hc_region` VALUES ('542625', '542600', '波密县', '2');
INSERT INTO `hc_region` VALUES ('542626', '542600', '察隅县', '2');
INSERT INTO `hc_region` VALUES ('542627', '542600', '朗县', '2');
INSERT INTO `hc_region` VALUES ('610000', '0', '陕西省', '0');
INSERT INTO `hc_region` VALUES ('610100', '610000', '西安市', '1');
INSERT INTO `hc_region` VALUES ('610101', '610100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('610102', '610100', '新城区', '2');
INSERT INTO `hc_region` VALUES ('610103', '610100', '碑林区', '2');
INSERT INTO `hc_region` VALUES ('610104', '610100', '莲湖区', '2');
INSERT INTO `hc_region` VALUES ('610111', '610100', '灞桥区', '2');
INSERT INTO `hc_region` VALUES ('610112', '610100', '未央区', '2');
INSERT INTO `hc_region` VALUES ('610113', '610100', '雁塔区', '2');
INSERT INTO `hc_region` VALUES ('610114', '610100', '阎良区', '2');
INSERT INTO `hc_region` VALUES ('610115', '610100', '临潼区', '2');
INSERT INTO `hc_region` VALUES ('610116', '610100', '长安区', '2');
INSERT INTO `hc_region` VALUES ('610122', '610100', '蓝田县', '2');
INSERT INTO `hc_region` VALUES ('610124', '610100', '周至县', '2');
INSERT INTO `hc_region` VALUES ('610125', '610100', '户县', '2');
INSERT INTO `hc_region` VALUES ('610126', '610100', '高陵县', '2');
INSERT INTO `hc_region` VALUES ('610200', '610000', '铜川市', '1');
INSERT INTO `hc_region` VALUES ('610201', '610200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('610202', '610200', '王益区', '2');
INSERT INTO `hc_region` VALUES ('610203', '610200', '印台区', '2');
INSERT INTO `hc_region` VALUES ('610204', '610200', '耀州区', '2');
INSERT INTO `hc_region` VALUES ('610222', '610200', '宜君县', '2');
INSERT INTO `hc_region` VALUES ('610300', '610000', '宝鸡市', '1');
INSERT INTO `hc_region` VALUES ('610301', '610300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('610302', '610300', '渭滨区', '2');
INSERT INTO `hc_region` VALUES ('610303', '610300', '金台区', '2');
INSERT INTO `hc_region` VALUES ('610304', '610300', '陈仓区', '2');
INSERT INTO `hc_region` VALUES ('610322', '610300', '凤翔县', '2');
INSERT INTO `hc_region` VALUES ('610323', '610300', '岐山县', '2');
INSERT INTO `hc_region` VALUES ('610324', '610300', '扶风县', '2');
INSERT INTO `hc_region` VALUES ('610326', '610300', '眉县', '2');
INSERT INTO `hc_region` VALUES ('610327', '610300', '陇县', '2');
INSERT INTO `hc_region` VALUES ('610328', '610300', '千阳县', '2');
INSERT INTO `hc_region` VALUES ('610329', '610300', '麟游县', '2');
INSERT INTO `hc_region` VALUES ('610330', '610300', '凤县', '2');
INSERT INTO `hc_region` VALUES ('610331', '610300', '太白县', '2');
INSERT INTO `hc_region` VALUES ('610400', '610000', '咸阳市', '1');
INSERT INTO `hc_region` VALUES ('610401', '610400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('610402', '610400', '秦都区', '2');
INSERT INTO `hc_region` VALUES ('610403', '610400', '杨陵区', '2');
INSERT INTO `hc_region` VALUES ('610404', '610400', '渭城区', '2');
INSERT INTO `hc_region` VALUES ('610422', '610400', '三原县', '2');
INSERT INTO `hc_region` VALUES ('610423', '610400', '泾阳县', '2');
INSERT INTO `hc_region` VALUES ('610424', '610400', '乾县', '2');
INSERT INTO `hc_region` VALUES ('610425', '610400', '礼泉县', '2');
INSERT INTO `hc_region` VALUES ('610426', '610400', '永寿县', '2');
INSERT INTO `hc_region` VALUES ('610427', '610400', '彬县', '2');
INSERT INTO `hc_region` VALUES ('610428', '610400', '长武县', '2');
INSERT INTO `hc_region` VALUES ('610429', '610400', '旬邑县', '2');
INSERT INTO `hc_region` VALUES ('610430', '610400', '淳化县', '2');
INSERT INTO `hc_region` VALUES ('610431', '610400', '武功县', '2');
INSERT INTO `hc_region` VALUES ('610481', '610400', '兴平市', '2');
INSERT INTO `hc_region` VALUES ('610500', '610000', '渭南市', '1');
INSERT INTO `hc_region` VALUES ('610501', '610500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('610502', '610500', '临渭区', '2');
INSERT INTO `hc_region` VALUES ('610521', '610500', '华县', '2');
INSERT INTO `hc_region` VALUES ('610522', '610500', '潼关县', '2');
INSERT INTO `hc_region` VALUES ('610523', '610500', '大荔县', '2');
INSERT INTO `hc_region` VALUES ('610524', '610500', '合阳县', '2');
INSERT INTO `hc_region` VALUES ('610525', '610500', '澄城县', '2');
INSERT INTO `hc_region` VALUES ('610526', '610500', '蒲城县', '2');
INSERT INTO `hc_region` VALUES ('610527', '610500', '白水县', '2');
INSERT INTO `hc_region` VALUES ('610528', '610500', '富平县', '2');
INSERT INTO `hc_region` VALUES ('610581', '610500', '韩城市', '2');
INSERT INTO `hc_region` VALUES ('610582', '610500', '华阴市', '2');
INSERT INTO `hc_region` VALUES ('610600', '610000', '延安市', '1');
INSERT INTO `hc_region` VALUES ('610601', '610600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('610602', '610600', '宝塔区', '2');
INSERT INTO `hc_region` VALUES ('610621', '610600', '延长县', '2');
INSERT INTO `hc_region` VALUES ('610622', '610600', '延川县', '2');
INSERT INTO `hc_region` VALUES ('610623', '610600', '子长县', '2');
INSERT INTO `hc_region` VALUES ('610624', '610600', '安塞县', '2');
INSERT INTO `hc_region` VALUES ('610625', '610600', '志丹县', '2');
INSERT INTO `hc_region` VALUES ('610626', '610600', '吴起县', '2');
INSERT INTO `hc_region` VALUES ('610627', '610600', '甘泉县', '2');
INSERT INTO `hc_region` VALUES ('610628', '610600', '富县', '2');
INSERT INTO `hc_region` VALUES ('610629', '610600', '洛川县', '2');
INSERT INTO `hc_region` VALUES ('610630', '610600', '宜川县', '2');
INSERT INTO `hc_region` VALUES ('610631', '610600', '黄龙县', '2');
INSERT INTO `hc_region` VALUES ('610632', '610600', '黄陵县', '2');
INSERT INTO `hc_region` VALUES ('610700', '610000', '汉中市', '1');
INSERT INTO `hc_region` VALUES ('610701', '610700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('610702', '610700', '汉台区', '2');
INSERT INTO `hc_region` VALUES ('610721', '610700', '南郑县', '2');
INSERT INTO `hc_region` VALUES ('610722', '610700', '城固县', '2');
INSERT INTO `hc_region` VALUES ('610723', '610700', '洋县', '2');
INSERT INTO `hc_region` VALUES ('610724', '610700', '西乡县', '2');
INSERT INTO `hc_region` VALUES ('610725', '610700', '勉县', '2');
INSERT INTO `hc_region` VALUES ('610726', '610700', '宁强县', '2');
INSERT INTO `hc_region` VALUES ('610727', '610700', '略阳县', '2');
INSERT INTO `hc_region` VALUES ('610728', '610700', '镇巴县', '2');
INSERT INTO `hc_region` VALUES ('610729', '610700', '留坝县', '2');
INSERT INTO `hc_region` VALUES ('610730', '610700', '佛坪县', '2');
INSERT INTO `hc_region` VALUES ('610800', '610000', '榆林市', '1');
INSERT INTO `hc_region` VALUES ('610801', '610800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('610802', '610800', '榆阳区', '2');
INSERT INTO `hc_region` VALUES ('610821', '610800', '神木县', '2');
INSERT INTO `hc_region` VALUES ('610822', '610800', '府谷县', '2');
INSERT INTO `hc_region` VALUES ('610823', '610800', '横山县', '2');
INSERT INTO `hc_region` VALUES ('610824', '610800', '靖边县', '2');
INSERT INTO `hc_region` VALUES ('610825', '610800', '定边县', '2');
INSERT INTO `hc_region` VALUES ('610826', '610800', '绥德县', '2');
INSERT INTO `hc_region` VALUES ('610827', '610800', '米脂县', '2');
INSERT INTO `hc_region` VALUES ('610828', '610800', '佳县', '2');
INSERT INTO `hc_region` VALUES ('610829', '610800', '吴堡县', '2');
INSERT INTO `hc_region` VALUES ('610830', '610800', '清涧县', '2');
INSERT INTO `hc_region` VALUES ('610831', '610800', '子洲县', '2');
INSERT INTO `hc_region` VALUES ('610900', '610000', '安康市', '1');
INSERT INTO `hc_region` VALUES ('610901', '610900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('610902', '610900', '汉滨区', '2');
INSERT INTO `hc_region` VALUES ('610921', '610900', '汉阴县', '2');
INSERT INTO `hc_region` VALUES ('610922', '610900', '石泉县', '2');
INSERT INTO `hc_region` VALUES ('610923', '610900', '宁陕县', '2');
INSERT INTO `hc_region` VALUES ('610924', '610900', '紫阳县', '2');
INSERT INTO `hc_region` VALUES ('610925', '610900', '岚皋县', '2');
INSERT INTO `hc_region` VALUES ('610926', '610900', '平利县', '2');
INSERT INTO `hc_region` VALUES ('610927', '610900', '镇坪县', '2');
INSERT INTO `hc_region` VALUES ('610928', '610900', '旬阳县', '2');
INSERT INTO `hc_region` VALUES ('610929', '610900', '白河县', '2');
INSERT INTO `hc_region` VALUES ('611000', '610000', '商洛市', '1');
INSERT INTO `hc_region` VALUES ('611001', '611000', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('611002', '611000', '商州区', '2');
INSERT INTO `hc_region` VALUES ('611021', '611000', '洛南县', '2');
INSERT INTO `hc_region` VALUES ('611022', '611000', '丹凤县', '2');
INSERT INTO `hc_region` VALUES ('611023', '611000', '商南县', '2');
INSERT INTO `hc_region` VALUES ('611024', '611000', '山阳县', '2');
INSERT INTO `hc_region` VALUES ('611025', '611000', '镇安县', '2');
INSERT INTO `hc_region` VALUES ('611026', '611000', '柞水县', '2');
INSERT INTO `hc_region` VALUES ('620000', '0', '甘肃省', '0');
INSERT INTO `hc_region` VALUES ('620100', '620000', '兰州市', '1');
INSERT INTO `hc_region` VALUES ('620101', '620100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('620102', '620100', '城关区', '2');
INSERT INTO `hc_region` VALUES ('620103', '620100', '七里河区', '2');
INSERT INTO `hc_region` VALUES ('620104', '620100', '西固区', '2');
INSERT INTO `hc_region` VALUES ('620105', '620100', '安宁区', '2');
INSERT INTO `hc_region` VALUES ('620111', '620100', '红古区', '2');
INSERT INTO `hc_region` VALUES ('620121', '620100', '永登县', '2');
INSERT INTO `hc_region` VALUES ('620122', '620100', '皋兰县', '2');
INSERT INTO `hc_region` VALUES ('620123', '620100', '榆中县', '2');
INSERT INTO `hc_region` VALUES ('620200', '620000', '嘉峪关市', '1');
INSERT INTO `hc_region` VALUES ('620201', '620200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('620300', '620000', '金昌市', '1');
INSERT INTO `hc_region` VALUES ('620301', '620300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('620302', '620300', '金川区', '2');
INSERT INTO `hc_region` VALUES ('620321', '620300', '永昌县', '2');
INSERT INTO `hc_region` VALUES ('620400', '620000', '白银市', '1');
INSERT INTO `hc_region` VALUES ('620401', '620400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('620402', '620400', '白银区', '2');
INSERT INTO `hc_region` VALUES ('620403', '620400', '平川区', '2');
INSERT INTO `hc_region` VALUES ('620421', '620400', '靖远县', '2');
INSERT INTO `hc_region` VALUES ('620422', '620400', '会宁县', '2');
INSERT INTO `hc_region` VALUES ('620423', '620400', '景泰县', '2');
INSERT INTO `hc_region` VALUES ('620500', '620000', '天水市', '1');
INSERT INTO `hc_region` VALUES ('620501', '620500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('620502', '620500', '秦州区', '2');
INSERT INTO `hc_region` VALUES ('620503', '620500', '麦积区', '2');
INSERT INTO `hc_region` VALUES ('620521', '620500', '清水县', '2');
INSERT INTO `hc_region` VALUES ('620522', '620500', '秦安县', '2');
INSERT INTO `hc_region` VALUES ('620523', '620500', '甘谷县', '2');
INSERT INTO `hc_region` VALUES ('620524', '620500', '武山县', '2');
INSERT INTO `hc_region` VALUES ('620525', '620500', '张家川回族自治县', '2');
INSERT INTO `hc_region` VALUES ('620600', '620000', '武威市', '1');
INSERT INTO `hc_region` VALUES ('620601', '620600', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('620602', '620600', '凉州区', '2');
INSERT INTO `hc_region` VALUES ('620621', '620600', '民勤县', '2');
INSERT INTO `hc_region` VALUES ('620622', '620600', '古浪县', '2');
INSERT INTO `hc_region` VALUES ('620623', '620600', '天祝藏族自治县', '2');
INSERT INTO `hc_region` VALUES ('620700', '620000', '张掖市', '1');
INSERT INTO `hc_region` VALUES ('620701', '620700', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('620702', '620700', '甘州区', '2');
INSERT INTO `hc_region` VALUES ('620721', '620700', '肃南裕固族自治县', '2');
INSERT INTO `hc_region` VALUES ('620722', '620700', '民乐县', '2');
INSERT INTO `hc_region` VALUES ('620723', '620700', '临泽县', '2');
INSERT INTO `hc_region` VALUES ('620724', '620700', '高台县', '2');
INSERT INTO `hc_region` VALUES ('620725', '620700', '山丹县', '2');
INSERT INTO `hc_region` VALUES ('620800', '620000', '平凉市', '1');
INSERT INTO `hc_region` VALUES ('620801', '620800', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('620802', '620800', '崆峒区', '2');
INSERT INTO `hc_region` VALUES ('620821', '620800', '泾川县', '2');
INSERT INTO `hc_region` VALUES ('620822', '620800', '灵台县', '2');
INSERT INTO `hc_region` VALUES ('620823', '620800', '崇信县', '2');
INSERT INTO `hc_region` VALUES ('620824', '620800', '华亭县', '2');
INSERT INTO `hc_region` VALUES ('620825', '620800', '庄浪县', '2');
INSERT INTO `hc_region` VALUES ('620826', '620800', '静宁县', '2');
INSERT INTO `hc_region` VALUES ('620900', '620000', '酒泉市', '1');
INSERT INTO `hc_region` VALUES ('620901', '620900', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('620902', '620900', '肃州区', '2');
INSERT INTO `hc_region` VALUES ('620921', '620900', '金塔县', '2');
INSERT INTO `hc_region` VALUES ('620922', '620900', '瓜州县', '2');
INSERT INTO `hc_region` VALUES ('620923', '620900', '肃北蒙古族自治县', '2');
INSERT INTO `hc_region` VALUES ('620924', '620900', '阿克塞哈萨克族自治县', '2');
INSERT INTO `hc_region` VALUES ('620981', '620900', '玉门市', '2');
INSERT INTO `hc_region` VALUES ('620982', '620900', '敦煌市', '2');
INSERT INTO `hc_region` VALUES ('621000', '620000', '庆阳市', '1');
INSERT INTO `hc_region` VALUES ('621001', '621000', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('621002', '621000', '西峰区', '2');
INSERT INTO `hc_region` VALUES ('621021', '621000', '庆城县', '2');
INSERT INTO `hc_region` VALUES ('621022', '621000', '环县', '2');
INSERT INTO `hc_region` VALUES ('621023', '621000', '华池县', '2');
INSERT INTO `hc_region` VALUES ('621024', '621000', '合水县', '2');
INSERT INTO `hc_region` VALUES ('621025', '621000', '正宁县', '2');
INSERT INTO `hc_region` VALUES ('621026', '621000', '宁县', '2');
INSERT INTO `hc_region` VALUES ('621027', '621000', '镇原县', '2');
INSERT INTO `hc_region` VALUES ('621100', '620000', '定西市', '1');
INSERT INTO `hc_region` VALUES ('621101', '621100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('621102', '621100', '安定区', '2');
INSERT INTO `hc_region` VALUES ('621121', '621100', '通渭县', '2');
INSERT INTO `hc_region` VALUES ('621122', '621100', '陇西县', '2');
INSERT INTO `hc_region` VALUES ('621123', '621100', '渭源县', '2');
INSERT INTO `hc_region` VALUES ('621124', '621100', '临洮县', '2');
INSERT INTO `hc_region` VALUES ('621125', '621100', '漳县', '2');
INSERT INTO `hc_region` VALUES ('621126', '621100', '岷县', '2');
INSERT INTO `hc_region` VALUES ('621200', '620000', '陇南市', '1');
INSERT INTO `hc_region` VALUES ('621201', '621200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('621202', '621200', '武都区', '2');
INSERT INTO `hc_region` VALUES ('621221', '621200', '成县', '2');
INSERT INTO `hc_region` VALUES ('621222', '621200', '文县', '2');
INSERT INTO `hc_region` VALUES ('621223', '621200', '宕昌县', '2');
INSERT INTO `hc_region` VALUES ('621224', '621200', '康县', '2');
INSERT INTO `hc_region` VALUES ('621225', '621200', '西和县', '2');
INSERT INTO `hc_region` VALUES ('621226', '621200', '礼县', '2');
INSERT INTO `hc_region` VALUES ('621227', '621200', '徽县', '2');
INSERT INTO `hc_region` VALUES ('621228', '621200', '两当县', '2');
INSERT INTO `hc_region` VALUES ('622900', '620000', '临夏回族自治州', '1');
INSERT INTO `hc_region` VALUES ('622901', '622900', '临夏市', '2');
INSERT INTO `hc_region` VALUES ('622921', '622900', '临夏县', '2');
INSERT INTO `hc_region` VALUES ('622922', '622900', '康乐县', '2');
INSERT INTO `hc_region` VALUES ('622923', '622900', '永靖县', '2');
INSERT INTO `hc_region` VALUES ('622924', '622900', '广河县', '2');
INSERT INTO `hc_region` VALUES ('622925', '622900', '和政县', '2');
INSERT INTO `hc_region` VALUES ('622926', '622900', '东乡族自治县', '2');
INSERT INTO `hc_region` VALUES ('622927', '622900', '积石山保安族东乡族撒拉族自治县', '2');
INSERT INTO `hc_region` VALUES ('623000', '620000', '甘南藏族自治州', '1');
INSERT INTO `hc_region` VALUES ('623001', '623000', '合作市', '2');
INSERT INTO `hc_region` VALUES ('623021', '623000', '临潭县', '2');
INSERT INTO `hc_region` VALUES ('623022', '623000', '卓尼县', '2');
INSERT INTO `hc_region` VALUES ('623023', '623000', '舟曲县', '2');
INSERT INTO `hc_region` VALUES ('623024', '623000', '迭部县', '2');
INSERT INTO `hc_region` VALUES ('623025', '623000', '玛曲县', '2');
INSERT INTO `hc_region` VALUES ('623026', '623000', '碌曲县', '2');
INSERT INTO `hc_region` VALUES ('623027', '623000', '夏河县', '2');
INSERT INTO `hc_region` VALUES ('630000', '0', '青海省', '0');
INSERT INTO `hc_region` VALUES ('630100', '630000', '西宁市', '1');
INSERT INTO `hc_region` VALUES ('630101', '630100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('630102', '630100', '城东区', '2');
INSERT INTO `hc_region` VALUES ('630103', '630100', '城中区', '2');
INSERT INTO `hc_region` VALUES ('630104', '630100', '城西区', '2');
INSERT INTO `hc_region` VALUES ('630105', '630100', '城北区', '2');
INSERT INTO `hc_region` VALUES ('630121', '630100', '大通回族土族自治县', '2');
INSERT INTO `hc_region` VALUES ('630122', '630100', '湟中县', '2');
INSERT INTO `hc_region` VALUES ('630123', '630100', '湟源县', '2');
INSERT INTO `hc_region` VALUES ('630200', '630000', '海东市', '1');
INSERT INTO `hc_region` VALUES ('630202', '630200', '乐都区', '2');
INSERT INTO `hc_region` VALUES ('630221', '630200', '平安县', '2');
INSERT INTO `hc_region` VALUES ('630222', '630200', '民和回族土族自治县', '2');
INSERT INTO `hc_region` VALUES ('630223', '630200', '互助土族自治县', '2');
INSERT INTO `hc_region` VALUES ('630224', '630200', '化隆回族自治县', '2');
INSERT INTO `hc_region` VALUES ('630225', '630200', '循化撒拉族自治县', '2');
INSERT INTO `hc_region` VALUES ('632200', '630000', '海北藏族自治州', '1');
INSERT INTO `hc_region` VALUES ('632221', '632200', '门源回族自治县', '2');
INSERT INTO `hc_region` VALUES ('632222', '632200', '祁连县', '2');
INSERT INTO `hc_region` VALUES ('632223', '632200', '海晏县', '2');
INSERT INTO `hc_region` VALUES ('632224', '632200', '刚察县', '2');
INSERT INTO `hc_region` VALUES ('632300', '630000', '黄南藏族自治州', '1');
INSERT INTO `hc_region` VALUES ('632321', '632300', '同仁县', '2');
INSERT INTO `hc_region` VALUES ('632322', '632300', '尖扎县', '2');
INSERT INTO `hc_region` VALUES ('632323', '632300', '泽库县', '2');
INSERT INTO `hc_region` VALUES ('632324', '632300', '河南蒙古族自治县', '2');
INSERT INTO `hc_region` VALUES ('632500', '630000', '海南藏族自治州', '1');
INSERT INTO `hc_region` VALUES ('632521', '632500', '共和县', '2');
INSERT INTO `hc_region` VALUES ('632522', '632500', '同德县', '2');
INSERT INTO `hc_region` VALUES ('632523', '632500', '贵德县', '2');
INSERT INTO `hc_region` VALUES ('632524', '632500', '兴海县', '2');
INSERT INTO `hc_region` VALUES ('632525', '632500', '贵南县', '2');
INSERT INTO `hc_region` VALUES ('632600', '630000', '果洛藏族自治州', '1');
INSERT INTO `hc_region` VALUES ('632621', '632600', '玛沁县', '2');
INSERT INTO `hc_region` VALUES ('632622', '632600', '班玛县', '2');
INSERT INTO `hc_region` VALUES ('632623', '632600', '甘德县', '2');
INSERT INTO `hc_region` VALUES ('632624', '632600', '达日县', '2');
INSERT INTO `hc_region` VALUES ('632625', '632600', '久治县', '2');
INSERT INTO `hc_region` VALUES ('632626', '632600', '玛多县', '2');
INSERT INTO `hc_region` VALUES ('632700', '630000', '玉树藏族自治州', '1');
INSERT INTO `hc_region` VALUES ('632701', '632700', '玉树市', '2');
INSERT INTO `hc_region` VALUES ('632722', '632700', '杂多县', '2');
INSERT INTO `hc_region` VALUES ('632723', '632700', '称多县', '2');
INSERT INTO `hc_region` VALUES ('632724', '632700', '治多县', '2');
INSERT INTO `hc_region` VALUES ('632725', '632700', '囊谦县', '2');
INSERT INTO `hc_region` VALUES ('632726', '632700', '曲麻莱县', '2');
INSERT INTO `hc_region` VALUES ('632800', '630000', '海西蒙古族藏族自治州', '1');
INSERT INTO `hc_region` VALUES ('632801', '632800', '格尔木市', '2');
INSERT INTO `hc_region` VALUES ('632802', '632800', '德令哈市', '2');
INSERT INTO `hc_region` VALUES ('632821', '632800', '乌兰县', '2');
INSERT INTO `hc_region` VALUES ('632822', '632800', '都兰县', '2');
INSERT INTO `hc_region` VALUES ('632823', '632800', '天峻县', '2');
INSERT INTO `hc_region` VALUES ('640000', '0', '宁夏回族自治区', '0');
INSERT INTO `hc_region` VALUES ('640100', '640000', '银川市', '1');
INSERT INTO `hc_region` VALUES ('640101', '640100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('640104', '640100', '兴庆区', '2');
INSERT INTO `hc_region` VALUES ('640105', '640100', '西夏区', '2');
INSERT INTO `hc_region` VALUES ('640106', '640100', '金凤区', '2');
INSERT INTO `hc_region` VALUES ('640121', '640100', '永宁县', '2');
INSERT INTO `hc_region` VALUES ('640122', '640100', '贺兰县', '2');
INSERT INTO `hc_region` VALUES ('640181', '640100', '灵武市', '2');
INSERT INTO `hc_region` VALUES ('640200', '640000', '石嘴山市', '1');
INSERT INTO `hc_region` VALUES ('640201', '640200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('640202', '640200', '大武口区', '2');
INSERT INTO `hc_region` VALUES ('640205', '640200', '惠农区', '2');
INSERT INTO `hc_region` VALUES ('640221', '640200', '平罗县', '2');
INSERT INTO `hc_region` VALUES ('640300', '640000', '吴忠市', '1');
INSERT INTO `hc_region` VALUES ('640301', '640300', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('640302', '640300', '利通区', '2');
INSERT INTO `hc_region` VALUES ('640303', '640300', '红寺堡区', '2');
INSERT INTO `hc_region` VALUES ('640323', '640300', '盐池县', '2');
INSERT INTO `hc_region` VALUES ('640324', '640300', '同心县', '2');
INSERT INTO `hc_region` VALUES ('640381', '640300', '青铜峡市', '2');
INSERT INTO `hc_region` VALUES ('640400', '640000', '固原市', '1');
INSERT INTO `hc_region` VALUES ('640401', '640400', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('640402', '640400', '原州区', '2');
INSERT INTO `hc_region` VALUES ('640422', '640400', '西吉县', '2');
INSERT INTO `hc_region` VALUES ('640423', '640400', '隆德县', '2');
INSERT INTO `hc_region` VALUES ('640424', '640400', '泾源县', '2');
INSERT INTO `hc_region` VALUES ('640425', '640400', '彭阳县', '2');
INSERT INTO `hc_region` VALUES ('640500', '640000', '中卫市', '1');
INSERT INTO `hc_region` VALUES ('640501', '640500', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('640502', '640500', '沙坡头区', '2');
INSERT INTO `hc_region` VALUES ('640521', '640500', '中宁县', '2');
INSERT INTO `hc_region` VALUES ('640522', '640500', '海原县', '2');
INSERT INTO `hc_region` VALUES ('650000', '0', '新疆维吾尔自治区', '0');
INSERT INTO `hc_region` VALUES ('650100', '650000', '乌鲁木齐市', '1');
INSERT INTO `hc_region` VALUES ('650101', '650100', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('650102', '650100', '天山区', '2');
INSERT INTO `hc_region` VALUES ('650103', '650100', '沙依巴克区', '2');
INSERT INTO `hc_region` VALUES ('650104', '650100', '新市区', '2');
INSERT INTO `hc_region` VALUES ('650105', '650100', '水磨沟区', '2');
INSERT INTO `hc_region` VALUES ('650106', '650100', '头屯河区', '2');
INSERT INTO `hc_region` VALUES ('650107', '650100', '达坂城区', '2');
INSERT INTO `hc_region` VALUES ('650109', '650100', '米东区', '2');
INSERT INTO `hc_region` VALUES ('650121', '650100', '乌鲁木齐县', '2');
INSERT INTO `hc_region` VALUES ('650200', '650000', '克拉玛依市', '1');
INSERT INTO `hc_region` VALUES ('650201', '650200', '市辖区', '2');
INSERT INTO `hc_region` VALUES ('650202', '650200', '独山子区', '2');
INSERT INTO `hc_region` VALUES ('650203', '650200', '克拉玛依区', '2');
INSERT INTO `hc_region` VALUES ('650204', '650200', '白碱滩区', '2');
INSERT INTO `hc_region` VALUES ('650205', '650200', '乌尔禾区', '2');
INSERT INTO `hc_region` VALUES ('652100', '650000', '吐鲁番地区', '1');
INSERT INTO `hc_region` VALUES ('652101', '652100', '吐鲁番市', '2');
INSERT INTO `hc_region` VALUES ('652122', '652100', '鄯善县', '2');
INSERT INTO `hc_region` VALUES ('652123', '652100', '托克逊县', '2');
INSERT INTO `hc_region` VALUES ('652200', '650000', '哈密地区', '1');
INSERT INTO `hc_region` VALUES ('652201', '652200', '哈密市', '2');
INSERT INTO `hc_region` VALUES ('652222', '652200', '巴里坤哈萨克自治县', '2');
INSERT INTO `hc_region` VALUES ('652223', '652200', '伊吾县', '2');
INSERT INTO `hc_region` VALUES ('652300', '650000', '昌吉回族自治州', '1');
INSERT INTO `hc_region` VALUES ('652301', '652300', '昌吉市', '2');
INSERT INTO `hc_region` VALUES ('652302', '652300', '阜康市', '2');
INSERT INTO `hc_region` VALUES ('652323', '652300', '呼图壁县', '2');
INSERT INTO `hc_region` VALUES ('652324', '652300', '玛纳斯县', '2');
INSERT INTO `hc_region` VALUES ('652325', '652300', '奇台县', '2');
INSERT INTO `hc_region` VALUES ('652327', '652300', '吉木萨尔县', '2');
INSERT INTO `hc_region` VALUES ('652328', '652300', '木垒哈萨克自治县', '2');
INSERT INTO `hc_region` VALUES ('652700', '650000', '博尔塔拉蒙古自治州', '1');
INSERT INTO `hc_region` VALUES ('652701', '652700', '博乐市', '2');
INSERT INTO `hc_region` VALUES ('652702', '652700', '阿拉山口市', '2');
INSERT INTO `hc_region` VALUES ('652722', '652700', '精河县', '2');
INSERT INTO `hc_region` VALUES ('652723', '652700', '温泉县', '2');
INSERT INTO `hc_region` VALUES ('652800', '650000', '巴音郭楞蒙古自治州', '1');
INSERT INTO `hc_region` VALUES ('652801', '652800', '库尔勒市', '2');
INSERT INTO `hc_region` VALUES ('652822', '652800', '轮台县', '2');
INSERT INTO `hc_region` VALUES ('652823', '652800', '尉犁县', '2');
INSERT INTO `hc_region` VALUES ('652824', '652800', '若羌县', '2');
INSERT INTO `hc_region` VALUES ('652825', '652800', '且末县', '2');
INSERT INTO `hc_region` VALUES ('652826', '652800', '焉耆回族自治县', '2');
INSERT INTO `hc_region` VALUES ('652827', '652800', '和静县', '2');
INSERT INTO `hc_region` VALUES ('652828', '652800', '和硕县', '2');
INSERT INTO `hc_region` VALUES ('652829', '652800', '博湖县', '2');
INSERT INTO `hc_region` VALUES ('652900', '650000', '阿克苏地区', '1');
INSERT INTO `hc_region` VALUES ('652901', '652900', '阿克苏市', '2');
INSERT INTO `hc_region` VALUES ('652922', '652900', '温宿县', '2');
INSERT INTO `hc_region` VALUES ('652923', '652900', '库车县', '2');
INSERT INTO `hc_region` VALUES ('652924', '652900', '沙雅县', '2');
INSERT INTO `hc_region` VALUES ('652925', '652900', '新和县', '2');
INSERT INTO `hc_region` VALUES ('652926', '652900', '拜城县', '2');
INSERT INTO `hc_region` VALUES ('652927', '652900', '乌什县', '2');
INSERT INTO `hc_region` VALUES ('652928', '652900', '阿瓦提县', '2');
INSERT INTO `hc_region` VALUES ('652929', '652900', '柯坪县', '2');
INSERT INTO `hc_region` VALUES ('653000', '650000', '克孜勒苏柯尔克孜自治州', '1');
INSERT INTO `hc_region` VALUES ('653001', '653000', '阿图什市', '2');
INSERT INTO `hc_region` VALUES ('653022', '653000', '阿克陶县', '2');
INSERT INTO `hc_region` VALUES ('653023', '653000', '阿合奇县', '2');
INSERT INTO `hc_region` VALUES ('653024', '653000', '乌恰县', '2');
INSERT INTO `hc_region` VALUES ('653100', '650000', '喀什地区', '1');
INSERT INTO `hc_region` VALUES ('653101', '653100', '喀什市', '2');
INSERT INTO `hc_region` VALUES ('653121', '653100', '疏附县', '2');
INSERT INTO `hc_region` VALUES ('653122', '653100', '疏勒县', '2');
INSERT INTO `hc_region` VALUES ('653123', '653100', '英吉沙县', '2');
INSERT INTO `hc_region` VALUES ('653124', '653100', '泽普县', '2');
INSERT INTO `hc_region` VALUES ('653125', '653100', '莎车县', '2');
INSERT INTO `hc_region` VALUES ('653126', '653100', '叶城县', '2');
INSERT INTO `hc_region` VALUES ('653127', '653100', '麦盖提县', '2');
INSERT INTO `hc_region` VALUES ('653128', '653100', '岳普湖县', '2');
INSERT INTO `hc_region` VALUES ('653129', '653100', '伽师县', '2');
INSERT INTO `hc_region` VALUES ('653130', '653100', '巴楚县', '2');
INSERT INTO `hc_region` VALUES ('653131', '653100', '塔什库尔干塔吉克自治县', '2');
INSERT INTO `hc_region` VALUES ('653200', '650000', '和田地区', '1');
INSERT INTO `hc_region` VALUES ('653201', '653200', '和田市', '2');
INSERT INTO `hc_region` VALUES ('653221', '653200', '和田县', '2');
INSERT INTO `hc_region` VALUES ('653222', '653200', '墨玉县', '2');
INSERT INTO `hc_region` VALUES ('653223', '653200', '皮山县', '2');
INSERT INTO `hc_region` VALUES ('653224', '653200', '洛浦县', '2');
INSERT INTO `hc_region` VALUES ('653225', '653200', '策勒县', '2');
INSERT INTO `hc_region` VALUES ('653226', '653200', '于田县', '2');
INSERT INTO `hc_region` VALUES ('653227', '653200', '民丰县', '2');
INSERT INTO `hc_region` VALUES ('654000', '650000', '伊犁哈萨克自治州', '1');
INSERT INTO `hc_region` VALUES ('654002', '654000', '伊宁市', '2');
INSERT INTO `hc_region` VALUES ('654003', '654000', '奎屯市', '2');
INSERT INTO `hc_region` VALUES ('654021', '654000', '伊宁县', '2');
INSERT INTO `hc_region` VALUES ('654022', '654000', '察布查尔锡伯自治县', '2');
INSERT INTO `hc_region` VALUES ('654023', '654000', '霍城县', '2');
INSERT INTO `hc_region` VALUES ('654024', '654000', '巩留县', '2');
INSERT INTO `hc_region` VALUES ('654025', '654000', '新源县', '2');
INSERT INTO `hc_region` VALUES ('654026', '654000', '昭苏县', '2');
INSERT INTO `hc_region` VALUES ('654027', '654000', '特克斯县', '2');
INSERT INTO `hc_region` VALUES ('654028', '654000', '尼勒克县', '2');
INSERT INTO `hc_region` VALUES ('654200', '650000', '塔城地区', '1');
INSERT INTO `hc_region` VALUES ('654201', '654200', '塔城市', '2');
INSERT INTO `hc_region` VALUES ('654202', '654200', '乌苏市', '2');
INSERT INTO `hc_region` VALUES ('654221', '654200', '额敏县', '2');
INSERT INTO `hc_region` VALUES ('654223', '654200', '沙湾县', '2');
INSERT INTO `hc_region` VALUES ('654224', '654200', '托里县', '2');
INSERT INTO `hc_region` VALUES ('654225', '654200', '裕民县', '2');
INSERT INTO `hc_region` VALUES ('654226', '654200', '和布克赛尔蒙古自治县', '2');
INSERT INTO `hc_region` VALUES ('654300', '650000', '阿勒泰地区', '1');
INSERT INTO `hc_region` VALUES ('654301', '654300', '阿勒泰市', '2');
INSERT INTO `hc_region` VALUES ('654321', '654300', '布尔津县', '2');
INSERT INTO `hc_region` VALUES ('654322', '654300', '富蕴县', '2');
INSERT INTO `hc_region` VALUES ('654323', '654300', '福海县', '2');
INSERT INTO `hc_region` VALUES ('654324', '654300', '哈巴河县', '2');
INSERT INTO `hc_region` VALUES ('654325', '654300', '青河县', '2');
INSERT INTO `hc_region` VALUES ('654326', '654300', '吉木乃县', '2');
INSERT INTO `hc_region` VALUES ('659000', '650000', '自治区直辖县级行政区划', '1');
INSERT INTO `hc_region` VALUES ('659001', '659000', '石河子市', '2');
INSERT INTO `hc_region` VALUES ('659002', '659000', '阿拉尔市', '2');
INSERT INTO `hc_region` VALUES ('659003', '659000', '图木舒克市', '2');
INSERT INTO `hc_region` VALUES ('659004', '659000', '五家渠市', '2');
INSERT INTO `hc_region` VALUES ('710000', '0', '台湾省', '0');
INSERT INTO `hc_region` VALUES ('810000', '0', '香港特别行政区', '0');

-- ----------------------------
-- Table structure for hc_session
-- ----------------------------
DROP TABLE IF EXISTS `hc_session`;
CREATE TABLE `hc_session` (
  `session_id` varchar(255) NOT NULL,
  `session_expire` int(11) NOT NULL,
  `session_data` blob,
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='session表';

-- ----------------------------
-- Records of hc_session
-- ----------------------------
INSERT INTO `hc_session` VALUES ('usek57g9ro0pevu81ov8kd2bk7', '1445419693', '');
INSERT INTO `hc_session` VALUES ('k315ucv5c51d4pqqfosp3p48q5', '1445327682', 0x62616B75726C7C733A32383A224C306C305A5730766157356D627939705A43387A4E69356F64473173223B64326439373763353834343432373164396337383031383765393366383065357C613A323A7B733A31313A227665726966795F636F6465223B733A33323A223239363965383337313031396337353365653731343665616531346231373466223B733A31313A227665726966795F74696D65223B693A313434343732303436343B7D);
INSERT INTO `hc_session` VALUES ('deftd7n3lljo00347132vck5b6', '1445323250', '');
INSERT INTO `hc_session` VALUES ('m4tb9p29np7v8bnk0pjsjkvj04', '1445241683', 0x64326439373763353834343432373164396337383031383765393366383065357C613A323A7B733A31313A227665726966795F636F6465223B733A33323A223633386438376636366139393537316239663765356438376462333833383966223B733A31313A227665726966795F74696D65223B693A313434343633363733363B7D);
INSERT INTO `hc_session` VALUES ('di7rtgmnkmfj452qb0lndf7td3', '1445432600', 0x61646D696E5F7569647C733A313A2231223B61646D696E5F757365726E616D657C733A353A2261646D696E223B61646D696E5F6E69636B6E616D657C733A31353A22E8B685E7BAA7E7AEA1E79086E5913F3B61646D696E5F6C6F67696E5F6B65797C733A33323A223432383434633463333639313132623063353266356236326166383631623366223B62616B75726C7C733A33363A224C306876625755765358526C62533970626D5A764C326C6B4C7A4D324C6D68306257773D223B757365727C613A333A7B733A333A2275696E223B733A313A2231223B733A353A2270686F6E65223B733A31313A223135393730303939343835223B733A333A226B6579223B733A33323A223037323161326338306534313437616466363438646466383361663435353833223B7D736D73636F64657C693A33303135393B736D7374696D657C693A313434343735313933373B454E565F505245496E7374616C6C5F7C613A313A7B733A393A2264625F636F6E666967223B613A363A7B733A373A2244425F54595045223B733A353A226D7973716C223B733A373A2244425F484F5354223B733A393A223132372E302E302E31223B733A373A2244425F4E414D45223B733A363A227A6D6C636D73223B733A373A2244425F55534552223B733A343A22726F6F74223B733A363A2244425F505744223B733A303A22223B733A393A2244425F505245464958223B733A343A227A6D6C5F223B7D7D);
INSERT INTO `hc_session` VALUES ('eu8s8vlornilv2b4tj1ktrtt20', '1445333605', 0x62616B75726C7C733A32383A224C306C305A5730766157356D627939705A43387A4D69356F64473173223B757365727C613A333A7B733A333A2275696E223B733A313A2231223B733A353A2270686F6E65223B733A31313A223135393730303939343835223B733A333A226B6579223B733A33323A226239656162316566636133616266393763636462353634643061343738393134223B7D);
INSERT INTO `hc_session` VALUES ('dkcae321m53a007nurnc0gkor0', '1445432900', 0x736D73636F64657C693A35363730393B757365727C613A333A7B733A333A2275696E223B733A313A2233223B733A353A2270686F6E65223B733A31313A223135373730373937323630223B733A333A226B6579223B733A33323A223533643033666564643333306264383365323935393031336139373531613563223B7D61646D696E5F7569647C733A313A2239223B61646D696E5F757365726E616D657C733A343A22616D696E223B61646D696E5F6E69636B6E616D657C733A343A22616D696E223B61646D696E5F6C6F67696E5F6B65797C733A33323A223535633931353066333532343536356236333532313561383864393464303434223B);
INSERT INTO `hc_session` VALUES ('2nas4qk79r2tejg694k65mioj3', '1445310892', '');
INSERT INTO `hc_session` VALUES ('s8cabdt0vcusq39uprms1e7f01', '1445310912', '');
INSERT INTO `hc_session` VALUES ('k8bcjlgr6lpil24rpk5lhkn364', '1445310927', '');
INSERT INTO `hc_session` VALUES ('n6esq9updd8u473c6lmquubih6', '1445310893', 0x64326439373763353834343432373164396337383031383765393366383065357C613A323A7B733A31313A227665726966795F636F6465223B733A33323A226665323832366461646231373435653532303765373066356537643437343834223B733A31313A227665726966795F74696D65223B693A313434343730363039333B7D);
INSERT INTO `hc_session` VALUES ('qsgi0t85ri1499ui3cuc0pujj6', '1445415267', 0x757365727C613A323A7B733A333A2275696E223B733A313A2231223B733A353A2270686F6E65223B733A31313A223135393730303939343835223B7D61646D696E5F7569647C733A313A2231223B61646D696E5F757365726E616D657C733A353A2261646D696E223B61646D696E5F6E69636B6E616D657C733A31353A22E8B685E7BAA7E7AEA1E79086E5913F3B61646D696E5F6C6F67696E5F6B65797C733A33323A223432383434633463333639313132623063353266356236326166383631623366223B);
INSERT INTO `hc_session` VALUES ('vd9cg63o25kcpvp9mqhtp33hh7', '1445333926', 0x62616B75726C7C733A32383A224C306C305A5730766157356D627939705A43387A4D69356F64473173223B757365727C613A333A7B733A333A2275696E223B733A313A2231223B733A353A2270686F6E65223B733A31313A223135393730303939343835223B733A333A226B6579223B733A33323A223436343364326537653565343166643332353261646236643962393761393638223B7D);
INSERT INTO `hc_session` VALUES ('5sv1k36pm2b92cg3iribtehpq4', '1445337073', '');
INSERT INTO `hc_session` VALUES ('neetcoi4c9teh4pnaphl67hv82', '1445337116', '');
INSERT INTO `hc_session` VALUES ('hnhbehk6agbk6qfphg20arrfp5', '1445246607', 0x61646D696E5F7569647C733A313A2231223B61646D696E5F757365726E616D657C733A353A2261646D696E223B61646D696E5F6C6F67696E5F6B65797C733A33323A223432383434633463333639313132623063353266356236326166383631623366223B736D73636F64657C693A34393931333B736D7374696D657C693A313434343337353634393B62616B75726C7C733A32383A224C306C305A5730766157356D627939705A43387A4D69356F64473173223B);
INSERT INTO `hc_session` VALUES ('ajrc3r3jnqd6jemff17i48nn02', '1445313080', '');
INSERT INTO `hc_session` VALUES ('jnhad5bnnrp2cdi1klk9idf1n3', '1445313149', '');
INSERT INTO `hc_session` VALUES ('konqr02krlbbn13ddcl2s5n1d3', '1445313625', '');
INSERT INTO `hc_session` VALUES ('hjqabk3n8ggjlprktcierhcb15', '1445484360', 0x62616B75726C7C733A32383A224C306C305A5730766157356D627939705A43387A4E79356F64473173223B757365727C613A333A7B733A333A2275696E223B733A313A2232223B733A353A2270686F6E65223B733A31313A223133373636333235373532223B733A333A226B6579223B733A33323A223939333232303335353761646136323531616538333439363061623937376262223B7D61646D696E5F7569647C733A313A2231223B61646D696E5F757365726E616D657C733A353A2261646D696E223B61646D696E5F6E69636B6E616D657C733A31353A22E8B685E7BAA7E7AEA1E79086E5913F3B61646D696E5F6C6F67696E5F6B65797C733A33323A223432383434633463333639313132623063353266356236326166383631623366223B);
INSERT INTO `hc_session` VALUES ('58sf200vpg1cjocu968d5c21h6', '1445313051', '');
INSERT INTO `hc_session` VALUES ('qkt44g30bv53q10vj7ht1sm896', '1445245826', 0x61646D696E5F7569647C733A313A2231223B61646D696E5F757365726E616D657C733A353A2261646D696E223B61646D696E5F6E69636B6E616D657C733A31353A22E8B685E7BAA7E7AEA1E79086E5913F3B61646D696E5F6C6F67696E5F6B65797C733A33323A223432383434633463333639313132623063353266356236326166383631623366223B757365727C613A323A7B733A333A2275696E223B733A313A2231223B733A353A2270686F6E65223B733A31313A223135393730303939343835223B7D736D73636F64657C693A32363732363B736D7374696D657C693A313434343633343539303B);
INSERT INTO `hc_session` VALUES ('ha3ht2fkvt1qofqh3o4blp3k24', '1445337138', 0x757365727C613A333A7B733A333A2275696E223B733A313A2233223B733A353A2270686F6E65223B733A31313A223135373730373937323630223B733A333A226B6579223B733A33323A223239333538336262356562646539363032376538653033613031356130663636223B7D);
INSERT INTO `hc_session` VALUES ('scce59cjvduka3i9dl9bge4vq3', '1445310989', 0x64326439373763353834343432373164396337383031383765393366383065357C613A323A7B733A31313A227665726966795F636F6465223B733A33323A223839616239623331613137633361396437616364666264666133623431666166223B733A31313A227665726966795F74696D65223B693A313434343730363138383B7D);
INSERT INTO `hc_session` VALUES ('b135g5bb50766p0g0o7m1nahd5', '1444885458', 0x757365727C613A323A7B733A333A2275696E223B733A313A2232223B733A353A2270686F6E65223B733A31313A223133373636333235373532223B7D);
INSERT INTO `hc_session` VALUES ('9kht4trrsd4e0dn8fcfo6eklm7', '1445310934', '');
INSERT INTO `hc_session` VALUES ('j9a3psodduc4sj5kfp7bvdr273', '1445310940', '');
INSERT INTO `hc_session` VALUES ('8rvt9oru1ddr7bdjq9odg7jm21', '1445310974', '');
INSERT INTO `hc_session` VALUES ('dkslubp5m1n3off00mjtbmrtr3', '1445310974', '');
INSERT INTO `hc_session` VALUES ('7o5al7dnqudi52m618011fmhr3', '1445432863', '');
INSERT INTO `hc_session` VALUES ('n8eeoutefb1p6qarlcnhin5lj5', '1445432863', '');
INSERT INTO `hc_session` VALUES ('5i9u99fhicvp198orrnlvb7m64', '1445432898', '');

-- ----------------------------
-- Table structure for hc_tags
-- ----------------------------
DROP TABLE IF EXISTS `hc_tags`;
CREATE TABLE `hc_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='项目标签表';

-- ----------------------------
-- Records of hc_tags
-- ----------------------------
INSERT INTO `hc_tags` VALUES ('1', '创业', '1');
INSERT INTO `hc_tags` VALUES ('2', '创新', '1');
INSERT INTO `hc_tags` VALUES ('3', '设计', '1');
INSERT INTO `hc_tags` VALUES ('4', '创意', '1');

-- ----------------------------
-- Table structure for hc_user
-- ----------------------------
DROP TABLE IF EXISTS `hc_user`;
CREATE TABLE `hc_user` (
  `uin` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) DEFAULT '0' COMMENT '手机号',
  `pwd` varchar(64) DEFAULT '0' COMMENT '密码',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `points` decimal(10,0) DEFAULT '0',
  `name` varchar(255) DEFAULT '0' COMMENT '昵称',
  `age` int(11) DEFAULT '0' COMMENT '年龄',
  `sex` tinyint(2) DEFAULT '0' COMMENT '性别',
  `province` int(11) DEFAULT '0' COMMENT '省份',
  `city` int(11) DEFAULT '0' COMMENT '城市',
  `area` int(11) DEFAULT '0' COMMENT '地区',
  `address` varchar(255) DEFAULT '0' COMMENT '详细地址',
  `header` varchar(255) DEFAULT '0' COMMENT '头像',
  `description` text COMMENT '个人描述',
  `user_status` int(11) DEFAULT '1' COMMENT '用户状态，0：禁用，1：启用',
  `weight` int(11) DEFAULT NULL COMMENT '用户权重设置 1-5 ',
  PRIMARY KEY (`uin`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of hc_user
-- ----------------------------
INSERT INTO `hc_user` VALUES ('1', '13766325752', '6a566db32e06296a2ddedd7a1af2d7ce', '1444962843', '2362.31', '0', '李亮', '25', '1', '420000', '420100', '420106', '海外人才大楼', '/uploads//20151127/happychou_1448591401925.jpg', '老刀把子是个好人啊，我们都很喜欢他', '1', '1');
INSERT INTO `hc_user` VALUES ('2', '15970099486', '2a20c9564fc310cb9bfc2f5400307ae7', '1444966680', '0.00', '0', '预感', '30', '1', '360000', '360700', '360702', '水南', '/uploads//20151127/happychou_1448591386216.jpg', null, '1', '4');
INSERT INTO `hc_user` VALUES ('3', '12312312312', '4297f44b13955235245b2497399d7a93', '1445496739', '6477322.93', '0', '老板', '23', '1', '420000', '420100', '420106', '海外人才大楼', '/uploads//20151127/happychou_1448591173963.jpg', '海源资本 总经理 合伙人；O2O 母婴 消费 健康 IOT等领域的种子期到A轮投资； sam@haiyuanvc.com', '1', '3');
INSERT INTO `hc_user` VALUES ('4', '18771927650', '4297f44b13955235245b2497399d7a93', '1445496739', '1403657.40', '0', '张亮', '31', '1', '420000', '420100', '420100', '海外人才大楼', '/uploads//20151127/happychou_1448591203910.png', '一个投资总监', '1', '4');
INSERT INTO `hc_user` VALUES ('5', '18111111111', 'e10adc3949ba59abbe56e057f20f883e', null, '4000000.00', '0', '张亮', '31', '1', '420000', '420100', '420100', '海外人才大楼', '/uploads//20151127/happychou_1448591296940.jpg', '一个投资总监', '1', '4');
INSERT INTO `hc_user` VALUES ('10', '18207135869', '4297f44b13955235245b2497399d7a93', '1449034395', '472640.41', '0', '周海天', '22', '1', '120000', '120100', '120102', '海外人才大楼', '/uploads/10/20151211/happychou_1449820708558.jpg', '天气真是干燥啊1231231', '1', '3');
INSERT INTO `hc_user` VALUES ('7', '12312312312', '4297f44b13955235245b2497399d7a93', '1449041390', '0.00', '0', '石涵禹', '0', '0', '0', '0', '0', '0', '/uploads/10/20151203/happychou_1449127968360.jpg', null, '1', '2');
INSERT INTO `hc_user` VALUES ('8', '12312345645', '4297f44b13955235245b2497399d7a93', '1449041471', '0.00', '0', '王雅', '0', '0', '0', '0', '0', '0', '/uploads/10/20151203/happychou_1449127968360.jpg', null, '1', '3');
INSERT INTO `hc_user` VALUES ('13', '12345678998', '4297f44b13955235245b2497399d7a93', '1449041596', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '/uploads/10/20151203/happychou_1449127968360.jpg', null, '1', '4');
INSERT INTO `hc_user` VALUES ('14', '12345678985', '4297f44b13955235245b2497399d7a93', '1449041619', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '4');
INSERT INTO `hc_user` VALUES ('15', '18999999999', 'e10adc3949ba59abbe56e057f20f883e', '1449044631', '4000000.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', '5');
INSERT INTO `hc_user` VALUES ('16', '18612621819', 'e10adc3949ba59abbe56e057f20f883e', '1449077438', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '5');
INSERT INTO `hc_user` VALUES ('17', '17410741074', '4297f44b13955235245b2497399d7a93', '1450150695', '0.00', '0', '大红灯笼高高照', '55', '1', '130000', '130400', '130423', '0', '/uploads/17/20151215/happychou_1450151614883.jpg', '我就是我 颜色不一样的烟火', '1', null);
INSERT INTO `hc_user` VALUES ('18', '13816859965', '535f6faba28353944b57e1699a87d97c', '1450687629', '0.00', '0', 'Barry', '35', '1', '420000', '420100', '0', '0', '/uploads/18/20151221/happychou_1450689246738.jpg', null, '1', null);
INSERT INTO `hc_user` VALUES ('19', '17777777777', '4297f44b13955235245b2497399d7a93', '1450689611', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', null);
INSERT INTO `hc_user` VALUES ('20', '12222222222', '4297f44b13955235245b2497399d7a93', '1450690155', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', null);
INSERT INTO `hc_user` VALUES ('21', '12222222223', '4297f44b13955235245b2497399d7a93', '1450690212', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', null);
INSERT INTO `hc_user` VALUES ('22', '12323232323', '4297f44b13955235245b2497399d7a93', '1450690427', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', null);
INSERT INTO `hc_user` VALUES ('23', '13434343434', 'efe6398127928f1b2e9ef3207fb82663', '1450690520', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', null);
INSERT INTO `hc_user` VALUES ('24', '14564564564', 'efe6398127928f1b2e9ef3207fb82663', '1450690712', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', null);
INSERT INTO `hc_user` VALUES ('25', '13349943781', '4297f44b13955235245b2497399d7a93', '1452499763', '0.00', '0', '酱油2', '23', '1', '370000', '370100', '370101', '0', '/uploads/25/20160111/happychou_1452499822520.jpg', '-9=90', '1', null);
INSERT INTO `hc_user` VALUES ('26', '13910996308', '4297f44b13955235245b2497399d7a93', '1452690022', '0.00', '0', '123', '0', '1', '430000', '430100', '430102', '0', '/uploads/26/20160113/happychou_1452690234743.jpg', '123123', '1', null);
INSERT INTO `hc_user` VALUES ('27', '12345678912', '4297f44b13955235245b2497399d7a93', '1453267727', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', null);
INSERT INTO `hc_user` VALUES ('28', '18627099898', 'e10adc3949ba59abbe56e057f20f883e', '1454315915', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, '1', null);

-- ----------------------------
-- Table structure for hc_user_attest
-- ----------------------------
DROP TABLE IF EXISTS `hc_user_attest`;
CREATE TABLE `hc_user_attest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uin` int(11) DEFAULT '0' COMMENT '用户id',
  `true_header` varchar(255) DEFAULT NULL COMMENT '真实头像',
  `true_name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `company` varchar(255) DEFAULT NULL COMMENT '公司',
  `job` varchar(255) DEFAULT NULL COMMENT '职位',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `weixin` varchar(255) DEFAULT NULL COMMENT '微信号',
  `card_positive` varchar(255) DEFAULT '0' COMMENT '身份证正面',
  `card_negative` varchar(255) DEFAULT '0' COMMENT '身份证反面',
  `business_card` varchar(255) DEFAULT NULL COMMENT '名片',
  `shouru_pic` varchar(255) DEFAULT NULL COMMENT '收入证明',
  `jinrong_pic` varchar(255) DEFAULT NULL COMMENT '金融资产证明',
  `gudingzc_pic` varchar(255) DEFAULT NULL COMMENT '固定资产证明',
  `touzianli_pic` varchar(255) DEFAULT NULL COMMENT '投资案例证明',
  `jigou_pic` varchar(255) DEFAULT NULL COMMENT '机构资产证明',
  `jlr_pic` varchar(255) DEFAULT NULL COMMENT '机构净利润证明',
  `shijiao_pic` varchar(255) DEFAULT NULL COMMENT '实缴注册资本证明',
  `type` tinyint(5) DEFAULT '1' COMMENT '认证类型：1，实名认证，2：投资人认证',
  `attest_type` tinyint(5) DEFAULT '1' COMMENT '1：机构投资人，2：经验投资人，3：一般投资人',
  `status` tinyint(1) DEFAULT '0' COMMENT '实名认证状态，0待审核 1已审核 2拒绝',
  `attest_status` tinyint(1) DEFAULT '0' COMMENT '投资人认证状态，0待审核，1：已审核，2：拒绝',
  `time` int(10) DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='会员认证资料';

-- ----------------------------
-- Records of hc_user_attest
-- ----------------------------
INSERT INTO `hc_user_attest` VALUES ('1', '1', '/uploads/4/20151119/happychou_1447918681737.jpg', '酱油', '海天酱油', '打酱油', '123123213', '123123123', '/uploads/2/20151016/zmlcms_1444967423617.jpg', '/uploads/2/20151016/zmlcms_1444967425622.jpg', null, null, null, null, null, null, null, null, '1', '1', '1', '1', '1444967427');
INSERT INTO `hc_user_attest` VALUES ('5', '4', '/uploads/4/20151119/happychou_1447918681737.jpg', '张亮', '大不列颠诺维斯基', '挖煤的', '123123', '', '/uploads/4/20151119/happychou_1447908424465.jpg', '/uploads/4/20151120/happychou_1448002840864.jpg', '/uploads/4/20151119/happychou_1447908426971.jpg', '/uploads/4/20151119/happychou_1447907629851.jpg', null, null, null, null, null, null, '2', '3', '1', '1', '1448504177');
INSERT INTO `hc_user_attest` VALUES ('4', '3', '/uploads/3/20151213/happychou_1450009474804.jpg', '老板', '中地云创', '程序员', '798401789@qq.com', 'datou_wan', '/uploads/3/20151119/happychou_1447907945213.jpg', '/uploads/3/20151120/happychou_1448004296529.jpg', '/uploads/3/20151119/happychou_1447907950543.jpg', null, null, null, '/uploads/3/20151119/happychou_1447908601701.jpg', '/uploads/3/20151213/happychou_1450009786126.jpg', '/uploads/3/20151213/happychou_1450009720814.jpg', '/uploads/3/20151213/happychou_1450009781246.jpg', '2', '1', '1', '1', '1450010311');
INSERT INTO `hc_user_attest` VALUES ('3', '5', '/uploads/3/20151127/happychou_1448591996115.jpg', '哈哈', '中地云创', '程序员', null, null, '0', '0', null, null, null, null, null, null, null, null, '2', '1', '1', '1', '1448591999');
INSERT INTO `hc_user_attest` VALUES ('8', '10', '/uploads/10/20151212/happychou_1449885691226.jpg', '周海天', '123', '123', '123', '123', '/uploads/10/20151211/happychou_1449821685800.jpg', '/uploads/10/20151211/happychou_1449821693875.jpg', '/uploads/10/20151211/happychou_1449824154380.jpg', '/uploads/10/20151212/happychou_1449885096888.jpg', '/uploads/10/20151212/happychou_1449885101209.jpg', '/uploads/10/20151212/happychou_1449885104226.jpg', '/uploads/10/20151212/happychou_1449885514341.jpg', null, null, null, '2', '3', '1', '1', '1449885697');
INSERT INTO `hc_user_attest` VALUES ('9', '17', '/uploads/17/20151215/happychou_1450151614883.jpg', '大红灯笼高高照', '123', '123', '123', '123', '/uploads/17/20151215/happychou_1450164104198.jpg', '/uploads/17/20151215/happychou_1450164107324.jpg', '/uploads/17/20151215/happychou_1450171266412.jpg', '/uploads/17/20151215/happychou_1450171271977.jpg', '/uploads/17/20151215/happychou_1450171274677.jpg', '/uploads/17/20151215/happychou_1450171277309.jpg', null, null, null, null, '2', '3', '1', '1', '1450171278');
INSERT INTO `hc_user_attest` VALUES ('10', '25', '/uploads/25/20160111/happychou_1452499822520.jpg', '酱油2', null, null, null, null, '/uploads/25/20160120/happychou_1453267668346.png', '/uploads/25/20160111/happychou_1452499976276.JPG', '/uploads/25/20160111/happychou_1452500102705.jpg', null, null, null, null, null, null, null, '1', '1', '1', '0', '1452499978');
INSERT INTO `hc_user_attest` VALUES ('11', '26', '/uploads/26/20160113/happychou_1452690234743.jpg', '123', null, null, null, null, '/uploads/26/20160113/happychou_1452690242722.jpg', '/uploads/26/20160113/happychou_1452690245788.jpg', null, null, null, null, null, null, null, null, '1', '1', '1', '0', '1452690284');
INSERT INTO `hc_user_attest` VALUES ('12', '27', '/uploads/27/20160120/happychou_1453268067156.jpg', '0', '123123', '123123', '123123', '123123', '/uploads/27/20160120/happychou_1453267790176.jpg', '/uploads/27/20160120/happychou_1453267765454.png', '/uploads/27/20160120/happychou_1453268103717.jpg', '/uploads/27/20160120/happychou_1453268111649.png', '/uploads/27/20160120/happychou_1453268113211.jpg', '/uploads/27/20160120/happychou_1453268116128.jpg', null, null, null, null, '2', '3', '1', '2', '1453268279');

-- ----------------------------
-- Table structure for hc_user_bank
-- ----------------------------
DROP TABLE IF EXISTS `hc_user_bank`;
CREATE TABLE `hc_user_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uin` int(11) DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) DEFAULT '0' COMMENT '真实姓名',
  `card` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT '0' COMMENT '开户行',
  `type` varchar(255) DEFAULT '0' COMMENT '卡类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户银行卡表';

-- ----------------------------
-- Records of hc_user_bank
-- ----------------------------
INSERT INTO `hc_user_bank` VALUES ('1', '1', '黄日', '622220215000820559', '江西赣州市开发区支行', '工商银行-准贷记卡(商普)-准贷记卡');
INSERT INTO `hc_user_bank` VALUES ('2', '3', '万源', '621700284400554', '中国建设银行股份有限公司武汉珞南支行', '建设银行');

-- ----------------------------
-- Table structure for hc_user_category
-- ----------------------------
DROP TABLE IF EXISTS `hc_user_category`;
CREATE TABLE `hc_user_category` (
  `id` int(11) DEFAULT NULL COMMENT '投资者类别id',
  `name` varchar(255) DEFAULT NULL COMMENT '投资者类别名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_user_category
-- ----------------------------
INSERT INTO `hc_user_category` VALUES ('1', '机构投资人');
INSERT INTO `hc_user_category` VALUES ('2', '经验投资人');
INSERT INTO `hc_user_category` VALUES ('3', '一般投资人');

-- ----------------------------
-- Table structure for hc_user_details
-- ----------------------------
DROP TABLE IF EXISTS `hc_user_details`;
CREATE TABLE `hc_user_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uin` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `business_ideas` varchar(400) DEFAULT NULL COMMENT '创业理念',
  `skills` varchar(400) DEFAULT NULL COMMENT '擅长技能',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户详细信息表';

-- ----------------------------
-- Records of hc_user_details
-- ----------------------------
INSERT INTO `hc_user_details` VALUES ('1', '3', '创业就是一种生活体验，是一种生活方式而已，跟其他的工作并没有太大区别', '唱歌，跳舞，打酱油');

-- ----------------------------
-- Table structure for hc_user_do_log
-- ----------------------------
DROP TABLE IF EXISTS `hc_user_do_log`;
CREATE TABLE `hc_user_do_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT '0',
  `time` int(11) DEFAULT '0',
  `uin` int(11) DEFAULT '0',
  `ip` varchar(255) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0' COMMENT '未读0已读1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='会员操作日志表';

-- ----------------------------
-- Records of hc_user_do_log
-- ----------------------------
INSERT INTO `hc_user_do_log` VALUES ('1', '您的项目状态已变更!', '1444963641', '1', '127.0.0.1', '1');
INSERT INTO `hc_user_do_log` VALUES ('2', '您的项目进度已变更!', '1444963992', '1', '127.0.0.1', '1');
INSERT INTO `hc_user_do_log` VALUES ('3', '您的项目状态已变更!', '1444965235', '1', '127.0.0.1', '1');
INSERT INTO `hc_user_do_log` VALUES ('4', '您的项目进度已变更!', '1444967087', '1', '127.0.0.1', '1');
INSERT INTO `hc_user_do_log` VALUES ('5', '您的项目进度已变更!', '1444967093', '1', '127.0.0.1', '1');
INSERT INTO `hc_user_do_log` VALUES ('6', '您的项目进度已变更!', '1444967103', '1', '127.0.0.1', '1');
INSERT INTO `hc_user_do_log` VALUES ('7', '您的项目进度已变更!', '1444967344', '1', '127.0.0.1', '1');
INSERT INTO `hc_user_do_log` VALUES ('8', '您的身份信息已经提交！', '1444967427', '2', '127.0.0.1', '1');
INSERT INTO `hc_user_do_log` VALUES ('9', '您的项目进度已变更!', '1444967776', '1', '127.0.0.1', '1');
INSERT INTO `hc_user_do_log` VALUES ('10', '您的问题已经提交！', '1445065579', '1', '127.0.0.1', '1');
INSERT INTO `hc_user_do_log` VALUES ('11', '您的项目收藏成功！', '1445066030', '1', '127.0.0.1', '1');
INSERT INTO `hc_user_do_log` VALUES ('12', '您的项目收藏成功！', '1445132188', '1', '127.0.0.1', '1');
INSERT INTO `hc_user_do_log` VALUES ('13', '您的项目进度已变更!', '1445132610', '1', '127.0.0.1', '1');
INSERT INTO `hc_user_do_log` VALUES ('14', '您的项目进度已变更!', '1445132617', '1', '127.0.0.1', '1');
INSERT INTO `hc_user_do_log` VALUES ('15', '您的项目进度已变更!', '1445132624', '1', '127.0.0.1', '1');
INSERT INTO `hc_user_do_log` VALUES ('16', '您的银行卡创建成功！', '1445139434', '1', '127.0.0.1', '1');
INSERT INTO `hc_user_do_log` VALUES ('17', '您的项目收藏成功！', '1445500333', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('18', '您的项目状态已变更!', '1446430173', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('19', '您的项目进度已变更!', '1446430182', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('20', '您的项目状态已变更!', '1446430339', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('21', '您的项目进度已变更!', '1446430348', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('22', '您的项目状态已变更!', '1446430463', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('23', '您的项目进度已变更!', '1446430468', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('24', '您的项目状态已变更!', '1446434224', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('25', '您的项目进度已变更!', '1446434229', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('26', '您的项目进度已变更!', '1446434236', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('27', '您的项目状态已变更!', '1446434306', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('28', '您的项目进度已变更!', '1446434311', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('29', '您的项目状态已变更!', '1446434389', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('30', '您的项目进度已变更!', '1446434394', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('31', '您的项目状态已变更!', '1446434462', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('32', '您的项目进度已变更!', '1446434469', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('33', '您的项目状态已变更!', '1446434619', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('34', '您的项目进度已变更!', '1446434624', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('35', '您的银行卡创建成功！', '1447044945', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('36', '您的项目状态已变更!', '1447126126', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('37', '您的项目进度已变更!', '1447139322', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('38', '您的项目收藏成功！', '1447143384', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('39', '您的项目状态已变更!', '1447207564', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('40', '您的项目状态已变更!', '1447208986', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('41', '您的项目进度已变更!', '1447208995', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('42', '您的项目进度已变更!', '1447233740', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('43', '您的项目状态已变更!', '1447405474', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('44', '您的项目状态已变更!', '1447642203', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('45', '您的项目进度已变更!', '1447642219', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('46', '您的项目收藏成功！', '1447665119', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('47', '您的项目进度已变更!', '1447721990', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('48', '您的项目进度已变更!', '1447722012', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('49', '您的项目进度已变更!', '1447722202', '1', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('50', '您的项目收藏成功！', '1447722371', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('51', '您的项目进度已变更!', '1447722907', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('52', '您的项目状态已变更!', '1447741800', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('53', '您的问题已经提交！', '1447988578', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('54', '您的问题已经提交！', '1447989158', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('55', '您的问题已经提交！', '1447995111', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('56', '您的项目收藏成功！', '1448419046', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('57', '您的项目收藏成功！', '1448433319', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('58', '您的项目收藏成功！', '1448521499', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('59', '您的项目收藏成功！', '1448521543', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('60', '您的项目收藏成功！', '1448521643', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('61', '您的项目收藏成功！', '1448522258', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('62', '您的项目收藏成功！', '1448522311', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('63', '您的项目收藏成功！', '1448522342', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('64', '您的项目收藏成功！', '1448522392', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('65', '您的项目收藏成功！', '1448522483', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('66', '您的项目收藏成功！', '1448522538', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('67', '您的项目收藏成功！', '1448522543', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('68', '您的项目收藏成功！', '1448522567', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('69', '您的项目收藏成功！', '1448522571', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('70', '您的项目收藏成功！', '1448528758', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('71', '您的项目收藏成功！', '1448585638', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('72', '您的项目收藏成功！', '1448585657', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('73', '您的项目收藏成功！', '1448586380', '3', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('74', '您的问题已经提交！', '1448601141', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('75', '您的项目状态已变更!', '1448854543', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('76', '您的项目进度已变更!', '1448854561', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('77', '您的项目收藏成功！', '1448857661', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('78', '您的项目进度已变更!', '1448858113', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('79', '您的项目进度已变更!', '1448858118', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('80', '您的项目进度已变更!', '1448858146', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('81', '您的问题已经提交！', '1448858346', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('82', '您的项目收藏成功！', '1448858525', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('83', '您的项目收藏成功！', '1449108285', '10', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('84', '您的项目收藏成功！', '1449215500', '10', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('85', '您的问题已经提交！', '1449221148', '10', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('86', '您的项目收藏成功！', '1449315977', '10', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('87', '您的问题已经提交！', '1449452711', '10', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('88', '您的项目收藏成功！', '1449563062', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('89', '您的问题已经提交！', '1449563394', '10', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('90', '您的问题已经提交！', '1449564369', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('91', '您的问题已经提交！', '1449565417', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('92', '您的项目收藏成功！', '1449629154', '10', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('93', '您的问题已经提交！', '1449641561', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('94', '您的项目进度已变更!', '1449649000', '1', '192.168.12.135', '0');
INSERT INTO `hc_user_do_log` VALUES ('95', '您的项目收藏成功！', '1449725003', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('96', '您的项目收藏成功！', '1449725033', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('97', '您的项目收藏成功！', '1449725076', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('98', '您的项目收藏成功！', '1449725246', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('99', '您的项目收藏成功！', '1449725292', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('100', '您的项目状态已变更!', '1449733441', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('101', '您的问题已经提交！', '1449735491', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('102', '您的身份信息已经提交！', '1449821768', '10', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('103', '您的项目收藏成功！', '1449825375', '4', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('104', '您的身份信息已经提交！', '1450164112', '17', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('105', '您的项目状态已变更!', '1450167912', '17', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('106', '您的项目进度已变更!', '1450167923', '17', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('107', '您的问题已经提交！', '1450176492', '10', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('108', '您的项目收藏成功！', '1450176620', '10', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('109', '您的项目收藏成功！', '1450867886', '10', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('110', '您的项目收藏成功！', '1451529610', '18', '192.168.12.104', '0');
INSERT INTO `hc_user_do_log` VALUES ('111', '您的项目收藏成功！', '1452138859', '3', '61.183.115.214', '1');
INSERT INTO `hc_user_do_log` VALUES ('112', '您的项目状态已变更!', '1452499048', '10', '192.168.12.101', '1');
INSERT INTO `hc_user_do_log` VALUES ('113', '您的项目收藏成功！', '1452499194', '10', '192.168.12.101', '1');
INSERT INTO `hc_user_do_log` VALUES ('114', '您的身份信息已经提交！', '1452499978', '25', '192.168.12.101', '1');
INSERT INTO `hc_user_do_log` VALUES ('115', '您的项目进度已变更!', '1452586556', '10', '0.0.0.0', '1');
INSERT INTO `hc_user_do_log` VALUES ('116', '您的身份信息已经提交！', '1452690284', '26', '192.168.12.101', '0');
INSERT INTO `hc_user_do_log` VALUES ('117', '您的项目状态已变更!', '1453120305', '3', '0.0.0.0', '0');
INSERT INTO `hc_user_do_log` VALUES ('118', '您的身份信息已经提交！', '1453267775', '27', '0.0.0.0', '1');

-- ----------------------------
-- Table structure for hc_user_education
-- ----------------------------
DROP TABLE IF EXISTS `hc_user_education`;
CREATE TABLE `hc_user_education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uin` int(11) NOT NULL DEFAULT '0' COMMENT '用户uin',
  `degree` varchar(50) DEFAULT NULL COMMENT '学历',
  `school` varchar(250) DEFAULT NULL COMMENT '学校',
  `major` varchar(250) DEFAULT NULL COMMENT '学院',
  `year` varchar(250) DEFAULT NULL COMMENT '毕业年份',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户教育表';

-- ----------------------------
-- Records of hc_user_education
-- ----------------------------
INSERT INTO `hc_user_education` VALUES ('3', '3', '123123', '武汉理工大学1', '123123', '2015');
INSERT INTO `hc_user_education` VALUES ('4', '3', '本科', '111武汉', '222', '2015');
INSERT INTO `hc_user_education` VALUES ('5', '17', '本科', '武汉理工大学', '管理学院', '2015');

-- ----------------------------
-- Table structure for hc_user_experience
-- ----------------------------
DROP TABLE IF EXISTS `hc_user_experience`;
CREATE TABLE `hc_user_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uin` int(11) NOT NULL DEFAULT '0' COMMENT '用户uin',
  `company` varchar(250) DEFAULT NULL COMMENT '公司名称',
  `title` varchar(250) DEFAULT NULL COMMENT '职位',
  `start_time` int(50) DEFAULT NULL COMMENT '开始时间',
  `end_time` int(50) DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户经历表';

-- ----------------------------
-- Records of hc_user_experience
-- ----------------------------
INSERT INTO `hc_user_experience` VALUES ('1', '3', '武汉源淞时代科技有限公司', '创始人', '1448264627', '1448264800');
INSERT INTO `hc_user_experience` VALUES ('11', '3', '周海天', '哈哈哈', '1450108800', '1450351854');
INSERT INTO `hc_user_experience` VALUES ('16', '18', '上海百事通信息技术有限公司', '', '1291564800', '1355328000');
INSERT INTO `hc_user_experience` VALUES ('15', '17', '武汉中地资源环境有限责任公司', '码农', '1450108800', '1452147631');

-- ----------------------------
-- Table structure for hc_user_feedback
-- ----------------------------
DROP TABLE IF EXISTS `hc_user_feedback`;
CREATE TABLE `hc_user_feedback` (
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `emails` varchar(255) DEFAULT NULL,
  `telenum` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `deal` int(5) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_user_feedback
-- ----------------------------
INSERT INTO `hc_user_feedback` VALUES ('1', '1', '2015-12-02 14:33:39', '1', '1', '1', '14', '1');
INSERT INTO `hc_user_feedback` VALUES ('1', '1', '2015-12-02 14:57:49', '1', '1', '1', '15', '1');
INSERT INTO `hc_user_feedback` VALUES ('1', '1', '2015-12-02 14:58:50', '1', '1', '1', '16', '1');
INSERT INTO `hc_user_feedback` VALUES ('2', '2', '2015-12-02 14:59:24', '2', '2', '2', '17', '1');
INSERT INTO `hc_user_feedback` VALUES ('123', '123', '2015-12-02 14:59:56', '123', '123', '123', '18', '1');
INSERT INTO `hc_user_feedback` VALUES ('12', '12', '2015-12-02 15:00:36', '12', '12', '12', '19', '1');
INSERT INTO `hc_user_feedback` VALUES ('123', '123', '2015-12-02 15:01:21', '123', '123', '123', '20', '1');
INSERT INTO `hc_user_feedback` VALUES ('123', '123', '2015-12-02 15:01:44', '123', '123', '123', '21', '1');
INSERT INTO `hc_user_feedback` VALUES ('123', '123', '2015-12-02 15:02:57', '123', '123', '123', '22', '1');
INSERT INTO `hc_user_feedback` VALUES ('什么鬼·', '请问', '2015-12-15 18:45:19', '123@111.com', '2147483647', '请问', '23', '1');
INSERT INTO `hc_user_feedback` VALUES ('123', '123123', '2015-12-16 17:17:33', '123@qq.com', '2147483647', '123', '24', '0');
INSERT INTO `hc_user_feedback` VALUES ('哈哈哈', '且轻松地vckicjiodsnvljDh', '2015-12-16 17:17:58', '123@qq.com', '2147483647', '123', '25', '0');
INSERT INTO `hc_user_feedback` VALUES ('', '', '2015-12-16 17:18:08', '', '0', '123123', '26', '0');
INSERT INTO `hc_user_feedback` VALUES ('123', '123123', '2015-12-16 17:43:12', '', '0', '123123', '27', '0');
INSERT INTO `hc_user_feedback` VALUES ('', '123123', '2015-12-16 17:50:50', '', '0', '123', '28', '0');
INSERT INTO `hc_user_feedback` VALUES ('', '123123', '2015-12-16 17:51:25', '', '0', '123', '29', '1');
INSERT INTO `hc_user_feedback` VALUES ('', '12312312', '2015-12-16 18:16:12', '', '0', '1231231', '30', '1');
INSERT INTO `hc_user_feedback` VALUES ('', '123123', '2015-12-16 18:16:23', '', '0', '123123', '31', '1');
INSERT INTO `hc_user_feedback` VALUES ('', '123123', '2015-12-16 18:20:17', '', '0', '123123', '32', '1');
INSERT INTO `hc_user_feedback` VALUES ('', '123123', '2015-12-16 20:21:40', '', '0', '123', '33', '1');
INSERT INTO `hc_user_feedback` VALUES ('123', '123123123', '2015-12-17 11:56:35', '', '0', '123', '34', '1');

-- ----------------------------
-- Table structure for hc_user_follow
-- ----------------------------
DROP TABLE IF EXISTS `hc_user_follow`;
CREATE TABLE `hc_user_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uin` int(11) DEFAULT NULL COMMENT '被关注uin',
  `fuin` int(11) DEFAULT NULL COMMENT '关注者uin',
  `time` int(11) DEFAULT NULL COMMENT '关注时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='用户关注表';

-- ----------------------------
-- Records of hc_user_follow
-- ----------------------------
INSERT INTO `hc_user_follow` VALUES ('2', '4', '3', '2147483647');
INSERT INTO `hc_user_follow` VALUES ('11', '3', '1', '1448521635');

-- ----------------------------
-- Table structure for hc_user_investment_case
-- ----------------------------
DROP TABLE IF EXISTS `hc_user_investment_case`;
CREATE TABLE `hc_user_investment_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uin` int(11) NOT NULL DEFAULT '0' COMMENT '用户uin',
  `img` varchar(250) NOT NULL DEFAULT '0' COMMENT '项目logo',
  `name` varchar(250) NOT NULL DEFAULT '0' COMMENT '项目名称',
  `role` varchar(250) NOT NULL DEFAULT '0' COMMENT '所处角色',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='投资人投资案例';

-- ----------------------------
-- Records of hc_user_investment_case
-- ----------------------------
INSERT INTO `hc_user_investment_case` VALUES ('1', '3', '/uploads/2/20151016/zmlcms_1444966713334.jpg', '三只松鼠', '投资人', '2147483647');
INSERT INTO `hc_user_investment_case` VALUES ('2', '3', '/uploads/2/20151016/zmlcms_1444966713334.jpg', '三只松鼠', '投资人', '2147483647');

-- ----------------------------
-- Table structure for hc_user_investment_ideas
-- ----------------------------
DROP TABLE IF EXISTS `hc_user_investment_ideas`;
CREATE TABLE `hc_user_investment_ideas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uin` int(11) NOT NULL DEFAULT '0' COMMENT '用户uin',
  `content` varchar(300) DEFAULT NULL COMMENT '投资理念',
  `siklled_in` varchar(300) DEFAULT NULL COMMENT '擅长的投资领域',
  `added_value` varchar(50) DEFAULT NULL COMMENT '提供的附加值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='投资人的投资理念';

-- ----------------------------
-- Records of hc_user_investment_ideas
-- ----------------------------
INSERT INTO `hc_user_investment_ideas` VALUES ('1', '3', '1231231', '12312', '3123123123123');
INSERT INTO `hc_user_investment_ideas` VALUES ('2', '17', '', '', '');

-- ----------------------------
-- Table structure for hc_user_investment_plan
-- ----------------------------
DROP TABLE IF EXISTS `hc_user_investment_plan`;
CREATE TABLE `hc_user_investment_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uin` int(11) NOT NULL DEFAULT '0' COMMENT '用户uin',
  `concern_area` varchar(300) DEFAULT NULL COMMENT '关注领域',
  `concern_city` varchar(300) DEFAULT NULL COMMENT '关注的城市',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '计划投资项目的数量',
  `max_limit` int(11) NOT NULL DEFAULT '0' COMMENT '单个项目投资上限，单位：万',
  `min_limit` int(11) NOT NULL DEFAULT '0' COMMENT '单个项目投资下限，单位：万',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='投资计划';

-- ----------------------------
-- Records of hc_user_investment_plan
-- ----------------------------
INSERT INTO `hc_user_investment_plan` VALUES ('1', '3', '[{\"id\":0,\"name\":\"\\u7535\\u5546\"},{\"id\":1,\"name\":\"P2P\"},{\"id\":2,\"name\":\"\\u98ce\\u9669\\u6295\\u8d44\"}]', '[{\"id\":0,\"city\":\"\\u6cb3\\u5317\\u7701 \\u77f3\\u5bb6\\u5e84\\u5e02\"}]', '123123', '12', '1');
INSERT INTO `hc_user_investment_plan` VALUES ('2', '17', '[{\"id\":0,\"name\":\"\\u4e92\\u8054\\u7f51\\u91d1\\u878d\"}]', '[{\"id\":0,\"city\":\"\\u5317\\u4eac\\u5e02 \\u53bf\"}]', '123', '12', '1');

-- ----------------------------
-- Table structure for hc_user_list
-- ----------------------------
DROP TABLE IF EXISTS `hc_user_list`;
CREATE TABLE `hc_user_list` (
  `id` int(11) DEFAULT NULL COMMENT '投资者省份id',
  `name` varchar(255) DEFAULT NULL COMMENT '投资者省份名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hc_user_list
-- ----------------------------
INSERT INTO `hc_user_list` VALUES ('110000', '北京');
INSERT INTO `hc_user_list` VALUES ('310000', '上海');
INSERT INTO `hc_user_list` VALUES ('120000', '天津');
INSERT INTO `hc_user_list` VALUES ('500000', '重庆');
INSERT INTO `hc_user_list` VALUES ('510000', '广东');
INSERT INTO `hc_user_list` VALUES ('420000', '湖北');
INSERT INTO `hc_user_list` VALUES ('440300', '深圳');
INSERT INTO `hc_user_list` VALUES ('320000', '江苏');
INSERT INTO `hc_user_list` VALUES ('330000', '浙江');
INSERT INTO `hc_user_list` VALUES ('510000', '四川');
INSERT INTO `hc_user_list` VALUES ('370000', '山东');
INSERT INTO `hc_user_list` VALUES ('350000', '福建');
INSERT INTO `hc_user_list` VALUES ('430000', '湖南');

-- ----------------------------
-- Table structure for hc_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `hc_user_login_log`;
CREATE TABLE `hc_user_login_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uin` int(11) DEFAULT NULL COMMENT '会员ID',
  `ip` varchar(15) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=220 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户登录记录表';

-- ----------------------------
-- Records of hc_user_login_log
-- ----------------------------
INSERT INTO `hc_user_login_log` VALUES ('1', '1', '127.0.0.1', '2d5525c74d61a8fcf6ecb9dbf4a752cc', '1444963210');
INSERT INTO `hc_user_login_log` VALUES ('2', '1', '127.0.0.1', '907202a7f3acd46c4529f3d950fcabc6', '1445137406');
INSERT INTO `hc_user_login_log` VALUES ('3', '1', '106.226.10.66', '957e47e3931da6f73f82cd0bd7763e1f', '1445160228');
INSERT INTO `hc_user_login_log` VALUES ('4', '1', '127.0.0.1', 'f13cda01bbb15cc02224f67bc86382bc', '1445162000');
INSERT INTO `hc_user_login_log` VALUES ('5', '1', '127.0.0.1', '5152f9c12177d41867b04b9ec220a855', '1445163088');
INSERT INTO `hc_user_login_log` VALUES ('6', '2', '127.0.0.1', '67d7af2affa6f258a968fcd682ba8946', '1445164208');
INSERT INTO `hc_user_login_log` VALUES ('7', '2', '127.0.0.1', 'b443194d614dd22788e1274049d3ff1d', '1445164287');
INSERT INTO `hc_user_login_log` VALUES ('8', '2', '127.0.0.1', '465c4f6b8d4a2120a450429d6d829c76', '1445182453');
INSERT INTO `hc_user_login_log` VALUES ('9', '1', '127.0.0.1', 'd0dd4520160102227fd3cc5673ad73c9', '1445185724');
INSERT INTO `hc_user_login_log` VALUES ('10', '3', '0.0.0.0', 'f0cdd24c3977491144bb59f62e81b2d1', '1445500322');
INSERT INTO `hc_user_login_log` VALUES ('11', '4', '0.0.0.0', 'a7bd0fd8158c4238872d9df6431170a7', '1446435762');
INSERT INTO `hc_user_login_log` VALUES ('12', '4', '0.0.0.0', 'a21cc1228199d537c34d3f166c6f3009', '1446519025');
INSERT INTO `hc_user_login_log` VALUES ('13', '4', '0.0.0.0', 'b423130f7cb7ef1eab7c77ef02e58a8d', '1446713022');
INSERT INTO `hc_user_login_log` VALUES ('14', '4', '0.0.0.0', '0e92c5f32a38f4db4734a7ec915eb152', '1446779883');
INSERT INTO `hc_user_login_log` VALUES ('15', '3', '0.0.0.0', 'b69479658d88e390477439ad84d47f9c', '1447041401');
INSERT INTO `hc_user_login_log` VALUES ('16', '3', '0.0.0.0', '355de33173ef19742029e4c8106ebb51', '1447125491');
INSERT INTO `hc_user_login_log` VALUES ('17', '3', '0.0.0.0', '65fbc42bd7c6bb99ab8469d75c3d3637', '1447207398');
INSERT INTO `hc_user_login_log` VALUES ('18', '3', '0.0.0.0', '1aaca2e4095e327efbce9cbb1383689e', '1447291432');
INSERT INTO `hc_user_login_log` VALUES ('19', '4', '0.0.0.0', '607f4cdedf9d83d21348cc0e735d9eca', '1447301528');
INSERT INTO `hc_user_login_log` VALUES ('20', '4', '0.0.0.0', '2e5425ecef7a8c3441cfa0cdd57f2a34', '1447314034');
INSERT INTO `hc_user_login_log` VALUES ('21', '4', '0.0.0.0', '67087b411a6a43e033e344e09014b049', '1447314197');
INSERT INTO `hc_user_login_log` VALUES ('22', '3', '0.0.0.0', '8dbc3823585bc8ecd1ee6a73128f9171', '1447315172');
INSERT INTO `hc_user_login_log` VALUES ('23', '3', '0.0.0.0', 'c0442a802cf313514ca58495523dd564', '1447639969');
INSERT INTO `hc_user_login_log` VALUES ('24', '4', '0.0.0.0', '0d5e8e7fb2cba40819cd4a60cc7c0f63', '1447643006');
INSERT INTO `hc_user_login_log` VALUES ('25', '3', '0.0.0.0', '1ec5f6189eee7df7a45ca431bb9a90ed', '1447652565');
INSERT INTO `hc_user_login_log` VALUES ('26', '3', '0.0.0.0', '9dc7a6b47b5d07ec1587111b7cbbdcaf', '1447656204');
INSERT INTO `hc_user_login_log` VALUES ('27', '4', '0.0.0.0', 'd2dc79db0f18d4749c45aaf68f28951e', '1447660633');
INSERT INTO `hc_user_login_log` VALUES ('28', '4', '0.0.0.0', 'cbd77f2ff4185c1190fc5ec04256f851', '1447664677');
INSERT INTO `hc_user_login_log` VALUES ('29', '4', '0.0.0.0', 'a9e557ef4273d11b6ee95417787c86d3', '1447721204');
INSERT INTO `hc_user_login_log` VALUES ('30', '3', '0.0.0.0', 'ac60e94af80c867a1442fb3f989ba028', '1447727082');
INSERT INTO `hc_user_login_log` VALUES ('31', '3', '0.0.0.0', '0e6a1a4ee60d9ec57b02ba1eda47ca47', '1447728813');
INSERT INTO `hc_user_login_log` VALUES ('32', '4', '0.0.0.0', 'fe91a30b4e04bc9885459c93f9e75005', '1447732423');
INSERT INTO `hc_user_login_log` VALUES ('33', '3', '0.0.0.0', 'b6c0abdcc9fb3383ca1320421903ae35', '1447732513');
INSERT INTO `hc_user_login_log` VALUES ('34', '3', '0.0.0.0', 'c2e8ef9cfe21e7858b2f83c095218297', '1447736979');
INSERT INTO `hc_user_login_log` VALUES ('35', '3', '0.0.0.0', 'c10626ae907d39edd6150fa00670c890', '1447741467');
INSERT INTO `hc_user_login_log` VALUES ('36', '3', '0.0.0.0', 'ca74a364099b83b4cc0b546944c06380', '1447741488');
INSERT INTO `hc_user_login_log` VALUES ('37', '3', '0.0.0.0', 'a2fde846468cfa7f17e21746fb15ee35', '1447749993');
INSERT INTO `hc_user_login_log` VALUES ('38', '4', '0.0.0.0', 'fa93cb52eda8cd2af2c2965be73053e2', '1447750054');
INSERT INTO `hc_user_login_log` VALUES ('39', '3', '0.0.0.0', '6af1837e0e22ec08644fb68c87d01475', '1447755238');
INSERT INTO `hc_user_login_log` VALUES ('40', '3', '0.0.0.0', 'db76b24492fe10d820aa8b0e6fde317b', '1447812976');
INSERT INTO `hc_user_login_log` VALUES ('41', '3', '0.0.0.0', '6f73970839c1700684e271ba3f8f198e', '1447819117');
INSERT INTO `hc_user_login_log` VALUES ('42', '4', '0.0.0.0', 'f87856eb1352836a68ede1214a5bf2a6', '1447827951');
INSERT INTO `hc_user_login_log` VALUES ('43', '3', '192.168.12.133', '40436f1977e406f8b4189fa363b73473', '1447834052');
INSERT INTO `hc_user_login_log` VALUES ('44', '3', '192.168.12.133', '467c7e618c794b2aea0b13f5bb92f9a8', '1447839034');
INSERT INTO `hc_user_login_log` VALUES ('45', '3', '0.0.0.0', 'b9ffb826452bd757788f241b31869cb7', '1447900348');
INSERT INTO `hc_user_login_log` VALUES ('46', '3', '192.168.12.133', '6e14d9bee78fb0d9ca97327bd617258a', '1447901463');
INSERT INTO `hc_user_login_log` VALUES ('47', '4', '0.0.0.0', 'd1a3065e561524a9260082aeff016194', '1447901755');
INSERT INTO `hc_user_login_log` VALUES ('48', '4', '0.0.0.0', 'b9dc6fae22f59f743d6e68df3e801bc8', '1447905215');
INSERT INTO `hc_user_login_log` VALUES ('49', '3', '0.0.0.0', '3dfb64db5814acc8511e233a08115ffd', '1447911760');
INSERT INTO `hc_user_login_log` VALUES ('50', '4', '0.0.0.0', '7be78a32ee77a29492d195ed7751dc47', '1447912198');
INSERT INTO `hc_user_login_log` VALUES ('51', '4', '0.0.0.0', '1f4d780775e2618607e1b4d5130d76df', '1447917721');
INSERT INTO `hc_user_login_log` VALUES ('52', '4', '0.0.0.0', 'b83852005c5135a3cc13f790e17a63e3', '1447918205');
INSERT INTO `hc_user_login_log` VALUES ('53', '4', '0.0.0.0', '16dc49167b72b2087f7b2889913c839a', '1447918237');
INSERT INTO `hc_user_login_log` VALUES ('54', '4', '0.0.0.0', '7de8b9bd5558d8ca52fa4b1a652b7bbb', '1447918277');
INSERT INTO `hc_user_login_log` VALUES ('55', '4', '0.0.0.0', '527f29ccf9d1c43f9d1e24c8444db3b9', '1447918344');
INSERT INTO `hc_user_login_log` VALUES ('56', '3', '0.0.0.0', '51bcbe3fe5fdc41207813ebae61cc889', '1447919181');
INSERT INTO `hc_user_login_log` VALUES ('57', '3', '0.0.0.0', '3a769fe7b30d55700daf04eba73513b4', '1447919559');
INSERT INTO `hc_user_login_log` VALUES ('58', '3', '0.0.0.0', '6eaf9fac82b5fa1d4a8b4a8c484a357a', '1447920003');
INSERT INTO `hc_user_login_log` VALUES ('59', '3', '0.0.0.0', 'baaa8acd8ba77a82834f75bbd8507ded', '1447920142');
INSERT INTO `hc_user_login_log` VALUES ('60', '3', '0.0.0.0', 'fef58ea3655514091ba8f69125116a5a', '1447920276');
INSERT INTO `hc_user_login_log` VALUES ('61', '3', '0.0.0.0', '42f169c9ba8b15b5163107573362dee3', '1447920347');
INSERT INTO `hc_user_login_log` VALUES ('62', '3', '0.0.0.0', 'aafcab6be9148f446058eb71cfd70db1', '1447920378');
INSERT INTO `hc_user_login_log` VALUES ('63', '3', '0.0.0.0', '8c8db170d46257bc335dc9a749423f18', '1447920509');
INSERT INTO `hc_user_login_log` VALUES ('64', '3', '0.0.0.0', '8ce2d8c471bd90031e38f1e957c771c3', '1447920938');
INSERT INTO `hc_user_login_log` VALUES ('65', '3', '0.0.0.0', 'cd45b0c8ff4e4d6fd540fe0c16742200', '1447920967');
INSERT INTO `hc_user_login_log` VALUES ('66', '3', '0.0.0.0', '09498c4fb0fb8411dae47345cb0da681', '1447921023');
INSERT INTO `hc_user_login_log` VALUES ('67', '3', '0.0.0.0', '9c1f1522ad7c630e8f4c1d13f0a8ccb9', '1447921093');
INSERT INTO `hc_user_login_log` VALUES ('68', '3', '0.0.0.0', 'a927f2eada134224358cd41820a6e6c0', '1447921106');
INSERT INTO `hc_user_login_log` VALUES ('69', '3', '0.0.0.0', '4b6648fcb13933fb90ac75fc85d578fd', '1447921136');
INSERT INTO `hc_user_login_log` VALUES ('70', '3', '0.0.0.0', '9caec96ebd4c1c24e38a592093b2aa99', '1447921343');
INSERT INTO `hc_user_login_log` VALUES ('71', '3', '0.0.0.0', '3b40b609e2656c9c711ad6520faceaba', '1447921431');
INSERT INTO `hc_user_login_log` VALUES ('72', '3', '0.0.0.0', 'c96b81435205c05eae10660c66668130', '1447922032');
INSERT INTO `hc_user_login_log` VALUES ('73', '4', '0.0.0.0', 'f34b82639122c082424c9d66c6e5742e', '1447923390');
INSERT INTO `hc_user_login_log` VALUES ('74', '3', '0.0.0.0', 'a917c0b91d9455fa3fdae5aab28eb123', '1447935143');
INSERT INTO `hc_user_login_log` VALUES ('75', '3', '0.0.0.0', '3ecac10c6001361994b10482c406f438', '1447935540');
INSERT INTO `hc_user_login_log` VALUES ('76', '3', '192.168.12.154', 'dced6ec80bd95773d787343334986823', '1447935821');
INSERT INTO `hc_user_login_log` VALUES ('77', '3', '0.0.0.0', 'fe9101c4290f0898f935e9e3b7d1b0c9', '1447983049');
INSERT INTO `hc_user_login_log` VALUES ('78', '3', '0.0.0.0', '002dfc9157734139b8452a802b4a425f', '1447988550');
INSERT INTO `hc_user_login_log` VALUES ('79', '3', '0.0.0.0', '034f661ebca417f534ce7b99fe5b78bb', '1447994975');
INSERT INTO `hc_user_login_log` VALUES ('80', '3', '0.0.0.0', 'd533abc599dbf3db1a64f362340c116e', '1447996388');
INSERT INTO `hc_user_login_log` VALUES ('81', null, '0.0.0.0', 'fdab2204c4755ad22c52e2d8172546a8', '1447996565');
INSERT INTO `hc_user_login_log` VALUES ('82', null, '0.0.0.0', '36192ae396510ef65a4ee8cc0ac78058', '1447996583');
INSERT INTO `hc_user_login_log` VALUES ('83', null, '0.0.0.0', '62ddfd7e35040cfce99062ec50d0aa8e', '1447996622');
INSERT INTO `hc_user_login_log` VALUES ('84', '3', '0.0.0.0', '928e93cf414304127f1532deaaee69a9', '1447998644');
INSERT INTO `hc_user_login_log` VALUES ('85', '3', '0.0.0.0', '3495b9421eb040aa9161eba5e899461b', '1448249738');
INSERT INTO `hc_user_login_log` VALUES ('86', '3', '0.0.0.0', '2879ebb5b45234031c06a15b72b28972', '1448253899');
INSERT INTO `hc_user_login_log` VALUES ('87', '3', '0.0.0.0', '23794badfd75ad5701c1d75e0e1e1314', '1448264396');
INSERT INTO `hc_user_login_log` VALUES ('88', '3', '0.0.0.0', 'ee87dc86c9301e8feaab0e0be758776e', '1448274843');
INSERT INTO `hc_user_login_log` VALUES ('89', '3', '0.0.0.0', '46ac3f4482b48df13243e0a3e20787f3', '1448275710');
INSERT INTO `hc_user_login_log` VALUES ('90', '3', '0.0.0.0', '0c7b7564ed3f98cbb42696e093a21b68', '1448326632');
INSERT INTO `hc_user_login_log` VALUES ('91', '3', '192.168.12.195', 'a41c37f79164eb22d501125ef42374ce', '1448418126');
INSERT INTO `hc_user_login_log` VALUES ('92', '3', '0.0.0.0', '041b35303ee5dd2b027dab539d32153f', '1448418880');
INSERT INTO `hc_user_login_log` VALUES ('93', '4', '0.0.0.0', 'fcb48449065373729a13aa55a88ca140', '1448419759');
INSERT INTO `hc_user_login_log` VALUES ('94', '5', '192.168.12.193', 'ff367d0351ff2882fa09fa92947791db', '1448425802');
INSERT INTO `hc_user_login_log` VALUES ('95', '5', '192.168.12.193', 'e0283fb81624ff41a94bbd5d46036fd8', '1448425905');
INSERT INTO `hc_user_login_log` VALUES ('96', '3', '0.0.0.0', 'f3559ab1a3f64cadf67684bffc61fe53', '1448501195');
INSERT INTO `hc_user_login_log` VALUES ('97', '3', '0.0.0.0', 'a71a6a327012a6cb0539407f143aca41', '1448501530');
INSERT INTO `hc_user_login_log` VALUES ('98', '3', '0.0.0.0', 'c25ce0bb854e784f480f18928046abdc', '1448501732');
INSERT INTO `hc_user_login_log` VALUES ('99', '3', '0.0.0.0', '2347d833d6dcd6c359e4ae62dbdb759d', '1448532556');
INSERT INTO `hc_user_login_log` VALUES ('100', '3', '0.0.0.0', '6ab67e2d2acf4248e325256b1c14c897', '1448532596');
INSERT INTO `hc_user_login_log` VALUES ('101', '3', '0.0.0.0', '5e4716c5298172d79cedc773f474ffdc', '1448539669');
INSERT INTO `hc_user_login_log` VALUES ('102', '4', '0.0.0.0', 'eb2d4b92bd83ddd1669fd4f64dd6a8c5', '1448585633');
INSERT INTO `hc_user_login_log` VALUES ('103', '3', '0.0.0.0', 'a74234c9a9bf658676f4b10b3800478d', '1448585685');
INSERT INTO `hc_user_login_log` VALUES ('104', '3', '192.168.12.195', 'c8e7d9f2a455dd2a764d295d83d4c8f0', '1448591936');
INSERT INTO `hc_user_login_log` VALUES ('105', '3', '0.0.0.0', '9011130206fdb60c622f2e2e5e846674', '1448598453');
INSERT INTO `hc_user_login_log` VALUES ('106', '3', '0.0.0.0', '5bc33751cdf6984c3b4b6a8ce0410ce8', '1448598580');
INSERT INTO `hc_user_login_log` VALUES ('107', '3', '0.0.0.0', 'f6f17f35b45e67d258b27856a989ee84', '1448598654');
INSERT INTO `hc_user_login_log` VALUES ('108', '3', '0.0.0.0', 'e79f585f9691f401d58d121dbef3f8cd', '1448598801');
INSERT INTO `hc_user_login_log` VALUES ('109', '3', '0.0.0.0', '5357b05c4fc98e0967b615357c65e7b4', '1448598929');
INSERT INTO `hc_user_login_log` VALUES ('110', '3', '192.168.12.195', 'cfedbdd473f2c2676bbf8c8bf985b693', '1448601350');
INSERT INTO `hc_user_login_log` VALUES ('111', '3', '0.0.0.0', '07fb8bcf8a7c3a75093fc483e791d396', '1448846815');
INSERT INTO `hc_user_login_log` VALUES ('112', '4', '0.0.0.0', '2f021a7f9edad1340fa967c74358887d', '1448853718');
INSERT INTO `hc_user_login_log` VALUES ('113', '4', '0.0.0.0', '7a912602ea237beba0e4dacdeffa6213', '1448858461');
INSERT INTO `hc_user_login_log` VALUES ('114', '4', '0.0.0.0', 'f6740dfbc2a4d7e0fdc9b22b22ca11fc', '1448983699');
INSERT INTO `hc_user_login_log` VALUES ('115', '10', '0.0.0.0', 'ec17d5f7b8dfe629cff9a55cd9337333', '1449035188');
INSERT INTO `hc_user_login_log` VALUES ('116', '10', '0.0.0.0', 'dbdb9debdac337f9a19118265370b9f7', '1449035811');
INSERT INTO `hc_user_login_log` VALUES ('117', '10', '0.0.0.0', '1fde156f590315096b32aea71388da10', '1449036234');
INSERT INTO `hc_user_login_log` VALUES ('118', '10', '0.0.0.0', '50c91df4fb1f4dc4ac95d2568af9b70c', '1449036278');
INSERT INTO `hc_user_login_log` VALUES ('119', '4', '0.0.0.0', '5744a1e3820ac6ba6c129e39613a34b6', '1449040935');
INSERT INTO `hc_user_login_log` VALUES ('120', '4', '0.0.0.0', 'a3f78184b9f97626bb0c2042cbbbbd8e', '1449040992');
INSERT INTO `hc_user_login_log` VALUES ('121', '4', '0.0.0.0', '1fbb63d348e4e654ecf8f1df697df540', '1449042526');
INSERT INTO `hc_user_login_log` VALUES ('122', '15', '58.251.2.90', 'a097b6e35a0096ceb933c23c31122ef1', '1449076134');
INSERT INTO `hc_user_login_log` VALUES ('123', '15', '58.251.2.90', 'f9499fae3be0b84ea80a771693ae991b', '1449077449');
INSERT INTO `hc_user_login_log` VALUES ('124', '10', '0.0.0.0', 'de2f508faa79fe00ab737b913cbd908f', '1449106709');
INSERT INTO `hc_user_login_log` VALUES ('125', '10', '0.0.0.0', '5ada96aac28d95939fca5e54e22f4ae7', '1449108282');
INSERT INTO `hc_user_login_log` VALUES ('126', '10', '0.0.0.0', '3172dd1d460a59a374e7213bc607054a', '1449117507');
INSERT INTO `hc_user_login_log` VALUES ('127', '10', '0.0.0.0', '1943595488532c94944ff63faa2a0670', '1449190345');
INSERT INTO `hc_user_login_log` VALUES ('128', '10', '0.0.0.0', '89f4d032acc016c31bab6db645bcfe5e', '1449315974');
INSERT INTO `hc_user_login_log` VALUES ('129', '4', '0.0.0.0', '8c4e9f600145f89ec19d246fe631dcbb', '1449324483');
INSERT INTO `hc_user_login_log` VALUES ('130', '4', '0.0.0.0', '7e6bf643a09f0f9445806ee8ab5829a1', '1449324642');
INSERT INTO `hc_user_login_log` VALUES ('131', '4', '0.0.0.0', 'b2c3849276bc320d3ca5643689aa36ba', '1449324930');
INSERT INTO `hc_user_login_log` VALUES ('132', '4', '0.0.0.0', '3f5a0f02f5a01aa333f9f41277cf036d', '1449324946');
INSERT INTO `hc_user_login_log` VALUES ('133', '10', '0.0.0.0', '1d6e84c7e9afaecd99db98453fe8ffa3', '1449449887');
INSERT INTO `hc_user_login_log` VALUES ('134', '10', '0.0.0.0', 'c5b68782cc15fa9b9ae0eaa9c3293e77', '1449535795');
INSERT INTO `hc_user_login_log` VALUES ('135', '4', '0.0.0.0', '6c9645a206b225c0b6721a56cbe19771', '1449558043');
INSERT INTO `hc_user_login_log` VALUES ('136', '4', '0.0.0.0', 'b2ba126dd3b3f8b444eeff985f2ce6b1', '1449560463');
INSERT INTO `hc_user_login_log` VALUES ('137', '10', '0.0.0.0', '7557482b1c8aa3bc946996dfcf694475', '1449622651');
INSERT INTO `hc_user_login_log` VALUES ('138', '4', '0.0.0.0', '50ed03eec1dcc381f850ad5f9c625671', '1449625018');
INSERT INTO `hc_user_login_log` VALUES ('139', '4', '0.0.0.0', 'd86379873c13ba0b297eabe5d772df3e', '1449630156');
INSERT INTO `hc_user_login_log` VALUES ('140', '15', '192.168.12.135', '068e41c4f03a764866062b912fc7efec', '1449641815');
INSERT INTO `hc_user_login_log` VALUES ('141', '10', '0.0.0.0', '7c055fcd83d580c31bf4eae956fc9aa1', '1449649228');
INSERT INTO `hc_user_login_log` VALUES ('142', '4', '0.0.0.0', 'dbec013607905e47d9aab9db0b7e1ac6', '1449661483');
INSERT INTO `hc_user_login_log` VALUES ('143', '4', '0.0.0.0', '05d7fbcfae7527801b9ed70579edff40', '1449663265');
INSERT INTO `hc_user_login_log` VALUES ('144', '4', '0.0.0.0', '938ef99772a424e30d5601f11614611f', '1449664750');
INSERT INTO `hc_user_login_log` VALUES ('145', '10', '0.0.0.0', '4528c58bf4a305b3774f3887f208264e', '1449666377');
INSERT INTO `hc_user_login_log` VALUES ('146', '10', '0.0.0.0', '1ae72e0c6a60c4527feee39259271269', '1449711133');
INSERT INTO `hc_user_login_log` VALUES ('147', '3', '0.0.0.0', 'bdb7fa592d65b1793f422ac681382fc0', '1449711836');
INSERT INTO `hc_user_login_log` VALUES ('148', '4', '0.0.0.0', '1a825510cb78bf720745e3ba7e71db5d', '1449717219');
INSERT INTO `hc_user_login_log` VALUES ('149', '4', '0.0.0.0', 'b1986b9b5adf7f5225e28712c47e3003', '1449724104');
INSERT INTO `hc_user_login_log` VALUES ('150', '4', '0.0.0.0', '7df04c2b6c0d8350886b28af52967801', '1449724196');
INSERT INTO `hc_user_login_log` VALUES ('151', '10', '0.0.0.0', 'f2f1333f1d79a27260dfab1ce4371eba', '1449724195');
INSERT INTO `hc_user_login_log` VALUES ('152', '3', '0.0.0.0', 'fb5d4228b17c55af7839d66f9e70ab0a', '1449724601');
INSERT INTO `hc_user_login_log` VALUES ('153', '10', '0.0.0.0', 'db9e97d32d163c4479773e0f45cbb4ec', '1449726686');
INSERT INTO `hc_user_login_log` VALUES ('154', '3', '0.0.0.0', '8f654cca71ba35da6f097a34fce12751', '1449727624');
INSERT INTO `hc_user_login_log` VALUES ('155', '3', '0.0.0.0', '4c259f25c1db550b4e2f45e443d87350', '1449794146');
INSERT INTO `hc_user_login_log` VALUES ('156', '4', '0.0.0.0', 'e7616c2f59334ffde5129c68c21a982d', '1449800260');
INSERT INTO `hc_user_login_log` VALUES ('157', '10', '0.0.0.0', '4ae225c7eae4da0c2f5d5b01c7154742', '1449803195');
INSERT INTO `hc_user_login_log` VALUES ('158', '4', '0.0.0.0', '6e4a404d42bca823ce9b3cb7074aede7', '1449818858');
INSERT INTO `hc_user_login_log` VALUES ('159', '10', '0.0.0.0', 'a28b344ec2f7564b11688244752b019d', '1449823681');
INSERT INTO `hc_user_login_log` VALUES ('160', '4', '0.0.0.0', 'b3d7cf7ca8dcced5c615c790c33b676a', '1449825320');
INSERT INTO `hc_user_login_log` VALUES ('161', '10', '0.0.0.0', 'd61932c55cafcc168ce3a8055663dccc', '1449885070');
INSERT INTO `hc_user_login_log` VALUES ('162', '3', '0.0.0.0', '0703c6c5c5ea245879055fcf059d55e3', '1450003059');
INSERT INTO `hc_user_login_log` VALUES ('163', '4', '0.0.0.0', 'd3d382af1b166366d93ebe93e24ce9ed', '1450005949');
INSERT INTO `hc_user_login_log` VALUES ('164', '3', '0.0.0.0', 'c6d0ed1ea71241d1f52c96064933c2cd', '1450008600');
INSERT INTO `hc_user_login_log` VALUES ('165', '3', '0.0.0.0', '237480af28931ab2c2ee2238760be0da', '1450054175');
INSERT INTO `hc_user_login_log` VALUES ('166', '10', '0.0.0.0', 'b00fe03ee0c5df0b51fb73510955843f', '1450095930');
INSERT INTO `hc_user_login_log` VALUES ('167', '17', '0.0.0.0', 'f121d1c5ecba8e809a4f25a8c1f7d732', '1450150711');
INSERT INTO `hc_user_login_log` VALUES ('168', '3', '0.0.0.0', '683b4f1d6466c0b6d08ff98b467bdd6c', '1450172444');
INSERT INTO `hc_user_login_log` VALUES ('169', '10', '0.0.0.0', 'ea34c0e4d70fb2aac51df8e1c6ff234e', '1450172850');
INSERT INTO `hc_user_login_log` VALUES ('170', '10', '0.0.0.0', '3403afd41510752e97c89c8a418582dc', '1450232079');
INSERT INTO `hc_user_login_log` VALUES ('171', '4', '0.0.0.0', '106ab90fd63cb780dda70cbc1e89434e', '1450254688');
INSERT INTO `hc_user_login_log` VALUES ('172', '3', '0.0.0.0', 'b6df804805dcac379bfe5f5ac1ee61f9', '1450254865');
INSERT INTO `hc_user_login_log` VALUES ('173', '4', '0.0.0.0', '4cb088adb9ec53da585cce5caeea2c7e', '1450258709');
INSERT INTO `hc_user_login_log` VALUES ('174', '3', '0.0.0.0', 'fcf82cab8a39648e9e32a7f828f8b300', '1450259465');
INSERT INTO `hc_user_login_log` VALUES ('175', '3', '0.0.0.0', 'a4c83e7688ae832df04c19182e849184', '1450261813');
INSERT INTO `hc_user_login_log` VALUES ('176', '4', '0.0.0.0', '13c3f951b7f51b493c4d78d2b5d246ae', '1450269888');
INSERT INTO `hc_user_login_log` VALUES ('177', '10', '0.0.0.0', '7e6698ae08290edc7c911d1a72def1c8', '1450272690');
INSERT INTO `hc_user_login_log` VALUES ('178', '3', '0.0.0.0', 'bb5692d6d568bce4b88bf870f1b0f650', '1450318871');
INSERT INTO `hc_user_login_log` VALUES ('179', '4', '192.168.12.104', 'b59a179d0642b68fd4d5e995d102c270', '1450324549');
INSERT INTO `hc_user_login_log` VALUES ('180', '4', '0.0.0.0', '60ac9166117e4494804f0881b37e47ad', '1450324706');
INSERT INTO `hc_user_login_log` VALUES ('181', '3', '0.0.0.0', '5a7aa5532c99c3ca0db8ec0582eaecec', '1450403117');
INSERT INTO `hc_user_login_log` VALUES ('182', '18', '192.168.12.103', 'ae7d07f39fe95fc2cd4586fdc305dfc3', '1450687685');
INSERT INTO `hc_user_login_log` VALUES ('183', '3', '0.0.0.0', 'c1c2c967b1b431fcfcb4972553885b92', '1450691672');
INSERT INTO `hc_user_login_log` VALUES ('184', '10', '192.168.12.111', 'd369592f4fcd9c622d347331c9057a3b', '1450701308');
INSERT INTO `hc_user_login_log` VALUES ('185', '18', '192.168.12.103', 'd715044346e4193043014f7a27f0e1b8', '1450755025');
INSERT INTO `hc_user_login_log` VALUES ('186', '3', '0.0.0.0', 'a2a1440c0bcc65e9b78961347b9e3880', '1450780628');
INSERT INTO `hc_user_login_log` VALUES ('187', '10', '0.0.0.0', '0b4d7a83ca732f4ad59a780e646413ef', '1450781211');
INSERT INTO `hc_user_login_log` VALUES ('188', '3', '61.183.115.214', 'c2f16c4a503e31226f9ea53fc94ebbfe', '1450858326');
INSERT INTO `hc_user_login_log` VALUES ('189', '3', '0.0.0.0', '187adb2e05bc6fba8cb4bbd96cdca26c', '1450858342');
INSERT INTO `hc_user_login_log` VALUES ('190', '10', '0.0.0.0', 'e1eaf80188912ba66c49986646b220f0', '1450859331');
INSERT INTO `hc_user_login_log` VALUES ('191', '3', '0.0.0.0', 'f430aee90f42f3cc4da401e530bd24ff', '1450860156');
INSERT INTO `hc_user_login_log` VALUES ('192', '10', '0.0.0.0', 'b12a37c8341f64a1721e082bda9bf7b8', '1450861826');
INSERT INTO `hc_user_login_log` VALUES ('193', '3', '0.0.0.0', 'ff75ca63a4a6bad57ac38477b089df69', '1450924457');
INSERT INTO `hc_user_login_log` VALUES ('194', '10', '0.0.0.0', 'aee131427448d3a8ea72161bffd8d1fe', '1450924651');
INSERT INTO `hc_user_login_log` VALUES ('195', '3', '0.0.0.0', 'b6fd3903d45564028e7c31b0ea0d6de2', '1451009488');
INSERT INTO `hc_user_login_log` VALUES ('196', '18', '192.168.12.104', 'ddccdb6e2bbb00e588037282bdbf2ed4', '1451529572');
INSERT INTO `hc_user_login_log` VALUES ('197', '4', '61.183.115.214', 'e6b935a39bc40834dffed41d2e00a63f', '1451875812');
INSERT INTO `hc_user_login_log` VALUES ('198', '4', '192.168.12.109', '0de17691f604862df25291722b3fd68b', '1451875862');
INSERT INTO `hc_user_login_log` VALUES ('199', '10', '192.168.12.101', 'a413e0654bc7a6ee0c76132252663c04', '1451875889');
INSERT INTO `hc_user_login_log` VALUES ('200', '10', '0.0.0.0', 'f0d0bdb9b9b039a4a924af0a94c621da', '1451876034');
INSERT INTO `hc_user_login_log` VALUES ('201', '10', '0.0.0.0', '081c2a515ef92fc5bfc68452efe585aa', '1451885694');
INSERT INTO `hc_user_login_log` VALUES ('202', '3', '61.183.115.214', '806b844c569be32aec6dbde474102974', '1452137324');
INSERT INTO `hc_user_login_log` VALUES ('203', '10', '192.168.12.101', '3dd8bf452345221ff3374f82b057cf07', '1452498803');
INSERT INTO `hc_user_login_log` VALUES ('204', '3', '0.0.0.0', '84921d5e91c10a6f4f9a7e46c624a2a4', '1452507517');
INSERT INTO `hc_user_login_log` VALUES ('205', '10', '0.0.0.0', '43a186edfc6e68f29a533faf67e5a8f3', '1452559894');
INSERT INTO `hc_user_login_log` VALUES ('206', '10', '0.0.0.0', 'e18912620603de71bc34e3f061cac51c', '1452561231');
INSERT INTO `hc_user_login_log` VALUES ('207', '3', '0.0.0.0', 'adc815055aac32f84071f34b548225a1', '1452563977');
INSERT INTO `hc_user_login_log` VALUES ('208', '10', '0.0.0.0', '48a346dacde4c0ae9124c82513f516f3', '1452564007');
INSERT INTO `hc_user_login_log` VALUES ('209', '25', '0.0.0.0', 'b28752f4affaca65a207a73ec778f9fd', '1452570786');
INSERT INTO `hc_user_login_log` VALUES ('210', '10', '0.0.0.0', '67779b5a9cff9aa746c0ce7898792811', '1452576482');
INSERT INTO `hc_user_login_log` VALUES ('211', '25', '0.0.0.0', 'd539b5b17fd0235a8144ed687e221310', '1452576804');
INSERT INTO `hc_user_login_log` VALUES ('212', '10', '0.0.0.0', '1bf4d3167c89e3b3bc24f963132c6c42', '1452576858');
INSERT INTO `hc_user_login_log` VALUES ('213', '3', '192.168.12.101', 'cc9a489db2d710231a6ebba2bc5ab161', '1452689987');
INSERT INTO `hc_user_login_log` VALUES ('214', '26', '192.168.12.117', 'e1b1d1897700f7976cfdbffa21f11dcf', '1453095299');
INSERT INTO `hc_user_login_log` VALUES ('215', '3', '0.0.0.0', 'b4d85334d381cee372f598efa98e59d4', '1453095387');
INSERT INTO `hc_user_login_log` VALUES ('216', '3', '192.168.12.101', '01f131c4d63ba0e22a4954ab08e47a3c', '1453096277');
INSERT INTO `hc_user_login_log` VALUES ('217', '3', '0.0.0.0', 'c50a89c7e5e1be6ef7a7c757dc020b6e', '1453253805');
INSERT INTO `hc_user_login_log` VALUES ('218', '25', '0.0.0.0', '4d7a166f7e981b145c12b9568e59a614', '1453267607');
INSERT INTO `hc_user_login_log` VALUES ('219', '10', '113.57.168.243', '3a611d7548cfeec1e69e5210be8a3b01', '1456903821');

-- ----------------------------
-- Table structure for hc_user_money_details
-- ----------------------------
DROP TABLE IF EXISTS `hc_user_money_details`;
CREATE TABLE `hc_user_money_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uin` int(11) NOT NULL COMMENT '会员ID',
  `title` varchar(64) NOT NULL COMMENT '标题',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=进账，2=出账',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '操作金额',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前余额',
  `user_ip` varchar(15) DEFAULT NULL COMMENT '用户IP',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户金钱明细表';

-- ----------------------------
-- Records of hc_user_money_details
-- ----------------------------
INSERT INTO `hc_user_money_details` VALUES ('1', '1', '资金充值', '1', '10000.00', '10000.00', '127.0.0.1', '1', '在线充值:10000.00元,订单ID:11', '0', '1445137637');
INSERT INTO `hc_user_money_details` VALUES ('2', '1', '项目投资', '2', '7537.69', '2462.31', '127.0.0.1', '1', '项目:三个爸爸投资:7537.69元,订单ID:1', '0', '1445137730');
INSERT INTO `hc_user_money_details` VALUES ('3', '1', '资金提现', '2', '100.00', '2362.31', '127.0.0.1', '1', '资金提现_100元', '1445139918', '1445139813');
INSERT INTO `hc_user_money_details` VALUES ('4', '3', '项目投资', '2', '15075.38', '6484924.62', '0.0.0.0', '1', '项目:三个爸爸投资:15075.38元,订单ID:2', '0', '1447292115');
INSERT INTO `hc_user_money_details` VALUES ('5', '3', '项目投资', '2', '7537.69', '6477386.93', '0.0.0.0', '1', '项目:三个爸爸追加投资:7537.69元,订单ID:2', '0', '1447405693');
INSERT INTO `hc_user_money_details` VALUES ('6', '4', '项目投资', '2', '5057142.60', '1442857.40', '0.0.0.0', '1', '项目:Glup游戏投资:5057142.6元,订单ID:3', '0', '1447722438');
INSERT INTO `hc_user_money_details` VALUES ('7', '3', '项目投资', '2', '11.00', '6477375.93', '0.0.0.0', '1', '项目:三只松鼠投资:11元,订单ID:4', '0', '1448588755');
INSERT INTO `hc_user_money_details` VALUES ('8', '11', '项目投资', '2', '11.00', '6477364.93', '0.0.0.0', '1', '项目:三只松鼠追加投资:11元,订单ID:4', '0', '1448588761');
INSERT INTO `hc_user_money_details` VALUES ('9', '12', '项目投资', '2', '12.00', '6477352.93', '0.0.0.0', '1', '项目:三只松鼠追加投资:12元,订单ID:4', '0', '1448588826');
INSERT INTO `hc_user_money_details` VALUES ('10', '3', '项目投资', '2', '30.00', '6477322.93', '0.0.0.0', '1', '项目:三只松鼠追加投资:30元,订单ID:4', '0', '1448588845');
INSERT INTO `hc_user_money_details` VALUES ('11', '4', '项目投资', '2', '39200.00', '1403657.40', '0.0.0.0', '1', '项目:范文芳投资:39200元,订单ID:5', '0', '1448858157');
INSERT INTO `hc_user_money_details` VALUES ('12', '10', '项目投资', '2', '82914.59', '472640.41', '0.0.0.0', '1', '项目:三个爸爸投资:82914.59元,订单ID:6', '0', '1449221379');
INSERT INTO `hc_user_money_details` VALUES ('13', '4', '项目投资', '2', '39200.00', '1364457.40', '0.0.0.0', '1', '项目:范文芳追加投资:39200元,订单ID:5', '0', '1449642334');
INSERT INTO `hc_user_money_details` VALUES ('14', '4', '项目投资', '2', '9800.00', '1393857.40', '0.0.0.0', '1', '项目:范文芳追加投资:9800元,订单ID:5', '0', '1449643700');
INSERT INTO `hc_user_money_details` VALUES ('15', '4', '项目投资', '2', '7537.69', '1396119.71', '0.0.0.0', '1', '项目:三个爸爸投资:7537.69元,订单ID:7', '0', '1449649064');
INSERT INTO `hc_user_money_details` VALUES ('16', '4', '项目投资', '2', '7537.69', '1396119.71', '0.0.0.0', '1', '项目:三个爸爸追加投资:7537.69元,订单ID:7', '0', '1449649290');
INSERT INTO `hc_user_money_details` VALUES ('17', '4', '项目投资', '2', '7537.69', '1396119.71', '0.0.0.0', '1', '项目:三个爸爸追加投资:7537.69元,订单ID:7', '0', '1449649355');
INSERT INTO `hc_user_money_details` VALUES ('18', '4', '项目投资', '2', '7537.69', '1396119.71', '0.0.0.0', '1', '项目:三个爸爸追加投资:7537.69元,订单ID:7', '0', '1449649516');
INSERT INTO `hc_user_money_details` VALUES ('19', '4', '项目投资', '2', '7537.69', '1396119.71', '0.0.0.0', '1', '项目:三个爸爸追加投资:7537.69元,订单ID:7', '0', '1449649560');
INSERT INTO `hc_user_money_details` VALUES ('20', '4', '项目投资', '2', '7537.69', '1396119.71', '0.0.0.0', '1', '项目:三个爸爸追加投资:7537.69元,订单ID:7', '0', '1449649572');
INSERT INTO `hc_user_money_details` VALUES ('21', '4', '项目投资', '2', '7537.69', '1396119.71', '0.0.0.0', '1', '项目:三个爸爸追加投资:7537.69元,订单ID:7', '0', '1449649630');
INSERT INTO `hc_user_money_details` VALUES ('22', '4', '项目投资', '2', '7537.69', '1396119.71', '0.0.0.0', '1', '项目:三个爸爸追加投资:7537.69元,订单ID:7', '0', '1449649967');
INSERT INTO `hc_user_money_details` VALUES ('23', '4', '项目投资', '2', '9045.22', '1394612.18', '0.0.0.0', '1', '项目:海洋世界投资:9045.22元,订单ID:8', '0', '1449662521');
INSERT INTO `hc_user_money_details` VALUES ('24', '10', '项目投资', '2', '7537.69', '465102.72', '0.0.0.0', '1', '项目:三个爸爸追加投资:7537.69元,订单ID:6', '0', '1449666393');
INSERT INTO `hc_user_money_details` VALUES ('25', '3', '项目投资', '2', '7537.69', '6469785.24', '0.0.0.0', '1', '项目:三个爸爸追加投资:7537.69元,订单ID:2', '0', '1449732490');
INSERT INTO `hc_user_money_details` VALUES ('26', '4', '项目投资', '2', '9045.22', '1394612.18', '0.0.0.0', '1', '项目:海洋世界追加投资:9045.22元,订单ID:8', '0', '1449735545');
INSERT INTO `hc_user_money_details` VALUES ('27', '10', '项目投资', '2', '82914.59', '389725.82', '0.0.0.0', '1', '项目:三个爸爸追加投资:82914.59元,订单ID:6', '0', '1449813152');
INSERT INTO `hc_user_money_details` VALUES ('28', '10', '项目投资', '2', '75376.90', '397263.51', '0.0.0.0', '1', '项目:三个爸爸追加投资:75376.9元,订单ID:6', '0', '1449813219');
INSERT INTO `hc_user_money_details` VALUES ('29', '10', '项目投资', '2', '82914.59', '389725.82', '0.0.0.0', '1', '项目:三个爸爸追加投资:82914.59元,订单ID:6', '0', '1449813879');
INSERT INTO `hc_user_money_details` VALUES ('30', '10', '项目投资', '2', '7537.69', '465102.72', '0.0.0.0', '1', '项目:三个爸爸追加投资:7537.69元,订单ID:6', '0', '1449814186');
INSERT INTO `hc_user_money_details` VALUES ('31', '10', '项目投资', '2', '7537.69', '465102.72', '0.0.0.0', '1', '项目:三个爸爸追加投资:7537.69元,订单ID:6', '0', '1449814487');
INSERT INTO `hc_user_money_details` VALUES ('32', '10', '项目投资', '2', '37688.45', '434951.96', '0.0.0.0', '1', '项目:三个爸爸追加投资:37688.45元,订单ID:6', '0', '1449814678');
INSERT INTO `hc_user_money_details` VALUES ('33', '3', '项目投资', '2', '7537.69', '6469785.24', '0.0.0.0', '1', '项目:三个爸爸追加投资:7537.69元,订单ID:2', '0', '1450011404');
INSERT INTO `hc_user_money_details` VALUES ('34', '17', '项目投资', '2', '7537.69', '-7537.69', '0.0.0.0', '1', '项目:三个爸爸投资:7537.69元,订单ID:14', '0', '1450171310');
INSERT INTO `hc_user_money_details` VALUES ('35', '10', '项目投资', '2', '4522.61', '468117.80', '0.0.0.0', '1', '项目:海洋世界投资:4522.61元,订单ID:15', '0', '1450176528');
INSERT INTO `hc_user_money_details` VALUES ('36', '10', '项目投资', '2', '40000.00', '432640.41', '0.0.0.0', '1', '项目:蘑菇先生投资:40000元,订单ID:16', '0', '1450177846');
INSERT INTO `hc_user_money_details` VALUES ('37', '4', '项目投资', '2', '22613.07', '1381044.33', '0.0.0.0', '1', '项目:三个爸爸追加投资:22613.07元,订单ID:7', '0', '1450257664');
INSERT INTO `hc_user_money_details` VALUES ('38', '4', '项目投资', '2', '7537.69', '1396119.71', '192.168.12.104', '1', '项目:三个爸爸追加投资:7537.69元,订单ID:7', '0', '1450324560');
INSERT INTO `hc_user_money_details` VALUES ('39', '10', '项目投资', '2', '10000000.00', '-9527359.59', '0.0.0.0', '1', '项目:三石科技投资:10000000元,订单ID:19', '0', '1450862717');
INSERT INTO `hc_user_money_details` VALUES ('40', '10', '项目投资', '2', '753769.00', '-281128.59', '0.0.0.0', '1', '项目:三个爸爸追加投资:753769元,订单ID:6', '0', '1450862896');
INSERT INTO `hc_user_money_details` VALUES ('41', '10', '项目投资', '2', '877386.34', '-404745.93', '0.0.0.0', '1', '项目:海洋世界追加投资:877386.34元,订单ID:15', '0', '1450866985');
INSERT INTO `hc_user_money_details` VALUES ('42', '10', '项目投资', '2', '17000000.00', '-16527359.59', '0.0.0.0', '1', '项目:grup 创意项目投资:17000000元,订单ID:22', '0', '1450867834');
INSERT INTO `hc_user_money_details` VALUES ('43', '10', '项目投资', '2', '2000.00', '470640.41', '192.168.12.101', '1', '项目:16年测试投资:2000元,订单ID:23', '0', '1452499170');

-- ----------------------------
-- Table structure for hc_user_pay
-- ----------------------------
DROP TABLE IF EXISTS `hc_user_pay`;
CREATE TABLE `hc_user_pay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uin` int(11) NOT NULL COMMENT '用户ID',
  `login_key` varchar(255) NOT NULL COMMENT '登录验证',
  `out_trade_no` varchar(18) NOT NULL COMMENT '18位订单号码',
  `pay_type` varchar(11) NOT NULL COMMENT '支付类型',
  `pay_type_name` varchar(11) NOT NULL COMMENT '支付类型名称',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `body` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `client_ip` varchar(15) DEFAULT NULL COMMENT '客户端IP',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='在线支付表';

-- ----------------------------
-- Records of hc_user_pay
-- ----------------------------
INSERT INTO `hc_user_pay` VALUES ('1', '1', '2d5525c74d61a8fcf6ecb9dbf4a752cc', '151018092432834668', 'alipay', '支付宝', '100.00', '支付宝在线充值100元', '0', '支付宝在线充值100元', '127.0.0.1', '0', '1445131472');
INSERT INTO `hc_user_pay` VALUES ('2', '1', '2d5525c74d61a8fcf6ecb9dbf4a752cc', '151018105802754519', 'alipay', '支付宝', '1000000.00', '支付宝在线充值1000000元', '0', '支付宝在线充值1000000元', '127.0.0.1', '0', '1445137082');
INSERT INTO `hc_user_pay` VALUES ('3', '1', '2d5525c74d61a8fcf6ecb9dbf4a752cc', '151018105814686530', 'unionpay', '银联', '1000000.00', '银联在线充值1000000元', '0', '银联在线充值1000000元', '127.0.0.1', '0', '1445137094');
INSERT INTO `hc_user_pay` VALUES ('4', '1', '2d5525c74d61a8fcf6ecb9dbf4a752cc', '151018105946549271', 'unionpay', '银联', '1000000.00', '银联在线充值1000000元', '0', '银联在线充值1000000元', '127.0.0.1', '0', '1445137186');
INSERT INTO `hc_user_pay` VALUES ('5', '1', '2d5525c74d61a8fcf6ecb9dbf4a752cc', '151018110036839711', 'unionpay', '银联', '10000000.00', '银联在线充值10000000元', '0', '银联在线充值10000000元', '127.0.0.1', '0', '1445137236');
INSERT INTO `hc_user_pay` VALUES ('6', '1', '2d5525c74d61a8fcf6ecb9dbf4a752cc', '151018110044741200', 'unionpay', '银联', '1000000.00', '银联在线充值1000000元', '0', '银联在线充值1000000元', '127.0.0.1', '0', '1445137244');
INSERT INTO `hc_user_pay` VALUES ('7', '1', '2d5525c74d61a8fcf6ecb9dbf4a752cc', '151018110141789313', 'unionpay', '银联', '100000.00', '银联在线充值100000元', '0', '银联在线充值100000元', '127.0.0.1', '0', '1445137301');
INSERT INTO `hc_user_pay` VALUES ('8', '1', '907202a7f3acd46c4529f3d950fcabc6', '151018110342782453', 'unionpay', '银联', '1000000.00', '银联在线充值1000000元', '0', '银联在线充值1000000元', '127.0.0.1', '0', '1445137422');
INSERT INTO `hc_user_pay` VALUES ('9', '1', '907202a7f3acd46c4529f3d950fcabc6', '151018110448953670', 'unionpay', '银联', '100000.00', '银联在线充值100000元', '0', '银联在线充值100000元', '127.0.0.1', '0', '1445137488');
INSERT INTO `hc_user_pay` VALUES ('10', '1', '907202a7f3acd46c4529f3d950fcabc6', '151018110538994068', 'unionpay', '银联', '10000.00', '银联在线充值10000元', '0', '银联在线充值10000元', '127.0.0.1', '0', '1445137538');
INSERT INTO `hc_user_pay` VALUES ('11', '1', '907202a7f3acd46c4529f3d950fcabc6', '151018110704598496', 'unionpay', '银联', '10000.00', '银联在线充值10000元', '1', '银联在线充值10000元', '127.0.0.1', '1445137637', '1445137624');
INSERT INTO `hc_user_pay` VALUES ('12', '3', '47840df4f5d49f3c8acd5abd7a34ab6c', '151022145452298925', 'alipay', '支付宝', '1.00', '支付宝在线充值1元', '0', '支付宝在线充值1元', '0.0.0.0', '0', '1445496892');

-- ----------------------------
-- Table structure for hc_user_withdrawals
-- ----------------------------
DROP TABLE IF EXISTS `hc_user_withdrawals`;
CREATE TABLE `hc_user_withdrawals` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uin` int(11) NOT NULL COMMENT '会员ID',
  `money_details_id` int(11) NOT NULL COMMENT '资金明细ID',
  `bank_id` int(11) NOT NULL COMMENT '银行ID',
  `bank_name` varchar(64) NOT NULL COMMENT '银行名称',
  `bank_area` varchar(64) NOT NULL COMMENT '银行开户行',
  `name` varchar(64) NOT NULL COMMENT '持卡人姓名',
  `card` varchar(64) NOT NULL COMMENT '卡号',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '操作金额',
  `feemoney` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际到账金额',
  `fee` float(11,2) DEFAULT NULL COMMENT '手续费',
  `order_id` varchar(64) NOT NULL COMMENT '转账交易单号',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户提现信息表';

-- ----------------------------
-- Records of hc_user_withdrawals
-- ----------------------------
INSERT INTO `hc_user_withdrawals` VALUES ('1', '1', '3', '1', '工商银行-准贷记卡(商普)-准贷记卡', '江西赣州市开发区支行', '黄日', '622220215000820559', '100.00', '100.00', '0.00', '11', '1', '1445139918', '1445139813');
