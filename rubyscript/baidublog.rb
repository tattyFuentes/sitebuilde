# coding: utf-8
require 'rubygems'
require 'watir'

$LOAD_PATH << File.dirname(__FILE__)
require 'mylogger'
ie = Watir::IE.new
ie.goto('https://passport.baidu.com/?login&tpl=mn')
ie.text_field(:name, 'username').set('hfhuga')
ie.text_field(:id, 'normModPsp').set('coco2001')	
ie.checkbox(:name, "mem_pass").clear
ie.button(:value, " 登录 ").click     # Return to the inbox page
filePrefix = "logs/baidublog/baidubloglog"    
logger = LoggerFactory.start_default_logger(filePrefix)
logger.log("begin 登录")
ie.goto('http://hi.baidu.com/hfhuga/blog/create')
ie.text_field(:name, 'spBlogTitle').set('中方：日对钓鱼岛等采取任何单方面举措非法无效 ')
ie.select_list(:name , "spBlogCatName").select("技术")
ie.frame(:name, "tangram_editor_iframe_TANGRAM__1").document.body.innerhtml='中新社北京3月27日电 (张蔚然 张晓宁)中国外交部发言人洪磊27日在例行记者会上表示，日方对钓鱼岛及其附属岛屿采取任何单方面举措都是非法和无效的，都改变不了这些岛屿属于中国的事实。

据报道，26日，日本官房长官藤村修在记者会上称，日本政府将钓鱼岛附近4个岛屿中的“北小岛”登记为国有财产。

洪磊就此表示，钓鱼岛及其附属岛屿自古以来就是中国的固有领土，中国对此拥有无可争辩的主权。日方对钓鱼岛及其附属岛屿采取任何单方面举措都是非法和无效的，都改变不了这些岛屿属于中国的事实。

'
ie.hidden(:name, 'spBlogText').value='中新社北京3月27日电 (张蔚然 张晓宁)中国外交部发言人洪磊27日在例行记者会上表示，日方对钓鱼岛及其附属岛屿采取任何单方面举措都是非法和无效的，都改变不了这些岛屿属于中国的事实。

据报道，26日，日本官房长官藤村修在记者会上称，日本政府将钓鱼岛附近4个岛屿中的“北小岛”登记为国有财产。

洪磊就此表示，钓鱼岛及其附属岛屿自古以来就是中国的固有领土，中国对此拥有无可争辩的主权。日方对钓鱼岛及其附属岛屿采取任何单方面举措都是非法和无效的，都改变不了这些岛屿属于中国的事实。
'
logger.log('begin submit') 
#ie.form(:name,'form1').submit
ie.div(:class => 'spblog-btn',:index => 0).click
logger.log('end submit') 
  
