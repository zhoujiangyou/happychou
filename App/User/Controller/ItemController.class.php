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

class ItemController extends PublicController
{
    /**
     * 项目列表页面
     */
    public function index()
    {
        //项目列表
        $item = D('Item');
        $progress = I('get.progress');
        //主要针对产品项目
        $status = I('get.status', null);
        $invest_status = I("get.invest_status", null);

        $item_type = I("get.item_type", 1);

        if ($progress) {
            $where['a.progress'] = $progress;
        }
        if ($status != null) {
            $where['a.status'] = $status;
        }
        if ($invest_status != null) {
            $where['a.invest_status'] = $invest_status;
        }

        $where['a.item_type'] = $item_type;
        $where['a.uin'] = session('user.uin');
        $count = $item->countList($where);
        $Page = new Page($count, 10);                    // 实例化分页类 传入总记录数和每页显示的记录数(10)
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $show = $Page->show();
        $list = $item->loadList($where, $limit);
        foreach ($list as $k => $v) {
            $list[$k]['interview'] = D('ItemInterview')->countList(array('itemid' => $v['id']));
            $list[$k]['countlead'] = D('ItemLeadUser')->countLead($v['id']);
            $list[$k]['success_rate'] = D('ItemWithOrder')->successRate($v['id']);                //完成率
            $list[$k]['count_money'] = D('ItemWithOrder')->countMoney($v['id']);                //现已融资
            $list[$k]['countorder'] = D('ItemWithOrder')->countList(array('itemid' => $v['id']));
            if(!$list[$k]['progress_name']){
                $list[$k]['progress_name']='待审核中';
            }
        }
        //进度列表
        $this->progresslist = M('item_progress')->select();
        $this->page = $show;
        $this->list = $list;
        if ($item_type == 1) {
            $this->display("index");
        } else {
            $this->display("product_list");
        }
    }

    //项目视频
    public function item_video()
    {
        if (IS_POST) {
            $ItemVideo = D('ItemVideo');
            $post = I('post.');
            $videoid = M('item_video')->where(array('itemid' => $post['itemid'], 'type' => $post['type']))->getField('id');
            if ($videoid) {
                $ok = M('item_video')->where(array('id' => $videoid))->setField('url', $post['url']);
            } else {
                if (!$ItemVideo->create()) {
                    $this->error($ItemVideo->getError());
                } else {
                    $ok = $ItemVideo->add();
                };
            }
            if ($ok) {
                $this->success('成功');
            } else {
                $this->error('失败');
            }
        } else {
            $itemid = I('get.itemid');
            $itemvideo = D('ItemVideo')->loadList($itemid);
            $this->itemid = $itemid;
            $this->video = $itemvideo;
            $this->display();
        }
    }

    /**
     * 项目新增方法
     */
    public function item_add()
    {
        A('Attest')->card_in_check(); //验证是否补全信息
        $setup = I('get.set');
        $itemid = I('get.itemid');
        if ($itemid) {
            $item = M('item')->where(array('id' => $itemid))->find();
            if ($item['uin'] != session('user.uin')) {
                $this->error('你没有权限');
            }
            $this->item = $item;
            $this->tagsid = M('itemTag')->where(array('itemid' => $itemid))->getField('tagid', true);
            $nowcate = getupcate($item['cid']);
            sort($nowcate);
            $this->nowcate = $nowcate;
            $this->nowcity = M("region")->where("pid=" . $item['province'])->select();
        }
        $this->itemid = $itemid;
        switch ($setup) {
            case 2:
                $this->display('item_add_set2');
                break;
            case 3:
                $item['prove'] = M('item_prove')->where(array('itemid' => $itemid))->select();
                $item['video'] = M('item_video')->where(array('itemid' => $itemid))->getField('url');
                $this->item = $item;
                $this->display('item_add_set3');
                break;
            case 4:
                $this->display('item_add_set4');
                break;
            case 5:
                $item['prove'] = M('item_prove')->where(array('itemid' => $itemid))->select();
                $item['video'] = M('item_video')->where(array('itemid' => $itemid))->getField('url');
                $this->item = $item;
                $this->display('item_add_set5');
                break;
            default:
                $top = M('item_category')->where(array('pid' => 0, 'status' => 1))->select();
                $this->tags = M('tags')->where(array('status' => 1))->select();
                $this->cate = $top;
                $this->province = M("region")->where(array('pid' => 0))->select();
                $this->display();
        }
    }

    public function get_category()
    {
        $pid = I('get.pid');
        if (get_category($pid)) {
            $this->success(get_category($pid));
        }
    }

    //获取地区信息
    public function get_region()
    {
        $pid = I('get.pid');
        if (get_region($pid)) {
            $this->success(get_region($pid));
        }
    }

    //项目入库
    public function item_in()
    {
        if (IS_POST) {
            $item = D('item');
            $post = I('post.');
            $tags = explode(',', $post['tag']);
            $post['update_time'] = time();
            $post['time'] = time();
            $post['start_time'] = 0; //strtotime($post['start_time'])
            $post['end_time'] = 0;//strtotime($post['end_time'])
            $post['uin'] = session('user.uin');
            $post['province'] = $post['province'];
            $post['city'] = $post['city'];
            $post['brokerage'] = $post['brokerage'];
            $post['item_type'] = $post['item_type'];
            $p = $post['type'] == 'add' ? 1 : 2;
            if (!$item->create($post, $p)) {
                $this->error($item->getError());
            } else {
                if ($post['type'] != 'add') {
                    //罗家明修改验证POST ID权限BUG;
                    $uin = D('item')->where(array('id' => $post['type']))->getField('uin');
                    if ($uin != session('user.uin')) {
                        $this->error('你没有权限');
                    }
                    D('ItemTag')->where(array('itemid' => $post['type']))->delete();
                    foreach ($tags as $k => $v) {
                        $tagarr[] = array('tagid' => $v, 'itemid' => $post['type']);
                    }
                    $result = $item->where(array('id' => $post['type']))->save();
                    D('ItemTag')->addAll($tagarr);
                    if ($result) {
                        if ($post['item_type'] == 1) {
                            $this->success('', U('Item/item_add', array('itemid' => $post['type'], 'set' => 2)));
                        } else {
                            $this->success('', U('Item/item_add', array('itemid' => $post['type'], 'set' => 5)));
                        }
                    } else {
                        $this->error('修改失败！');
                    }
                } else {
                    $itemid = $item->add();
                    foreach ($tags as $k => $v) {
                        $tagarr[] = array('tagid' => $v, 'itemid' => $itemid);
                    }
                    D('ItemTag')->addAll($tagarr);
                    if ($post['item_type'] == 1) {
                        $this->success('', U('Item/item_add', array('itemid' => $itemid, 'set' => 2)));
                    } else {
                        $this->success('', U('Item/item_add', array('itemid' => $itemid, 'set' => 5)));
                    }
                }
            }
        }
    }

    //第二步项目资料提交
    public function item_in_two()
    {
        if (!IS_POST) {
            $this->error();
        } else {
            $item = D('item');
            $post = I('post.');
            $itemid = I('post.id');
            $uin = M('item')->where(array('id' => $itemid))->getField('uin');
            if ($uin != session('user.uin')) {
                $this->error('你没有权限');
            }
            if (!$item->create($post, 2)) {
                $this->error($item->getError());
            } else {
                $item->save();
                $this->success('', U('Item/item_add', array('itemid' => $itemid, 'set' => 3)));
            }
        }
    }

    // 第三步项目资料提交
    public function item_in_third()
    {
        if (!IS_POST) {
            $this->error();
        }
        $item = D('item');
        $post = I('post.');
        $itemid = I('post.id');
        $uin = M('item')->where(array('id' => $itemid))->getField('uin');
        if ($uin != session('user.uin')) {
            $this->error('你没有权限');
        }
        if (!$item->create($post, 2)) {
            $this->error($item->getError());
        } else {
            $item->save();
            //插入视频
            if ($post['video']) {
                $video = M('item_progress')->find();//查找第一个进度
                $data['itemid'] = $itemid;
                $data['url'] = $post['video'];
                $data['type'] = $video['id'];
                $data['time'] = time();
                $r = M('item_video')->where(array('itemid' => $itemid, 'type' => $data['type']))->find();
                if ($r) {
                    M('item_video')->where(array('itemid' => $itemid))->save($data);
                } else {
                    M('item_video')->add($data);
                }
            }
            $proveattr = explode(',', $post['prove']); // 组成数组
            foreach ($proveattr as $k => $v) {
                $prove[] = array('url' => $v, 'itemid' => $itemid, 'time' => time());
            }
            M('item_prove')->where(array('itemid' => $itemid))->delete();
            M('item_prove')->addAll($prove);
            $this->success('', U('User/Item/index'));
        }
    }

    //项目方约谈列表
    public function interview(){
        $itemid = I('get.itemid', null);
        $status = I('get.status', null);
        if ($itemid!=null) {
            $where['a.itemid'] = $itemid;
        }else{
            //查看个人发布项目的所有约谈列表
            $uin = session('user.uin');
            $ids = M("item")->where("uin=".$uin)->field("id")->select();
            $itemids = array_columnmy($ids);
            if(!empty($itemids)){
                $where['a.itemid'] = array("in", $itemids);
            }else{
                $where['a.itemid']=array('in','0');
            }
        }
        if ($status!=null) {
            $where['a.status'] = $status;
        } //如果指定状态
        $investor = D('ItemInterview');
        $count = $investor->countList($where); // 统计有多少条数据
        $Page = new Page($count, 10); // 实例化分页类 传入总记录数和每页显示的记录数(20)
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $this->page = $Page->show(); // 分页显示输出
        $list = $investor->loadList($where, $limit);
        foreach ($list as $k => $v) {
            $list[$k]['interview_name'] = A('Investor')->interview_status($v['status']);
        }
        $this->list = $list;
        $this->display();
    }

    //约谈状态更改操作
    public function intervies_status()
    {
        if (!IS_POST) $this->ajaxReturn(array('status' => 0, 'info' => '操作失败！'));
        $postData = I('post.');
        $where['id'] = $postData['id'];
        $itemid = M('item_interview')->where($where)->getField('itemid');    //获取约谈的项目
        A('Login')->check_itemid($itemid);
        $ok = M('item_interview')->where($where)->setField('status', $postData['status']);
        if ($ok) {
            $this->ajaxReturn(array('status' => 1, 'info' => '操作成功！'));
        } else {
            $this->ajaxReturn(array('status' => 0, 'info' => '操作失败！'));
        }
    }

    public function sendsms()
    {
        $end = session('smstime') + 90 - time();
        if ($end > 1) {
            $this->error('距离上一次发送还有' . $end . '秒');
        } else {
            $phone = session('user.phone');
            $code = rand(10000, 99999);
            session('smscode', $code, 90);
            session('smstime', time());
            $this->success($code);
        }
    }

    //设置项目的回报
    public function set_item_return(){
        $itemid = I("get.itemid");
        if($itemid)$where['itemid']=$itemid;
        $itemReturn = D("ItemReturn");
        $count = $itemReturn->countList($where);
        $Page = new Page($count, 10);                    // 实例化分页类 传入总记录数和每页显示的记录数(25)
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $show = $Page->show();
        $list = $itemReturn->loadList($where, $limit);
        $this->itemid = $itemid;
        $this->invest = $list;
        $this->show = $show;
        $this->display();
    }


    //添加产品众筹回报规则
    public function add_item_return()
    {
        if (IS_POST) {
            $post = I("post.");
            $itemid = $post['itemid'];
            $img = $post['img'];
            $item = D('ItemReturn');
            $p = $post['post_type'] == 'add' ? $item::MODEL_INSERT : $item::MODEL_UPDATE;
            if (!$item->create($post, $p)) {
                $this->error($item->getError());
            } else {
                if ($post['post_type'] != 'add') {
                    M("item_return_image")->where(array('item_return_id' => $post['post_type']))->delete();        //将海报图片删除
                    $result = $item->where(array('id' => $post['post_type']))->save();
                    $other = M("item_return_image")->add(array("item_id" => $itemid, 'item_return_id' => $post['post_type'], 'image' => $img));        //将海报图片写入数据库
                    if ($result || $other) {
                        $this->success('修改成功', U('Item/set_item_return', array('itemid' => $itemid)));
                    } else {
                        $this->error('修改失败！');
                    }
                } else {
                    $item_return_id = $item->add();
                    if ($item_return_id) {
                        M("item_return_image")->add(array("item_id" => $itemid, 'item_return_id' => $item_return_id, 'image' => $img));        //将海报图片写入数据库
                        $this->success('添加成功！', U('Item/set_item_return', array('itemid' => $itemid)));
                    } else {
                        $this->success('添加失败！', U('Item/add_item_return', array('itemid' => $itemid)));
                    }
                }
            }
        } else {
            $itemid = I("get.itemid");
            $this->itemid = $itemid;
            $id = I('get.id');
            if ($id) {
                $item = D('ItemReturn')->getInfo(array("a.id" => $id));
                $this->item = $item;
                $this->return_img = M('item_return_image')->where(array('item_return_id' => $id))->find();
            }
            $this->display();
        }

    }

    //删除产品回报项
    public function product_item_del()
    {
        if (IS_POST) {
            $http_post = I('post.');
            M("item_return_image")->where(array("item_return_id" => $http_post['id']))->delete();
            $delete = M('item_return')->where(array('id' => $http_post['id']))->delete();
            if ($delete) {
                $this->ajaxReturn(array('info' => '删除成功!', 'status' => 1));
            } else {
                $this->ajaxReturn(array('info' => '删除失败!', 'status' => 0));
            }
        }
    }

    //设置项目的大事记
    public function set_item_events(){
        $itemid = I("get.itemid");
        if($itemid)$where['itemid']=$itemid;
        $itemEvents = D("ItemEvents");
        $count = $itemEvents->countList($where);
        $Page = new Page($count, 10);                    // 实例化分页类 传入总记录数和每页显示的记录数(25)
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $show = $Page->show();
        $list = $itemEvents->loadList($where, $limit);
        $this->itemid = $itemid;
        $this->events = $list;
        $this->show = $show;
        $this->display();
    }
    //设置项目的新闻
    public function set_item_news(){
        $itemid = I("get.itemid");
        if($itemid)$where['a.itemid']=$itemid;
        $itemnews = D("ItemNews");
        $count = $itemnews->countList($where);
        $Page = new Page($count, 10);                    // 实例化分页类 传入总记录数和每页显示的记录数(25)
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $show = $Page->show();
        $list = $itemnews->loadList($where, $limit);
        $this->itemid = $itemid;
        $this->events = $list;
        $this->show = $show;
        $this->display();
    }
    //显示项目创始团队成员
    public function set_item_team(){
        $itemid = I("get.itemid");
        if($itemid)$where['itemid']=$itemid;
        $itemTeam = D("ItemTeam");
        $count = $itemTeam->countList($where);
        $Page = new Page($count, 10);                    // 实例化分页类 传入总记录数和每页显示的记录数(25)
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $show = $Page->show();
        $list = $itemTeam->loadList($where, $limit);
        $this->itemid = $itemid;
        $this->team = $list;
        $this->show = $show;
        $this->display();
    }

    //添加创始团队成员
    public function add_item_team(){
        if (IS_POST) {
            $post = I("post.");
            $itemid = $post['itemid'];
            $phone = $post['phone'];
            $item = D('ItemTeam');
            $where['a.phone']=$phone;
            $userInfo = D("User")->getInfo($where);
            if(empty($userInfo)){
                $this->error("您输入的用户不存在，或者输入错误，请重试！", U('user/item/add_item_team', array('itemid' => $itemid)));
            }else{
                $post['uin']=$userInfo['uin'];
            }

            $p = $post['post_type'] == 'add' ? $item::MODEL_INSERT : $item::MODEL_UPDATE;
            if (!$item->create($post, $p)) {
                $this->error($item->getError());
            } else {
                if ($post['post_type'] != 'add') {
                    $result = $item->where(array('id' => $post['post_type']))->save();
                    if ($result) {
                        $this->success('修改成功', U('user/item/set_item_team', array('itemid' => $itemid)));
                    } else {
                        $this->error('修改失败！', U('user/item/add_item_team', array('itemid' => $itemid)));
                    }
                } else {
                    $team_result = $item->getInfo($where);
                    if(!empty($team_result)) {
                        $this->error("您已输入此用户，请勿重复！", U('user/item/add_item_team', array('itemid' => $itemid)));
                    }
                    $item_team_id = $item->add();
                    if ($item_team_id) {
                        $this->success('添加成功！', U('user/item/set_item_team', array('itemid' => $itemid)));
                    } else {
                        $this->success('添加失败！', U('user/item/add_item_team', array('itemid' => $itemid)));
                    }
                }

            }
        } else {
            $itemid = I("get.itemid");
            $this->itemid = $itemid;
            $id = I('get.id');
            if ($id) {
                $team = D('ItemTeam')->getInfo(array("a.id" => $id));
                $this->team = $team;
            }
            $this->display();
        }
    }

    //删除团队成员
    public function del_team(){
        if (IS_AJAX) {
            $http_post = I('post.');
            $delete = M('item_team')->where(array('id' => $http_post['id']))->delete();
            if ($delete) {
                $this->ajaxReturn(array('info' => '删除成功!', 'status' => 1));
            } else {
                $this->ajaxReturn(array('info' => '删除失败!', 'status' => 0));
            }
        }else{
            exit("亲，不要调皮哦！^_^");
        }
    }


    /**
     * 向投资人提交项目
     */
    public function submit_item(){
        if(IS_AJAX){
            $user = M("item_submit");
            $data['itemid'] = I("post.itemid");
            $data['invest_uin'] = I("post.uin");
            $data['uin'] =  session("user.uin");
            $data['time'] = time();
            if(!$user->create($data)){
                $this->error($user->getError());
            }else{
                $result = $user->add();
                if($result){
                    $this->success("提交成功！");
                }else{
                    $this->success("提交失败！");
                }
            }

        }else{
            $invest_uin=I('get.id');
            $where['a.item_type'] = 1;
            $uin =  session("user.uin");
            if($uin && $invest_uin){
                $where['a.uin'] =$uin;
            }else{
                $this->error("请正常访问~!^_^");
            }
            //已经提交过的就不显示出来
            $items = M("item_submit")->where(array('uin'=>$uin, 'invest_uin'=>$invest_uin))->field("itemid")->select();
            if(!empty($items)){
                $ids = array_columnmy($items);
                $where['a.id'] = array('not in',$ids);
            }
            $list = D('Item')->loadList($where);
            foreach ($list as $k => $v) {
                $list[$k]['interview'] = D('ItemInterview')->countList(array('itemid' => $v['id']));
                $list[$k]['countlead'] = D('ItemLeadUser')->countLead($v['id']);
                $list[$k]['success_rate'] = D('ItemWithOrder')->successRate($v['id']);                //完成率
                $list[$k]['count_money'] = D('ItemWithOrder')->countMoney($v['id']);                //现已融资
                $list[$k]['countorder'] = D('ItemWithOrder')->countList(array('itemid' => $v['id']));
            }
            $this->item = $list;
            $this->uin = $invest_uin;
            $this->display();
        }

    }


    //投资股权项目
    public function with_item()
    {
        if (!IS_POST) $this->ajaxReturn(array('info' => '操作失败!', 'status' => 0));
        $httppost = I('post.');
        $userinfo = M('user')->where(array('uin' => session('user.uin')))->find();
        if (!$userinfo) $this->ajaxReturn(array('info' => '用户验证失败!', 'status' => 0));
        $itemid = $httppost['itemid'];  //提交过来的项目ID
        $amount = $httppost['amount'];  //提交过来的份数
        $item_info = M('item')
            ->where(array('id' => $itemid))
            ->find();
        $item_amount_info = M('item_with_order')
            ->where(array('itemid' => $item_info['id']))
            ->sum('amount');
        $surplus_amount = $item_info['amount'] - $item_amount_info;
        if ($surplus_amount < $amount) {
            $this->ajaxReturn(array('msg' => '投资已经满了!', 's_ok' => 0));
        }
        $money = $item_info['lowest_money'] * $amount;
        if ($money <= 0) {
            $this->ajaxReturn(array('msg' => '不能投资0元!', 's_ok' => 0));
        }
//        if ($money > $userinfo['money']) {
//            $this->ajaxReturn(array('info' => '投资失败,金钱不足,是否充值?', 'url' => U('user/prepaid/index'), 'status' => 0));
//        }
       // $User = M('user');
        // 启动事务
        $Order = M('user_money_details');
        $Order->startTrans();
        $Item = M('item_with_order');
        $item_with_order_info = $Item->where(array('uin' => $userinfo['uin'], 'itemid' => $itemid))->find();
        //操作表1
        if (!$item_with_order_info) {
            //增加投资记录
            $add_item_with_order_data['uin'] = $userinfo['uin'];
            $add_item_with_order_data['itemid'] = $itemid;
            $add_item_with_order_data['amount'] = $amount;
           // $add_item_with_order_data['money'] = $money;//等待后台确认之后在进行money的更改
            $add_item_with_order_data['status'] = 0;
            $add_item_with_order_data['item_name'] = $item_info['name'];
            $add_item_with_order_data['card_holder']=$httppost['card_holder'];
            $add_item_with_order_data['account']=$httppost['account'];
            $add_item_with_order_data['type'] = 0;
            $add_item_with_order_data['create_time'] = time();
            $add_item_with_order = $Item->data($add_item_with_order_data)->add();
            $remark = '项目:' . $item_info['name'] . '投资:' . $money . '元,订单ID:' . $add_item_with_order;
            $item_order_id = $add_item_with_order;
        } else {
            //修改投资记录
            $update_item_with_order_data['amount'] = $item_with_order_info['amount'] + $amount;
           // $update_item_with_order_data['money'] = $item_with_order_info['money'] + $money; //等待后台确认之后在进行money的更改
            $update_item_with_order_data['update_time'] = time();
            $add_item_with_order_data['status'] = 0;






            $updataorder['uin'] = $userinfo['uin'];
            $updataorder['itemid'] = $itemid;
            $updataorder['amount'] = $amount;
            // $add_item_with_order_data['money'] = $money;//等待后台确认之后在进行money的更改
            $updataorder['status'] = 0;
            $updataorder['item_name'] = $item_info['name'];
            $updataorder['card_holder']=$httppost['card_holder'];
            $updataorder['account']=$httppost['account'];
            $updataorder['type'] = 0;
            $updataorder['create_time'] = time();
            $Item->data($updataorder)->add();





            $add_item_with_order = $Item->where(array('id' => $item_with_order_info['id']))->setField($update_item_with_order_data);
            $remark = '项目:' . $item_info['name'] . '追加投资:' . $money . '元,订单ID:' . $item_with_order_info['id'];
            $item_order_id = $item_with_order_info['id'];
        }
        //操作表2
        //用户资金减少
//        $setmoney = $User->where(array('uin' => $userinfo['uin']))->setDec('money', $money);
        //操作表3

        //写入资金明细
        $money_details_data['uin'] = $userinfo['uin'];
        $money_details_data['title'] = '项目投资';
        $money_details_data['type'] = 2;//出账
        $money_details_data['money'] = $money;
        $money_details_data['balance'] = $userinfo['money'] - $money;
        $money_details_data['user_ip'] = get_client_ip();
        $money_details_data['status'] = 1;
        $money_details_data['remark'] = $remark;
        $money_details_data['create_time'] = time();
        $del_money_details = $Order->data($money_details_data)->add();
        $Item->where(array('id' => $item_order_id))->setField(array('payment_id' => $del_money_details));    //将payment_id写入数据库
        if ($add_item_with_order and $del_money_details) {
            // 提交事务
            $Order->commit();
            $this->ajaxReturn(array('msg' => '投资成功', 's_ok' => 1));
        } else {
            // 事务回滚
            $Order->rollback();
            $this->ajaxReturn(array('msg' => '投资失败!', 's_ok' => 0));
        }

    }

    //投资产品项目
    public function with_product()
    {
        if (!IS_POST) $this->ajaxReturn(array('info' => '操作失败!', 'status' => 0));
        $httppost = I('post.');
        $userinfo = M('user')->where(array('uin' => session('user.uin')))->find();
        if (!$userinfo) $this->ajaxReturn(array('info' => '用户验证失败!', 'status' => 0));
        $itemid = $httppost['itemid'];                  //提交过来的项目ID
        $item_return_id = $httppost['item_return_id'];  //提交回报项id
        $money = $httppost['money'];                    //提交的钱数
        $amount = 1;                                    //提交过来的份数
        $item_info = M('item')
            ->where(array('id' => $itemid))
            ->find();
        $item_amount_info = M('item_with_order')
            ->where(array('itemid' => $item_info['id']))
            ->sum('money');
        $surplus_money = $item_info['raising_money'] - $item_amount_info;
        if ($surplus_money < $money) {
            $this->ajaxReturn(array('info' => '投资已经满了!', 'status' => 0));
        }
        if ($money <= 0) {
            $this->ajaxReturn(array('info' => '不能投资0元!', 'status' => 0));
        }
        if ($money > $userinfo['money']) {
            $this->ajaxReturn(array('info' => '投资失败,金钱不足,是否充值?', 'url' => U('user/prepaid/index'), 'status' => 0));
        }
        $User = M('user');
        // 启动事务
        $User->startTrans();
        $Order = M('user_money_details');
        $Item = M('item_with_order');
        $item_with_order_info = $Item->where(array('uin' => $userinfo['uin'], 'itemid' => $itemid))->find();
        $item_order_id = 0;
        //操作表1
        if (!$item_with_order_info) {
            //增加投资记录
            $add_item_with_order_data['uin'] = $userinfo['uin'];
            $add_item_with_order_data['itemid'] = $itemid;
            $add_item_with_order_data['item_return_id'] = $item_return_id;
            $add_item_with_order_data['amount'] = $amount;
            $add_item_with_order_data['money'] = $money;
            $add_item_with_order_data['status'] = 1;
            $add_item_with_order_data['item_name'] = $item_info['name'];

            $add_item_with_order_data['type'] = 1;
            $add_item_with_order_data['create_time'] = time();
            $add_item_with_order = $Item->data($add_item_with_order_data)->add();
            $remark = '项目:' . $item_info['name'] . '投资:' . $money . '元,订单ID:' . $add_item_with_order;
            $item_order_id = $add_item_with_order;
        } else {
            //修改投资记录
            $update_item_with_order_data['amount'] = $item_with_order_info['amount'] + $amount;
            $update_item_with_order_data['money'] = $item_with_order_info['money'] + $money;
            $update_item_with_order_data['update_time'] = time();
            $add_item_with_order = $Item->where(array('id' => $item_with_order_info['id']))->setField($update_item_with_order_data);
            $remark = '项目:' . $item_info['name'] . '追加投资:' . $money . '元,订单ID:' . $item_with_order_info['id'];
            $item_order_id = $item_with_order_info['id'];
        }
        //操作表2
        //用户资金减少
        $setmoney = $User->where(array('uin' => $userinfo['uin']))->setDec('money', $money);
        //操作表3

        //写入资金明细
        $money_details_data['uin'] = $userinfo['uin'];
        $money_details_data['title'] = '项目投资';
        $money_details_data['type'] = 2;//出账
        $money_details_data['money'] = $money;
        $money_details_data['balance'] = $userinfo['money'] - $money;
        $money_details_data['user_ip'] = get_client_ip();
        $money_details_data['status'] = 1;
        $money_details_data['remark'] = $remark;
        $money_details_data['create_time'] = time();
        $del_money_details = $Order->data($money_details_data)->add();
        $Item->where(array('id' => $item_order_id))->setField(array('payment_id' => $del_money_details));    //将payment_id写入数据库
        if ($add_item_with_order and $setmoney and $del_money_details) {
            // 提交事务
            $User->commit();
            $this->ajaxReturn(array('info' => '投资成功', 'status' => 1, 'url' => U('user/investor/product_item')));
        } else {
            // 事务回滚
            $User->rollback();
            $this->ajaxReturn(array('info' => '投资失败!', 'status' => 0));
        }
    }

    //股权项目大纪事 数据页面展示
    public function show_events(){
        $user_uin = session('user.uin');
        //获取该用户发布的项目 itemid
        $itemids = M('item')->where(array('uin'=>$user_uin))->field('id')->select();
        $itemwhere=array_columnmy($itemids);
        $where['itemid']=array('in',$itemwhere);
        $count 			=  M('item_events')->where($where)->count();
        $Page       	= new Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $limit 			= $Page->firstRow.','.$Page->listRows;
        $this->page  	= $Page->show();
        $showdata = M('item_events')->where($where)->order('time desc')->limit($limit)->select();
        $this->list=$showdata;
        $this->display();
    }

    //股权项目新闻增加
    public function add_news(){
        if(IS_POST) {
            $data = I('post.');
            $data['news_time'] = time();
            $news = M('item_news');
            $result = $news->data($data)->add();
            if ($result) {
                $this->ajaxReturn(AjaxResult(1, '新增成功'));
            } else {
                $this->ajaxReturn(AjaxResult(0, '新增失败'));
            }
        }else{
            $this->display();
        }

    }

//股权项目新闻修改
public function save_news(){
    if(IS_POST){
        $data = I('post.');
        $news=M('item_news');
        $change=array('news_title'=>$data['news_title'],'news_content'=>$data['news_content'],'news_time'=>time());
        if($news->where(array('id'=>$data['id']))->save($change)){
            $this->ajaxReturn(AjaxResult(1,'修改成功'));
        }else{
            $this->ajaxReturn(AjaxResult(0,'修改失败'));
        }
    }else{
        $id=I('get.id');
        $data =M('item_news')->where(array('id'=>$id))->select();
        $this->data=$data;
        $this->display();
    }

}


    //添加项目大事记
    public function add_item_events(){
        if (IS_POST) {
            $post = I("post.");
            $itemid = $post['itemid'];
            $post['time']= strtotime($post['time']);
            $item = D('ItemEvents');
            $p = $post['post_type'] == 'add' ? $item::MODEL_INSERT : $item::MODEL_UPDATE;
            if (!$item->create($post, $p)) {
                $this->error($item->getError());
            } else {
                if ($post['post_type'] != 'add') {
                    $result = $item->where(array('id' => $post['post_type']))->save();
                    if ($result) {
                        $this->success('修改成功', U('Item/set_item_events', array('itemid' => $itemid)));
                    } else {
                        $this->error('修改失败！');
                    }
                } else {
                    $item_event_id = $item->add();
                    if ($item_event_id) {
                        $this->success('添加成功！', U('Item/set_item_events', array('itemid' => $itemid)));
                    } else {
                        $this->success('添加失败！', U('Item/add_item_events', array('itemid' => $itemid)));
                    }
                }

            }
        } else {
            $itemid = I("get.itemid");
            $this->itemid = $itemid;
            $id = I('get.id');
            if ($id) {
                $events = D('ItemEvents')->getInfo(array("a.id" => $id));
                $this->events = $events;
            }
            $this->display();
        }
    }



    //添加项目新闻
    public function add_item_news(){
        if (IS_POST) {
            $post = I("post.");
            $itemid = $post['itemid'];
            $post['news_time']= strtotime($post['news_time']);
            $item = D('ItemNews');
            $p = $post['post_type'] == 'add' ? $item::MODEL_INSERT : $item::MODEL_UPDATE;
            if (!$item->create($post, $p)) {
                $this->error($item->getError());
            } else {
                if ($post['post_type'] != 'add') {
                    $result = $item->where(array('id' => $post['post_type']))->save();
                    if ($result) {
                        $this->success('修改成功', U('Item/set_item_news', array('itemid' => $itemid)));
                    } else {
                        $this->error('修改失败！');
                    }
                } else {
                    $item_event_id = $item->add();
                    if ($item_event_id) {
                        $this->success('添加成功！', U('Item/set_item_news', array('itemid' => $itemid)));
                    } else {
                        $this->success('添加失败！', U('Item/set_item_news', array('itemid' => $itemid)));
                    }
                }

            }
        } else {
            $itemid = I("get.itemid");
            $this->itemid = $itemid;
            $id = I('get.id');
            if ($id) {
                $events = D('ItemNews')->getInfo(array("a.id" => $id));
                $this->events = $events;
            }
            $this->display();
        }
    }






    //删除大事记
    public function del_events(){
        if (IS_AJAX) {
            $http_post = I('post.');
            $delete = M('item_events')->where(array('id' => $http_post['id']))->delete();
            if ($delete) {
                $this->ajaxReturn(array('info' => '删除成功!', 'status' => 1));
            } else {
                $this->ajaxReturn(array('info' => '删除失败!', 'status' => 0));
            }
        }else{
            exit("亲，不要调皮哦！^_^");
        }
    }





    //删除新闻
    public function del_news(){
        if (IS_AJAX) {
            $http_post = I('post.');
            $delete = M('item_news')->where(array('id' => $http_post['id']))->delete();
            if ($delete) {
                $this->ajaxReturn(array('info' => '删除成功!', 'status' => 1));
            } else {
                $this->ajaxReturn(array('info' => '删除失败!', 'status' => 0));
            }
        }else{
            exit("亲，不要调皮哦！^_^");
        }
    }

}