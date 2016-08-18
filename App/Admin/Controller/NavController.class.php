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
class NavController extends CommonController {
    public function index(){
		$lists=M('nav')->where(array('pid'=>0))->order('sort desc')->select();
		foreach($lists as $k=>$v){
			$lists[$k]['sub']=M('nav')->where(array('pid'=>$v['id']))->order("sort desc")->select();
		}
		$this->lists=$lists;
		$this->display();
    }
	public function nav_edit(){
		
		$id=I('get.id');
		if(IS_POST){
			$post=I('post.');
			if($id){
				$post['id']=$id;
				$ok=M('nav')->save($post);				
			}else{
				$ok=M('nav')->add($post);				
			}
			if($ok){
				$this->success('成功');
			}else{
				$this->error('失败');
			}
		}else{
			$this->info=M('nav')->where(array('id'=>$id))->find();
			$this->lists=M('nav')->where(array('pid'=>0))->order('sort desc')->select();
			$this->display();
		}
	
		
	}
	public function nav_del(){
		$id=I('post.id');
		if(M('nav')->where(array('pid'=>$id))->find()){
			$this->error('先删除下级');
		}else{
			if(M('nav')->delete($id)){
				$this->success('删除成功');
			}else{
				$this->error('删除失败');
			}
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
namespace Admin\Controller;
class NavController extends CommonController {
    public function index(){
		$lists=M('nav')->where(array('pid'=>0))->order('sort desc')->select();
		foreach($lists as $k=>$v){
			$lists[$k]['sub']=M('nav')->where(array('pid'=>$v['id']))->order("sort desc")->select();
		}
		$this->lists=$lists;
		$this->display();
    }
	public function nav_edit(){
		
		$id=I('get.id');
		if(IS_POST){
			$post=I('post.');
			if($id){
				$post['id']=$id;
				$ok=M('nav')->save($post);				
			}else{
				$ok=M('nav')->add($post);				
			}
			if($ok){
				$this->success('成功');
			}else{
				$this->error('失败');
			}
		}else{
			$this->info=M('nav')->where(array('id'=>$id))->find();
			$this->lists=M('nav')->where(array('pid'=>0))->order('sort desc')->select();
			$this->display();
		}
	
		
	}
	public function nav_del(){
		$id=I('post.id');
		if(M('nav')->where(array('pid'=>$id))->find()){
			$this->error('先删除下级');
		}else{
			if(M('nav')->delete($id)){
				$this->success('删除成功');
			}else{
				$this->error('删除失败');
			}
		}
		
	}
>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}