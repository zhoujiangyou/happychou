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
class UserDoLogModel extends Model {
	protected $_auto = array ( 
         array('time','time',1,'function'), 
         array('ip','get_client_ip',1,'function'),
     );
	/**
     * 读取信息
     * @return array 信息
     */
	public function getInfo($where){
		return M('user_do_log as a')
		->join('LEFT JOIN __USER__ b ON a.uin = b.uin')
		->field('a.*,b.name as user_name')
		->where($where)
		->find();
	}
	/**
     * 读取列表数据
     * @return array 列表
     */
	public function loadList($where = array(), $limit = 10 ,$order = 'time desc'){
		return 	M('user_do_log as a')
				->join('LEFT JOIN __USER__ b ON a.uin = b.uin')
				->field('a.*,b.name as user_name')
				->where($where)
				->limit($limit)
				->order($order)
				->select();
	}
	/**
     * 获取数量
     * @return int 数量
     */
    public function countList($where = array()){
        return 	M('user_do_log as a')
        		->where($where)
                ->count();
    }
    /**
     * 添加信息
     * @param string $log 增加数据
     * @return bool 更新状态
     */
    public function addData($log,$uin){
        if(empty($log) || empty($uin))  return false;
        $data            = array();
        $data['content'] = $log;
        $data['uin']     = $uin;
        //增加记录
        $this->create($data);
        return $this->add();
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
class UserDoLogModel extends Model {
	protected $_auto = array ( 
         array('time','time',1,'function'), 
         array('ip','get_client_ip',1,'function'),
     );
	/**
     * 读取信息
     * @return array 信息
     */
	public function getInfo($where){
		return M('user_do_log as a')
		->join('LEFT JOIN __USER__ b ON a.uin = b.uin')
		->field('a.*,b.name as user_name')
		->where($where)
		->find();
	}
	/**
     * 读取列表数据
     * @return array 列表
     */
	public function loadList($where = array(), $limit = 10 ,$order = 'time desc'){
		return 	M('user_do_log as a')
				->join('LEFT JOIN __USER__ b ON a.uin = b.uin')
				->field('a.*,b.name as user_name')
				->where($where)
				->limit($limit)
				->order($order)
				->select();
	}
	/**
     * 获取数量
     * @return int 数量
     */
    public function countList($where = array()){
        return 	M('user_do_log as a')
        		->where($where)
                ->count();
    }
    /**
     * 添加信息
     * @param string $log 增加数据
     * @return bool 更新状态
     */
    public function addData($log,$uin){
        if(empty($log) || empty($uin))  return false;
        $data            = array();
        $data['content'] = $log;
        $data['uin']     = $uin;
        //增加记录
        $this->create($data);
        return $this->add();
    }
>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}