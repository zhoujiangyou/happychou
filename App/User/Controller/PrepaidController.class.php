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
use Think\Pay;
use Think\Pay\PayVo;

class PrepaidController extends PublicController {
    public function index(){
    	$payment_data              = C('payment');
    	$payment_data_array_keys   = array_keys($payment_data);
    	foreach ($payment_data_array_keys as $key => $value) {
    		if ($payment_data[$value]['status']==1) {
    			//$payment_lists[$key] = $payment_data[$value];
    			$payment_lists[$key]['title']    = $payment_data[$value]['title'];
    			$payment_lists[$key]['type']     = $value;
    			$payment_lists[$key]['ico']      = $payment_data[$value]['ico'];
    			$payment_lists[$key]['sort']     = $payment_data[$value]['sort'];
    		}
    	}
    	foreach ($payment_lists as $key => $value) {
    		$sort[$key] = $value['sort'];
    	}

    	array_multisort($sort, SORT_DESC, $payment_lists);

        $money 		 = M('user')->where(array('uin'=>session('user.uin')))->getField('money');
        $this->money = !$money ? 0 : $money;
        $this->assign('payment_lists',$payment_lists);
    	$this->display();
    }

    //支付接口
    public function pay_param() {
        if (IS_POST) {
            $http_post  = I('post.');
            $paytype    = $http_post['paytype'];            //在线支付类型，支付宝为alipay 财付通为tenpay
            $money      = $http_post['money'];              //充值金额
            if ($money<0.01) {
                $this->error('充值金额错误!');
            }
            $payment_data   = C('payment.' . $paytype);
            $pay            = new Pay($paytype, $payment_data);
            $order_no       = $pay->createOrderNo();

            $user_pay_data['uin']           = session('user.uin');
            $user_pay_data['login_key']     = session('user.key');
            $user_pay_data['out_trade_no']  = $order_no;
            $user_pay_data['pay_type']      = $paytype;
            $user_pay_data['pay_type_name'] = $payment_data['title'];
            $user_pay_data['money']         = $money;
            $user_pay_data['body']          = $payment_data['title'].'在线充值'.$money.'元';
            $user_pay_data['status']        = 0;
            $user_pay_data['remark']        = $payment_data['title'].'在线充值'.$money.'元';
            $user_pay_data['client_ip']     = get_client_ip();
            $user_pay_data['create_time']   = time();
            $user_pay_add = M('user_pay')->add($user_pay_data);
            $vo = new PayVo();
            $vo     ->setBody('用户ID:'.session('user.uin').',在线充值'.$money.'元!')
                    ->setFee($money) //支付金额
                    ->setOrderNo($order_no)
                    ->setTitle('用户资金在线充值')
                    ->setCallback("User/Payment/pay")
                    ->setUrl(U("User/Index/index"))
                    ->setParam(array('uin'=>session('user.uin'),'order_id' => $user_pay_add));
            echo $pay->buildRequestForm($vo);
        } else {
            $this->display();
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
namespace User\Controller;
use Think\Pay;
use Think\Pay\PayVo;

class PrepaidController extends PublicController {
    public function index(){
    	$payment_data              = C('payment');
    	$payment_data_array_keys   = array_keys($payment_data);
    	foreach ($payment_data_array_keys as $key => $value) {
    		if ($payment_data[$value]['status']==1) {
    			//$payment_lists[$key] = $payment_data[$value];
    			$payment_lists[$key]['title']    = $payment_data[$value]['title'];
    			$payment_lists[$key]['type']     = $value;
    			$payment_lists[$key]['ico']      = $payment_data[$value]['ico'];
    			$payment_lists[$key]['sort']     = $payment_data[$value]['sort'];
    		}
    	}
    	foreach ($payment_lists as $key => $value) {
    		$sort[$key] = $value['sort'];
    	}

    	array_multisort($sort, SORT_DESC, $payment_lists);

        $money 		 = M('user')->where(array('uin'=>session('user.uin')))->getField('money');
        $this->money = !$money ? 0 : $money;
        $this->assign('payment_lists',$payment_lists);
    	$this->display();
    }

    //支付接口
    public function pay_param() {
        if (IS_POST) {
            $http_post  = I('post.');
            $paytype    = $http_post['paytype'];            //在线支付类型，支付宝为alipay 财付通为tenpay
            $money      = $http_post['money'];              //充值金额
            if ($money<0.01) {
                $this->error('充值金额错误!');
            }
            $payment_data   = C('payment.' . $paytype);
            $pay            = new Pay($paytype, $payment_data);
            $order_no       = $pay->createOrderNo();

            $user_pay_data['uin']           = session('user.uin');
            $user_pay_data['login_key']     = session('user.key');
            $user_pay_data['out_trade_no']  = $order_no;
            $user_pay_data['pay_type']      = $paytype;
            $user_pay_data['pay_type_name'] = $payment_data['title'];
            $user_pay_data['money']         = $money;
            $user_pay_data['body']          = $payment_data['title'].'在线充值'.$money.'元';
            $user_pay_data['status']        = 0;
            $user_pay_data['remark']        = $payment_data['title'].'在线充值'.$money.'元';
            $user_pay_data['client_ip']     = get_client_ip();
            $user_pay_data['create_time']   = time();
            $user_pay_add = M('user_pay')->add($user_pay_data);
            $vo = new PayVo();
            $vo     ->setBody('用户ID:'.session('user.uin').',在线充值'.$money.'元!')
                    ->setFee($money) //支付金额
                    ->setOrderNo($order_no)
                    ->setTitle('用户资金在线充值')
                    ->setCallback("User/Payment/pay")
                    ->setUrl(U("User/Index/index"))
                    ->setParam(array('uin'=>session('user.uin'),'order_id' => $user_pay_add));
            echo $pay->buildRequestForm($vo);
        } else {
            $this->display();
        }
    }

>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}