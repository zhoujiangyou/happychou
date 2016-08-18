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
class ItemTeamModel extends Model {
	/**
     * 读取信息
     * @return array 信息
     */
	public function getInfo($where){
		return M('item_team as a')
				->join('LEFT JOIN __USER__ b ON a.uin = b.uin')
				->field('a.*,name, description, header, title')
				->where($where)
				->find();
	}
	/**
     * 读取列表数据
     * @return array 列表
     */
	public function loadList($where = array(), $limit = 10 ,$order = 'id desc'){
		return 	M('item_team as a')
				->join('LEFT JOIN __USER__ b ON a.uin = b.uin')
				->field('a.*,name, b.description, b.header, a.title')
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
        return 	M('item_team as a')
        		->where($where)
                ->count();
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
class ItemTeamModel extends Model {
	/**
     * 读取信息
     * @return array 信息
     */
	public function getInfo($where){
		return M('item_team as a')
				->join('LEFT JOIN __USER__ b ON a.uin = b.uin')
				->field('a.*,name, description, header, title')
				->where($where)
				->find();
	}
	/**
     * 读取列表数据
     * @return array 列表
     */
	public function loadList($where = array(), $limit = 10 ,$order = 'id desc'){
		return 	M('item_team as a')
				->join('LEFT JOIN __USER__ b ON a.uin = b.uin')
				->field('a.*,name, b.description, b.header, a.title')
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
        return 	M('item_team as a')
        		->where($where)
                ->count();
    }

>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}