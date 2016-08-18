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

class UserDetailsModel extends Model
{

    /**
     * 读取用户详细信息
     * @return array 信息
     */
    public function getDetails($where = array()){
        return M('user_details as a')
            ->field('uin,business_ideas,skills')
            ->where($where)
            ->find();
    }

    //获取个人经历信息
    public function getExprience($where = array(), $order = 'end_time desc'){
        return M('user_experience as a')
            ->field('a.*')
            ->where($where)
            ->order($order)
            ->select();
    }
    //获取个人教育经历
    public function getEducation($where = array(), $order="year desc"){
        return M('user_education as a')
            ->field('a.*')
            ->where($where)
            ->order($order)
            ->select();
    }

    //获取投资人投资案例信息
    public function getInvestmentCase($where = array(),$order='time desc'){
        return M('user_investment_case as a')
            ->field('a.*')
            ->where($where)
            ->order($order)
            ->select();
    }

    //获取投资人投资理念信息
    public function getInvestmentIdeas($where = array()){
        return M('user_investment_ideas as a')
            ->field('a.*')
            ->where($where)
            ->find();
    }

    //获取投资人投资计划
    public function getInvestmentPlan($where = array()){
        return M('user_investment_plan as a')
            ->field('a.*')
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

class UserDetailsModel extends Model
{

    /**
     * 读取用户详细信息
     * @return array 信息
     */
    public function getDetails($where = array()){
        return M('user_details as a')
            ->field('uin,business_ideas,skills')
            ->where($where)
            ->find();
    }

    //获取个人经历信息
    public function getExprience($where = array(), $order = 'end_time desc'){
        return M('user_experience as a')
            ->field('a.*')
            ->where($where)
            ->order($order)
            ->select();
    }
    //获取个人教育经历
    public function getEducation($where = array(), $order="year desc"){
        return M('user_education as a')
            ->field('a.*')
            ->where($where)
            ->order($order)
            ->select();
    }

    //获取投资人投资案例信息
    public function getInvestmentCase($where = array(),$order='time desc'){
        return M('user_investment_case as a')
            ->field('a.*')
            ->where($where)
            ->order($order)
            ->select();
    }

    //获取投资人投资理念信息
    public function getInvestmentIdeas($where = array()){
        return M('user_investment_ideas as a')
            ->field('a.*')
            ->where($where)
            ->find();
    }

    //获取投资人投资计划
    public function getInvestmentPlan($where = array()){
        return M('user_investment_plan as a')
            ->field('a.*')
            ->where($where)
            ->find();
    }

>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}