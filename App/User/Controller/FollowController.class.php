<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.happychou.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author:  zhouht (zhouht@happychou.net)
// +----------------------------------------------------------------------
namespace User\Controller;

class FollowController extends PublicController {

	/**
	 * 关注用户方法
	 * @TODO 控制用户操作过于频繁
	 */
	public function follow(){
		if (!IS_POST)  $this->ajaxReturn(array('s_ok'=>0,'msg'=>'操作失败！'));
		$follow = D("UserFollow");
		$uin=I('post.uin');
		$fuin = session("user.uin");
		if($uin == $fuin){
			$this->ajaxReturn(AjaxResult(0,'无法关注自己！'));
		}
		if($uin){
			$where['a.uin'] = $uin;
		}else{
			$this->ajaxReturn(AjaxResult(0,'请正确操作！'));
		}
		$is_follow = check_follow($uin, $fuin);
		if($is_follow){
			$this->ajaxReturn(AjaxResult(0,'您已关注过，请不要重复操作！！'));
		}else{
			$result = $follow->add(array(
				'uin' => $uin,
				'fuin' => $fuin,
				'time' =>time(),
			));
			if($result){
				$this->ajaxReturn(AjaxResult(1,'您已关注成功!'));
			}else{
				$this->ajaxReturn(AjaxResult(0,'操作失败，请重试！！'));
			}
		}

	}

	//取消关注用户方法
	public function unfollow(){
		if (!IS_POST)  $this->ajaxReturn(array('s_ok'=>0,'msg'=>'操作失败！'));
		$follow = D("UserFollow");
		$uin=I('post.uin');
		$fuin = session("user.uin");
		if($uin){
			$where['a.uin'] = $uin;
		}else{
			$this->ajaxReturn(AjaxResult(0,'请正确操作！'));
		}
		$is_follow = check_follow($uin, $fuin);
		if($is_follow){
			$result = $follow->where(array(
					'uin' => $uin,
					'fuin' => $fuin,
			))->delete();
			if($result){
				$this->ajaxReturn(AjaxResult(1,'您已成功取消关注！'));
			}else{
				$this->ajaxReturn(AjaxResult(0,'操作失败，请重试！！'));
			}
		}else{
			$this->ajaxReturn(AjaxResult(0,'您未关注过，无法取消关注！'));
		}

	}

}