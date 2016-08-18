<<<<<<< HEAD
<?php
/**
 * Created by PhpStorm.
 * User: zhouhaitian
 * Date: 2015/12/2
 * Time: 8:51
 */

namespace  User\Controller;
use Think\Controller;
class FeedBackController extends Controller {
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
=======
<?php
/**
 * Created by PhpStorm.
 * User: zhouhaitian
 * Date: 2015/12/2
 * Time: 8:51
 */

namespace  User\Controller;
use Think\Controller;
class FeedBackController extends Controller {
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
>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}