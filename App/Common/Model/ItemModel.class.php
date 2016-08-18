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
class ItemModel extends Model {
	//验证
	protected $_validate = array(
		array('name','require','项目名不能为空'), 
		array('desc','require','项目简介不能为空'), 
		array('name','','项目名已经存在',0,'unique',1),
		array('cid','require','行业类别不能为空'),
		array('raising_money','currency','筹资金额不正确'), 
		array('end_time','require','筹资结束时间不能为空'),
		array('uin','checkUin','你没有权限',2,'notequal'), 
		array('has_investment','currency','项目方出资不正确'), 
		array('amount','checkNum','认购份数不正确',0,'function'), 
		array('lowest_money','currency','最低认购金额不正确'), 
		array('project_rate','currency','项目方收益比例不正确'), //项目方收益比例
		array('investment_rate','currency','投资方收益比例不正确'), //投资方收益比例
		array('cover_img','require','请上传封面图'), //投资方收益比例
		array('plan_file','require','请上传项目计划书'), //投资方收益比例
		array('content','require','项目详情请仔细填写'), //投资方收益比例
	);
	protected function checkUin(){
		return sessoin('user.uin');
	}
	protected function checkNum($num){
		if($num > 0){
			return true;
		}else{
			return false ;
		}
	}
	/**
     * 获取列表 
     * a 主表 b 视频表 c 进度表 
     * @return array 列表
     */
	public function loadList($where = array(), $limit = 10 ,$order = 'a.time desc'){
		if (!$where['a.isdel']) $where['a.isdel'] = '0';			//默认不显示删除数据
		$data   = M('item as a')
		        ->join('LEFT JOIN __ITEM_PROGRESS__ as c ON a.progress = c.id')
		        ->join('LEFT JOIN __USER__ as d ON a.uin = d.uin')
		        ->join('LEFT JOIN __ITEM_CATEGORY__ as e ON a.cid = e.id')
		        ->field('a.*,a.id as id,c.id as cid,c.name as progress_name,d.uin,d.name as user_name,d.header as user_header,e.id as eid,e.name as category_name')
		        ->where($where)
		        ->limit($limit)
		        ->order($order)
		        ->select();
        return $data;
	}
	/**
     * 获取数量
     * @return int 数量
     */
    public function countList($where = array()){
		if (!$where['a.isdel']) $where['a.isdel'] = '0';			//默认不显示删除数据
        return 	M('item as a')
    			->join('LEFT JOIN __ITEM_VIDEO__ as b ON a.id = b.itemid')
                ->where($where)
                ->count();
    }


	//获取用户发起项目数量
	public function getuseritem($where = array()){
		return M('item')->where($where)->count();
	}



    /**
     * 获取信息
     * @param int $userId ID
     * @return array 信息
     */
    public function getInfo($where){	
		if (empty($where['a.isdel'])) $where['a.isdel'] = '0';			//默认不显示删除数据
        return M('item as a')
				->join('LEFT JOIN __ITEM_PROGRESS__ as c ON a.progress = c.id')
		        ->join('LEFT JOIN __USER__ as d ON a.uin = d.uin')
				->join('LEFT JOIN __ITEM_CATEGORY__ as e ON a.cid = e.id')
		        ->field('a.*,a.id as id,c.id as cid,c.name as progress_name,d.uin,d.name as user_name,d.header as user_header,e.id as eid,e.name as category_name')
		        ->where($where)
		        ->find();
    }

	//获取股权项目标签内容
	public function gettags($itemid){
		$data=M('item_tag as a')
				->join('left join hc_tags as b on a.tagid = b.id')
				->field('b.name as tag_name')
				->where(array('a.itemid'=>$itemid))
				->select();
      return $data;
	}


	//股权项目数据接口model

	public function getdata($where='',$limit='',$order=''){
		//默认不显示删除数据 即isdel=0
		$sql ='select a.*,a.id as item_id,
				e.id as progress_id,e.name as progress_name ,
				d.uin as user_id,d.name as user_name,d.header as user_header,
				b.name as category_name,b.id as category_id ,
				SUM(f.money)/a.raising_money as rute,
				count(c.uin) as foucsnum
				from `hc_item` a
				LEFT JOIN `hc_item_category`  b on a.cid = b.id
				LEFT JOIN `hc_item_collect` c on a.id=c.itemid
				LEFT JOIN  `hc_user` d on a.uin = d.uin
				LEFT JOIN `hc_item_progress` e on  a.progress =e.id
				LEFT JOIN `hc_item_with_order` f on  a.id =f.itemid
				 where a.isdel=0  '.$where.' GROUP BY a.id '.$order.$limit;
				$Dao = new Model();
		$data =$Dao->query($sql);
		return $data;
	}


	//首页股权项目列表信息

	public  function indexgetltem( ){
		$limit = 12;
		$where['a.isdel'] = '0';			//默认不显示删除数据
		$where['a.status'] = 1;             //没有通过审核的不展示在首页项目中
		$data = M('item as a ')
				  ->join('LEFT JOIN hc_item_collect as b ON a.id =b.itemid ')
				  ->join('LEFT JOIN hc_item_with_order as c ON a.id =c.itemid ')
				  ->join('LEFT JOIN hc_region as d ON a.city=d.id ')
				  ->join('LEFT JOIN hc_region as f ON a.province =f.id ')
				  ->join('LEFT JOIN hc_item_category e ON a.cid=e.id ')
				  ->field('a.*,count(b.uin) as foucsnum, SUM(c.money)/a.raising_money  as success_rute,e.name as category_name, d.name as city_name,f.name as province')
				  ->group('a.id')
				  ->where($where)
				  ->limit($limit)
				  ->order('a.weight,success_rute,foucsnum')
				  ->select();
		return $data;
		}


	//首页股权信息列表 按照时间排序

	public  function indexgetltembytime( ){
		$limit = 8;
		$where['a.isdel'] = '0';			//默认不显示删除数据
		$where['a.status'] = 1;             //没有通过审核的不展示在首页项目中
		$data = M('item as a ')
				->join('LEFT JOIN hc_item_collect as b ON a.id =b.itemid ')
				->join('LEFT JOIN hc_item_with_order as c ON a.id =c.itemid ')
				->join('LEFT JOIN hc_region as d ON a.city=d.id ')
				->join('LEFT JOIN hc_region as f ON a.province =f.id ')
				->join('LEFT JOIN hc_item_category e ON a.cid=e.id ')
				->field('a.*,count(b.uin) as foucsnum, SUM(c.money)/a.raising_money  as success_rute,e.name as category_name, d.name as city_name,f.name as province')
				->group('a.id')
				->where($where)
				->limit($limit)
				->order('success_rute desc,foucsnum desc')
				->select();
		return $data;
	}





	//首页投资人信息
  public function indexinvestor(){
	 $sql="select c.name,c.header,a.uin as id,a.job job ,SUM(b.money) as money, c.weight weight from hc_user_attest a
			LEFT JOIN hc_item_with_order b on a.uin = b.uin
			LEFT JOIN hc_user c on c.uin =a.uin
			WHERE c.user_status =1  AND a.attest_status=1 AND a.status=1
			GROUP BY a.uin
			ORDER BY c.weight DESC , money DESC
			LIMIT 5 ";

	  $dao= new Model();
	  $data = $dao->query($sql);
	  return $data;
  }



}