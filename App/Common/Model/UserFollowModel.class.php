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

class UserFollowModel extends Model
{
    protected $_validate = array(
        array('uin', 'require', '被关注者不存在！', 0),
        array('fuin', 'require', '关注者', 1),
    );
    protected $_auto = array(
        array('fuin', 'getUin', 1, 'callback'),
    );

    //自动完成uin
    protected function getUin()
    {
        return $_SESSION['user']['uin'];
    }

    /**
     * 读取信息
     * @param  array $where
     * @return array 信息
     */
    public function getInfo($where)
    {
        return M('user_follow as a')
            ->join('LEFT JOIN __USER__ b ON a.uin = b.uin')
            ->join('LEFT JOIN __USER__ c ON a.fuin = c.uin')
            ->field('a.*,b.name as user_name,c.name as follow_name')
            ->where($where)
            ->find();
    }

    /**
     * 获取用户粉丝数量
     * @return int 数量
     */
    public function countList($uin)
    {
        $where['a.uin'] = $uin;
        return M('user_follow as a')
            ->where($where)
            ->count();
    }

    /**
     * 获取用户的粉丝列表
     * @return array 列表
     */
    public function loadList($uin, $limit = 10, $order = 'time desc')
    {
        $where['a.uin'] = $uin;
        return M('user_follow as a')
            ->join('LEFT JOIN __USER__ b ON a.fuin = b.uin')
            ->field('a.*,b.name as user_name,age,points,create_time,phone,sex,province,city,area,address,header,description')
            ->where($where)
            ->limit($limit)
            ->order($order)
            ->select();
    }


    /**
     * 获取用户关注的用户数
     * @return int 数量
     */
    public function countFollowList($uin)
    {
        $where['a.fuin'] = $uin;
        return M('user_follow as a')
            ->where($where)
            ->count();
    }
    /**
     * 获取用户的关注的用户列表
     * @return array 列表
     */
    public function loadFollowList($uin, $limit = 10, $order = 'time desc')
    {
        $where['a.fuin'] = $uin;
        return M('user_follow as a')
            ->join('LEFT JOIN __USER__ b ON a.uin = b.uin')
            ->field('a.*,b.name as user_name,age,points,create_time,phone,sex,province,city,area,address,header,description')
            ->where($where)
            ->limit($limit)
            ->order($order)
            ->select();
    }


}