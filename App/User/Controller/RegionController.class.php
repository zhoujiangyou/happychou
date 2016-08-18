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
class RegionController extends PublicController {
    public function index(){
		$pid 	= I('get.pid');
		$region = get_region($pid);
		if($region){
			$this->success($region);	
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
class RegionController extends PublicController {
    public function index(){
		$pid 	= I('get.pid');
		$region = get_region($pid);
		if($region){
			$this->success($region);	
		}
    }
>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}