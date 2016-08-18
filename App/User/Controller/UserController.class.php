<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.happychou.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author:  zhouht (zhouht@happychou.net)
// +----------------------------------------------------------------------
namespace User\Controller;

use Think\Page;

class UserController extends PublicController
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
        $this->display('ajax_user');

 }


    public function getuser_item(){
        $user_uin = session('user.uin');
        $where=array('uin'=>$user_uin);
        $count 			=  M('item')->where($where)->count();
        $Page       	= new Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $limit 			= $Page->firstRow.','.$Page->listRows;
        $this->page  	= $Page->show();
        $iteminfo = M('item')->where(array('uin'=>$user_uin))->limit($limit)->select();
        $this->iteminfo=$iteminfo;
        $this->display();
    }

}