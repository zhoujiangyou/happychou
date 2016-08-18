<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.happychou.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: zhouht (zhouht@happychou.net)
// +----------------------------------------------------------------------
namespace User\Controller;
class AttestController extends PublicController
{
    public function index()
    {
        $where['a.uin'] = session('user.uin');
        $attest = D('UserAttest')->getInfo($where);
        if ($attest) {
            switch ($attest['status']) {
                case '1':
                    $status = '您的身份已审核通过！';
                    break;
                case '2':
                    $status = '您的身份已拒绝！,请重新申请';
                    break;
                default:
                    $status = '您的身份待审核中！';
                    break;
            }
        } else {
            $status = '您还未申请身份认证';
        }
        $this->status = $status;    //审核状态赋值到模板
        $this->attest = $attest;    //用户审核信息赋值到模板
        $this->card_in_check();    //检查是否完善个人信息
        $this->display();
    }

    //验证是否未补全信息
    public function card_in_check()
    {
        $where['uin'] = session('user.uin');
        $userInfo = M('user')->where($where)->find();
        $warninfo ='';
        if(!$userInfo['name']){
            $warninfo='用户姓名、';
        }

        if(!$userInfo['sex']){
            $warninfo+='用户性别、';
        }
        if(!$userInfo['phone']){
            $warninfo+='用户手机信息、';
        }
        if(!$userInfo['description']){
            $warninfo+='用户相关描述、';
        }

        if(!empty($warninfo)){
            $this->error($warninfo.'等用户个人信息尚未完善，请先补全信息', '/User/Info');
        }
//        if (!$userInfo['name'] || !$userInfo['sex'] || !$userInfo['phone'] || !$userInfo['description']) {
//            $this->error('请先补全信息', '/User/Info');
//        }
    }

    //验证是否实名认证
    public function attest_in_check()
    {
        $where['uin'] = session('user.uin');
        $attest = M('user_attest')->where($where)->find();
        if ($attest['status']!=1) {
            $this->error('请先实名认证', U("user/attest/index"));
        }
    }

    //提交身份证审核信息
    public function card_in()
    {
        $this->card_in_check();        //检查是否完善个人信息
        $attest = D('UserAttest');        //实例化认证模型
        $uin = session('user.uin');//获取uin
        $userinfo=M('user')->where(array('uin'=>$uin))->find();
        $data = I('post.');        //接收的post值
        $where['a.uin'] = $uin;        //此条件用户查找数据
        if ($attest->getInfo($where)) {        //如果已存在数据 进行修改操作
            $data['time'] = time();
            $data['status'] = '0';            //修改后状态改为未实名认证
            $data['type'] = 1;
            if ($attest->where(array('uin' => $uin))->save($data)) $this->success('修改成功！');
        } else {        //如果数据不存在进行新增操作
            if (!$attest->create()) {
                $this->error($attest->getError());
            } else {
                $data['uin']=$uin;
                $data['time'] = time();
                $data['status'] = '0';
                $data['type'] = 1;
                $data['true_header']=$userinfo['header'];
                $data['true_name']=$userinfo['name'];
                if ($attest->add($data)) {
                    D('UserDoLog')->addData('您的身份信息已经提交！', session('user.uin'));
                    $this->success('提交成功！');
                } else {
                    $this->error('提交失败！');
                }
            }
        }
    }

    // 投资人认证
    public function angel()
    {
        $this->card_in_check();    //检查是否完善个人信息
        $this->attest_in_check();   //检查是否实名认证
        $where['a.uin'] = session('user.uin');
        $attest = D('UserAttest')->getInfo($where);
        if ($attest) {
            switch ($attest['attest_status']) {
                case '1':
                    $status = '已通过';
                    break;
                case '2':
                    $status = '已拒绝';
                    break;
                default:
                    $status = '待审核！';
                    break;
            }
        } else {
            $status = '未申请';
        }
        $this->status = $status;
        $this->attest = $attest;
        $this->display();

    }

    // 投资人认证第二步
    public function angel_apply()
    {
        $this->attest_in_check();   //检查是否实名认证
        $this->prove = M('region')->where(array('pid' => 0))->cache('region_prove', 8640000)->select();
        $where['a.uin'] = session('user.uin');
        $attest = D('UserAttest')->getInfo($where);
        $this->attest = $attest;
        $this->display();
    }

    //投资人认证方法
    public function attest_in()
    {
        if (IS_AJAX) {
            $this->card_in_check();             //检查是否完善个人信息
            $attest = D('UserAttest');          //实例化认证模型
            $uin = session('user.uin');         //获取uin
            $data = I('post.');                 //接收的post值
            $where['a.uin'] = $uin;             //此条件用户查找数据
            $data['time'] = time();
            $data['type'] = 2;                  //设置认证类型
            $data['attest_status']=0;           //设置认证状态为审核中
            if ($attest->getInfo($where)) {        //如果已存在数据 进行修改操作
                if ($attest->where(array('uin' => $uin))->save($data)) $this->success('修改成功！');
            } else {        //如果数据不存在进行新增操作
                if (!$attest->create($data)) {
                    $this->error($attest->getError());
                } else {
                    if ($attest->add()) {
                        D('UserDoLog')->addData('您的投资人认证信息已经提交！', session('user.uin'));
                        $this->success('提交成功！');
                    } else {
                        $this->error('提交失败！');
                    }
                }
            }
        } else {
            echo '不要调皮哦，亲 ^-^';
        }
    }

    //修改图片信息等
    public function edit()
    {
        if (IS_POST) {
            $post = I('post.');
            $post['uin'] = session('user.uin');
            $result = M("user_attest")->where("uin=" . $post['uin'])->find();
            if (empty($result)) {
                if (M('user_attest')->add($post)) {
                    $this->success('添加成功');
                } else {
                    $this->error('添加失败');
                }
            } else {
                if (M('user_attest')->token(true)->where('uin=' . $post['uin'])->save($post)) {
                    $this->success('修改成功');
                } else {
                    $this->error('修改失败');
                }
            }
        }
    }

    //悦筹在线投资服务协议
    public function protocol()
    {
        $this->display();
    }

    //风险说明书
    public function risk()
    {
        $this->display();
    }

}