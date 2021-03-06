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
class NewsController extends CommonController {
	//新闻列表页
    public function index(){
    	$id = I('get.id');
    	if ($id) {
    		$newsInfo = news_category($_GET['id']);
    		// 如果有 pid seo标题 描述 关键词
			$this->title = $newsInfo['title'] ? $newsInfo['title'].' - '.C('sitename') : C('sitename');
			$this->keywords = $newsInfo['keywords'] ? $newsInfo['keywords'].' - '.C('keywords'): C('keywords');
			$this->description = $newsInfo['description'] ? $newsInfo['description'].' - '.C('desc'): C('desc');
    		$where['cid'] = $id;
    		$limit = $newsInfo['limit']; // 获取栏目调用新闻数值
    	}
    	//如果 没定义条数 默认10条
    	$limit             = default_data($limit,10);
    	$news              = D('News'); // 实例化User对象
    	$where['a.status'] = 1;
    	$count             = $news->countList($where); // 统计有多少条数据
    	$Page              = new Page($count,$limit); // 实例化分页类 传入总记录数和每页显示的记录数(20)
    	$show  = $Page->show(); 
        $limit = $Page->firstRow.','.$Page->listRows;
    	// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
    	$newsList = $news->loadList($where);
    	foreach ($newsList as $key => $value) {
    		$newsList[$key]['url'] = U('News/info',array('id'=>$value['id']));
    	}
    	//面包屑导航组装
    	$bread = 	'<ul class="x12 bread padding-big-top">
						<li><a href="'.__ROOT__.'/" class="icon-home"> 首页</a></li>
						<li><a href="'.news_category($id,'url').'">'.news_category($id,'name').'</a></li>
					</ul>';
		$this->bread         = $bread;
    	$this->newslist        = $newsList;
    	$this->page            = $show;
    	$this->display();
    }
    //新闻内页
    public function info(){
    	$id                = I('get.id');
        $where             = array('a.id'=>$id,'a.status'=>1);
    	$news              = D('News')->getInfo($where);
        $news['content']   = htmlspecialchars_decode($news['content']);
    	if(!$news){
    		$this->error('改文章已被删除或不存在！');
    	}
    	//面包屑导航组装
    	$bread = 	'<ul class="x12 bread padding-big-top">
						<li><a href="'.__ROOT__.'/" class="icon-home"> 首页</a></li>
						<li><a href="'.news_category($news['cid'],'url').'">'.news_category($news['cid'],'name').'</a></li>
					</ul>';
		$this ->bread     = $bread;
    	$this->zml        = $news;
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
namespace Home\Controller;
use Think\Page;
class NewsController extends CommonController {
	//新闻列表页
    public function index(){
    	$id = I('get.id');
    	if ($id) {
    		$newsInfo = news_category($_GET['id']);
    		// 如果有 pid seo标题 描述 关键词
			$this->title = $newsInfo['title'] ? $newsInfo['title'].' - '.C('sitename') : C('sitename');
			$this->keywords = $newsInfo['keywords'] ? $newsInfo['keywords'].' - '.C('keywords'): C('keywords');
			$this->description = $newsInfo['description'] ? $newsInfo['description'].' - '.C('desc'): C('desc');
    		$where['cid'] = $id;
    		$limit = $newsInfo['limit']; // 获取栏目调用新闻数值
    	}
    	//如果 没定义条数 默认10条
    	$limit             = default_data($limit,10);
    	$news              = D('News'); // 实例化User对象
    	$where['a.status'] = 1;
    	$count             = $news->countList($where); // 统计有多少条数据
    	$Page              = new Page($count,$limit); // 实例化分页类 传入总记录数和每页显示的记录数(20)
    	$show  = $Page->show(); 
        $limit = $Page->firstRow.','.$Page->listRows;
    	// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
    	$newsList = $news->loadList($where);
    	foreach ($newsList as $key => $value) {
    		$newsList[$key]['url'] = U('News/info',array('id'=>$value['id']));
    	}
    	//面包屑导航组装
    	$bread = 	'<ul class="x12 bread padding-big-top">
						<li><a href="'.__ROOT__.'/" class="icon-home"> 首页</a></li>
						<li><a href="'.news_category($id,'url').'">'.news_category($id,'name').'</a></li>
					</ul>';
		$this->bread         = $bread;
    	$this->newslist        = $newsList;
    	$this->page            = $show;
    	$this->display();
    }
    //新闻内页
    public function info(){
    	$id                = I('get.id');
        $where             = array('a.id'=>$id,'a.status'=>1);
    	$news              = D('News')->getInfo($where);
        $news['content']   = htmlspecialchars_decode($news['content']);
    	if(!$news){
    		$this->error('改文章已被删除或不存在！');
    	}
    	//面包屑导航组装
    	$bread = 	'<ul class="x12 bread padding-big-top">
						<li><a href="'.__ROOT__.'/" class="icon-home"> 首页</a></li>
						<li><a href="'.news_category($news['cid'],'url').'">'.news_category($news['cid'],'name').'</a></li>
					</ul>';
		$this ->bread     = $bread;
    	$this->zml        = $news;
    	$this->display();
    }
>>>>>>> 98b56c4fd74d8c0bc5ebc0c352b176e8d8f7d926
}