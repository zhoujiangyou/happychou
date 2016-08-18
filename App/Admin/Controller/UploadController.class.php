<<<<<<< HEAD
<?php
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.happychou.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author:  zhouht (zhouht@happychou.net)
// +----------------------------------------------------------------------
namespace Admin\Controller;
use Think\Controller;
use Think\Upload;
use Vendor\Imageslist;

class UploadController extends Controller {
    public function index(){
		$rootPath=C('UPLOAD_PATH');
		if(!IS_POST){
			date_default_timezone_set("Asia/Chongqing");
			error_reporting(E_ERROR);
			header("Content-Type: text/html; charset=utf-8");
			$url 	= "./Public/lib/ueditor/php/config.json";
			$CONFIG = json_decode(preg_replace("/\/\*[\s\S]+?\*\//", "", file_get_contents($url)), true);
			$action = I('get.action');
			switch ($action) {
				case 'config':
					$result =  json_encode($CONFIG);
					echo $result;
					break;
				case 'listimage':
					$result = new Imageslist();// 实例化上传类
					echo $result;					
					break;				
				 default:
					 echo "亲，不要调皮哦^_^！";
					break;
			}
		}else{
			
			$config = array(
					//'maxSize'    =    3145728,
					'rootPath'   =>    $rootPath,
					'savePath'   =>    'a_'.session('admin_uid').'/',
					'saveName'   =>    'happychou_'.time().rand(111,999),
					'exts'       =>   explode(',',C('UPLOAD_TYPE')),
					'autoSub'    =>    true,
					'subName'    =>    array('date','Ymd'),
			);
			
			$type 	= 'Local';
			$upload = new Upload($config,$type);// 实例化上传类
			$info   =   $upload->upload();
		
		if(!$info) {
			$this->error($upload->getError()) ;
		}else{// 上传成功			
			foreach($info as $file){
				$imgurl=$rootPath.$file['savepath'].$file['savename'];
				echo json_encode(array(
						'status' 	=> 1,
						'error' 	=> 0,
						'url'		=> str_replace('./','/',$imgurl),
						'original'	=> $file['name'],
						'state'		=> 'SUCCESS'
				));
			}
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
namespace Admin\Controller;
use Think\Controller;
use Think\Upload;
use Vendor\Imageslist;

class UploadController extends Controller {
    public function index(){
		$rootPath=C('UPLOAD_PATH');
		if(!IS_POST){
			date_default_timezone_set("Asia/Chongqing");
			error_reporting(E_ERROR);
			header("Content-Type: text/html; charset=utf-8");
			$url 	= "./Public/lib/ueditor/php/config.json";
			$CONFIG = json_decode(preg_replace("/\/\*[\s\S]+?\*\//", "", file_get_contents($url)), true);
			$action = I('get.action');
			switch ($action) {
				case 'config':
					$result =  json_encode($CONFIG);
					echo $result;
					break;
				case 'listimage':
					$result = new Imageslist();// 实例化上传类
					echo $result;					
					break;				
				 default:
					 echo "亲，不要调皮哦^_^！";
					break;
			}
		}else{
			
			$config = array(
					//'maxSize'    =    3145728,
					'rootPath'   =>    $rootPath,
					'savePath'   =>    'a_'.session('admin_uid').'/',
					'saveName'   =>    'happychou_'.time().rand(111,999),
					'exts'       =>   explode(',',C('UPLOAD_TYPE')),
					'autoSub'    =>    true,
					'subName'    =>    array('date','Ymd'),
			);
			
			$type 	= 'Local';
			$upload = new Upload($config,$type);// 实例化上传类
			$info   =   $upload->upload();
		
		if(!$info) {
			$this->error($upload->getError()) ;
		}else{// 上传成功			
			foreach($info as $file){
				$imgurl=$rootPath.$file['savepath'].$file['savename'];
				echo json_encode(array(
						'status' 	=> 1,
						'error' 	=> 0,
						'url'		=> str_replace('./','/',$imgurl),
						'original'	=> $file['name'],
						'state'		=> 'SUCCESS'
				));
			}
		}
		}
    }
>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}