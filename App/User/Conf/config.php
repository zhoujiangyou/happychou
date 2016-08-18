<?php
return $config = array(
	'SHOW_PAGE_TRACE'=>0,
	'TMPL_DETECT_THEME' => 1, 
	'DEFAULT_THEME'        => 'default',  //默认模板
	
	'TMPL_PARSE_STRING'=>array(
		'__CSS__'=> __ROOT__.'/Public/style/',
		'__JS__'=> __ROOT__.'/Public/js/',
		'__IMG__'=> __ROOT__.'/Public/img/',
		'__LIB__'=> __ROOT__.'/Public/lib/',
	 ),
);
