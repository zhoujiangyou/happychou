<<<<<<< HEAD
<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.happychou.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author:  zhouht (zhouht@happychou.net)
// +----------------------------------------------------------------------
namespace User\Controller;
class InfoController extends PublicController
{
    public function index()
    {
        $this->prove = M('region')->where(array('pid' => 0))->cache('region_prove', 8640000)->select();
        $this->display();
    }

    public function sendsms()
    {
        $end = session('smstime') + 90 - time();
        if ($end > 1) {
            $this->ajaxReturn(AjaxResult(0,'距离上一次发送还有' . $end . '秒'));
        } else {
            $phone = session('user.phone');
            $code = rand(10000, 99999);
            session('smscode', $code, 90);
            session('smstime', time());
            if (is_sms()) {
                $sms_message = '验证码：' . $code;
                send_sms($phone, $sms_message);
                $this->ajaxReturn(AjaxResult(1,'短信已发送至手机！'));
            } else {
                $this->ajaxReturn(AjaxResult(1,$code));
            }

        }
    }

    public function edit()
    {
        if (IS_POST) {
            $post = I('post.');
            if ($post['money']) {
               // $this->error();
                $this->ajaxReturn(AjaxResult(0,'money is null '));
            }
            if ($post['points']) {
                $this->ajaxReturn(AjaxResult(0,'points is null '));
            }
            $post['uin'] = session('user.uin');

            if (M('user')->token(true)->save($post)) {
                $this->ajaxReturn(AjaxResult(1,'修改成功'));
            } else {
                $this->ajaxReturn(AjaxResult(0,'修改失败'));
            }
        }
    }

    //修改手机号
    public function edit_phone()
    {
        if (IS_POST) {
            $code = I('post.code');
            $phone = I('post.phone');
            if ($code != session('smscode')) {
                $this->ajaxReturn(AjaxResult(0,'验证不正确'));
            }
            if (M('user')->where(array('phone' => $phone))->find()) {
                $this->ajaxReturn(AjaxResult(0,'手机号重复不能使用'));
            }
            $ok = M('user')->where(array('uin' => session('user.uin')))->setField('phone', $phone);
            if ($ok) {
                user_log(session('user.uin'), '修改手号为' . $phone, 3);
                $this->ajaxReturn(AjaxResult(1,'修改成功'));
            }
        }
    }

    //编辑详细信息
    public function edit_detail(){
        $uin = session("user.uin");
        $where['a.uin'] = $uin;
        $attest = check_attest($uin, 'attest');
        $this->user_details     = D("UserDetails")->getDetails($where);
        $this->experience       =  D("UserDetails")->getExprience($where);
        $this->education        = D("UserDetails")->getEducation($where);

        $this->investment_case  = D("UserDetails")->getInvestmentCase($where);
        $this->investment_ideas = D("UserDetails")->getInvestmentIdeas($where);
        $investment_plan  = D("UserDetails")->getInvestmentPlan($where);
        $investment_plan['concern_area'] = json_decode($investment_plan['concern_area'], true);
        $investment_plan['concern_city'] = json_decode($investment_plan['concern_city'], true);
        $this->investment_plan = $investment_plan;
        $this->attest = $attest;
        $this->uin = $uin;
        $this->display();
    }

////用户中心 获取编辑用户信息数据
//
//public function getuser_detail(){
//    $uin = session("user.uin");
//    $where['a.uin'] = $uin;
//    $attest = check_attest($uin, 'attest');
//    $user_details     = D("UserDetails")->getDetails($where);
//    $experience       =  D("UserDetails")->getExprience($where);
//    $education        = D("UserDetails")->getEducation($where);
//    $investment_case  = D("UserDetails")->getInvestmentCase($where);
//    $investment_ideas = D("UserDetails")->getInvestmentIdeas($where);
//    $investment_plan  = D("UserDetails")->getInvestmentPlan($where);
//    $investment_plan['concern_area'] = json_decode($investment_plan['concern_area'], true);
//    $investment_plan['concern_city'] = json_decode($investment_plan['concern_city'], true);
//    $this->ajaxReturn(AjaxResult(1,'获取成功',array(
//        'attest'=>$attest,
//        'user_details'=>$user_details,
//        'experience'=>$experience,
//        'education'=>$education,
//        'investment_case'=>$investment_case,
//        'investment_ideas'=>$investment_ideas,
//        'investment_plan'=>$investment_plan
//    )));
//
//}



    //删除个人经验
   public function del_experience(){
           $id = I("id");
           if($id){
               $where['id']=$id;
           }else{
               $this->ajaxReturn(AjaxResult(0,'请传入正确参数！'));
           }
           $result = M("user_experience")->where($where)->delete();
           if($result){
               $this->ajaxReturn(AjaxResult(1,'删除成功！'));
           }else{
               $this->ajaxReturn(AjaxResult(0,'删除失败！'));
           }

   }

    //添加个人经验
   public function add_experience(){
       if(IS_AJAX){
           $experience = M("user_experience");
           $post = I("get.");
           $data['uin'] = session("user.uin");
           $data['start_time'] = strtotime($post['begdate']);
           $data['end_time'] = strtotime($post['enddate']);
           $data['company'] = $post['company'];
           $data['title'] = $post['title'];
           if(empty($post['id'])){
               if(!$experience->create($post)){
                   $this->error($experience->getError());
               }else{
                   $experience_id = $experience->add($data);
                   if($experience_id){
                       $this->ajaxReturn(AjaxResult(1,'添加个人经验成功！'));
                   }else{
                       $this->ajaxReturn(AjaxResult(0,'添加个人经验失败！'));
                   }
               }
           }else{
               $experience_id_save= $experience->where(array('id'=>$post['id']))->save($data);
               if($experience_id_save){
                   $this->ajaxReturn(AjaxResult(1,'修改个人经验成功！'));
               }else{
                   $this->ajaxReturn(AjaxResult(0,'修改个人经验失败！'));
               }
           }
       }else{
           $this->ajaxReturn(AjaxResult(0,'请通过正常渠道访问！'));
       }
   }

    //添加个人教育经历
    public function add_education(){
        if(IS_AJAX){
            $education = M("user_education");
            $get = I("get.");
            $data['uin'] = session("user.uin");
            $data['degree']=$get['degree'];
            $data['school']=$get['school'];
            $data['major']=$get['major'];
            $data['year']=date('Y',strtotime($get['year']));
           if($get['id']){
               $education_id_save=  $education->where(array('id'=>$get['id']))->save($data);
               if(!$education_id_save){
                   $this->ajaxReturn(AjaxResult(1,'修改个人教育经历成功！'));
               }else{
                   $this->ajaxReturn(AjaxResult(0,'修改个人教育经历失败！'));
               }
           }else{
               if(!$education->create($data)){
                   $this->error($education->getError());
               }else{
                   $education_id = $education->add($data);
                   if($education_id){
                       $this->ajaxReturn(AjaxResult(1,'添加个人教育经历成功！'));
                   }else{
                       $this->ajaxReturn(AjaxResult(0,'添加个人教育经历失败！'));
                   }
               }
           }
        }else{
            $this->ajaxReturn(AjaxResult(0,'请通过正常渠道访问！'));
        }
    }

    //删除个人教育经历
    public function del_education(){
        if(IS_AJAX){
            $id = I("id");
            if($id){
                $where['id']=$id;
            }else{
                $this->ajaxReturn(AjaxResult(0,'请传入正确参数！'));
            }
            $result = M("user_education")->where($where)->delete();
            if($result){
                $this->ajaxReturn(AjaxResult(1,'删除成功！'));
            }else{
                $this->ajaxReturn(AjaxResult(0,'删除失败！'));
            }
        }else{
            $this->ajaxReturn(AjaxResult(0,'请通过正常渠道访问！'));
        }
    }


    //编辑个人创业理念或者擅长技能
    public function edit_details(){
        if(IS_AJAX){
            $detail = M("user_details");
            $post = I("post.");
            $post['uin'] = session("user.uin");
            $user_detail = $detail->where(array("uin"=>$post['uin']))->find();
            $p = $detail::MODEL_INSERT;
            if($user_detail){
                $p = $detail::MODEL_UPDATE;
            }
            if(!$detail->create($post,$p)){
                $this->error($detail->getError());
            }else{
                if($user_detail){
                    $result = $detail->where(array("uin"=>$post['uin']))->save($post);
                }else{
                    $result = $detail->add();
                }
                if($result){
                    $this->ajaxReturn(AjaxResult(1,'个人资料编辑成功！'));
                }else{
                    $this->ajaxReturn(AjaxResult(0,'个人资料编辑失败！'));
                }
            }
        }else{
            $this->ajaxReturn(AjaxResult(0,'请通过正常渠道访问！'));
        }
    }


    //添加投资案例
    public function add_investment_case(){
        if(IS_AJAX){
            $investment_case = M("user_investment_case");
            $post = I("post.");
            $post['uin'] = session("user.uin");
            $post['time'] = strtotime($post['time']);
            if(!$investment_case->create($post)){
                $this->error($investment_case->getError());
            }else{
                $investment_case_id = $investment_case->add();
                if($investment_case_id){
                    $this->ajaxReturn(AjaxResult(1,'添加投资案例成功！'));
                }else{
                    $this->ajaxReturn(AjaxResult(0,'添加投资案例失败！'));
                }
            }
        }else{
            $this->ajaxReturn(AjaxResult(0,'请通过正常渠道访问！'));
        }
    }

    //删除投资人投资案例
    public function del_investment_case(){
        if(IS_AJAX){
            $id = I("id");
            if($id){
                $where['id']=$id;
            }else{
                $this->ajaxReturn(AjaxResult(0,'请传入正确参数！'));
            }
            $result = M("user_investment_case")->where($where)->delete();
            if($result){
                $this->ajaxReturn(AjaxResult(1,'删除成功！'));
            }else{
                $this->ajaxReturn(AjaxResult(0,'删除失败！'));
            }
        }else{
            $this->ajaxReturn(AjaxResult(0,'请通过正常渠道访问！'));
        }
    }


    //编辑投资人的投资理念
    public function edit_investment_ideas(){
        if(IS_AJAX){
            $detail = M("user_investment_ideas");
            $post = I("post.");
            $post['uin'] = session("user.uin");
            $user_detail = $detail->where(array("uin"=>$post['uin']))->find();
            $p = $detail::MODEL_INSERT;
            if($user_detail){
                $p = $detail::MODEL_UPDATE;
            }
            if(!$detail->create($post,$p)){
                $this->error($detail->getError());
            }else{
                if($user_detail){
                    $result = $detail->where(array("uin"=>$post['uin']))->save($post);
                }else{
                    $result = $detail->add();
                }
                if($result){
                    $this->ajaxReturn(AjaxResult(1,'个人资料编辑成功！'));
                }else{
                    $this->ajaxReturn(AjaxResult(0,'个人资料编辑失败！'));
                }
            }
        }else{
            $this->ajaxReturn(AjaxResult(0,'请通过正常渠道访问！'));
        }
    }

public function invest_plan(){
     $id=I('get.id');
     $this->id=$id;
     $this->province = M("region")->where(array('pid' => 0))->select();
     $this->display();
 }

public  function edit_invest_plan(){

    $postdata=I('post.');
    $data['uin']=session('user.uin');
    $data['num'] =$postdata['num'];
    $data['max_limit']=$postdata['max_limit'];
    $data['min_limit']=$postdata['min_limit'];
    $area = explode(';',$postdata['concern_area']);
    unset($area[count($area)-1]);
    foreach($area as $key=>$value){
        $citydata[$key]['id'] =$key;
        $citydata[$key]['name']=$value;
    }
    $data['concern_area']=json_encode($citydata,true);
    $data['concern_city']=json_encode(array(array('id'=>0,'city'=>region_address($postdata['concern_city']))),true);
    if($postdata['id']){
        $result = M('user_investment_plan')->where(array('id'=>$postdata['id']))->save($data);
        if($result){
            $this->ajaxReturn(AjaxResult(1,'保存成功！'));
        }else{
            $this->ajaxReturn(AjaxResult(0,'保存失败！'));
        }
    }else{
       if(! M('user_investment_plan')->create($data)){
           $this->ajaxReturn(AjaxResult(0,M('user_invest_plan')->getError()));
       }else{
           $resultadd=M('user_investment_plan')->add();
           if($resultadd){
               $this->ajaxReturn(AjaxResult(1,'新增成功！'));
           }else{
               $this->ajaxReturn(AjaxResult(0,'新增失败！'));
           }
       }
    }
}

public function invest_info(){
    $id=I('get.id');
    $this->id=$id;
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
namespace User\Controller;
class InfoController extends PublicController
{
    public function index()
    {
        $this->prove = M('region')->where(array('pid' => 0))->cache('region_prove', 8640000)->select();
        $this->display();
    }

    public function sendsms()
    {
        $end = session('smstime') + 90 - time();
        if ($end > 1) {
            $this->ajaxReturn(AjaxResult(0,'距离上一次发送还有' . $end . '秒'));
        } else {
            $phone = session('user.phone');
            $code = rand(10000, 99999);
            session('smscode', $code, 90);
            session('smstime', time());
            if (is_sms()) {
                $sms_message = '验证码：' . $code;
                send_sms($phone, $sms_message);
                $this->ajaxReturn(AjaxResult(1,'短信已发送至手机！'));
            } else {
                $this->ajaxReturn(AjaxResult(1,$code));
            }

        }
    }

    public function edit()
    {
        if (IS_POST) {
            $post = I('post.');
            if ($post['money']) {
               // $this->error();
                $this->ajaxReturn(AjaxResult(0,'money is null '));
            }
            if ($post['points']) {
                $this->ajaxReturn(AjaxResult(0,'points is null '));
            }
            $post['uin'] = session('user.uin');

            if (M('user')->token(true)->save($post)) {
                $this->ajaxReturn(AjaxResult(1,'修改成功'));
            } else {
                $this->ajaxReturn(AjaxResult(0,'修改失败'));
            }
        }
    }

    //修改手机号
    public function edit_phone()
    {
        if (IS_POST) {
            $code = I('post.code');
            $phone = I('post.phone');
            if ($code != session('smscode')) {
                $this->ajaxReturn(AjaxResult(0,'验证不正确'));
            }
            if (M('user')->where(array('phone' => $phone))->find()) {
                $this->ajaxReturn(AjaxResult(0,'手机号重复不能使用'));
            }
            $ok = M('user')->where(array('uin' => session('user.uin')))->setField('phone', $phone);
            if ($ok) {
                user_log(session('user.uin'), '修改手号为' . $phone, 3);
                $this->ajaxReturn(AjaxResult(1,'修改成功'));
            }
        }
    }

    //编辑详细信息
    public function edit_detail(){
        $uin = session("user.uin");
        $where['a.uin'] = $uin;
        $attest = check_attest($uin, 'attest');
        $this->user_details     = D("UserDetails")->getDetails($where);
        $this->experience       =  D("UserDetails")->getExprience($where);
        $this->education        = D("UserDetails")->getEducation($where);

        $this->investment_case  = D("UserDetails")->getInvestmentCase($where);
        $this->investment_ideas = D("UserDetails")->getInvestmentIdeas($where);
        $investment_plan  = D("UserDetails")->getInvestmentPlan($where);
        $investment_plan['concern_area'] = json_decode($investment_plan['concern_area'], true);
        $investment_plan['concern_city'] = json_decode($investment_plan['concern_city'], true);
        $this->investment_plan = $investment_plan;
        $this->attest = $attest;
        $this->uin = $uin;
        $this->display();
    }

////用户中心 获取编辑用户信息数据
//
//public function getuser_detail(){
//    $uin = session("user.uin");
//    $where['a.uin'] = $uin;
//    $attest = check_attest($uin, 'attest');
//    $user_details     = D("UserDetails")->getDetails($where);
//    $experience       =  D("UserDetails")->getExprience($where);
//    $education        = D("UserDetails")->getEducation($where);
//    $investment_case  = D("UserDetails")->getInvestmentCase($where);
//    $investment_ideas = D("UserDetails")->getInvestmentIdeas($where);
//    $investment_plan  = D("UserDetails")->getInvestmentPlan($where);
//    $investment_plan['concern_area'] = json_decode($investment_plan['concern_area'], true);
//    $investment_plan['concern_city'] = json_decode($investment_plan['concern_city'], true);
//    $this->ajaxReturn(AjaxResult(1,'获取成功',array(
//        'attest'=>$attest,
//        'user_details'=>$user_details,
//        'experience'=>$experience,
//        'education'=>$education,
//        'investment_case'=>$investment_case,
//        'investment_ideas'=>$investment_ideas,
//        'investment_plan'=>$investment_plan
//    )));
//
//}



    //删除个人经验
   public function del_experience(){
           $id = I("id");
           if($id){
               $where['id']=$id;
           }else{
               $this->ajaxReturn(AjaxResult(0,'请传入正确参数！'));
           }
           $result = M("user_experience")->where($where)->delete();
           if($result){
               $this->ajaxReturn(AjaxResult(1,'删除成功！'));
           }else{
               $this->ajaxReturn(AjaxResult(0,'删除失败！'));
           }

   }

    //添加个人经验
   public function add_experience(){
       if(IS_AJAX){
           $experience = M("user_experience");
           $post = I("get.");
           $data['uin'] = session("user.uin");
           $data['start_time'] = strtotime($post['begdate']);
           $data['end_time'] = strtotime($post['enddate']);
           $data['company'] = $post['company'];
           $data['title'] = $post['title'];
           if(empty($post['id'])){
               if(!$experience->create($post)){
                   $this->error($experience->getError());
               }else{
                   $experience_id = $experience->add($data);
                   if($experience_id){
                       $this->ajaxReturn(AjaxResult(1,'添加个人经验成功！'));
                   }else{
                       $this->ajaxReturn(AjaxResult(0,'添加个人经验失败！'));
                   }
               }
           }else{
               $experience_id_save= $experience->where(array('id'=>$post['id']))->save($data);
               if($experience_id_save){
                   $this->ajaxReturn(AjaxResult(1,'修改个人经验成功！'));
               }else{
                   $this->ajaxReturn(AjaxResult(0,'修改个人经验失败！'));
               }
           }
       }else{
           $this->ajaxReturn(AjaxResult(0,'请通过正常渠道访问！'));
       }
   }

    //添加个人教育经历
    public function add_education(){
        if(IS_AJAX){
            $education = M("user_education");
            $get = I("get.");
            $data['uin'] = session("user.uin");
            $data['degree']=$get['degree'];
            $data['school']=$get['school'];
            $data['major']=$get['major'];
            $data['year']=date('Y',strtotime($get['year']));
           if($get['id']){
               $education_id_save=  $education->where(array('id'=>$get['id']))->save($data);
               if(!$education_id_save){
                   $this->ajaxReturn(AjaxResult(1,'修改个人教育经历成功！'));
               }else{
                   $this->ajaxReturn(AjaxResult(0,'修改个人教育经历失败！'));
               }
           }else{
               if(!$education->create($data)){
                   $this->error($education->getError());
               }else{
                   $education_id = $education->add($data);
                   if($education_id){
                       $this->ajaxReturn(AjaxResult(1,'添加个人教育经历成功！'));
                   }else{
                       $this->ajaxReturn(AjaxResult(0,'添加个人教育经历失败！'));
                   }
               }
           }
        }else{
            $this->ajaxReturn(AjaxResult(0,'请通过正常渠道访问！'));
        }
    }

    //删除个人教育经历
    public function del_education(){
        if(IS_AJAX){
            $id = I("id");
            if($id){
                $where['id']=$id;
            }else{
                $this->ajaxReturn(AjaxResult(0,'请传入正确参数！'));
            }
            $result = M("user_education")->where($where)->delete();
            if($result){
                $this->ajaxReturn(AjaxResult(1,'删除成功！'));
            }else{
                $this->ajaxReturn(AjaxResult(0,'删除失败！'));
            }
        }else{
            $this->ajaxReturn(AjaxResult(0,'请通过正常渠道访问！'));
        }
    }


    //编辑个人创业理念或者擅长技能
    public function edit_details(){
        if(IS_AJAX){
            $detail = M("user_details");
            $post = I("post.");
            $post['uin'] = session("user.uin");
            $user_detail = $detail->where(array("uin"=>$post['uin']))->find();
            $p = $detail::MODEL_INSERT;
            if($user_detail){
                $p = $detail::MODEL_UPDATE;
            }
            if(!$detail->create($post,$p)){
                $this->error($detail->getError());
            }else{
                if($user_detail){
                    $result = $detail->where(array("uin"=>$post['uin']))->save($post);
                }else{
                    $result = $detail->add();
                }
                if($result){
                    $this->ajaxReturn(AjaxResult(1,'个人资料编辑成功！'));
                }else{
                    $this->ajaxReturn(AjaxResult(0,'个人资料编辑失败！'));
                }
            }
        }else{
            $this->ajaxReturn(AjaxResult(0,'请通过正常渠道访问！'));
        }
    }


    //添加投资案例
    public function add_investment_case(){
        if(IS_AJAX){
            $investment_case = M("user_investment_case");
            $post = I("post.");
            $post['uin'] = session("user.uin");
            $post['time'] = strtotime($post['time']);
            if(!$investment_case->create($post)){
                $this->error($investment_case->getError());
            }else{
                $investment_case_id = $investment_case->add();
                if($investment_case_id){
                    $this->ajaxReturn(AjaxResult(1,'添加投资案例成功！'));
                }else{
                    $this->ajaxReturn(AjaxResult(0,'添加投资案例失败！'));
                }
            }
        }else{
            $this->ajaxReturn(AjaxResult(0,'请通过正常渠道访问！'));
        }
    }

    //删除投资人投资案例
    public function del_investment_case(){
        if(IS_AJAX){
            $id = I("id");
            if($id){
                $where['id']=$id;
            }else{
                $this->ajaxReturn(AjaxResult(0,'请传入正确参数！'));
            }
            $result = M("user_investment_case")->where($where)->delete();
            if($result){
                $this->ajaxReturn(AjaxResult(1,'删除成功！'));
            }else{
                $this->ajaxReturn(AjaxResult(0,'删除失败！'));
            }
        }else{
            $this->ajaxReturn(AjaxResult(0,'请通过正常渠道访问！'));
        }
    }


    //编辑投资人的投资理念
    public function edit_investment_ideas(){
        if(IS_AJAX){
            $detail = M("user_investment_ideas");
            $post = I("post.");
            $post['uin'] = session("user.uin");
            $user_detail = $detail->where(array("uin"=>$post['uin']))->find();
            $p = $detail::MODEL_INSERT;
            if($user_detail){
                $p = $detail::MODEL_UPDATE;
            }
            if(!$detail->create($post,$p)){
                $this->error($detail->getError());
            }else{
                if($user_detail){
                    $result = $detail->where(array("uin"=>$post['uin']))->save($post);
                }else{
                    $result = $detail->add();
                }
                if($result){
                    $this->ajaxReturn(AjaxResult(1,'个人资料编辑成功！'));
                }else{
                    $this->ajaxReturn(AjaxResult(0,'个人资料编辑失败！'));
                }
            }
        }else{
            $this->ajaxReturn(AjaxResult(0,'请通过正常渠道访问！'));
        }
    }

public function invest_plan(){
     $id=I('get.id');
     $this->id=$id;
     $this->province = M("region")->where(array('pid' => 0))->select();
     $this->display();
 }

public  function edit_invest_plan(){

    $postdata=I('post.');
    $data['uin']=session('user.uin');
    $data['num'] =$postdata['num'];
    $data['max_limit']=$postdata['max_limit'];
    $data['min_limit']=$postdata['min_limit'];
    $area = explode(';',$postdata['concern_area']);
    unset($area[count($area)-1]);
    foreach($area as $key=>$value){
        $citydata[$key]['id'] =$key;
        $citydata[$key]['name']=$value;
    }
    $data['concern_area']=json_encode($citydata,true);
    $data['concern_city']=json_encode(array(array('id'=>0,'city'=>region_address($postdata['concern_city']))),true);
    if($postdata['id']){
        $result = M('user_investment_plan')->where(array('id'=>$postdata['id']))->save($data);
        if($result){
            $this->ajaxReturn(AjaxResult(1,'保存成功！'));
        }else{
            $this->ajaxReturn(AjaxResult(0,'保存失败！'));
        }
    }else{
       if(! M('user_investment_plan')->create($data)){
           $this->ajaxReturn(AjaxResult(0,M('user_invest_plan')->getError()));
       }else{
           $resultadd=M('user_investment_plan')->add();
           if($resultadd){
               $this->ajaxReturn(AjaxResult(1,'新增成功！'));
           }else{
               $this->ajaxReturn(AjaxResult(0,'新增失败！'));
           }
       }
    }
}

public function invest_info(){
    $id=I('get.id');
    $this->id=$id;
    $this->display();
}
>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}