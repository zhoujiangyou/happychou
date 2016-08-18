<?php 
//检验 验证码是否正确
function check_verify($code, $id = ''){
    $verify = new \Think\Verify();
    return $verify->check($code, $id);
}

/**
 * 检查用户是否通过认证
 * @param $uin  用户uin
 * @param string $type real:实名认证 attest:投资人认证
 * @return boolean
 */

function check_attest($uin, $type='real'){
    $where['a.uin'] = $uin;
    $userAttest = D("UserAttest")->getInfo($where);
    if($type == 'real'){
        if($userAttest['status']==1){
            return true;
        }else{
            return false;
        }
    }elseif($type='attest'){
        if($userAttest['attest_status']==1){
            return true;
        }else{
            return false;
        }
    }else{
        return false;
    }

}

/**
 * 检查用户是否被关注
 * @param $uin  被关注者id
 * @param $fuin 关注者id
 * @return bool 是否关注
 */
function check_follow($uin, $fuin){
    $where['a.uin'] = $uin;
    $where['a.fuin'] =$fuin;
    $result = D("UserFollow")->getInfo($where);
    if($result){
        return true;
    }else{
        return false;
    }
}

/**
 * 检查用户是否收藏该项目
 * @param $itemid   项目id
 * @param $uin  注者id
 * @return bool 是否关注
 */
function check_collect($itemid, $uin){
    $where['a.itemid'] = $itemid;
    $where['a.uin'] =$uin;
    $result = D("ItemCollect")->getInfo($where);
    if($result){
        return true;
    }else{
        return false;
    }
}

//图片裁剪
function cut_image($img, $width, $height, $type = 3){
    if(empty($width)&&empty($height)){
        return $img;
    }
    $imgDir = realpath(ROOT_PATH.$img);
    if(!is_file($imgDir)){
        return $img;
    }
    $imgInfo = pathinfo($img);
    $newImg = $imgInfo['dirname'].'/cut_'.$width.'_'.$height.'_'.$imgInfo["basename"];
    $newImgDir = ROOT_PATH.$newImg;
    if(!is_file($newImgDir)){
        $image = new \Think\Image();
        $image->open($imgDir);
        $image->thumb($width, $height,$type)->save($newImgDir);
    }
    return $newImg;
}
//默认数据
function default_data($data,$var){
	$info = !empty($data) ? $data: $var;
    return $info;
}
//获取变量
function zml_web($type){
	if ($type=='title') {
		$data = C('WEB_TITLE');
	}
	$this->title=C('WEB_TITLE');
}
//获取用户相关信息
function user($uin,$field){
    if ($field) {
        $info = M('user')->where(array('uin'=>$uin))->getField($field);
    }else{
        $info = M('user')->where(array('uin'=>$uin))->find();
    }
    return  $info;
}
//新闻分类调用函数 获取新闻分类相关信息
function news_category($id,$field){
	$info = M('news_category')->where(array('id'=>$id))->find();
	$info['url'] = U('news/index',array('id'=>$id));
	return  $field ? $info[$field]: $info;
}
//项目分类调用函数 获取项目分类相关信息
function item_category($id,$field){
    $info = M('item_category')->where(array('id'=>$id))->find();
    $info['url'] = U('item/index',array('id'=>$id));
    return  $field ? $info[$field]: $info;
}
/**
 * 加密密码
 * @param string    $data   待加密字符串
 * @return string 返回加密后的字符串
 */
function encrypt($data) {
    return md5(md5(C('AUTH_CODE').md5($data)));
    //return md5(C("AUTH_CODE") . md5($data));
}
//根据city名称获取省份信息
 function region_address_city($region_id){
    $region = M('region')->where(array('id'=>$region_id))->find();
    $address_info['area'] = $region['name'];
    if($region['type']==1){
        $region_p= M('region')->where(array('id'=>$region['pid']))->find();
        $address_info['area']=$region_p['name'].'-'.$address_info['area'];
    }
     return $address_info['area'];
}

//根据代码地区获取地址
function region_address($region_id){
    $region = M('region')->where(array('id'=>$region_id))->find();

    $address_info['a'] = $region;

    if ($region['pid']!=0) {
        $address_info['b'] = M('region')->where(array('id'=>$region['pid']))->find();
    }

    if ($address_info['b']['pid']!=0) {
         $address_info['c'] = M('region')->where(array('id'=>$address_info['b']['pid']))->find();
    }

    if (count($address_info)==1) {
        $address_data['province'] = $address_info['a']['name'];
        
        $address_data['info'] = $address_info['a']['name'];
    }elseif (count($address_info)==2) {
        $address_data['province'] = $address_info['b']['name'];
        $address_data['city'] = $address_info['a']['name'];

        $address_data['info'] = $address_info['b']['name'].' '.$address_info['a']['name'];
    }else{
        $address_data['province'] = $address_info['c']['name'];
        $address_data['city'] = $address_info['b']['name'];
        $address_data['counties'] = $address_info['a']['name'];

        $address_data['info'] = $address_info['c']['name'].' '.$address_info['b']['name'].' '.$address_info['a']['name'];
    }
	
    return $address_data['info'];
}

//增加用户操作记录
function user_log($uin,$con,$type)
{
    $data['uin'] = $uin;
    $data['con'] = $con;
    $data['type'] = $type;
    $data['time'] = time();
    if (M('user_do_log')->token(true)->add($data)) {
        return true;
    } else {
        return false;
    }
}
//将id全部组合
function array_columnmy($data){
    foreach($data as $value){
        $result[]=$value['id'];
    }
  return implode(',',$result);
}

//传地区库的PID列出全部的下级
function get_region($pid){
	$region=M('region')->where(array('pid'=>$pid))->select();
    return $region;
}
//传分类PID或取下级分类
function get_category($pid){
    $region=M('item_category')->where(array('pid'=>$pid))->select();
    return $region;
}
//通过分类ID找出所有上级分类ID和name
function getupcate($id){    
    $cate=M('item_category')->order('pid asc')->select();
    $arr=array();
    foreach($cate as $v){
        if($v['id']==$id){
            $arr[]=$v;
            $arr=array_merge($arr,getupcate($v['pid']));
        }
    }
    return $arr;
}
//转换剩余时间格式
function gettime($time){
    if ($time < 0) {
        return '已结束';  
    } else {  
        if ($time < 60) {  
            return $time . '秒';  
        } else {  
            if ($time < 3600) {  
                return floor($time / 60) . '分钟';  
            } else {  
                if ($time < 86400) {  
                    return floor($time / 3600) . '小时';  
                } else {  
                    if ($time < 259200) {//3天内  
                        return floor($time / 86400) . '天';  
                    } else {  
                        return floor($time / 86400) . '天';  
                    }  
                }  
            }  
        }  
    }  
}
function doLog($uin,$status = '0'){
    $where['uin'] = empty($uin) ? session('user.uin') : $uin;
    $where['status'] = $status;
    return D('UserDoLog')->countList($where);
}


/**
 * 将一个字符串部分字符用*替代隐藏
 * @param string    $string   待转换的字符串
 * @param int       $bengin   起始位置，从0开始计数，当$type=4时，表示左侧保留长度
 * @param int       $len      需要转换成*的字符个数，当$type=4时，表示右侧保留长度
 * @param int       $type     转换类型：0，从左向右隐藏；1，从右向左隐藏；2，从指定字符位置分割前由右向左隐藏；3，从指定字符位置分割后由左向右隐藏；4，保留首末指定字符串
 * @param string    $glue     分割符
 * @return string   处理后的字符串
 */
function hideStr($string, $bengin = 0, $len = 4, $type = 0, $glue = "@") {
    if (empty($string))
        return false;
    $array = array();
    if ($type == 0 || $type == 1 || $type == 4) {
        $strlen = $length = mb_strlen($string);
        while ($strlen) {
            $array[] = mb_substr($string, 0, 1, "utf8");
            $string = mb_substr($string, 1, $strlen, "utf8");
            $strlen = mb_strlen($string);
        }
    }
    switch ($type) {
        case 1:
            $array = array_reverse($array);
            for ($i = $bengin; $i < ($bengin + $len); $i++) {
                if (isset($array[$i]))
                    $array[$i] = "*";
            }
            $string = implode("", array_reverse($array));
            break;
        case 2:
            $array = explode($glue, $string);
            $array[0] = hideStr($array[0], $bengin, $len, 1);
            $string = implode($glue, $array);
            break;
        case 3:
            $array = explode($glue, $string);
            $array[1] = hideStr($array[1], $bengin, $len, 0);
            $string = implode($glue, $array);
            break;
        case 4:
            $left = $bengin;
            $right = $len;
            $tem = array();
            for ($i = 0; $i < ($length - $right); $i++) {
                if (isset($array[$i]))
                    $tem[] = $i >= $left ? "*" : $array[$i];
            }
            $array = array_chunk(array_reverse($array), $right);
            $array = array_reverse($array[0]);
            for ($i = 0; $i < $right; $i++) {
                $tem[] = $array[$i];
            }
            $string = implode("", $tem);
            break;
        default:
            for ($i = $bengin; $i < ($bengin + $len); $i++) {
                if (isset($array[$i]))
                    $array[$i] = "*";
            }
            $string = implode("", $array);
            break;
    }
    return $string;
}

/**
 * 功能：字符串截取指定长度
 * @param string    $string      待截取的字符串
 * @param int       $len         截取的长度
 * @param int       $start       从第几个字符开始截取
 * @param boolean   $suffix      是否在截取后的字符串后跟上省略号
 * @return string               返回截取后的字符串
 */
function cutStr($str, $len = 100, $start = 0, $suffix = 1) {
    $str = strip_tags(trim(strip_tags($str)));
    $str = str_replace(array("\n", "\t"), "", $str);
    $strlen = mb_strlen($str);
    while ($strlen) {
        $array[] = mb_substr($str, 0, 1, "utf8");
        $str = mb_substr($str, 1, $strlen, "utf8");
        $strlen = mb_strlen($str);
    }
    $end = $len + $start;
    $str = '';
    for ($i = $start; $i < $end; $i++) {
        $str.=$array[$i];
    }
    return count($array) > $len ? ($suffix == 1 ? $str . "&hellip;" : $str) : $str;
}

//判断网站是否是手机端请求
function is_mobile_request()
{
    $_SERVER['ALL_HTTP'] = isset($_SERVER['ALL_HTTP']) ? $_SERVER['ALL_HTTP'] : '';
    $mobile_browser = '0';
    if (preg_match('/(up.browser|up.link|mmp|symbian|smartphone|midp|wap|phone|iphone|ipad|ipod|android|xoom)/i', strtolower($_SERVER['HTTP_USER_AGENT'])))
        $mobile_browser++;
    if ((isset($_SERVER['HTTP_ACCEPT'])) and (strpos(strtolower($_SERVER['HTTP_ACCEPT']), 'application/vnd.wap.xhtml+xml') !== false))
        $mobile_browser++;
    if (isset($_SERVER['HTTP_X_WAP_PROFILE']))
        $mobile_browser++;
    if (isset($_SERVER['HTTP_PROFILE']))
        $mobile_browser++;
    $mobile_ua = strtolower(substr($_SERVER['HTTP_USER_AGENT'], 0, 4));
    $mobile_agents = array(
        'w3c ', 'acs-', 'alav', 'alca', 'amoi', 'audi', 'avan', 'benq', 'bird', 'blac',
        'blaz', 'brew', 'cell', 'cldc', 'cmd-', 'dang', 'doco', 'eric', 'hipt', 'inno',
        'ipaq', 'java', 'jigs', 'kddi', 'keji', 'leno', 'lg-c', 'lg-d', 'lg-g', 'lge-',
        'maui', 'maxo', 'midp', 'mits', 'mmef', 'mobi', 'mot-', 'moto', 'mwbp', 'nec-',
        'newt', 'noki', 'oper', 'palm', 'pana', 'pant', 'phil', 'play', 'port', 'prox',
        'qwap', 'sage', 'sams', 'sany', 'sch-', 'sec-', 'send', 'seri', 'sgh-', 'shar',
        'sie-', 'siem', 'smal', 'smar', 'sony', 'sph-', 'symb', 't-mo', 'teli', 'tim-',
        'tosh', 'tsm-', 'upg1', 'upsi', 'vk-v', 'voda', 'wap-', 'wapa', 'wapi', 'wapp',
        'wapr', 'webc', 'winw', 'winw', 'xda', 'xda-'
    );
    if (in_array($mobile_ua, $mobile_agents))
        $mobile_browser++;
    if (strpos(strtolower($_SERVER['ALL_HTTP']), 'operamini') !== false)
        $mobile_browser++;
    // Pre-final check to reset everything if the user is on Windows
    if (strpos(strtolower($_SERVER['HTTP_USER_AGENT']), 'windows') !== false)
        $mobile_browser = 0;
    // But WP7 is also Windows, with a slightly different characteristic
    if (strpos(strtolower($_SERVER['HTTP_USER_AGENT']), 'windows phone') !== false)
        $mobile_browser++;
    if ($mobile_browser > 0)
        return true;
    else
        return false;
}

/**
 * 功能：短信发送函数
 * @param string $phone    接收者手机号码
 * @param string $message   短信内容
 * @return boolean
 */
function send_sms($phone,$message) {
    $message = $message.'【'.C('ZHIMALE.SMS_SIGN').'】';

    $ch = curl_init();
    //curl_setopt($ch, CURLOPT_URL, "http://sms.zhimale.com/api/sms/send.json");
    curl_setopt($ch, CURLOPT_URL, "http://www.baidu.com");

    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE); 
    curl_setopt($ch, CURLOPT_HEADER, FALSE);

    curl_setopt($ch, CURLOPT_HTTPAUTH , CURLAUTH_BASIC);
    curl_setopt($ch, CURLOPT_USERPWD  , 'api:key-'.C('ZHIMALE.SMS_API_KEY'));

    curl_setopt($ch, CURLOPT_POST, TRUE);
    curl_setopt($ch, CURLOPT_POSTFIELDS, array('phone' => $phone,'message' => $message));

    $res = curl_exec( $ch );
    curl_close( $ch );
    //$res  = curl_error( $ch );
    $res = json_decode($res,true);

    return $res;
}

//检测短信平台是否配置
function is_sms() {
    if (C('ZHIMALE.SMS_API_KEY') and C('ZHIMALE.SMS_SIGN')) {
        $res = true;
    }else{
        $res = false;
    }

    return $res;
}
//curlget 请求函数
function curl_get($url){
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE); 
    curl_setopt($ch, CURLOPT_HEADER, FALSE);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
    $res = curl_exec($ch);
    curl_close($ch);
    return $res;
}

//分页功能
//param ： currentpage pagenum
//return : string

function PageLimit($pagenum = 10,$currentpage =1){

    if($pagenum==0){
        $limit='';
    }else{
        $limit = ($currentpage-1)*$pagenum.','.$pagenum;
    }
    return $limit;
}

//ajax返回数据格式
function AjaxResult($s_ok,$msg,$data=array()){

    $returndata= array(
        's_ok'=>$s_ok,
        'msg'=>$msg,
        'data'=>$data
    );
    return $returndata;
}


//股权项目条件筛选
function projectfilter($data){
     $where ='';
    if($data['area']!='000000'){
         $where=" a.province=".$data['area'].'  and' ;
     }

    if($data['category']!=0){
        $where=$where.' b.id  = '.$data['category'].'  and';
    }
  switch ($data['filter']){
      case 0:
          $where= $where .'  1=1 ';
          break;
      case 1:
          $where = $where.'   a.left_money = 0';
          break;
      case 2:
          $where = $where.'  a.left_money <> 0';
          break;
      case 3:
          $where = $where.'  e.id=1';
          break;
  }
    $where='  and  '.$where;
    return $where;
}

function projectsort($data){
    $sort='';
    if($data['direction']==1){
        $dir='  desc  ';
    }else{
        $dir='  asc  ';
    }
     switch($data['sort']) {
         case 0:
             break;
         case 1:
             $sort = ' rute ' .$dir;
             break;
         case 2:
             $sort = ' foucsnum  '.$dir;
             break;
         case 3:
             $sort = ' a.raising_money '.$dir;
             break;
         case 4:
             $sort = ' a.end_time '.$dir;
             break;
     }
    if($sort!=''){
        $sort='ORDER BY '.$sort;
    }

    return $sort;
}

/**
 * 邮件发送函数
 * 单个发送 还不能增加附件 比较搓
 */
function sendMail($to, $title, $content) {

    Vendor('PHPMailer.PHPMailerAutoload');
    $mail = new PHPMailer(); //实例化
    $mail->IsSMTP(); // 启用SMTP
    $mail->Host=C('MAIL_HOST'); //smtp服务器的名称（这里以QQ邮箱为例）
    $mail->SMTPAuth = C('MAIL_SMTPAUTH'); //启用smtp认证
    $mail->Username = C('MAIL_USERNAME'); //你的邮箱名
    $mail->Password = C('MAIL_PASSWORD') ; //邮箱密码
    $mail->From = C('MAIL_FROM'); //发件人地址（也就是你的邮箱地址）
    $mail->FromName = C('MAIL_FROMNAME'); //发件人姓名
    $mail->AddAddress($to,"尊敬的客户");
    $mail->WordWrap = 50; //设置每行字符长度
    $mail->IsHTML(C('MAIL_ISHTML')); // 是否HTML格式邮件
    $mail->CharSet=C('MAIL_CHARSET'); //设置邮件编码
    $mail->Subject =$title; //邮件主题
    $mail->Body = $content; //邮件内容
    $mail->AltBody = "这是一个纯文本的身体在非营利的HTML电子邮件客户端"; //邮件正文不支持HTML的备用显示
    return($mail->Send());
}


/**
 * 系统邮件发送函数
 * @param string $to    接收邮件者邮箱
 * @param string $name  接收邮件者名称
 * @param string $subject 邮件主题
 * @param string $body    邮件内容
 * @param string $attachment 附件列表
 * @return boolean
 */
function think_send_mail($to, $name, $subject = '', $body = '', $attachment = null){
    $config = C('THINK_EMAIL');
//    vendor('PHPMailer.class#phpmailer'); //从PHPMailer目录导class.phpmailer.php类文件
//    Vendor('PHPMailer');
    Vendor('PHPMailer.PHPMailerAutoload');
    $mail             = new PHPMailer(); //PHPMailer对象
    $mail->CharSet    = 'UTF-8'; //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码
    $mail->IsSMTP();  // 设定使用SMTP服务
    $mail->SMTPDebug  = 0;                     // 关闭SMTP调试功能
    // 1 = errors and messages
    // 2 = messages only
    $mail->SMTPAuth   = true;                  // 启用 SMTP 验证功能
  //  $mail->SMTPSecure = 'ssl';                 // 使用安全协议
    $mail->Host       = $config['SMTP_HOST'];  // SMTP 服务器
    $mail->Port       = $config['SMTP_PORT'];  // SMTP服务器的端口号
    $mail->Username   = $config['SMTP_USER'];  // SMTP服务器用户名
    $mail->Password   = $config['SMTP_PASS'];  // SMTP服务器密码
    $mail->SetFrom($config['FROM_EMAIL'], $config['FROM_NAME']);
    $replyEmail       = $config['REPLY_EMAIL']?$config['REPLY_EMAIL']:$config['FROM_EMAIL'];
    $replyName        = $config['REPLY_NAME']?$config['REPLY_NAME']:$config['FROM_NAME'];
    $mail->AddReplyTo($replyEmail, $replyName);
    $mail->Subject    = $subject;
    $mail->MsgHTML($body);

    $mail->AddAddress($to, $name);
    if(is_array($attachment)){ // 添加附件
        foreach ($attachment as $file){
            is_file($file) && $mail->AddAttachment($file);
        }
    }
    return $mail->Send() ? true : $mail->ErrorInfo;
}

//下载文件(未验证)
function download_file($file){
    if(is_file($file)){
        $length = filesize($file);
       // $type = mime_content_type($file);
        $finfo = finfo_open(FILEINFO_MIME);
        $type = finfo_file($finfo, $file);
        $showname =  ltrim(strrchr($file,'/'),'/');
        header("Content-Description: File Transfer");
        header('Content-type: ' . $type);
        header('Content-Length:' . $length);
        if (preg_match('/MSIE/', $_SERVER['HTTP_USER_AGENT'])) { //for IE
            header('Content-Disposition: attachment; filename="' . rawurlencode($showname) . '"');
        } else {
            header('Content-Disposition: attachment; filename="' . $showname . '"');
        }
        readfile($file);
        exit;
    } else {
        exit('文件已被删除！');
    }
}

