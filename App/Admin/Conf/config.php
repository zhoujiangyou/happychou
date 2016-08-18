<?php
return $config = array(
	//'配置项'=>'配置值'
	'DEFAULT_THEME'        =>'default',  //默认模板
	'AUTH_CONFIG'=>array(
        'AUTH_ON' => true, //认证开关
        'AUTH_TYPE' => 1, // 认证方式，1为时时认证；2为登录认证。
        'AUTH_GROUP' => 'hc_admin_auth_group', //用户组数据表名
        'AUTH_GROUP_ACCESS' => 'hc_admin_auth_group_access', //用户组明细表
        'AUTH_RULE' => 'hc_admin_auth_rule', //权限规则表
        'AUTH_USER' => 'hc_admin_user',//用户信息表
        'AUTH_ADMINUID' => array('1'),    //定义UID为1为系统管理员,无需进行权限认证；//'administrator'=>array('1','3'),    //定义UID为1和3的用户为超级管理员；
    ),

);
