<<<<<<< HEAD
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

class InvestorController extends CommonController {
    //投资人列表
    public function index(){
        //用户认证表，查询投资人认证列表
        $user 		= D('UserAttest');
        $where      = array();
        $where['a.attest_status']=1;                            //后台已审核通过
        $count 		= $user->countList($where);
        $Page       = new Page($count,10);			             // 实例化分页类 传入总记录数和每页显示的记录数
        $limit 		= $Page->firstRow.','.$Page->listRows;
        $show       = $Page->show();
        $list 		= $user->loadList($where,$limit);
        foreach ($list as $k => $v) {
            $list[$k]['item']       = D('Item')->countList(array('a.uin'=>$list[$k]['uin']));//发布过的项目;
            $list[$k]['itemLead']   = D('ItemLeadUser')->countList(array('a.uin'=>$list[$k]['uin'],'a.status'=>1));//领投的项目;
        }
        $this->page = $show;
        $this->list = $list;
        $this->end_item = D("Item")->loadList(array('a.status'   =>1, 'a.end_time' => array('lt',time()),'a.item_type' =>1));   //获取已完成项目
        $this->last_investor = D("UserAttest")->loadList(array(
            'a.attest_status'=>1
        ));                         //获取最新的投资人列表
        $this->display();
    }



    //投资人详情页
    public  function detail(){
        $uin = I("get.id", null);
        if($uin == null){
            $this->display('./Template/Home/default/Public/404.html');
        }
        $where['a.uin'] = $uin;
        $this->userinfo  = D("UserAttest")->getInfo($where);
        $this->investment_case  = D("UserDetails")->getInvestmentCase($where);      //投资案例

        $userexperiencea =M('user_experience')->where(array('uin'=>$uin))->select(); //个人经历
        if($userexperiencea) {
            foreach ($userexperiencea as $key=>$value) {
                $userexperiencea[$key]['start_time'] = date('Y-m-d', $userexperiencea[$key]['start_time']);
                $userexperiencea[$key]['end_time'] = date('Y-m-d', $userexperiencea[$key]['end_time']);
            }
        }
        $this->experience =$userexperiencea;
        $this->education        = D("UserDetails")->getEducation($where);           //教育经历
        $this->investment_ideas = D("UserDetails")->getInvestmentIdeas($where);     //投资理念
        $investment_plan        = D("UserDetails")->getInvestmentPlan($where);      //投资计划
        $investment_plan['concern_area'] = json_decode(($investment_plan['concern_area']),true);   //用户关注的领域
        $investment_plan['concern_city'] = json_decode(($investment_plan['concern_city']),true);   //用户关注的城市
        $this->plan = $investment_plan;                                              //将投资计划写入前台
        $this->collect             = D("ItemCollect")->loadList($where, 30);           //获取投资人关注的项目列表
        $this->be_follow_count     = D('UserFollow')->countList($uin);               //获取投资人的粉丝数
        $this->be_follow           = D('UserFollow')->loadList($uin, 30);            //获取投资人的粉丝列表
        $this->follow_count        = D('UserFollow')->countFollowList($uin);         //获取投资人的关注数
        $this->follow              = D('UserFollow')->loadFollowList($uin,30);        //获取投资人的关注列表
        $this->uin                 = $uin;
        $this->is_follow           = check_follow();                                 //判断用户是否关注此投资人
        $this->display();
    }

    //用户详情页
    public function userinfo(){
        $this->display();
    }

    public  function getusercategory(){
        $data = M('user_category')->select();
        $this->ajaxReturn(AjaxResult(1,'获取数据成功',$data));

    }

    public function getuserarea(){
        $data = M('user_attest as a')
                 ->join('LEFT JOIN hc_user c on c.uin=a.uin')
                ->join('LEFT JOIN hc_region as b on c.province=b.id')
                ->field('distinct b.name,b.id')
                ->select();
        $this->ajaxReturn(AjaxResult(1,'获取数据成功',$data));
    }

    //获取投资人所有信息
    public function getuserinfo(){
        $category = I('get.category');
        $area = I('get.area');
        $pagecount=I('get.pagecount');
        $pagecurrent=I('get.pagecurrent');
        $limit=PageLimit($pagecount,$pagecurrent);

        if($category){
            $where['a.attest_type']=$category;
        }
         if($area){
             $where['b.province']=$area;
         }
        $user= D('UserAttest');

        $list= $user->loadList($where,$limit);

        if(!empty($list)){
            foreach ($list as $k => $v) {
                $list[$k]['itemInvest']       = D('ItemWithOrder')->countList(array('a.uin'=>$list[$k]['uin']));//已投资项目数量;
                $list[$k]['itemCollect']   = D('ItemCollect')->getusercollectnum(array('uin'=>$list[$k]['uin']));//收藏项目数量;
            }
            $this->ajaxReturn(AjaxResult(1,'获取数据成功',$list));
        }else{
            $this->ajaxReturn(AjaxResult(1,'数据为空',array()));
        }

    }

    //获取投资人详情
   public function getuserdetail(){
       $uin = I("get.id", null);
       if($uin == null){
           $this->ajaxReturn(AjaxResult(0,'用户 uin 为空',array()));
       }
       $where['a.uin'] = $uin;
       $userinfo= D("UserAttest")->getInfo($where); //用户信息
       $investment_case  = D("UserDetails")->getInvestmentCase($where); //投资案例
       $education = D("UserDetails")->getEducation($where); //教育经历
       $investment_ideas = D("UserDetails")->getInvestmentIdeas($where);     //投资理念
       $investment_plan        = D("UserDetails")->getInvestmentPlan($where);      //投资计划
       $investment_plan['concern_area'] = json_decode(($investment_plan['concern_area']),true);   //用户关注的领域
       $investment_plan['concern_city'] = json_decode(($investment_plan['concern_city']),true);   //用户关注的城市
     //  $this->collect             = D("ItemCollect")->loadList($where, 30);           //获取投资人关注的项目列表
       $be_follow_count = D('UserFollow')->countList($uin);               //获取投资人的粉丝数
     //  $this->be_follow           = D('UserFollow')->loadList($uin, 30);            //获取投资人的粉丝列表
       $follow_count = D('UserFollow')->countFollowList($uin);         //获取投资人的关注数
     //  $this->follow              = D('UserFollow')->loadFollowList($uin,30);        //获取投资人的关注列表
       $uin = $uin;
       $is_follow = check_follow();                                 //判断用户是否关注此投资人

       $this->ajaxReturn(AjaxResult(1,'获取数据成功',array('userinfo'=>$userinfo,
           'investment_case'=>$investment_case,
           'education'=>$education,
           'investment_ideas'=>$investment_ideas,
           'investment_plan'=>$investment_plan,
           'be_follow_count'=>$be_follow_count,
           'follow_count'=>$follow_count,
           'uin'=>$uin,
           'is_follow'=> $is_follow)));
   }

    //获取投资人关注的项目列表
     public function getuserdetail_collect(){
         $uin = I('get.id');
         if($uin == null){
             $this->ajaxReturn(AjaxResult(0,'用户 uin 为空',array()));
         }
         $pagecount=I('get.pagecount');
         $pagecurrent=I('get.pagecurrent');
         $limit=PageLimit($pagecount,$pagecurrent);
         $where['a.uin'] = $uin;
         $collect= D("ItemCollect")->loadList($where, $limit);           //获取投资人关注的项目列表

         $this->ajaxReturn(AjaxResult(1,'获取数据成功',$collect));
     }

    //获取投资人的粉丝列表
    public function getuserdetail_be_follow (){

        $uin = I('get.id');
        if($uin == null){
            $this->ajaxReturn(AjaxResult(0,'用户 uin 为空',array()));
        }
        $pagecount=I('get.pagecount');
        $pagecurrent=I('get.pagecurrent');
        $limit=PageLimit($pagecount,$pagecurrent);
        $where['a.uin'] = $uin;
        $be_follow = D('UserFollow')->loadList($uin, $limit);            //获取投资人的粉丝列表
        $this->ajaxReturn(AjaxResult(1,'获取数据成功',$be_follow));

    }

//获取投资人的关注列表
    public function getuserdetail_follow(){
        $uin = I('get.id');
        if($uin == null){
            $this->ajaxReturn(AjaxResult(0,'用户 uin 为空',array()));
        }
        $pagecount=I('get.pagecount');
        $pagecurrent=I('get.pagecurrent');
        $limit=PageLimit($pagecount,$pagecurrent);
        $follow  = D('UserFollow')->loadFollowList($uin,$limit);
        $this->ajaxReturn(AjaxResult(1,'获取数据成功',$follow));
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
namespace Home\Controller;
use Think\Page;

class InvestorController extends CommonController {
    //投资人列表
    public function index(){
        //用户认证表，查询投资人认证列表
        $user 		= D('UserAttest');
        $where      = array();
        $where['a.attest_status']=1;                            //后台已审核通过
        $count 		= $user->countList($where);
        $Page       = new Page($count,10);			             // 实例化分页类 传入总记录数和每页显示的记录数
        $limit 		= $Page->firstRow.','.$Page->listRows;
        $show       = $Page->show();
        $list 		= $user->loadList($where,$limit);
        foreach ($list as $k => $v) {
            $list[$k]['item']       = D('Item')->countList(array('a.uin'=>$list[$k]['uin']));//发布过的项目;
            $list[$k]['itemLead']   = D('ItemLeadUser')->countList(array('a.uin'=>$list[$k]['uin'],'a.status'=>1));//领投的项目;
        }
        $this->page = $show;
        $this->list = $list;
        $this->end_item = D("Item")->loadList(array('a.status'   =>1, 'a.end_time' => array('lt',time()),'a.item_type' =>1));   //获取已完成项目
        $this->last_investor = D("UserAttest")->loadList(array(
            'a.attest_status'=>1
        ));                         //获取最新的投资人列表
        $this->display();
    }



    //投资人详情页
    public  function detail(){
        $uin = I("get.id", null);
        if($uin == null){
            $this->display('./Template/Home/default/Public/404.html');
        }
        $where['a.uin'] = $uin;
        $this->userinfo  = D("UserAttest")->getInfo($where);
        $this->investment_case  = D("UserDetails")->getInvestmentCase($where);      //投资案例

        $userexperiencea =M('user_experience')->where(array('uin'=>$uin))->select(); //个人经历
        if($userexperiencea) {
            foreach ($userexperiencea as $key=>$value) {
                $userexperiencea[$key]['start_time'] = date('Y-m-d', $userexperiencea[$key]['start_time']);
                $userexperiencea[$key]['end_time'] = date('Y-m-d', $userexperiencea[$key]['end_time']);
            }
        }
        $this->experience =$userexperiencea;
        $this->education        = D("UserDetails")->getEducation($where);           //教育经历
        $this->investment_ideas = D("UserDetails")->getInvestmentIdeas($where);     //投资理念
        $investment_plan        = D("UserDetails")->getInvestmentPlan($where);      //投资计划
        $investment_plan['concern_area'] = json_decode(($investment_plan['concern_area']),true);   //用户关注的领域
        $investment_plan['concern_city'] = json_decode(($investment_plan['concern_city']),true);   //用户关注的城市
        $this->plan = $investment_plan;                                              //将投资计划写入前台
        $this->collect             = D("ItemCollect")->loadList($where, 30);           //获取投资人关注的项目列表
        $this->be_follow_count     = D('UserFollow')->countList($uin);               //获取投资人的粉丝数
        $this->be_follow           = D('UserFollow')->loadList($uin, 30);            //获取投资人的粉丝列表
        $this->follow_count        = D('UserFollow')->countFollowList($uin);         //获取投资人的关注数
        $this->follow              = D('UserFollow')->loadFollowList($uin,30);        //获取投资人的关注列表
        $this->uin                 = $uin;
        $this->is_follow           = check_follow();                                 //判断用户是否关注此投资人
        $this->display();
    }

    //用户详情页
    public function userinfo(){
        $this->display();
    }

    public  function getusercategory(){
        $data = M('user_category')->select();
        $this->ajaxReturn(AjaxResult(1,'获取数据成功',$data));

    }

    public function getuserarea(){
        $data = M('user_attest as a')
                 ->join('LEFT JOIN hc_user c on c.uin=a.uin')
                ->join('LEFT JOIN hc_region as b on c.province=b.id')
                ->field('distinct b.name,b.id')
                ->select();
        $this->ajaxReturn(AjaxResult(1,'获取数据成功',$data));
    }

    //获取投资人所有信息
    public function getuserinfo(){
        $category = I('get.category');
        $area = I('get.area');
        $pagecount=I('get.pagecount');
        $pagecurrent=I('get.pagecurrent');
        $limit=PageLimit($pagecount,$pagecurrent);

        if($category){
            $where['a.attest_type']=$category;
        }
         if($area){
             $where['b.province']=$area;
         }
        $user= D('UserAttest');

        $list= $user->loadList($where,$limit);

        if(!empty($list)){
            foreach ($list as $k => $v) {
                $list[$k]['itemInvest']       = D('ItemWithOrder')->countList(array('a.uin'=>$list[$k]['uin']));//已投资项目数量;
                $list[$k]['itemCollect']   = D('ItemCollect')->getusercollectnum(array('uin'=>$list[$k]['uin']));//收藏项目数量;
            }
            $this->ajaxReturn(AjaxResult(1,'获取数据成功',$list));
        }else{
            $this->ajaxReturn(AjaxResult(1,'数据为空',array()));
        }

    }

    //获取投资人详情
   public function getuserdetail(){
       $uin = I("get.id", null);
       if($uin == null){
           $this->ajaxReturn(AjaxResult(0,'用户 uin 为空',array()));
       }
       $where['a.uin'] = $uin;
       $userinfo= D("UserAttest")->getInfo($where); //用户信息
       $investment_case  = D("UserDetails")->getInvestmentCase($where); //投资案例
       $education = D("UserDetails")->getEducation($where); //教育经历
       $investment_ideas = D("UserDetails")->getInvestmentIdeas($where);     //投资理念
       $investment_plan        = D("UserDetails")->getInvestmentPlan($where);      //投资计划
       $investment_plan['concern_area'] = json_decode(($investment_plan['concern_area']),true);   //用户关注的领域
       $investment_plan['concern_city'] = json_decode(($investment_plan['concern_city']),true);   //用户关注的城市
     //  $this->collect             = D("ItemCollect")->loadList($where, 30);           //获取投资人关注的项目列表
       $be_follow_count = D('UserFollow')->countList($uin);               //获取投资人的粉丝数
     //  $this->be_follow           = D('UserFollow')->loadList($uin, 30);            //获取投资人的粉丝列表
       $follow_count = D('UserFollow')->countFollowList($uin);         //获取投资人的关注数
     //  $this->follow              = D('UserFollow')->loadFollowList($uin,30);        //获取投资人的关注列表
       $uin = $uin;
       $is_follow = check_follow();                                 //判断用户是否关注此投资人

       $this->ajaxReturn(AjaxResult(1,'获取数据成功',array('userinfo'=>$userinfo,
           'investment_case'=>$investment_case,
           'education'=>$education,
           'investment_ideas'=>$investment_ideas,
           'investment_plan'=>$investment_plan,
           'be_follow_count'=>$be_follow_count,
           'follow_count'=>$follow_count,
           'uin'=>$uin,
           'is_follow'=> $is_follow)));
   }

    //获取投资人关注的项目列表
     public function getuserdetail_collect(){
         $uin = I('get.id');
         if($uin == null){
             $this->ajaxReturn(AjaxResult(0,'用户 uin 为空',array()));
         }
         $pagecount=I('get.pagecount');
         $pagecurrent=I('get.pagecurrent');
         $limit=PageLimit($pagecount,$pagecurrent);
         $where['a.uin'] = $uin;
         $collect= D("ItemCollect")->loadList($where, $limit);           //获取投资人关注的项目列表

         $this->ajaxReturn(AjaxResult(1,'获取数据成功',$collect));
     }

    //获取投资人的粉丝列表
    public function getuserdetail_be_follow (){

        $uin = I('get.id');
        if($uin == null){
            $this->ajaxReturn(AjaxResult(0,'用户 uin 为空',array()));
        }
        $pagecount=I('get.pagecount');
        $pagecurrent=I('get.pagecurrent');
        $limit=PageLimit($pagecount,$pagecurrent);
        $where['a.uin'] = $uin;
        $be_follow = D('UserFollow')->loadList($uin, $limit);            //获取投资人的粉丝列表
        $this->ajaxReturn(AjaxResult(1,'获取数据成功',$be_follow));

    }

//获取投资人的关注列表
    public function getuserdetail_follow(){
        $uin = I('get.id');
        if($uin == null){
            $this->ajaxReturn(AjaxResult(0,'用户 uin 为空',array()));
        }
        $pagecount=I('get.pagecount');
        $pagecurrent=I('get.pagecurrent');
        $limit=PageLimit($pagecount,$pagecurrent);
        $follow  = D('UserFollow')->loadFollowList($uin,$limit);
        $this->ajaxReturn(AjaxResult(1,'获取数据成功',$follow));
    }
>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}