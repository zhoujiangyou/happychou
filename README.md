#运行说明：
*   清除Runtime下面的所有文件
*   将本机根目录解析到本项目目录，以免网站相关资源无法加载
*   将tp框架中的think解压至inc/Libary/ 下面，文件过大就不在上传

#注意事项：
*   网站管理后台地址是在本机地址后面加/admin
*   后台管理账号默认为：admin，admin
*   模板目录为new，修改new下面的文件

#开发注意流程：
*   开发单个功能，在本地git建立单独branch，功能开发测试完毕，提交到服务器对应branch，然后发送pull request
*   全部文件采用UTF-8 编码，注意编码一致性

#目录结构
*   APP         网站后端代码目录
*   -- Admin    后台管理
*   -- Common   公用目录
*   -- Home     网站前台目录
*   -- User     会员中心目录
*   Inc         框架根目录
*   Public      公用资源目录
*   Runtime     运行缓存目录
*   Template    网站皮肤目录
*   -- Admin    后台皮肤目录
*   -- Home     前台皮肤目录
*   -- User     会员中心皮肤目录
*   uploads     上传目录
