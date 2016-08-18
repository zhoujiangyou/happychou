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

class UserModel extends Model
{
    //获取用户列表列表
    public function loadList($where = array(), $limit = 10, $order = 'id desc')
    {
        $data = M('user as a')
            ->field('a.*')
            ->where($where)
            ->limit($limit)
            ->order($order)
            ->select();

        return $data;
    }

    //获取用户列表数量
    public function countList($where = array())
    {
        return M('user as a')->where($where)->count();
    }

    /**
     * 读取用户信息
     * @param $where
     * @return array 信息
     */
    public function getInfo($where = array()){
        return M('user a')
            ->join('LEFT JOIN __REGION__ p ON  p.id=a.province')
            ->join('LEFT JOIN __REGION__ c ON  c.id=a.city')
            ->join('LEFT JOIN __REGION__ ar ON  ar.id=a.area')
            ->join('LEFT JOIN __USER_ATTEST__ r ON r.uin=a.uin')
            ->field('r.status as rstatus,a.uin,a.name,a.phone,a.create_time,a.money,a.points,a.age,a.sex,a.province,a.city,a.area,a.address,a.header,a.description,c.name as cityname,p.name as provname,ar.name as areaname')
            ->where($where)
            ->find();
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

class UserModel extends Model
{
    //获取用户列表列表
    public function loadList($where = array(), $limit = 10, $order = 'id desc')
    {
        $data = M('user as a')
            ->field('a.*')
            ->where($where)
            ->limit($limit)
            ->order($order)
            ->select();

        return $data;
    }

    //获取用户列表数量
    public function countList($where = array())
    {
        return M('user as a')->where($where)->count();
    }

    /**
     * 读取用户信息
     * @param $where
     * @return array 信息
     */
    public function getInfo($where = array()){
        return M('user a')
            ->join('LEFT JOIN __REGION__ p ON  p.id=a.province')
            ->join('LEFT JOIN __REGION__ c ON  c.id=a.city')
            ->join('LEFT JOIN __REGION__ ar ON  ar.id=a.area')
            ->join('LEFT JOIN __USER_ATTEST__ r ON r.uin=a.uin')
            ->field('r.status as rstatus,a.uin,a.name,a.phone,a.create_time,a.money,a.points,a.age,a.sex,a.province,a.city,a.area,a.address,a.header,a.description,c.name as cityname,p.name as provname,ar.name as areaname')
            ->where($where)
            ->find();
    }

>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}