<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.happychou.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author:  zhouht (zhouht@happychou.net)
// +----------------------------------------------------------------------
namespace Home\Controller;
use Think\Page;

class ProductController extends CommonController {
    public function index(){
        //分类列表
        $categoryList = M('item_category')->select();
        foreach ($categoryList as $key => $value) {
            $categoryList[$key]['url'] = U('product/index',array('cid'=>$value['id']));
        }
        $this->categorylist = $categoryList;
        //搜索
        $search = I('get.search');
        if ($search) $where['a.name'] = array('like','%'.$search.'%');
        $cid = I('get.cid');
        if ($cid) {
            $where['a.cid']   = $cid;
            $limit            = item_category($cid,'limit');
        }
        $where['a.status'] = 1;
        $where['a.item_type']=2;
        $limit = default_data($limit,5);                          //如果没有限制条数 默认10条
        $count = D('Item')->countList($where);                // 统计有多少条数据
        $Page  = new Page($count,$limit);                   // 实例化分页类 传入总记录数和每页显示的记录数(20)
        $limit = $Page->firstRow.','.$Page->listRows;
        $show       = $Page->show(); // 分页显示输出
        // 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $order = 'a.time desc';
        $itemList = D('Item')->loadList($where,$limit,$order);
        foreach ($itemList as $key => $value) {
            $itemList[$key]['url']              = U('product/detail',array('id'=>$value['id']));
            $itemList[$key]['last_time']        = gettime($value['end_time']-time());
            $itemList[$key]['category_name']    = item_category($value['cid'],'name');
            $itemList[$key]['success_rate']     = D('ItemWithOrder')->successRate($value['id']);     //完成率
        }
        //面包屑导航组装
        $bread = 	'<ul class="x12 bread padding-big-top">
						<li><a href="'.__ROOT__.'/" class="icon-home"> 首页</a></li>
						<li><a href="'.item_category($cid,'url').'">'.item_category($cid,'name').'</a></li>
					</ul>';
        $this -> bread     =$bread;
        $this->productlist    = $itemList;
        $this->page        = $show;
        $this->display();
    }


    public  function detail(){
        $id = I("get.id", 0);
        if($id == 0){
            $this->redirect(U("home/product/index"));
        }
        $info = D("Item")->getInfo(array("a.id"=>$id));
        //项目详情信息
        $this->info = $info;

        $where['a.itemid']=$id;
        $this->team = D("ItemTeam")->loadList($where);                //项目团队成员
        $this->events = D("ItemEvents")->loadList($where);            //获取项目大事记
        $this->support = D("ItemWithOrder")->countSupport($id);       //获取项目支持人数
        $this->return = D("ItemReturn")->loadList($where);            //获取项目回报选项
        $this->collect = D("ItemCollect")->loadList($where, 30);      //获取项目用户关注列表
        $this->collect_num =  D("ItemCollect")->countList($where);    //获取项目用户关注数
        $successRate = D("ItemWithOrder")->successRate($id);
        $this->leftRate = 100-$successRate;                         //项目剩余完成度
        $this->countMoney = D("ItemWithOrder")->countMoney($id);    //项目共筹集多少资金
        $this->itemid = $id;
        $this->display();
    }




}