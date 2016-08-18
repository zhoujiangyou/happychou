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

class ItemController extends CommonController {

    public function index(){
        //分类列表
        $categoryList = M('item_category')->select();
        foreach ($categoryList as $key => $value) {
            $categoryList[$key]['url'] = U('item/index',array('cid'=>$value['id']));
        }
        $this->categorylist = $categoryList;
        //搜索
        $search = I('get.search');
        if ($search) $where['a.name'] = array('like','%'.$search.'%');
        $cid = I('get.cid');
        if ($cid) {
            $where['a.cid']   = $cid;
            $limit            = item_category($cid,'limit');
        }
        $where['a.status'] = 1;
        $where['a.item_type']=1;
        $limit = default_data($limit,6);                          //如果没有限制条数 默认10条
        $count = D('Item')->countList($where);                // 统计有多少条数据
        $Page  = new Page($count,$limit);                   // 实例化分页类 传入总记录数和每页显示的记录数(20)
        $limit = $Page->firstRow.','.$Page->listRows;
        $show       = $Page->show(); // 分页显示输出
        // 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $order = 'a.time desc';
        $itemList = D('Item')->loadList($where,$limit,$order);
        foreach ($itemList as $key => $value) {
            $itemList[$key]['url']              = U('item/info',array('id'=>$value['id']));
            $itemList[$key]['last_time']        = gettime($value['end_time']-time());
            $itemList[$key]['category_name']    = item_category($value['cid'],'name');
            $itemList[$key]['success_rate']     = D('ItemWithOrder')->successRate($value['id']);     //完成率
        }
        //面包屑导航组装
        $bread = 	'<ul class="x12 bread padding-big-top">
						<li><a href="'.__ROOT__.'/" class="icon-home"> 首页</a></li>
						<li><a href="'.item_category($cid,'url').'">'.item_category($cid,'name').'</a></li>
					</ul>';
        $this -> bread     =$bread;
        $this->itemlist    = $itemList;
        $this->page        = $show;
        $this->display();
    }

//股权项目数据接口
    public function getdata(){
        $get=I('get.');

        if($get['area']==null){
            $this->ajaxReturn(AjaxResult(0,'区域为空'));
        }
        if($get['category']==null){
            $this->ajaxReturn(AjaxResult(0,'行业类型为空'));
        }
        if($get['pagecount']==null){
            $this->ajaxReturn(AjaxResult(0,'页码为空'));
        }
        if($get['pagecurrent']==null){
            $this->ajaxReturn(AjaxResult(0,'当前页为空'));
        }
        if($get['filter']==null){
            $this->ajaxReturn(AjaxResult(0,'过滤条件为空'));
        }
        if($get['sort']==null){
            $this->ajaxReturn(AjaxResult(0,'排序条件为空'));
        }
        $where=projectfilter($get);
        $sort=projectsort($get);
        if(PageLimit($get['pagecount'],$get['pagecurrent'])!=''){
            $limit= 'LIMIT '.PageLimit($get['pagecount'],$get['pagecurrent']);
            $data = D('Item')->getdata($where,$limit,$sort);
        }else{
            $data = D('Item')->getdata($where,$sort);
        }

       // $data = D('Item')->getdata($where,$limit,$sort);
        foreach ($data as $key => $value) {
            $data[$key]['last_time']        = gettime($value['end_time']-time()); //剩余时间
            $data[$key]['success_rate']     = D('ItemWithOrder')->successRate($value['item_id']);     //完成率
            $data[$key]['area']=region_address($value['city']);
        }
        $this->ajaxReturn(AjaxResult(1,'操作成功',$data));
    }


    public function getarea(){
        $area = M('item_list')->select();
        if($area){
            $this->ajaxReturn(AjaxResult(1,'操作成功',$area));
        }else{
            $this->ajaxReturn(AjaxResult(0,'操作失败'));
        }


    }


    public function getcategory(){
        $categoryList = M('item_category')->select();
        if($categoryList){
            $this->ajaxReturn(AjaxResult(1,'操作成功',$categoryList));
        }else{
            $this->ajaxReturn(AjaxResult(0,'操作失败'));
        }
    }


//获取首页项目列表数据 根据项目权重
    public function getindexitem(){

        $data = D('Item')->indexgetltem();
        if($data){
        foreach ($data as $key => $value) {
            $data[$key]['last_time']        = gettime($value['end_time']-time());
            $data[$key]['success_rute']     = D('ItemWithOrder')->successRate($value['id']);     //完成率
        }
            $this->ajaxReturn(AjaxResult(1,'操作成功',$data));
        }else{

            $this->ajaxReturn(AjaxResult(0,'操作失败'));

        }

    }

    //获取首页项目数据 根据创建时间来进行排序

    public function getltembytime(){

        $data = D('Item')->indexgetltembytime();
        if($data){
            foreach ($data as $key => $value) {
                $data[$key]['last_time']        = gettime($value['end_time']-time());
                $data[$key]['success_rute']     = D('ItemWithOrder')->successRate($value['id']);     //完成率
            }
            $this->ajaxReturn(AjaxResult(1,'操作成功',$data));
        }else{

            $this->ajaxReturn(AjaxResult(0,'操作失败'));

        }

    }

    public function getinvestorinfo(){
        $data = D('Item')->indexinvestor();
        if($data){
            $this->ajaxReturn(AjaxResult(1,'操作成功',$data));
        }else{
            $this->ajaxReturn(AjaxResult(0,'操作失败'));
        }
    }


    public function info(){
        $itemid = I('get.id');
        //项目详情
        $info = D('Item')->getInfo(array('a.id'=>$itemid,'a.status'=>1));
        if(!$info)  $this->error('项目尚未被审核 敬请期待！');
        $info['last_time']      = gettime($info['end_time']-time());
        $info['content']        = htmlspecialchars_decode($info['content']);
        $info['success_rate']   = D('ItemWithOrder')->successRate($itemid);           // 完成率
        $info['count_money']    = D('ItemWithOrder')->countMoney($itemid);             // 现已融资
        $info['invest_money']   = $info['raising_money'] - $info['has_investment'];        //投资方共融资
        $this->iteminfo         = $info;
        //面包屑导航组装
        $bread =    '<ul class="x12 bread padding-big-top">
                        <li><a href="'.__ROOT__.'/" class="icon-home"> 首页</a></li>
                        <li><a href="'.item_category($info['cid'],'url').'">'.item_category($info['cid'],'name').'</a></li>
                    </ul>';
        $this -> bread =$bread;
        //问答内容
        $questionsList = D('ItemQuestions')->loadList(array('itemid'=>$itemid));
        foreach ($questionsList as $key => $value) {
            $questionsList[$key]['u_name'] = user($value['uin'],'name');
            $questionsList[$key]['header'] = user($value['uin'],'header');
            $qid = $value['id'];
            $questionsList[$key]['answers']    =   D("ItemAnswers")->loadList(array('a.qid'=>$qid));    //获取回复信息
            foreach($questionsList[$key]['answers'] as $k =>$v){
                $questionsList[$key]['answers'][$k]['u_name'] = user($v['uin'],'name');
            }
        }
        $this->questionsList = $questionsList;
        //投资列表
        $this->invest   = D('ItemWithOrder')->loadList(array('a.itemid'=>$itemid));
        //项目动态
        $itemLog        = M('item_log') -> where(array('itemid'=>$itemid))->select();
        $this->log      = $itemLog;
        //领投人列表
        $leadUser       = D('ItemLeadUser')->loadList(array('a.itemid'=>$itemid));
        foreach ($leadUser as $key => $value) {
            $leadUser[$key]['countmoney'] = D('ItemWithOrder')->countMoney($itemid,$value['uin']);
        }
        //视频列表
        $this->video    = D('ItemVideo')->loadList($itemid,'RIGHT');
        $this->leaduser = $leadUser;
        $this->display();
    }

  public function getinfo(){
      $itemid = I('get.id');
      $interview = M('item_interview');
      $uin                = session('user.uin');
      $interview_num =$interview->where(array('status'=>1,'itemid'=>$itemid))->count();
      //项目详情
      $info = D('Item')->getInfo(array('a.id'=>$itemid,'a.status'=>1));
      if(!$info)  $this->ajaxReturn(AjaxResult(0,'item id lost'));
      $info['item_address'] =region_address($info['city']);
      $info['item_tags']=D('item')->gettags($itemid);
      $info['is_collect']=D('ItemCollect')->getInfo(array('itemid'=>$itemid,'uin'=>$uin))?1:0;
      $info['last_time']      = gettime($info['end_time']-time());
      $info['question_num']= M('ItemQuestions')->where(array('itemid'=>$itemid))->count();//消息数目
      $info['invest_num']=D('ItemWithOrder')->countSupport($itemid); //投资人数
      $info['content']        = htmlspecialchars_decode($info['content']);
      $info['success_rate']   = D('ItemWithOrder')->successRate($itemid);            // 完成率
      $info['count_money']    = D('ItemWithOrder')->countMoney($itemid);             // 现已融资
      $info['invest_money']   = $info['raising_money'] - $info['has_investment'];    //投资方共融资
      $info['invest_people_num']  = D('ItemWithOrder')->countSupport($itemid);                        //跟投人数
      $info['interview_num'] = $interview_num?$interview_num:0;  //约谈人数
      $info['video']=D('ItemVideo')->loadList($itemid,'RIGHT');  //视频列表
      $this->ajaxReturn(AjaxResult(1,'数据获取成功',$info));
  }

    //获取话题问答
    public function getinfo_question(){
        $itemid = I('get.id');
        $pagecount=I('get.pagecount');
        $pagecurrent=I('get.pagecurrent');
        $limit=PageLimit($pagecount,$pagecurrent);
        $questionsList = D('ItemQuestions')->loadList(array('itemid'=>$itemid),$limit);
        if(empty($questionsList)){
            $this->ajaxReturn(AjaxResult(1,'数据为空'));
        }
        foreach ($questionsList as $key => $value) {
            $questionsList[$key]['u_name'] = user($value['uin'],'name');
            $questionsList[$key]['header'] = user($value['uin'],'header');
            $qid = $value['id'];
            $questionsList[$key]['answers']    =   D("ItemAnswers")->loadList(array('a.qid'=>$qid));    //获取回复信息
            foreach($questionsList[$key]['answers'] as $k =>$v){
                $questionsList[$key]['answers'][$k]['u_name'] = user($v['uin'],'name');
            }
        }
        $this->ajaxReturn(AjaxResult(1,'数据获取成功',$questionsList));
    }

    //获取投资列表
    public function getinfo_invest(){
        $itemid = I('get.id');
        $pagecount=I('get.pagecount');
        $pagecurrent=I('get.pagecurrent');
        $limit=PageLimit($pagecount,$pagecurrent);
        $data= D('ItemWithOrder')->loadList(array('a.itemid'=>$itemid),$limit);
        if(empty($data)){
            $this->ajaxReturn(AjaxResult(1,'数据为空'));
        }else{
            foreach($data as $key => $value){
                $data[$key]['create_time'] =date('Y-m-d H:i:s',$data[$key]['create_time']);
            }
            $this->ajaxReturn(AjaxResult(1,'数据获取成功',$data));
        }

    }

//获取项目动态
 public  function getinfo_itemlog(){
     $itemid = I('get.id');
     $itemLog= M('item_log') -> where(array('itemid'=>$itemid))->select();
     $this->ajaxReturn(AjaxResult(1,'数据获取成功',$itemLog));
 }

//获取投资人列表
public  function getinfo_invertor(){
    $itemid = I('get.id');
    $pagecount=I('get.pagecount');
    $pagecurrent=I('get.pagecurrent');
    $limit=PageLimit($pagecount,$pagecurrent);
    $leadUser = D('ItemLeadUser')->loadList(array('a.itemid'=>$itemid),$limit);
    $leadUser['count']=M('ItemLeadUser')->where(array('itemid'=>$itemid))->count(); // 该项目投资人数目
    if(empty($leadUser)){
        $this->ajaxReturn(AjaxResult(1,'数据为空'));
    }
    foreach ($leadUser as $key => $value) {
        $leadUser[$key]['countmoney'] = D('ItemWithOrder')->countMoney($itemid,$value['uin']);
    }
        $this->ajaxReturn(AjaxResult(1,'数据获取成功',$leadUser));
}

//获取股权项目新闻

public function getinfo_news(){
    $itemid = I('get.id');
    $pagecount=I('get.pagecount',10);
    $pagecurrent=I('get.pagecurrent',1);
    $limit=PageLimit($pagecount,$pagecurrent);
    $data=M('item_news')->where(array('itemid'=>$itemid))->order('news_time desc')->limit($limit)->select();
  if(empty($data)){
      $this->ajaxReturn(AjaxResult(1,'数据为空'));
  }else{
      foreach($data as $key=>$value){
          $data[$key]['news_time']=date('Y-m-d',$data[$key]['news_time']);
      }
      $this->ajaxReturn(AjaxResult(1,'数据获取成功',$data));
  }
}

    //获取股权项目大纪事
    public function getinfo_bigevent(){
        $itemid = I('get.id');
        $pagecount=I('get.pagecount',10);
        $pagecurrent=I('get.pagecurrent',1);
        $limit=PageLimit($pagecount,$pagecurrent);
        $data=D('ItemEvents')->loadList(array('itemid'=>$itemid),$limit,'time desc');
        if(empty($data)){
            $this->ajaxReturn(AjaxResult(1,'数据为空'));
        }else{
            $this->ajaxReturn(AjaxResult(1,'数据获取成功',$data));
        }
    }


    //验证是否可以领投
    public function lead_check(){
        $itemid=I('get.itemid');                                //如果项目id false 取get值
        $leadUser = D('ItemLeadUser');                                         //实例化领投人列表

        if (!$itemid)  $this->ajaxReturn(AjaxResult(0,'项目不存在'));                             //安全考虑 防止直接打开方法
        $lead = D('ItemLead')->getInfo(array('itemid'=>$itemid));              //读取项目领投规则
        $leadUserCount = $leadUser->countList(array('itemid'=>$itemid));                         //统计现有多少领投人
        if ($leadUserCount >= $lead['num'])  $this->ajaxReturn(AjaxResult(0,'领投已经满了'));           //如果现有领投人大于等于 领投规则设定的人数 false
        $repeat = $leadUser ->getInfo(array('itemid'=>$itemid,'uin'=>session('user.uin')));
        if($repeat)  $this->ajaxReturn(AjaxResult(0,'您申请过领投了！'));                             //如果已经申请过领投该项目 false
        if(I('get.itemid')) $this->ajaxReturn(AjaxResult(1,'您可以进行领投操作！'));

    }
    //领投人申请
    public function lead_user(){
        $leadUser= M('item_lead_user');
        $post = I('post.');
        $data['uin']=session('user.uin');
        $data['user_desc']=$post['user_desc'];
        $data['itemid']=$post['itemid'];
        $data['status']=0;
        $data['time']=time();
        $result= $leadUser->add($data);
        if($result){
            $this->ajaxReturn(AjaxResult(1,'申请领投成功！'));
        }else{
            $this->ajaxReturn(AjaxResult(0,'申请领投失败！'));
        }


    }
    //验证约谈条件
    public function interview_check($itemid){
        $leadInterview      = D('ItemInterview');
        $uin                = session('user.uin');
        $where['uin']       = $uin;
        $where['itemid']    = $itemid;
        $where['status']    = '0';
        $Interview          = $leadInterview->getInfo($where);
        if ($Interview) {
            if ($Interview['time']+ 86400 < time()) {
                return true;
            }else{
                return false;
            }
        }else{
            return true;
        }
    }
    //约谈申请
    public function interview_user(){
        if (!IS_POST)  $this->ajaxReturn(AjaxResult(0,'操作失败！'));
        //判断是否可以预约
        if(!$this->interview_check(I('post.itemid')))   $this->ajaxReturn(AjaxResult(0,'您上次的预约未满24小时，请24小时之后再提交！'));
        $leadInterview = D('ItemInterview');
        if (!$leadInterview->create()) {
            $this->ajaxReturn(AjaxResult(0,$leadInterview->getError()));
        }else{
            if ($leadInterview->add()) {
                $this->ajaxReturn(AjaxResult(1,'申请约谈成功！'));
            }else{
                $this->ajaxReturn(AjaxResult(0,'约谈失败！'));
            }
        }
    }
    //收藏操作
    public function collect(){
        if (!IS_POST)  $this->ajaxReturn(AjaxResult(0,'操作失败！'));
        $uin                = session('user.uin');
        $itemCollect        = D('ItemCollect');
        $where['itemid']    = I('post.itemid');
        $where['uin']       = $uin;
        if($itemCollect->getInfo($where))   $this->ajaxReturn(AjaxResult(0,'您已经收藏过了！'));
        if (!$itemCollect->create()) {
            $this->ajaxReturn(AjaxResult(0,$itemCollect->getError()));
        }else{
            if ($itemCollect->add()) {
                D('UserDoLog')-> addData('您的项目收藏成功！',session('user.uin'));
                $this->ajaxReturn(AjaxResult(1,'收藏成功！'));
            }else{
                $this->ajaxReturn(AjaxResult(0,'收藏失败！'));
            }
        }
    }

    //取消取消收藏某项目
    public function uncollect(){
        if (!IS_POST)  $this->ajaxReturn(AjaxResult(0,'操作失败！'));
        $follow = D("ItemCollect");
        $itemid=I('post.itemid');
        $uin = session("user.uin");
        $is_follow = check_collect($itemid, $uin);
        if($is_follow){
            $result = $follow->where(array(
                'itemid' => $itemid,
                'uin' => $uin,
                'type' =>2,
            ))->delete();
            if($result){
                $this->ajaxReturn(AjaxResult(1,'您已成功取消关注！'));
            }else{
                $this->ajaxReturn(AjaxResult(0,'操作失败，请重试！'));
            }
        }else{
            $this->ajaxReturn(AjaxResult(0,'您未关注过，无法取消关注！！'));
        }

    }

    //投资下单
    public function with_item(){
        $http_get               = I('get.');
        $info                   = M('item')->where(array('id'=>$http_get['id']))->find();
        $item_amount_info       = M('item_with_order')->where(array('itemid'=>$info['id']))->sum('amount');
        $info['surplus_amount'] = $info['amount']-$item_amount_info;
        if($info['surplus_amount']<=0){
            $info['surplus_amount']=0;
        }
        $this->assign('info',$info);
        $this->display();
    }
}