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

class UserAttestModel extends Model
{
    protected $_validate = array(
        array('uin', 'require', '投资人uin不存在！', 0),
        array('card_positive', 'require', '身份证正面不存在', 1),
        array('card_negative', 'require', '身份证反面不存在', 1),
    );
    protected $_auto = array(
        array('uin', 'getUin', 1, 'callback'),
        array('time', 'time', 1, 'function'),
    );

    //自动完成uin
    protected function getUin()
    {
        return $_SESSION['user']['uin'];
    }

    /**
     * 读取信息
     * @return array 信息
     */
    public function getInfo($where)
    {
        $where['b.user_status'] = 1;        //确保用户是可用状态，而不是禁用状态
        return M('user_attest as a')
            ->join('LEFT JOIN __USER__ b ON a.uin = b.uin')
            ->field('a.*,age,points,create_time,phone,sex,province,city,area,address,description,b.user_status')
            ->where($where)
            ->find();
    }

    /**
     * 读取列表数据
     * @return array 列表
     */
    public function loadList($where = array(), $limit = 10, $order = 'b.weight desc, money desc')
    {
        return M('user_attest as a')
            ->join('LEFT JOIN __USER__ b ON a.uin = b.uin')
            ->join('LEFT JOIN hc_region d ON b.city = d.id')
            ->join('LEFT JOIN hc_item_with_order c on c.uin = a.uin')
            ->field(' SUM(c.money) as money,d.name as area,a.*,a.status,b.name as user_name,b.age,b.points,b.create_time,b.phone,b.sex,b.province,b.address,b.header,b.description')
            ->group('a.uin')
            ->where($where)
            ->limit($limit)
            ->order($order)
            ->select();
    }



    /**
     * 获取数量
     * @return int 数量
     */
    public function countList($where = array())
    {
        return M('user_attest as a')
            ->where($where)
            ->count();
    }
}