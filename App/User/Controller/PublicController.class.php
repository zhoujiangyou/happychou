<<<<<<< HEAD
<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.happychou.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author:  zhouht (zhouht@happychou.net)
// +----------------------------------------------------------------------
namespace User\Controller;
use Think\Controller;

class PublicController extends Controller
{
    public function _initialize()
    {
        //如果未登录则跳转去登录
        if (!session('user.uin')) {
            header("location: " . __MODULE__ . '/login/index');
        }

        //判断如果是手机访问，则切换手机模板
        if(is_mobile_request() == true){
            C('DEFAULT_THEME','wap');
        }

        $this->user = D('User')->getInfo(array('a.uin' => session('user.uin')));
        $this->phone = session('user.phone');
    }

    function _empty(){
        header("HTTP/1.0 404 Not Found");
        $this->display('./Template/Home/default/Public/404.html');
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
namespace User\Controller;
use Think\Controller;

class PublicController extends Controller
{
    public function _initialize()
    {
        //如果未登录则跳转去登录
        if (!session('user.uin')) {
            header("location: " . __MODULE__ . '/login/index');
        }

        //判断如果是手机访问，则切换手机模板
        if(is_mobile_request() == true){
            C('DEFAULT_THEME','wap');
        }

        $this->user = D('User')->getInfo(array('a.uin' => session('user.uin')));
        $this->phone = session('user.phone');
    }

    function _empty(){
        header("HTTP/1.0 404 Not Found");
        $this->display('./Template/Home/default/Public/404.html');
    }

>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}