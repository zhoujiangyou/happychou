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

use Think\Page;

class InvestorController extends CommonController
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
        $where['a.uin'] = I('get.uin');
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
        $where['a.uin'] = I('get.uin');;
        $count = $collect->countList($where);
        $Page = new Page($count, 10); // 实例化分页类 传入总记录数和每页显示的记录数(20)
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

    //跟投项目
    public function with_item()
    {
        $Form = M('item_with_order');
        $where = array('uin' => I('get.uin'));
        $count = $Form->where($where)->count();
        $Page = new Page($count, 10);
        $this->page = $Page->show();
        $item_with_order_list = $Form->where($where)->limit($Page->firstRow . ',' . $Page->listRows)->order('id desc')->select();
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
        $where['a.uin'] = I('get.uin');
        $where['a.status'] = '1';
        $count = $leadUser->countList();
        $Page = new Page($count, 10); // 实例化分页类 传入总记录数和每页显示的记录数(20)
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $this->page = $Page->show(); // 分页显示输出
        $list = $leadUser->loadList($where, $limit);
        foreach ($list as $k => $v) {
            $list[$k]['money'] = D('ItemWithOrder')->countMoney($v['itemid'], $v['uin']); //统计申请人已经认投多少钱
        }
        $this->list = $list;
        $this->display();
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

use Think\Page;

class InvestorController extends CommonController
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
        $where['a.uin'] = I('get.uin');
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
        $where['a.uin'] = I('get.uin');;
        $count = $collect->countList($where);
        $Page = new Page($count, 10); // 实例化分页类 传入总记录数和每页显示的记录数(20)
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

    //跟投项目
    public function with_item()
    {
        $Form = M('item_with_order');
        $where = array('uin' => I('get.uin'));
        $count = $Form->where($where)->count();
        $Page = new Page($count, 10);
        $this->page = $Page->show();
        $item_with_order_list = $Form->where($where)->limit($Page->firstRow . ',' . $Page->listRows)->order('id desc')->select();
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
        $where['a.uin'] = I('get.uin');
        $where['a.status'] = '1';
        $count = $leadUser->countList();
        $Page = new Page($count, 10); // 实例化分页类 传入总记录数和每页显示的记录数(20)
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $this->page = $Page->show(); // 分页显示输出
        $list = $leadUser->loadList($where, $limit);
        foreach ($list as $k => $v) {
            $list[$k]['money'] = D('ItemWithOrder')->countMoney($v['itemid'], $v['uin']); //统计申请人已经认投多少钱
        }
        $this->list = $list;
        $this->display();
    }



>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}