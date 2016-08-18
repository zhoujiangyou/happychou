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

class LoginController extends Controller
{
    function _empty(){
        header("HTTP/1.0 404 Not Found");
        $this->display('./Template/Home/default/Public/404.html');
    }

    public function _initialize()
    {
        //判断如果是手机访问，则切换手机模板
        if(is_mobile_request() == true){
            C('DEFAULT_THEME','wap');
        }
    }

    //登录页面
    public function index()
    {
        $bakurl = I('bakurl');
        if ($bakurl) session('bakurl', $bakurl);
        if (IS_POST) {
            $post = I('post.');
            if (!check_verify(I('post.verify'))) {
                $this->error('验证码错误');
            }
            $reged = M('user')->where(array('phone' => $post['phone']))->find();
                if (!$reged) {
                $this->error('用户未注册');
            }
            $post['pwd'] = MD5($post['pwd']);
            $user = M('user')->where(array('phone' => $post['phone'], 'pwd' => $post['pwd']))->find();

            if ($user) {
                if ($user['user_status'] == 0) {
                    $this->error('账户被冻结,请联系管理员');
                }
                session('user.uin', $user['uin'], 86400);
                session('user.phone', $post['phone'], 86400);
                $log['ip'] = get_client_ip();
                $log['time'] = time();
                $log['uin'] = $user['uin'];
                $log['key'] = MD5($post['phone'] . time());
                session('user.key', $log['key'], 86400);
                M('user_login_log')->token(true)->add($log);
                if (session('bakurl')){
                    //如果有返回url
                    $bakurl = base64_decode(session('bakurl'));
                    session('bakurl', null);        //清空返回url
                    $this->success('登录成功', $bakurl);
                } else{
                    $this->success('登录成功', U('user/index/index'));        //默认到会员首页
                }
            } else {

                $this->error('登录失败,请联系管理员');
            }
        } else {
                if (session('user.uin')) {
                    header('location: ' . U('/user'));
                }
            $this->display();
        }
    }


    //用户登录
    public function  InterFaceUserLogin(){
       $message = array(
           's_ok'=>0,
           'msg'=>'',
           'data'=>array()
       );
        $post = I('post.');
     if($post['verify']){
         if (!check_verify($post['verify'])) {
             $message['msg'] = '验证码错误！';
             $this->ajaxReturn($message,'JSON');
         }
     }

         $isphone=M('user')->where(array('phone' => $post['phone']))->find();
        if(!$isphone){
            $this->ajaxReturn(AjaxResult(0,'手机号不存在！'),'JSON');
        }
         $post['pwd'] = MD5($post['pwd']);
         $user = M('user')->where(array('phone' => $post['phone'], 'pwd' => $post['pwd']))->find();

        if($user){
            $message['s_ok']=1;
            $message['msg']='登录成功！';
            session('user.uin', $user['uin'], 86400);
            session('user.phone', $post['phone'], 86400);
            session('user.name',$user['name'],86400);
            $log['ip'] = get_client_ip();
            $log['time'] = time();
            $log['uin'] = $user['uin'];
            $log['key'] = MD5($post['phone'] . time());
            session('user.key', $log['key'], 86400);
            M('user_login_log')->token(true)->add($log);
            $message['data']['need_code']='0';
            session('err_num',0);
            $this->ajaxReturn($message,'JSON');

        }else{
            session('err_num',session('err_num')+1);
            $message['msg']='密码错误！';
            $message['count']=session('err_num');
            if(session('err_num')>3){
                $message['data']['need_code']=1;
                $this->ajaxReturn($message,'JSON');
            }else{
                $message['data']['need_code']=0;
                $this->ajaxReturn($message,'JSON');
            }
        }
    }

    public function InterFacereg(){

        $post = I('post.');
        $reged = M('user')->where(array('phone' => $post['phone']))->find();
        if ($reged) {
            $this->ajaxReturn(AjaxResult(0,'该手机已被注册'),'JSON');
        }
        if(strlen($post['phone'])!=11){
            $this->ajaxReturn(AjaxResult(0,'手机长度不足11位！'),'JSON');
        }
        if (!check_verify(I('post.verify'))) {
            $this->ajaxReturn(AjaxResult(0,'验证码错误'),'JSON');
        }
        if(strlen($post['pwd'])!=6||strlen($post['pwd_confirm'])!= 6){
            $this->ajaxReturn(AjaxResult(0,'密码长度不满足6位'),'JSON');
        }
        if( $post['pwd']!= $post['pwd_confirm']){
            $this->ajaxReturn(AjaxResult(0,'密码不一致'),'JSON');
        }
        $post['pwd'] = MD5($post['pwd']);
        $post['create_time'] = time();
        $uin = M('user')->token(true)->add($post);
        if ($uin) {
            session('user.uin', $uin, 86400);
            session('user.key', MD5($post['phone'] . time()), 86400);

            $this->ajaxReturn(AjaxResult(1,'操作成功'),'JSON');
        } else {
            $this->ajaxReturn(AjaxResult(0,'操作失败'),'JSON');
        }

    }

    // 发送验证码
    public function sendsms()
    {
        $phone = I('post.phone');
        $reged = M('user')->where(array('phone' => $phone))->find();
        if ($reged) {
            $this->error('用户已被注册');
        }
        $code = rand(10000, 99999);
        session('smscode', $code, 600);
        if (is_sms()) {
            $sms_message = '用户注册验证码：' . $code;
            send_sms($phone, $sms_message);
            $this->success('短信已发送至手机！');
        } else {
            $this->success($code);
        }

    }

    //找回密码送信发送
    public function forgotpwd_sendsms()
    {
        $phone = I('post.phone');
        $reged = M('user')->where(array('phone' => $phone))->find();
        if (!$reged) {
            $this->error('用户未注册');
        }
        $code = rand(10000, 99999);
        session('smscode', $code, 600);
        if (is_sms()) {
            $sms_message = '验证码：' . $code;
            send_sms($phone, $sms_message);
            $this->success('短信已发送至手机！');
        } else {
            $this->success($code);
        }
    }

    //找回密码
    public function forgotpwd()
    {
        if (IS_POST) {
            $post = I('post.');
            $reged = M('user')->where(array('phone' => $post['phone']))->find();
            if (!$reged) {
                $this->error('用户未注册');
            }
            if ($post['verify'] != session('smscode')) {
                $this->error('手机验证码不正确');
            }
            $post['pwd'] = MD5($post['pwd']);
            $uin = M('user')->where(array('uin' => $reged['uin']))->setField('pwd', $post['pwd']);
            if ($uin) {
                session('user.uin', $reged['uin'], 86400);
                session('user.key', MD5($post['phone'] . time()), 86400);
                $this->success('密码重置成功', U('user/index/index'));
            } else {
                $this->error('失败,请联系管理员');
            }
        } else {
            $this->display();
        }
    }


    //退出登录状态
    public function logout()
    {
        session('user', null);
        header('location: ' . U('/home/index/index'));
    }

    //验证是否登录
    public function check_login()
    {
        $bakurl = I('get.bakurl');
        if ($bakurl) session('bakurl', $bakurl);    //如果有bakurl 存session
        if (!$_SESSION['user']['uin']) $this->error('请登录！', U('user/login/index'));
        else    $this->success('用户已登录！');
    }

    //验证项目是否可以操作
    public function check_itemid($itemid)
    {
        if (!$itemid) $itemid = I('get.itemid');
        $uin = M('item')->where(array('id' => $itemid))->getField('uin');
        if ($uin != $_SESSION['user']['uin']) {
            $this->error('您没有操作权限！');
        }
    }
}