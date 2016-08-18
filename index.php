<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.happychou.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author:  wanyuan (wanyuan@happychou.net)
// +----------------------------------------------------------------------
define('APP_PATH', './App/');                   // 定义应用目录
define('TMPL_PATH', './Template/');             // 定义模版目录
define('RUNTIME_PATH', './Runtime/');            //定义运行缓存目录
define('ROOT_PATH', dirname(__FILE__) . DIRECTORY_SEPARATOR); //定义网站物理路径

define('APP_DEBUG', true);                          // 开启调试模式 建议开发阶段开启 部署阶段注释或者设为false
define('HAPPY_V', '20151127');                      //定义网站版本号

// 引入框架入口文件
require './Inc/core.php';
