<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.happychou.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author:  zhouht (zhouht@happychou.net)
// +----------------------------------------------------------------------
namespace Admin\Controller;

use Think\Page;

class UserController extends CommonController
{
    public function index()
    {
        $key = I('get.key');
        if ($key) {
            $where['phone'] = array('like', '%' . $key . '%');
            $where['name'] = array('like', '%' . $key . '%');
            $where['address'] = array('like', '%' . $key . '%');
            $where['_logic'] = 'or';
            $map['_complex'] = $where;
        }
        $time = I('get.create_time');
        $money = I('get.money');
        $points = I('get.points');
        $order = 'uin desc';
        if ($time) {
            $order = 'create_time asc';
        }
        if ($money) {
            $order = 'money desc';
        }
        if ($points) {
            $order = 'points desc';
        }
        $M = M('user');
        $count = $M->where($map)->count();
        $page = new Page($count, 20);
        $show = $page->show();
        $user_list = $M->where($map)->limit($page->firstRow . ',' . $page->listRows)->order($order)->select();

        foreach ($user_list as $k => $v) {
            $uin = $v['uin'];
            $user_list[$k]['item'] = D('Item')->countList(array('a.uin' => $uin));//发布过的项目
            $user_list[$k]['itemLead'] = D('ItemLeadUser')->countList(array('a.uin' => $uin, 'a.status' => 1));//领投的项目
            $user_list[$k]['questions'] = D('ItemQuestions')->countList(array('a.uin' => $uin));//提过的问题
            $user_list[$k]['interview'] = D('ItemInterview')->countList(array('a.uin' => $uin));//约谈的项目
            $user_list[$k]['investor'] = D('ItemCollect')->countList(array('a.uin' => $uin));//收藏的项目
        }
        $this->alluser = $count;
        $this->assign('page', $show);
        $this->assign('lists', $user_list);
        if (I('get.getuser') == 'ok') {
            $this->display('ajax_user');
        } else {
            $this->display();
        }
    }

    //实名认证列表
    public function user_attest()
    {
        $status = I('get.status', null);
        if ($status != null) {
            $where['status'] = $status;
        }
        $where['_string'] = ' (a.type=1)  OR ( a.status=1) ';   //正在进行实名认证的或者已经审核通过的
        $user = D('UserAttest');
        $count = $user->countList($where);
        $Page = new Page($count, 10);
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $show = $Page->show();
        $list = $user->loadList($where, $limit);

        $this->assign('page', $show);
        $this->assign('lists', $list);
        $this->display();
    }

    //投资人认证列表
    public function investor_attest()
    {
        $status = I('get.status', null);
        if ($status != null) {
            $where['attest_status'] = $status;
        }
        $where['_string'] = ' (a.type=2)  OR (a.attest_status=1) ';    //正在进行投资人认证的或者已经审核通过的
        $user = D('UserAttest');
        $count = $user->countList($where);
        $Page = new Page($count, 10);
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $show = $Page->show();
        $list = $user->loadList($where, $limit);

        $this->assign('page', $show);
        $this->assign('lists', $list);
        $this->display();
    }

    //修改投资人认证状态
    public function attest_pass()
    {
        $id = I('post.id');
        $attest_status = I('post.attest_status');
        $ok = M('user_attest')->where(array('id' => $id))->setField('attest_status', $attest_status);
        if ($ok) {
            $this->success('操作成功');
        } else {
            $this->error('操作失败');
        }
    }

    //修改实名认证状态
    public function attest_user_pass(){
        $id = I('post.id');
        $status = I('post.status');
        $ok = M('user_attest')->where(array('id' => $id))->setField('status', $status);
        if ($ok) {
            $this->success('操作成功');
        } else {
            $this->error('操作失败');
        }
    }

    //认证详细资料
    public function attest_detail(){
        $uin = I("get.uin");
        $userAttest = D("UserAttest");
        $where["a.uin"]=$uin;
        $info = $userAttest->getInfo($where);
        $this->info = $info;
        $this->display();
    }

    //修改会员信息
    public function edit(){
        if (IS_POST) {
            $post = I('post.');
            if ($post['money']) {
                $this->error();
            }
            if ($post['points']) {
                $this->error();
            }

            if (M('user')->token(true)->save($post)) {
                $this->success('修改成功');
            } else {
                $this->error('修改失败');
            }
        }else{
            $uin = I("uin");
            $this->user = M('user u')
                ->join('LEFT JOIN __REGION__ p ON  p.id=u.province')
                ->join('LEFT JOIN __REGION__ c ON  c.id=u.city')
                ->join('LEFT JOIN __REGION__ a ON  a.id=u.area')
                ->join('LEFT JOIN __USER_ATTEST__ r ON r.uin=u.uin')
                ->field('u.weight as weight,r.status as rstatus,u.uin,u.name,u.phone,u.create_time,u.money,u.points,u.age,u.sex,u.province,u.city,u.area,u.address,u.header,u.description,c.name as cityname,p.name as provname,a.name as areaname')
                ->where(array('u.uin' => $uin))->find();
            $this->prove = M('region')->where(array('pid' => 0))->cache('region_prove', 8640000)->select();
            $this->display();
        }

    }

    //修改会员状态
    public function turn(){
        $uin = I('post.uin');
        $status = I('post.user_status');
        $ok = M('user')->where(array('uin' => $uin))->setField('user_status', $status);
        if ($ok) {
            $this->success('操作成功');
        } else {
            $this->error('操作失败');
        }
    }


}