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
use Think\Page;
class QuestionsController extends PublicController{

    public function index()
    {
        $question = D("ItemQuestions");
        $where = array();
        $uin = I('get.uin', session('user.uin'));
        $where['a.uin'] = $uin ;
        $count = $question->countList($where);
        $page = new Page($count, 10);
        $limit = $page->firstRow . ',' . $page->listRows;
        $this->page = $page->show(); // 分页显示输出
        $list = $question->loadList($where, $limit);
        foreach($list as $k => $value){
            $qid = $value['id'];
            $list[$k]['answers']    =   D("ItemAnswers")->loadList(array('a.qid'=>$qid));
        }
        $this->list = $list;
        $this->display();
}

    //添加项目问题
    public function add(){
        if(IS_POST){
            $itemQuestion = D("ItemQuestions");
            if (!$itemQuestion->create()) {
                $this->error($itemQuestion->getError());
            } else {
                if ($itemQuestion->add()) {
                    $this->success('提交成功！');
                } else {
                    $this->error('提交失败！');
                }
            }
        }else{
            $this->display();
        }

    }

    //编辑项目问题
    public function edit(){
        if(IS_POST){
            $post=I('post.');
            $itemQuestion = D("ItemQuestions");
            $_SESSION['user']['uin'] = $post['uin'];
            if (!$itemQuestion->create($post,$itemQuestion::MODEL_UPDATE)) {
                $this->error($itemQuestion->getError());
            } else {
                if ($itemQuestion->where("id=".$post['id'])->save($post)) {
                    unset($_SESSION['user']['uin']);        //绕过model里面的规则检查
                    $this->success('修改成功！');
                } else {
                    $this->error('修改失败！');
                }
            }
        }else{
            $id = I("id");
            $info = D("ItemQuestions")->getInfo(array("a.id"=>$id));
            $this->info = $info;
            $this->display();
        }

    }

    //删除项目问题
    public function del_question(){
        if(IS_POST){
            $id = I("post.id");
            $result = M("item_questions")->where("id='$id'")->delete();
            $answers = M("item_answers")->where("qid=".$id)->delete();
            if($result!=false && $answers!=false){
                $this->success("删除成功！");
            }else{
                $this->error("删除失败!");
            }
        }else{
            $this->error("请以正确的方式访问");
        }
    }

    //删除项目问题回复
    public function del_answers(){
        if(IS_POST){
            $id = I("post.id");
            $answers = M("item_answers")->where("id=".$id)->delete();
            if( $answers!=false){
                $this->success("删除成功！");
            }else{
                $this->error("删除失败!");
            }
        }else{
            $this->error("请以正确的方式访问");
        }
    }


    //添加问题回复
    public function add_answers(){
        if(IS_POST){
            $post=I('post.');
            $_SESSION['user']['uin'] = $post['uin'];
            $itemAnswer = D("ItemAnswers");
            if (!$itemAnswer->create()) {
                $this->error($itemAnswer->getError());
            } else {
                if ($itemAnswer->add()) {
                    unset($_SESSION['user']['uin']);        //绕过model里面的规则检查
                    $this->success('提交成功！');
                } else {
                    $this->error('提交失败！');
                }
            }
        }else{
            $qid = I("qid");
            $this->qid = $qid;
            $this->display();
        }

    }

    //修改问题回复
    public function edit_answers(){
        if(IS_POST){
            $post=I('post.');
            $_SESSION['user']['uin'] = $post['uin'];
            $itemAnswer = D("ItemAnswers");
            if (!$itemAnswer->create($post,$itemAnswer::MODEL_UPDATE)) {
                $this->error($itemAnswer->getError());
            } else {
                if ($itemAnswer->where("id=".$post['id'])->save($post)) {
                    unset($_SESSION['user']['uin']);        //绕过model里面的规则检查
                    $this->success('提交成功！');
                } else {
                    $this->error('提交失败！');
                }
            }
        }else{
            $id = I("id");
            $this->info = D("ItemAnswers")->getInfo(array("a.id"=>$id));
            $this->display();
        }
    }

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
use Think\Page;
class QuestionsController extends PublicController{

    public function index()
    {
        $question = D("ItemQuestions");
        $where = array();
        $uin = I('get.uin', session('user.uin'));
        $where['a.uin'] = $uin ;
        $count = $question->countList($where);
        $page = new Page($count, 10);
        $limit = $page->firstRow . ',' . $page->listRows;
        $this->page = $page->show(); // 分页显示输出
        $list = $question->loadList($where, $limit);
        foreach($list as $k => $value){
            $qid = $value['id'];
            $list[$k]['answers']    =   D("ItemAnswers")->loadList(array('a.qid'=>$qid));
        }
        $this->list = $list;
        $this->display();
}

    //添加项目问题
    public function add(){
        if(IS_POST){
            $itemQuestion = D("ItemQuestions");
            if (!$itemQuestion->create()) {
                $this->error($itemQuestion->getError());
            } else {
                if ($itemQuestion->add()) {
                    $this->success('提交成功！');
                } else {
                    $this->error('提交失败！');
                }
            }
        }else{
            $this->display();
        }

    }

    //编辑项目问题
    public function edit(){
        if(IS_POST){
            $post=I('post.');
            $itemQuestion = D("ItemQuestions");
            $_SESSION['user']['uin'] = $post['uin'];
            if (!$itemQuestion->create($post,$itemQuestion::MODEL_UPDATE)) {
                $this->error($itemQuestion->getError());
            } else {
                if ($itemQuestion->where("id=".$post['id'])->save($post)) {
                    unset($_SESSION['user']['uin']);        //绕过model里面的规则检查
                    $this->success('修改成功！');
                } else {
                    $this->error('修改失败！');
                }
            }
        }else{
            $id = I("id");
            $info = D("ItemQuestions")->getInfo(array("a.id"=>$id));
            $this->info = $info;
            $this->display();
        }

    }

    //删除项目问题
    public function del_question(){
        if(IS_POST){
            $id = I("post.id");
            $result = M("item_questions")->where("id='$id'")->delete();
            $answers = M("item_answers")->where("qid=".$id)->delete();
            if($result!=false && $answers!=false){
                $this->success("删除成功！");
            }else{
                $this->error("删除失败!");
            }
        }else{
            $this->error("请以正确的方式访问");
        }
    }

    //删除项目问题回复
    public function del_answers(){
        if(IS_POST){
            $id = I("post.id");
            $answers = M("item_answers")->where("id=".$id)->delete();
            if( $answers!=false){
                $this->success("删除成功！");
            }else{
                $this->error("删除失败!");
            }
        }else{
            $this->error("请以正确的方式访问");
        }
    }


    //添加问题回复
    public function add_answers(){
        if(IS_POST){
            $post=I('post.');
            $_SESSION['user']['uin'] = $post['uin'];
            $itemAnswer = D("ItemAnswers");
            if (!$itemAnswer->create()) {
                $this->error($itemAnswer->getError());
            } else {
                if ($itemAnswer->add()) {
                    unset($_SESSION['user']['uin']);        //绕过model里面的规则检查
                    $this->success('提交成功！');
                } else {
                    $this->error('提交失败！');
                }
            }
        }else{
            $qid = I("qid");
            $this->qid = $qid;
            $this->display();
        }

    }

    //修改问题回复
    public function edit_answers(){
        if(IS_POST){
            $post=I('post.');
            $_SESSION['user']['uin'] = $post['uin'];
            $itemAnswer = D("ItemAnswers");
            if (!$itemAnswer->create($post,$itemAnswer::MODEL_UPDATE)) {
                $this->error($itemAnswer->getError());
            } else {
                if ($itemAnswer->where("id=".$post['id'])->save($post)) {
                    unset($_SESSION['user']['uin']);        //绕过model里面的规则检查
                    $this->success('提交成功！');
                } else {
                    $this->error('提交失败！');
                }
            }
        }else{
            $id = I("id");
            $this->info = D("ItemAnswers")->getInfo(array("a.id"=>$id));
            $this->display();
        }
    }

}
>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
