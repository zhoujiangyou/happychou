<?php
$config = array(
    //'配置项'=>'配置值'
    'URL_CASE_INSENSITIVE' => true,     // 默认false 表示URL区分大小写 true则表示不区分大小写
    'DB_FIELDTYPE_CHECK' => true,       //数据库字段检查
    'TMPL_STRIP_SPACE' => true,         //清除页面空白space
    'OUTPUT_ENCODE' => true,            // 页面压缩输出

    'MODULE_ALLOW_LIST' => array('Home', 'User', 'Admin'),
    'DEFAULT_MODULE' => 'Home',  // 默认模块

    //加密混合值
    'AUTH_CODE' => 'HappyChou',
    'TAGLIB_BUILD_IN' => 'cx,Zml',//标签库
    'TAGLIB_PRE_LOAD' => 'Zml',//标签命名范围

    /* 错误设置 */
    'ERROR_MESSAGE'         =>  '客官，请耐心等待一下下啦～',    //错误显示信息,非调试模式有效

    // 开启子域名配置
//    'APP_SUB_DOMAIN_DEPLOY' => 1,
//    'APP_SUB_DOMAIN_RULES'    =>    array(
//        'admin.happychou.net'  => 'Admin',  // admin.domain1.com域名指向Admin模块
//        'test.happychou.net   => 'Home',  // test.domain2.com域名指向Test模块
//    ),

//    'SESSION_OPTIONS'=>array(
//        'type'=> 'db',//session采用数据库保存
//        'expire'=>604800,//session过期时间，如果不设就是php.ini中设置的默认值
//    ),
//    'SESSION_TABLE' => 'hc_session', //必须设置成这样，如果不加前缀就找不到数据表，这个需要注意

// 配置邮件发送服务器
    'MAIL_HOST' =>'smtp.163.com',//smtp服务器的名称
    'MAIL_SMTPAUTH' =>TRUE, //启用smtp认证
    'MAIL_USERNAME' =>'m18207135869_1@163.com',//你的邮箱名
    'MAIL_FROM' =>'m18207135869_1@163.com',//发件人地址
    'MAIL_FROMNAME'=>'周海天',//发件人姓名
    'MAIL_PASSWORD' =>'reqbmieayzvicayw',//邮箱密码
    'MAIL_CHARSET' =>'utf-8',//设置邮件编码
    'MAIL_ISHTML' =>TRUE, // 是否HTML格式邮件



    //邮件配置
    'THINK_EMAIL' => array(
        'SMTP_HOST'   => 'smtp.163.com', //SMTP服务器
        'SMTP_PORT'   => '25', //SMTP服务器端口
        'SMTP_USER'   => 'm18207135869_1@163.com', //SMTP服务器用户名
        'SMTP_PASS'   => 'reqbmieayzvicayw', //SMTP服务器密码
        'FROM_EMAIL'  => 'm18207135869_1@163.com', //发件人EMAIL
        'FROM_NAME'   => '周海天', //发件人名称
        'REPLY_EMAIL' => '', //回复EMAIL（留空则为发件人EMAIL）
        'REPLY_NAME'  => '', //回复名称（留空则为发件人名称）
    ),

);


$web_config = dirname(__FILE__) . '/web_config.php';
$web_config = file_exists($web_config) ? include "$web_config" : array();

$upload = dirname(__FILE__) . '/upload.php';
$upload = file_exists($upload) ? include "$upload" : array();

$pay_config = dirname(__FILE__) . '/pay_config.php';
$pay_config = file_exists($pay_config) ? include "$pay_config" : array();

$sms_config = dirname(__FILE__) . '/sms_config.php';
$sms_config = file_exists($sms_config) ? include "$sms_config" : array();

$db_config = dirname(__FILE__) . '/db_config.php';
$db_config = file_exists($db_config) ? include "$db_config" : array();

$routes_config = dirname(__FILE__) . '/routes.php';
$routes_config = file_exists($routes_config) ? include "$routes_config" : array();

return array_merge($db_config, $config, $web_config, $pay_config, $sms_config, $upload, $routes_config);