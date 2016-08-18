<?php
return $config = array(
	//'配置项'=>'配置值'
	'DEFAULT_THEME'        => 'default',  //默认模板
	'TMPL_PARSE_STRING'  => array(
		'__THEME__'     => __ROOT__.'/Template/Home', // 增加新的JS类库路径替换规则
	),
);