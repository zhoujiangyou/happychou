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
use Think\Verify;
class VerifyController extends CommonController {
    public function index(){
		ob_clean();
        $Verify 			= new Verify();
        $Verify->fontSize 	= 30;
        $Verify->length   	= 4;
        $Verify->useNoise 	= false;
        $Verify->useImgBg 	= true; 
        $Verify->entry();
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
use Think\Verify;
class VerifyController extends CommonController {
    public function index(){
		ob_clean();
        $Verify 			= new Verify();
        $Verify->fontSize 	= 30;
        $Verify->length   	= 4;
        $Verify->useNoise 	= false;
        $Verify->useImgBg 	= true; 
        $Verify->entry();
    }
>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}