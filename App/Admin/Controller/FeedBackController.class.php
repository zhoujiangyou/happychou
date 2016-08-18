<?php
/**
 * Created by PhpStorm.
 * User: zhouht (zhouht@happychou.net)
 * Date: 2015/12/2
 * Time: 8:51
 */

namespace Admin\Controller;
use Think\Page;
class FeedBackController extends CommonController {

    public  function FeedBackList(){
        $post = I('post.');
        $Feedback = M('user_feedback');
        $limit =PageLimit($post['pagenum'],$post['currentpage']);
        $list = $Feedback->field('*')->order('feedback_id desc')->limit($limit)->select();
        $this->ajaxReturn($list,'JSON');
    }

   public function add(){
         $feedback =  M('user_feedback');
         $data = I('post.');
         $data['time'] = date('Y-m-d H:i:s ' ,time());
         $data['deal']=0;
         $result=$feedback->add($data);
         if($result){
             $this->ajaxReturn(AjaxResult(1,'操作成功'),'JSON');
         }else{
             $this->ajaxReturn(AjaxResult(0,'操作失败'),'JSON');
         }
   }


    public function update(){
         $feedback =  M('user_feedback');
         $feedback_id = I('post.id');
         $data = array('deal'=>1);
         $result=  $feedback->where('feedback_id='.$feedback_id)->save($data);
         if($result){
             $this->ajaxReturn(AjaxResult(1,'操作成功'),'JSON');
         }else{
             $this->ajaxReturn(AjaxResult(0,'已经修改过了~客官'),'JSON');
         }
    }


     public function query(){}


    public  function ShowFeedBack(){
        $get=I('get.');
        if(!$get['p']){
            $get['p']=1;
        }
        $Feedback = M('user_feedback');
        $limit =PageLimit( 10,$get['p']);
        $list = $Feedback->field('*')->where("deal=0")->order('feedback_id desc')->limit($limit)->select();

        $count = $Feedback->count();
        $page = new Page($count,10);
        $page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
        $show = $page->show();
        $this->assign('page',$show);

        $this->assign('list',$list);
        $this->display();
    }

}