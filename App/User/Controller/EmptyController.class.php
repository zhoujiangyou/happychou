<?php
/**
 * Created by PhpStorm.
 * User: zhouht (zhouht@happychou.net)
 * Date: 2015/11/19
 * Time: 12:29
 */

namespace User\Controller;
use Think\Controller;

class EmptyController extends  Controller
{
    function _empty(){
        header("HTTP/1.0 404 Not Found");
        $this->display('./Template/Home/default/Public/404.html');
    }

    function index() {
        header("HTTP/1.0 404 Not Found");
        $this->display('./Template/Home/default/Public/404.html');
    }

}