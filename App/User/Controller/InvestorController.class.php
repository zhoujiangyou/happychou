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

class InvestorController extends PublicController
{
    //投资的项目
    public function index()
    {
        $this->display();
    }

    //约谈状态
    public function interview_status($status)
    {
        switch ($status) {
            case '1':
                return '已约谈';
                break;
            case '2':
                return '已拒绝';
                break;
            default:
                return '约谈中';
                break;
        }
    }

    //约谈的项目
    public function interview_item()
    {
        $itemInterview = D('ItemInterview');
        $where['a.uin'] = $_SESSION['user']['uin'];
        $count = $itemInterview->countList($where); // 统计有多少条数据
        $Page = new Page($count, 10); // 实例化分页类 传入总记录数和每页显示的记录数(20)
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $this->page = $Page->show(); // 分页显示输出
        $info = $itemInterview->loadList($where, $limit);
        foreach ($info as $k => $v) {
            $info[$k]['status'] = $this->interview_status($v['status']);
        }
        $this->interview = $info;
        $this->display();
    }

    //收藏的项目
    public function collect_item()
    {
        $collect = D('ItemCollect');
        $where['a.uin'] = $_SESSION['user']['uin'];
        $count = $collect->countList($where);
        $Page = new Page($count, 10);        // 实例化分页类 传入总记录数和每页显示的记录数(20)
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $this->page = $Page->show(); // 分页显示输出
        $this->collect = $collect->loadList($where, $limit);
        $this->display();
    }


    //取消收藏
    public function collect_del()
    {
        if (D('ItemCollect')->delete(I('post.id')))
            $this->ajaxReturn(array('status' => 1, 'info' => '取消收藏成功！'));
        else
            $this->ajaxReturn(array('status' => 0, 'info' => '取消收藏失败！'));
    }

    //跟投的股权项目
    public function with_item()
    {
        $Form = M('item_with_order');
        $where = array(
            'uin' => session('user.uin'),
            'type' => 0,                //类别为股权项目
        );
        $count = $Form->where($where)->count();
        $Page = new Page($count, 10);
        $this->page = $Page->show();
        $item_with_order_list = $Form->where($where)
            ->limit($Page->firstRow . ',' . $Page->listRows)
            ->order('id desc')
            ->select();
        foreach ($item_with_order_list as $key => $value) {
            $item_with_order_list[$key]['item_info'] = M('item')->where(array('id' => $value['itemid']))->find();
        }
        $this->lists = $item_with_order_list;
        $this->display();
    }

    //投资的产品项目
    public function product_item()
    {
        $Form = M('item_with_order');
        $where = array(
            'uin' => session('user.uin'),
            'type' => 1,                //类别为股权项目
        );
        $count = $Form->where($where)->count();
        $Page = new Page($count, 10);
        $this->page = $Page->show();
        $item_with_order_list = $Form->where($where)
            ->limit($Page->firstRow . ',' . $Page->listRows)
            ->order('id desc')
            ->select();
        foreach ($item_with_order_list as $key => $value) {
            $item_with_order_list[$key]['item_info'] = M('item')->where(array('id' => $value['itemid']))->find();
        }
        $this->lists = $item_with_order_list;
        $this->display();
    }

    //领投项目列表
    public function lead()
    {
        $leadUser = D('ItemLeadUser');
        $where['a.uin'] = session('user.uin');
        $where['a.status'] = '1';
        $count = $leadUser->countList($where);
        $Page = new Page($count, 10);        // 实例化分页类 传入总记录数和每页显示的记录数(20)
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $this->page = $Page->show();        // 分页显示输出
        $list = $leadUser->loadList($where, $limit);
        foreach ($list as $k => $v) {
            $list[$k]['money'] = D('ItemWithOrder')->countMoney($v['itemid'], $v['uin']); //统计申请人已经认投多少钱
        }
        $this->list = $list;
        $this->display();
    }

    //项目搜索
//搜索条件为空的时候 不返回任何数据
//正常情况下  每次返回20条数据
    public function searchitem(){
     $sear = I('get.condition');
        if(!$sear){
            $this->ajaxReturn(AjaxResult(1,'数据为空'));
        }
     $where['status']=1;
     $where['name|desc']=array(array('LIKE','%'.$sear.'%'),array('LIKE','%'.$sear.'%'),'_multi'=>true);
        $data = M('Item')->where($where)->limit(20)->select();
        if($data){
            foreach($data as $key=>$value){
                $data[$key]['city']=get_category($value['city']);
                $data[$key]['interview'] = D('ItemInterview')->countList(array('itemid' => $value['id']));
                $data[$key]['countlead'] = D('ItemLeadUser')->countLead($value['id']);
                $data[$key]['success_rate'] = D('ItemWithOrder')->successRate($value['id']);                //完成率
                $data[$key]['count_money'] = D('ItemWithOrder')->countMoney($value['id']);                //现已融资
                $data[$key]['countorder'] = D('ItemWithOrder')->countList(array('itemid' => $value['id']));
            }
            $this->ajaxReturn(AjaxResult(1,'获取数据成功',$data));
        }else{
            $this->ajaxReturn(AjaxResult(1,'数据为空'));
        }
    }


    //用户提交给我的项目

    public function showitemstome(){
        $uin = session('user.uin');
        $data = M('item_submit')->where(array('invest_uin'=>$uin))->field('distinct itemid')->select();
        if($data){
            $newarr=array();
            foreach($data as $value){
                array_push($newarr,$value['itemid']);
            }
           $iteminfocount = M('item')->where(array('id'=>array('in',$newarr)))->count();
            $Page = new Page($iteminfocount, 10);        // 实例化分页类 传入总记录数和每页显示的记录数(20)
            $limit = $Page->firstRow . ',' . $Page->listRows;
            $iteminfo =M('item')->where(array('id'=>array('in',$newarr)))->limit($limit)->select();

            foreach ($iteminfo as $k => $v) {
                $iteminfo[$k]['interview'] = D('ItemInterview')->countList(array('itemid' => $v['id']));
                $iteminfo[$k]['countlead'] = D('ItemLeadUser')->countLead($v['id']);
                $iteminfo[$k]['success_rate'] = D('ItemWithOrder')->successRate($v['id']);                //完成率
                $iteminfo[$k]['count_money'] = D('ItemWithOrder')->countMoney($v['id']);                //现已融资
                $iteminfo[$k]['countorder'] = D('ItemWithOrder')->countList(array('itemid' => $v['id']));
                $iteminfo[$k]['tuijiannum'] =M('item_submit')->where(array('itemid'=>$v['id']))->count(); //获取该项目被推荐次数
            }
            $this->page = $Page->show();        // 分页显示输出
            $this->list=$iteminfo;
            $this->display();
        }else{
            $this->display();
        }
    }

}