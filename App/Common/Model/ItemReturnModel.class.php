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
class ItemReturnModel extends Model {
	/**
     * 读取信息
     * @return array 信息
     */
	public function getInfo($where){
		return M('item_return as a')
				->join('LEFT JOIN __ITEM__ b ON a.itemid = b.id')
				->field('a.*,b.name as item_name')
				->where($where)
				->find();
	}
	/**
     * 读取列表数据
     * @return array 列表
     */
	public function loadList($where = array(), $limit = 10 ,$order = 'id desc'){
		return 	M('item_return as a')
//				->join('LEFT JOIN __ITEM__ b ON a.itemid = b.id')
//				->field('a.*,b.name as item_name')
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
        return 	M('item_return as a')
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
class ItemReturnModel extends Model {
	/**
     * 读取信息
     * @return array 信息
     */
	public function getInfo($where){
		return M('item_return as a')
				->join('LEFT JOIN __ITEM__ b ON a.itemid = b.id')
				->field('a.*,b.name as item_name')
				->where($where)
				->find();
	}
	/**
     * 读取列表数据
     * @return array 列表
     */
	public function loadList($where = array(), $limit = 10 ,$order = 'id desc'){
		return 	M('item_return as a')
//				->join('LEFT JOIN __ITEM__ b ON a.itemid = b.id')
//				->field('a.*,b.name as item_name')
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
        return 	M('item_return as a')
        		->where($where)
                ->count();
    }

>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}