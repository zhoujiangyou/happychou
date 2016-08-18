<?php
defined('THINK_PATH') or exit();
// 调试模式下面默认设置 可以在应用配置目录下重新定义 debug.php 覆盖
return  array(
    'LOG_RECORD'            =>  true,                                               // 进行日志记录
    'SHOW_PAGE_TRACE'       =>  false,                                               //显示页面Trace信息
    'TRACE_PAGE_TABS'       =>  array(                                              //配置显示的信息
        'base'=>'基本',
        'file'=>'文件',
        'think'=>'流程',
        'error'=>'错误',
        'sql'=>'SQL',
        'debug'=>'调试',
        'user'=>'用户'
    ),
    'LOG_EXCEPTION_RECORD'  =>  true,                                               // 是否记录异常信息日志
    'LOG_LEVEL'             =>  'EMERG,ALERT,CRIT,ERR,WARN,NOTIC,INFO,DEBUG,SQL',  // 允许记录的日志级别
    'DB_FIELDS_CACHE'       =>  false,                                              // 字段缓存信息
    'DB_DEBUG'				=>  true,                                               // 开启调试模式 记录SQL日志
    'TMPL_CACHE_ON'         =>  false,                                              // 是否开启模板编译缓存,设为false则每次都会重新编译
    'TMPL_STRIP_SPACE'      =>  false,                                              // 是否去除模板文件里面的html空格与换行
    'SHOW_ERROR_MSG'        =>  true,                                               // 显示错误信息
    'URL_CASE_INSENSITIVE'  =>  false,                                              // URL区分大小写
);