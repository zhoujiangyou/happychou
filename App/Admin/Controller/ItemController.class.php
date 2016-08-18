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

class ItemController extends CommonController
{
    /**
     * 股权项目列表页面
     */
    public function index()
    {
        //项目列表
        $item = D('Item');
        $progress = I('get.progress');
        $uin = I('get.uin');
        //主要针对产品项目
        $status = I('get.status', null);
        $invest_status = I("get.invest_status", null);

        $item_type = I("get.item_type", 1);
        if ($uin) {
            $where['a.uin'] = $uin;
        }
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
        $count = $item->countList($where);
        $Page = new Page($count, 10);            // 实例化分页类 传入总记录数和每页显示的记录数(25)
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $show = $Page->show();
        $list = $item->loadList($where, $limit);
        foreach ($list as $k => $v) {
            $list[$k]['interview'] = D('ItemInterview')->countList(array('itemid' => $v['id']));
            $list[$k]['countorder'] = D('ItemWithOrder')->countList(array('itemid' => $v['id']));
            $list[$k]['countlead'] = D('ItemLeadUser')->countLead($v['id']);
            $list[$k]['countmoney'] = D('ItemWithOrder')->countMoney($v['id']);;
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


    /**
     * 项目新增方法
     */
    public function item_add()
    {
        $setup = I('get.set');
        $itemid = I('get.itemid');
        if ($itemid) {
            $item = M('item')->where(array('id' => $itemid))->find();
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
                $item['prove'] = M('item_prove')->where(array('itemid' => $itemid))->select();
                $item['video'] = M('item_video')->where(array('itemid' => $itemid))->getField('url');
                $this->item = $item;
                $this->display('item_add_set4');
                break;
            default:
                $top = M('item_category')->where(array('pid' => 0, 'status' => 1))->select();
                $this->tags = M('tags')->where(array('status' => 1))->select();
                $this->cate = $top;
                $this->province = M("region")->where(array('pid' => 0))->select();
                $this->display();
        }
    }

    //项目视频
    public function item_video()
    {
        if (IS_POST) {
            $post = I('post.');
            $videoid = M('item_video')->where(array('itemid' => $post['itemid'], 'type' => $post['type']))->getField('id');
            if ($videoid) {
                $ok = M('item_video')->where(array('id' => $videoid))->setField('url', $post['url']);
            } else {
                $data['itemid'] = $post['itemid'];
                $data['type'] = $post['type'];
                $data['url'] = $post['url'];
                $data['time'] = time();
                $ok = M('item_video')->add($data);
            }
            if ($ok) {
                $this->success('成功');
            } else {
                $this->error('失败');
            }
        } else {
            $itemid = I('get.itemid');
            $itemvideo = M('item_progress as a')
                ->join('__ITEM_VIDEO__ b ON b.type=a.id and b.itemid=' . $itemid, 'LEFT')
                ->field('b.*,a.id as pid,a.name as pname')
                ->where('a.id > 0')
                ->select();
            $this->itemid = $itemid;
            $this->video = $itemvideo;
            $this->display();
        }
    }


    //删除项目进回收站
    public function item_del()
    {
        $id = I('get.id');
        $isdel = I('get.isdel');
        if ($id) {
            if (M('item')->where(array('id' => $id))->setField('isdel', $isdel)) {
                $this->success('成功');
            } else {
                $this->error('失败');
            }
        }


    }

    //修改项目状态
    public function item_editstatus()
    {
        if (IS_POST) {
            $post = I('post.');
            if ($post['progress'] == 'pro') {
                $gai = M('item')->where(array('id' => $post['id']))->setField('progress', $post['status']);
                $data['itemid'] = $post['id'];
                $data['time'] = time();
                $progess = M('item_progress')->where(array('id' => $post['status']))->getField('name');
                $data['content'] = '项目进入' . $progess;
                M('item_log')->add($data);
                $uin = M('item')->where(array('id' => $post['id']))->getField('uin');

                D('UserDoLog')->addData('您的项目进度已变更!', $uin);
            } else {
                $gai = M('item')->where(array('id' => $post['id']))->setField('status', $post['status']);
                if ($post['status'] == '1') {
                    $data['itemid'] = $post['id'];
                    $data['time'] = time();
                    $data['content'] = '项目已被' . C('sitename') . '审核通过';
                    M('item_log')->add($data);
                    $uin = M('item')->where(array('id' => $post['id']))->getField('uin');
                    D('UserDoLog')->addData('您的项目状态已变更!', $uin);
                }
            }
            if ($gai) {
                $this->success('修改成功');
            } else {
                $this->error('修改失败');
            }
        } else {
            $itemid = I('get.itemid');
            $where = array('a.id' => $itemid);
            $this->item = D('Item')->getInfo($where);
            $this->progress = M('item_progress')->order('id asc')->select();
            $this->display();

        }

    }

    //项目分类
    public function item_category()
    {
        $pid_list = M('item_category')->where(array('pid' => 0))->order('sort desc')->select();
        $this->assign('pid_list', $pid_list);

        $lists = $pid_list;

        foreach ($lists as $key => $value) {
            $lists[$key]['lower'] = M('item_category')->where(array('pid' => $value['id']))->order('sort desc')->select();

        }
        $this->assign('lists', $lists);
        $this->display();

    }

    //创建分类
    public function item_category_add()
    {
        if (IS_POST) {
            $http_post = I('post.');
            $data['name'] = $http_post['name'];
            $data['pid'] = $http_post['pid'];
            $data['sort'] = $http_post['sort'];
            $data['limit'] = $http_post['limit'];
            $data['title'] = $http_post['title'];
            $data['keywords'] = $http_post['keywords'];
            $data['description'] = $http_post['description'];
            $data['create_time'] = time();

            $add = M('item_category')->add($data);

            if ($add) {
                $this->success('添加成功!');
            } else {
                $this->error('添加失败!');
            }
        } else {
            $lists = M('item_category')->where(array('pid' => 0))->select();
            $this->assign('lists', $lists);
            $this->display();
        }
    }

    //修改分类
    public function item_category_edit()
    {
        $http_get = I('get.');
        $http_post = I('post.');

        if (IS_POST) {
            $data['name'] = $http_post['name'];
            $data['pid'] = $http_post['pid'];
            $data['sort'] = $http_post['sort'];
            $data['limit'] = $http_post['limit'];
            $data['title'] = $http_post['title'];
            $data['keywords'] = $http_post['keywords'];
            $data['description'] = $http_post['description'];
            $data['update_time'] = time();

            $delete = M('item_category')->where(array('id' => $http_get['id']))->setField($data);

            if ($delete) {
                $this->ajaxReturn(array('info' => '更新成功!', 'id' => $http_post['id'], 'status' => 1));
            } else {
                $this->ajaxReturn(array('info' => '更新失败!', 'status' => 0));
            }
        } else {

            $info = M('item_category')->where(array('id' => $http_get['id']))->find();
            $this->assign('info', $info);

            $lists = M('item_category')->where(array('pid' => 0))->select();
            $this->assign('lists', $lists);
            $this->display('item_category_add');
        }
    }

    //删除分类
    public function item_category_del()
    {

        if (IS_POST) {
            $http_post = I('post.');
            $sub = M('item_category')->where(array('pid' => $http_post['id']))->find();
            if ($sub) {
                $this->error('还有下级分类，先删除一级分类');
            }
            $delnews = M('item')->where(array('cid' => $http_post['id']))->delete();

            $delete = M('item_category')->where(array('id' => $http_post['id']))->delete();
            if ($delete) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        }
    }

    //获取行业分类
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


    //项目标签

    public function tags()
    {
        $this->tags = M('tags')->select();
        $this->display();
    }

    //创建标签
    public function tags_add()
    {
        if (IS_POST) {
            $http_post = I('post.');
            $data['name'] = $http_post['name'];
            $data['status'] = 1;
            $ok = M('tags')->token(true)->add($data);
            if ($ok) {
                $this->success('创建成功');
            } else {
                $this->error('创建失败');
            }
        } else {
            $this->display();
        }
    }

    //修改标签
    public function tags_edit()
    {
        $http_get = I('get.');
        $http_post = I('post.');

        if (IS_POST) {
            $data['name'] = $http_post['name'];
            $delete = M('tags')->where(array('id' => $http_get['id']))->setField($data);

            if ($delete) {
                $this->ajaxReturn(array('info' => '更新成功!', 'id' => $http_post['id'], 'status' => 1));
            } else {
                $this->ajaxReturn(array('info' => '更新失败!', 'status' => 0));
            }
        } else {

            $info = M('tags')->where(array('id' => $http_get['id']))->find();
            $this->assign('info', $info);

            $lists = M('tags')->where(array('pid' => 0))->select();
            $this->assign('lists', $lists);
            $this->display('tags_add');
        }
    }

    public function tags_del()
    {
        if (IS_POST) {
            $http_post = I('post.');
            $delnews = M('item_tag')->where(array('tagid' => $http_post['id']))->delete();
            $delete = M('tags')->where(array('id' => $http_post['id']))->delete();
            if ($delete) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        }
    }

    //发布项目
    public function item_in()
    {
        if (IS_POST) {
            $item = D('item');
            $post = I('post.');
            $tags = explode(',', $post['tag']);
            $post['update_time'] = time();
            $post['time'] = time();
            $post['start_time'] = strtotime($post['start_time']);
            $post['end_time'] =$post['start_time']+2592000;
            $post['uin'] = $post['uin'];
            $post['province'] = $post['province'];
            $post['city'] = $post['city'];
            $post['brokerage'] = $post['brokerage'];
            $post['item_type'] = $post['item_type'];
            $post['weight'] = $post['weight'];
            $p = $post['type'] == 'add' ? $item::MODEL_INSERT : $item::MODEL_UPDATE;//$item::MODEL_INSERT=1 ,$item::MODEL_UPDATE=2
            if (!$item->create($post, $p)) {
                $this->error($item->getError());
            } else {
                if ($post['type'] != 'add') {
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
                            $this->success('', U('Item/item_add', array('itemid' => $post['type'], 'set' => 4)));
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
                        $this->success('', U('Item/item_add', array('itemid' => $itemid, 'set' => 4)));
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
            $this->success('', U('Item/index'));
        }
    }

    //项目方约谈列表
    public function interview()
    {
        $itemid = I('get.itemid');
        $status = I('get.status');
        if ($itemid) $where['a.itemid'] = $itemid; //如果指定项目
        if ($status) $where['a.status'] = $status; //如果指定状态
        $investor = D('ItemInterview');
        $count = $investor->countList($where); // 统计有多少条数据
        $Page = new Page($count, 10); // 实例化分页类 传入总记录数和每页显示的记录数(20)
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $this->page = $Page->show(); // 分页显示输出
        $list = $investor->loadList($where, $limit);
        foreach ($list as $k => $v) {
            $list[$k]['interview_name'] = R('User/Investor/interview_status', array($v['status']));
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

        $ok = M('item_interview')->where($where)->setField('status', $postData['status']);
        if ($ok) {
            $this->ajaxReturn(array('status' => 1, 'info' => '操作成功！'));
        } else {
            $this->ajaxReturn(array('status' => 0, 'info' => '操作失败！'));
        }
    }

    //股权项目的投资人列表
    public function item_order()
    {
        $itemid = I('get.itemid');
        if ($itemid) $where['a.itemid'] = $itemid; //如果指定项目
        $investor = D('ItemWithOrder');
        $count = $investor->countList($where); // 统计有多少条数据
        $Page = new Page($count, 10); // 实例化分页类 传入总记录数和每页显示的记录数(20)
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $this->page = $Page->show(); // 分页显示输出
        $list = $investor->loadList($where, $limit);
        $this->invest = $list;
        $this->display();
    }

    //设置产品众筹项目的回报规则
    public function set_item_return()
    {
        $itemid = I("get.itemid");
        if ($itemid) $where['a.itemid'] = $itemid; //如果指定项目
        $investor = D('ItemReturn');
        $count = $investor->countList($where); // 统计有多少条数据
        $Page = new Page($count, 10); // 实例化分页类 传入总记录数和每页显示的记录数(20)
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $this->page = $Page->show(); // 分页显示输出
        $list = $investor->loadList($where, $limit);
        $this->invest = $list;
        $this->itemid = $itemid;
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

    //项目回收站
    public function recycle()
    {
        $item = D('Item');
        $where['a.isdel'] = 1;
        $item_type = I("get.item_type", 1);
        $where['a.item_type'] = $item_type;
        $count = $item->countList($where);
        $Page = new Page($count, 10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $limit = $Page->firstRow . ',' . $Page->listRows;
        $Page->setConfig('prev', '上一页');
        $Page->setConfig('next', '下一页');
        $Page->setConfig('theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
        $show = $Page->show();
        $list = $item->loadList($where, $limit);
        foreach ($list as $k => $v) {
            $list[$k]['interview'] = D('ItemInterview')->countList(array('itemid' => $v['id']));
            $list[$k]['countlead'] = D('ItemLeadUser')->countLead($v['id']);
            $list[$k]['countmoney'] = D('ItemWithOrder')->countMoney($v['id']);;
        }
        $this->page = $show;
        $this->item_type = $item_type;
        $this->assign('list', $list);
        $this->display();

    }

}