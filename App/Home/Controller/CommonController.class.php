<<<<<<< HEAD
<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.happychou.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author:  zhouht (zhouht@happychou.net)
// +----------------------------------------------------------------------
namespace Home\Controller;
use Think\Controller;
class CommonController extends Controller {
    //当方法为空时显示404页面
    function _empty(){
        header("HTTP/1.0 404 Not Found");
        $this->display('./Template/Home/default/Public/404.html');
    }

    //项目初始化方法
    public function _initialize(){
        //判断如果是手机访问，则切换手机模板
        if(is_mobile_request() == true){
            C('DEFAULT_THEME','wap');
        }
    }
=======
<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.happychou.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author:  zhouht (zhouht@happychou.net)
// +----------------------------------------------------------------------
namespace Home\Controller;
use Think\Controller;
class CommonController extends Controller {
    //当方法为空时显示404页面
    function _empty(){
        header("HTTP/1.0 404 Not Found");
        $this->display('./Template/Home/default/Public/404.html');
    }

    //项目初始化方法
    public function _initialize(){
        //判断如果是手机访问，则切换手机模板
        if(is_mobile_request() == true){
            C('DEFAULT_THEME','wap');
        }
    }
>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}