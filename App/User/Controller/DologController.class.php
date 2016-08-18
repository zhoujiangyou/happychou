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
class DologController extends PublicController {
	public function index(){
		$doLog 			= D('UserDoLog');
		$statusId 		= 	$doLog -> where(array('status'=>'0','uin'=>session('user.uin')))->getField('id',true);//找出用户未读数据
		if($statusId) 		$doLog -> where(array('id'=>array('in',$statusId)))->setField('status','1');	//未读数据改成已读
		$where['a.uin'] = session('user.uin');
		$count 			=  $doLog->countList($where);
		$Page       	= new Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$limit 			= $Page->firstRow.','.$Page->listRows;
		$this->page  	= $Page->show();
		$this->list 	= $doLog->loadList($where,$limit);
		$this->display();
	}
}