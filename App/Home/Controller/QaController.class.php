<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.happychou.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author:  zhouht (zhouht@happychou.net)
// +----------------------------------------------------------------------
namespace Home\Controller;
class QaController extends CommonController {
    public function index(){
    	$this->display();
    }

    //问题提交
    public function questions_in(){
    	//$data          = I('post.');
    	$ItemQuestions = D("ItemQuestions");
    	if (!$ItemQuestions->create()) {
    		$this->ajaxReturn(array('status'=>2,'info'=>$ItemQuestions->getError()));
    	}else{
    		$id = $ItemQuestions->add();
            D('UserDoLog')-> addData('您的问题已经提交！',session('user.uin'));
    		$info = $ItemQuestions->getInfo(array('id'=>$id));
    		$info['u_name'] = user($info['uin'],'name');
    		$info['header'] = user($info['uin'],'header');
    		$this->ajaxReturn(AjaxResult(1,$info));
    	}
    }
}