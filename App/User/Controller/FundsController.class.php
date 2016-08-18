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
class FundsController extends PublicController {

    //资金明细
    public function money_details(){
        $httpget = I('get.');
        if ($httpget['type']) {
            $where['type'] = $httpget['type'];
        }
        $where['a.uin'] = session('user.uin');
        $UserMoneyDetails = D('UserMoneyDetails');
        $count = $UserMoneyDetails->countList($where);
        $page = new Page($count,10);
        $show = $page->show();
        $this->assign('page',$show);
        $limit = $page->firstRow.','.$page->listRows;
        $lists = $UserMoneyDetails->loadList($where,$limit,'id desc');
        $this->assign('lists',$lists);
        $this->display();
    }

    //充值记录
    public function payment_details(){
    	$httpget = I('get.');

        if ($httpget['out_trade_no']) {
        	$where['out_trade_no'] = $httpget['out_trade_no'];
        }
        if ($httpget['status']) {
            $where['status'] = $httpget['status'];
        }
        $where['a.uin'] = session('user.uin');
        $UserPay = D('UserPay');
        $count = $UserPay->countList($where);
        $page = new Page($count,10);
        $show = $page->show();
        $this->assign('page',$show);
        $limit = $page->firstRow.','.$page->listRows;
        $lists = $UserPay->loadList($where,$limit,'id desc');
        $this->assign('list',$lists);
        $this->display();
    }

}