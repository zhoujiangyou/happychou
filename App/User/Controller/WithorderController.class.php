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

class WithorderController extends PublicController {

	//投资列表
	public function index(){
		$itemid = I('get.itemid');
		if($itemid){
			$where['a.itemid'] = $itemid; //如果指定项目
		}else{
			$uin = session('user.uin');
			$ids = M("item")->where("uin=".$uin)->field("id")->select();
			$itemids = array_columnmy($ids);
			if(!empty($itemids)){
				$where['a.itemid'] = array("in", $itemids);
			}else{
				$where['a.itemid']=array('in','0');
			}
		}
		$investor =	D('ItemWithOrder');
		$count =  $investor->countList($where); // 统计有多少条数据
		$Page  = new Page($count,10); // 实例化分页类 传入总记录数和每页显示的记录数(20)
		$limit = $Page->firstRow.','.$Page->listRows;
		$this->page = $Page->show(); // 分页显示输出
		$list = $investor->loadList($where,$limit);
		$this->list = $list;
		$this->display();
	}

//回执账号信息存入数据库中
	public function  add_orderback(){
		if(IS_POST){
			$id=I('post.id');
			$info=I('post.content');
			if(!$id||!$info){
				$this->ajaxReturn(AjaxResult(0,'数据丢失啊大哥！！！'));
			}
			if(M('item_with_order')->where(array('id'=>$id))->save(array('bank_feedback'=>$info))){
				$this->ajaxReturn(AjaxResult(1,'信息添加成功！'));
			}else{
				$this->ajaxReturn(AjaxResult(0,'信息添加失败！'));
			}
		}else{
			$id=I('get.id');
			$info=M('item_with_order')->where(array('id'=>$id))->find();
			if(empty($info['bank_feedback'])){
				$this->isoffer=0;
				$this->bankfeedback='';
			}else{
				$this->isoffer=1;
				$this->bankfeedback=$info['bank_feedback'];
			}
			$this->id=$id;
			$this->display('bank_feedback');

		}
	}

	//修改用户银行回执信息
	public function save_orderback(){
		$id=I('post.id');
		$info=I('post.content');
		if(M('item_with_order')->where(array('id'=>$id))->save(array('bank_feedback'=>$info))){
			$this->ajaxReturn(AjaxResult(1,'信息修改成功！'));
		}else{
			$this->ajaxReturn(AjaxResult(1,'数据一样啊~'));
		}
	}
}