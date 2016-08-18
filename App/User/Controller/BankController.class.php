<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.happychou.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author:  zhouht (zhouht@happychou.net)
// +----------------------------------------------------------------------
namespace User\Controller;
class BankController extends PublicController {
	//银行卡列表
	Public function index(){
		$this->bank = D('UserBank')->loadList(array('a.uin'=>session('user.uin')));
		$this->display();
	}
	
	//新增银行卡
	Public function bank_add(){
		$this->display();
	}
	//新增银行卡
	Public function bank_in(){
		$bankUser = D('UserBank');
		if (!$bankUser->create()) {
			$this->error($bankUser->getError());
		}else{
			if ($bankUser->add()){
				D('UserDoLog')-> addData('您的银行卡创建成功！',session('user.uin'));
				$this->success('新增成功！');
			} 
		}
	}
}