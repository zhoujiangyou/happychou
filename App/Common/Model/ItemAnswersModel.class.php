<<<<<<< HEAD
<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.happychou.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author:  zhouht (zhouht@happychou.net)
// +----------------------------------------------------------------------
namespace Common\Model;
use Think\Model;
class ItemAnswersModel extends Model {
	protected $_validate = array(
	    array('content','require','内容必须填写！',0), //
	    array('uin','require','操作人不存在！',0), //
	    array('qid','require','请输入问题id',0), //
	);
	protected $_auto = array ( 
         array('time','time',3,'function'), // 
         array('uin','getUin',3,'callback'), // 
     );
	//自动完成uin
	protected function getUin(){ 
		return $_SESSION['user']['uin']; 
	}

	//查询内容
	public function getInfo($where){
		return M('item_answers  as a')->where($where)->find();
	}
	//查询内容
	public function loadList($where = array(), $limit = 10 ,$order = 'time desc'){
		$data = M('item_answers as a')->where($where)->limit($limit)->order($order)->select();
		return $data;
	}
	public function countList($where = array()){
		return M('item_answers as a')->where($where)->count();
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
namespace Common\Model;
use Think\Model;
class ItemAnswersModel extends Model {
	protected $_validate = array(
	    array('content','require','内容必须填写！',0), //
	    array('uin','require','操作人不存在！',0), //
	    array('qid','require','请输入问题id',0), //
	);
	protected $_auto = array ( 
         array('time','time',3,'function'), // 
         array('uin','getUin',3,'callback'), // 
     );
	//自动完成uin
	protected function getUin(){ 
		return $_SESSION['user']['uin']; 
	}

	//查询内容
	public function getInfo($where){
		return M('item_answers  as a')->where($where)->find();
	}
	//查询内容
	public function loadList($where = array(), $limit = 10 ,$order = 'time desc'){
		$data = M('item_answers as a')->where($where)->limit($limit)->order($order)->select();
		return $data;
	}
	public function countList($where = array()){
		return M('item_answers as a')->where($where)->count();
	}
}
>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
