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
class IndexController extends PublicController {
    public function index(){
		//投资统计
		$uin 			= session('user.uin');
		$j 				= date(j); 						//获取当前月份天数
		$start_time 	= strtotime(date('Y-m-01'));  	//获取本月第一天时间戳
		$count 			= array();
		for( $i=0; $i < $j ; $i++ ){
		    $count[$i]['start'] 			= $start_time+$i*86400; 				//开始时间
		    $count[$i]['end']				= $start_time+$i*86400+86399; 			//结束时间 
		    $wA[$i]['a.time']				= array(array('gt',$count[$i]['start']),array('lt',$count[$i]['end']));
		    $wA[$i]['a.uin']				= $uin;
		    $wB[$i]['a.create_time']		= array(array('gt',$count[$i]['start']),array('lt',$count[$i]['end']));
		    $wB[$i]['a.uin']				= $uin;
		    $count['data'] 				.= '"'.date('Y-m-d',$start_time+$i*86400).'",'; 			//正常时间
		    $count['collect_item']		.= D('ItemCollect')		->countList($wA[$i]).',';	//收藏项目
		    $count['with_item']			.= D('ItemWithOrder')		->countList($wB[$i]).',';	//投资
		    $count['interview']			.= D('ItemInterview')		->countList($wA[$i]).',';	//约谈
		    $count['inmoney']			.= D('UserMoneyDetails')	->sumList($wB[$i],1).',';	//进账
		    $count['outmoney']			.= D('UserMoneyDetails')	->sumList($wB[$i],2).',';	//出账
		}
		$this->count = $count;
		//获取余额
		$money 		 = M('user')->where(array('uin'=>session('user.uin')))->getField('money');
		$moneyinvest = M('item_with_order')->where(array('uin'=>$uin))->field(' SUM(money) as money')->group('uin')->getField('money');
		$this->money = !$moneyinvest ? 0 : $moneyinvest;
    	$this->display();
    }

	public function sendmails(){
		if(SendMail('935468215@qq.com','测试 2015.12.16','不要激动 这只是一个邮件自动发送的测试'))
			echo '发送成功';
		else
			echo '发送失败';
	}


	public function sendmailsattach()
	{
		think_send_mail('935468215@qq.com', '周海天', '测试邮件', '这里就是邮件的内容', array('./uploads/a_1/20151127/happychou_1448595389754.jpg'));
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
class IndexController extends PublicController {
    public function index(){
		//投资统计
		$uin 			= session('user.uin');
		$j 				= date(j); 						//获取当前月份天数
		$start_time 	= strtotime(date('Y-m-01'));  	//获取本月第一天时间戳
		$count 			= array();
		for( $i=0; $i < $j ; $i++ ){
		    $count[$i]['start'] 			= $start_time+$i*86400; 				//开始时间
		    $count[$i]['end']				= $start_time+$i*86400+86399; 			//结束时间 
		    $wA[$i]['a.time']				= array(array('gt',$count[$i]['start']),array('lt',$count[$i]['end']));
		    $wA[$i]['a.uin']				= $uin;
		    $wB[$i]['a.create_time']		= array(array('gt',$count[$i]['start']),array('lt',$count[$i]['end']));
		    $wB[$i]['a.uin']				= $uin;
		    $count['data'] 				.= '"'.date('Y-m-d',$start_time+$i*86400).'",'; 			//正常时间
		    $count['collect_item']		.= D('ItemCollect')		->countList($wA[$i]).',';	//收藏项目
		    $count['with_item']			.= D('ItemWithOrder')		->countList($wB[$i]).',';	//投资
		    $count['interview']			.= D('ItemInterview')		->countList($wA[$i]).',';	//约谈
		    $count['inmoney']			.= D('UserMoneyDetails')	->sumList($wB[$i],1).',';	//进账
		    $count['outmoney']			.= D('UserMoneyDetails')	->sumList($wB[$i],2).',';	//出账
		}
		$this->count = $count;
		//获取余额
		$money 		 = M('user')->where(array('uin'=>session('user.uin')))->getField('money');
		$moneyinvest = M('item_with_order')->where(array('uin'=>$uin))->field(' SUM(money) as money')->group('uin')->getField('money');
		$this->money = !$moneyinvest ? 0 : $moneyinvest;
    	$this->display();
    }

	public function sendmails(){
		if(SendMail('935468215@qq.com','测试 2015.12.16','不要激动 这只是一个邮件自动发送的测试'))
			echo '发送成功';
		else
			echo '发送失败';
	}


	public function sendmailsattach()
	{
		think_send_mail('935468215@qq.com', '周海天', '测试邮件', '这里就是邮件的内容', array('./uploads/a_1/20151127/happychou_1448595389754.jpg'));
	}
>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}