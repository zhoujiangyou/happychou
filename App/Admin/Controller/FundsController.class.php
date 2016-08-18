<<<<<<< HEAD
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

class FundsController extends CommonController {

    //资金明细
    public function money_details(){
        $httpget = I('get.');

        if ($httpget['type']) {
            $where['a.type'] = $httpget['type'];
        }
		if ($httpget['uin']) {            
			$where['a.uin']  =  $httpget['uin'];
        }
       

        $UserMoneyDetails = D('UserMoneyDetails');

        $count      = $UserMoneyDetails->countList($where);
        $page       = new Page($count,20);
        $show       = $page->show();
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
        	$where['a.out_trade_no'] = $httpget['out_trade_no'];
        }

        if (isset($httpget['status'])) {
            $where['a.status'] = $httpget['status'];
        }

        if ($httpget['uin']) {
            $where['a.uin'] = $httpget['uin'];
        }
    	$UserPay    = D('UserPay');
        $count      = $UserPay->countList($where);
        $page       = new Page($count,20);
        $show       = $page->show();
        $this->assign('page',$show);
        $limit      = $Page->firstRow.','.$Page->listRows;
        $lists      = $UserPay->loadList($where,$limit,'id desc');
        $this->assign('list',$lists);

        $this->display();
    }

    //提现管理
    public function withdrawals() {
        if (IS_POST) {
            $HttpPost = I('post.');

            $withdrawals_info = M('user_withdrawals')->where(array('id'=>$HttpPost['id']))->find();

            if ($withdrawals_info['status']==1) {
                $this->error('该提现已处理过!');
            }

            $User = M('user_withdrawals');
            // 启动事务
            $User->startTrans();
            $Details = M('user_money_details');

            //修改提现表
            $set_withdrawals = $User->where(array('id'=>$HttpPost['id']))->setField(array('order_id'=>$HttpPost['order_id'],'status'=>1,'update_time'=>time()));

            //修改资金明细表
            $set_details = $Details->where(array('id'=>$withdrawals_info['money_details_id']))->setField(array('status'=>1,'update_time'=>time()));

            if ($set_withdrawals and $set_details) {
                // 提交事务
                $User->commit();

                $userinfo = M('user')->where(array('uin'=>$withdrawals_info['uin']))->find();
                //发送短信通知
                if (is_sms()) {
                    $sms_message = '您的申请的'.$withdrawals_info['money'].'元提现，已处理成功!';
                    send_sms($userinfo['phone'],$sms_message);
                }
                $this->success('提现处理成功!',U('Admin/Funds/withdrawals'));
            }else{
                // 事务回滚
                $User->rollback();
                $this->success('处理失败!');
            }
        }else{
            $httpget = I('get.');

            if (isset($httpget['status'])) {
                $where['status'] = $httpget['status'];
            }

            if ($httpget['uin']) {
                $where['uin'] = $httpget['uin'];
            }
            $count      = M('user_withdrawals')->where($where)->count();
            $page       = new Page($count,15);
            $show       = $page->show();
            $this->assign('page',$show);
            $list       = M('user_withdrawals')->where($where)->limit($page->firstRow.','.$page->listRows)->order('id desc')->select();
            foreach ($list as $key => $value) {
                $list[$key]['money_details_info'] = M('user_money_details')->where(array('id'=>$value['money_details_id']))->find();
                $list[$key]['user_info'] = M('user')->where(array('uin'=>$value['uin']))->find();
            }
            $where['status'] = 0;
            $sumMoney = M('user_withdrawals')->where($where)->limit($page->firstRow.','.$page->listRows)->sum('money');
            $this->assign('sumMoney',$sumMoney);
            $this->assign('list',$list);
            $this->display();
        }
    }
	
	//转账操作
    public function zmlpay(){
        if (IS_POST) {
            $HttpPost = I('post.');

            $money = $HttpPost['money'];

            $User = M('user');
            // 启动事务
            $User->startTrans();
            $User_Money_Details = M('user_money_details');
            //查询用户信息
            $userinfo = $User->where(array('uin' => $HttpPost['uin']))->find();
            //增加用户资金
            $set_money = $User->where(array('uin' => $HttpPost['uin']))->setInc('money', $money);
            //写入资金明细
            $money_details_data['uin']      = $userinfo['uin'];
            $money_details_data['title']    = '在线转账';
            $money_details_data['type']     = 1;//进账
            $money_details_data['money']    = $money;
            $money_details_data['balance']  = $userinfo['money']+$money;
            $money_details_data['user_ip']  = get_client_ip();
            $money_details_data['status']   = 1;
            $money_details_data['remark']   = '在线转账:'.$money.'元,'.$HttpPost['remark'];
            $money_details_data['create_time'] = time();
            $add_money_details = $User_Money_Details->data($money_details_data)->add();

            if ($HttpPost['is_sms']==1 and is_sms()) {
                $sms_message = '您收到平台转账资金:'.$money.'元,请查收!';
                send_sms($userinfo['phone'],$sms_message);
            }

            if ($set_money and $add_money_details){
                // 成功,提交事务
                $User->commit();
                $this->success('转账成功!');
            }else{
                // 失败,事务回滚
                $User->rollback();
                $this->success('转账失败,请重试~!');
            }
        }else{
            $this->display();
        }
    }



    public function makesure(){
        if (IS_POST) {
         $data=I('post.');
         $withorder = M('item_with_order');
         $item=M('item');
            //开启事务
         $withorder->startTrans();
         $item->startTrans();
           // $orderinfo = $withorder->where(array('id'=>$data['id']))->find();
            $iteminfo = M('item')->where(array('id'=>$data['itemid']))->find();
            $orderupdate['money']=$data['money'];
            $orderupdate['status']=1;  //支付状态改为 1 已支付  0 未支付
            $itemupdata['left_money']=$iteminfo['raising_money']-$iteminfo['has_investment']-$data['money'];
            //开始数据更新
            $withresult= $withorder->where(array('id'=>$data['id']))->save($orderupdate);
            $itemresult=$item->where(array('id'=>$data['itemid']))->save($itemupdata);

            if($withresult  && $itemresult ){
                $withorder->commit();
                $item->commit();
                $this->ajaxReturn(AjaxResult(1,'操作成功'));
            }else{
                $withorder->rollback();
                $item->rollback();
                $this->ajaxReturn(AjaxResult(0,'已经操作过了哦~'));
            }

        }else{
            $status=I('get.status');
            if($status=='0'||$status=='1'){
                $where = array('a.status'=>$status);
            }else{
                $where=array();
            }
            $count      = D('ItemWithOrder')->countList($where);
            $page       = new Page($count,20);
            $show       = $page->show();
            $this->assign('page',$show);

            $limit = $Page->firstRow.','.$Page->listRows;
            $data=D('ItemWithOrder')->loadList($where,$limit);

           if($data){
               foreach($data as $key=>$value){
                   $data[$key]['create_time']=date('Y-m-d h:i:s',$data[$key]['create_time']);
                   $data[$key]['invest_money']=$data[$key]['amount']*$data[$key]['lowest_money'];
               }
           }
            $this->data=$data;
            $this->display();
        }
    }



    public  function  lookuporder(){
        $orderid=I('get.id');

        $data=D('ItemWithOrder')->getInfo(array('a.id'=>$orderid));
        if($data) {
                $data['create_time'] = date('Y-m-d h:i:s', $data['create_time']);
                $data['invest_money'] = $data['amount'] * $data['lowest_money'];
        }
        $this->data=$data;
        $this->display();
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
namespace Admin\Controller;
use Think\Page;

class FundsController extends CommonController {

    //资金明细
    public function money_details(){
        $httpget = I('get.');

        if ($httpget['type']) {
            $where['a.type'] = $httpget['type'];
        }
		if ($httpget['uin']) {            
			$where['a.uin']  =  $httpget['uin'];
        }
       

        $UserMoneyDetails = D('UserMoneyDetails');

        $count      = $UserMoneyDetails->countList($where);
        $page       = new Page($count,20);
        $show       = $page->show();
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
        	$where['a.out_trade_no'] = $httpget['out_trade_no'];
        }

        if (isset($httpget['status'])) {
            $where['a.status'] = $httpget['status'];
        }

        if ($httpget['uin']) {
            $where['a.uin'] = $httpget['uin'];
        }
    	$UserPay    = D('UserPay');
        $count      = $UserPay->countList($where);
        $page       = new Page($count,20);
        $show       = $page->show();
        $this->assign('page',$show);
        $limit      = $Page->firstRow.','.$Page->listRows;
        $lists      = $UserPay->loadList($where,$limit,'id desc');
        $this->assign('list',$lists);

        $this->display();
    }

    //提现管理
    public function withdrawals() {
        if (IS_POST) {
            $HttpPost = I('post.');

            $withdrawals_info = M('user_withdrawals')->where(array('id'=>$HttpPost['id']))->find();

            if ($withdrawals_info['status']==1) {
                $this->error('该提现已处理过!');
            }

            $User = M('user_withdrawals');
            // 启动事务
            $User->startTrans();
            $Details = M('user_money_details');

            //修改提现表
            $set_withdrawals = $User->where(array('id'=>$HttpPost['id']))->setField(array('order_id'=>$HttpPost['order_id'],'status'=>1,'update_time'=>time()));

            //修改资金明细表
            $set_details = $Details->where(array('id'=>$withdrawals_info['money_details_id']))->setField(array('status'=>1,'update_time'=>time()));

            if ($set_withdrawals and $set_details) {
                // 提交事务
                $User->commit();

                $userinfo = M('user')->where(array('uin'=>$withdrawals_info['uin']))->find();
                //发送短信通知
                if (is_sms()) {
                    $sms_message = '您的申请的'.$withdrawals_info['money'].'元提现，已处理成功!';
                    send_sms($userinfo['phone'],$sms_message);
                }
                $this->success('提现处理成功!',U('Admin/Funds/withdrawals'));
            }else{
                // 事务回滚
                $User->rollback();
                $this->success('处理失败!');
            }
        }else{
            $httpget = I('get.');

            if (isset($httpget['status'])) {
                $where['status'] = $httpget['status'];
            }

            if ($httpget['uin']) {
                $where['uin'] = $httpget['uin'];
            }
            $count      = M('user_withdrawals')->where($where)->count();
            $page       = new Page($count,15);
            $show       = $page->show();
            $this->assign('page',$show);
            $list       = M('user_withdrawals')->where($where)->limit($page->firstRow.','.$page->listRows)->order('id desc')->select();
            foreach ($list as $key => $value) {
                $list[$key]['money_details_info'] = M('user_money_details')->where(array('id'=>$value['money_details_id']))->find();
                $list[$key]['user_info'] = M('user')->where(array('uin'=>$value['uin']))->find();
            }
            $where['status'] = 0;
            $sumMoney = M('user_withdrawals')->where($where)->limit($page->firstRow.','.$page->listRows)->sum('money');
            $this->assign('sumMoney',$sumMoney);
            $this->assign('list',$list);
            $this->display();
        }
    }
	
	//转账操作
    public function zmlpay(){
        if (IS_POST) {
            $HttpPost = I('post.');

            $money = $HttpPost['money'];

            $User = M('user');
            // 启动事务
            $User->startTrans();
            $User_Money_Details = M('user_money_details');
            //查询用户信息
            $userinfo = $User->where(array('uin' => $HttpPost['uin']))->find();
            //增加用户资金
            $set_money = $User->where(array('uin' => $HttpPost['uin']))->setInc('money', $money);
            //写入资金明细
            $money_details_data['uin']      = $userinfo['uin'];
            $money_details_data['title']    = '在线转账';
            $money_details_data['type']     = 1;//进账
            $money_details_data['money']    = $money;
            $money_details_data['balance']  = $userinfo['money']+$money;
            $money_details_data['user_ip']  = get_client_ip();
            $money_details_data['status']   = 1;
            $money_details_data['remark']   = '在线转账:'.$money.'元,'.$HttpPost['remark'];
            $money_details_data['create_time'] = time();
            $add_money_details = $User_Money_Details->data($money_details_data)->add();

            if ($HttpPost['is_sms']==1 and is_sms()) {
                $sms_message = '您收到平台转账资金:'.$money.'元,请查收!';
                send_sms($userinfo['phone'],$sms_message);
            }

            if ($set_money and $add_money_details){
                // 成功,提交事务
                $User->commit();
                $this->success('转账成功!');
            }else{
                // 失败,事务回滚
                $User->rollback();
                $this->success('转账失败,请重试~!');
            }
        }else{
            $this->display();
        }
    }



    public function makesure(){
        if (IS_POST) {
         $data=I('post.');
         $withorder = M('item_with_order');
         $item=M('item');
            //开启事务
         $withorder->startTrans();
         $item->startTrans();
           // $orderinfo = $withorder->where(array('id'=>$data['id']))->find();
            $iteminfo = M('item')->where(array('id'=>$data['itemid']))->find();
            $orderupdate['money']=$data['money'];
            $orderupdate['status']=1;  //支付状态改为 1 已支付  0 未支付
            $itemupdata['left_money']=$iteminfo['raising_money']-$iteminfo['has_investment']-$data['money'];
            //开始数据更新
            $withresult= $withorder->where(array('id'=>$data['id']))->save($orderupdate);
            $itemresult=$item->where(array('id'=>$data['itemid']))->save($itemupdata);

            if($withresult  && $itemresult ){
                $withorder->commit();
                $item->commit();
                $this->ajaxReturn(AjaxResult(1,'操作成功'));
            }else{
                $withorder->rollback();
                $item->rollback();
                $this->ajaxReturn(AjaxResult(0,'已经操作过了哦~'));
            }

        }else{
            $status=I('get.status');
            if($status=='0'||$status=='1'){
                $where = array('a.status'=>$status);
            }else{
                $where=array();
            }
            $count      = D('ItemWithOrder')->countList($where);
            $page       = new Page($count,20);
            $show       = $page->show();
            $this->assign('page',$show);

            $limit = $Page->firstRow.','.$Page->listRows;
            $data=D('ItemWithOrder')->loadList($where,$limit);

           if($data){
               foreach($data as $key=>$value){
                   $data[$key]['create_time']=date('Y-m-d h:i:s',$data[$key]['create_time']);
                   $data[$key]['invest_money']=$data[$key]['amount']*$data[$key]['lowest_money'];
               }
           }
            $this->data=$data;
            $this->display();
        }
    }



    public  function  lookuporder(){
        $orderid=I('get.id');

        $data=D('ItemWithOrder')->getInfo(array('a.id'=>$orderid));
        if($data) {
                $data['create_time'] = date('Y-m-d h:i:s', $data['create_time']);
                $data['invest_money'] = $data['amount'] * $data['lowest_money'];
        }
        $this->data=$data;
        $this->display();
    }
	
>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}