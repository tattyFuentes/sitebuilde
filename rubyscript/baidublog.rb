# coding: utf-8
=begin
命令行参数定义：
0=username
1=normModPsp
2=logfilePrefix
3=createblogurl
4=spBlogTitle
5=spBlogCatName
6=spBlogText
=end

require 'rubygems'
require 'watir'

$LOAD_PATH << File.dirname(__FILE__)
require 'mylogger'
ie = Watir::IE.new
ie.goto('https://passport.baidu.com/?login&tpl=mn')
ie.text_field(:name, 'username').set(ARGV[0].encode('utf-8'))
ie.text_field(:id, 'normModPsp').set(ARGV[1].encode('utf-8'))	
ie.checkbox(:name, "mem_pass").clear
ie.button(:value, " 登录 ").click     # Return to the inbox page
#logfilePrefix = "logs/baidublog/baidubloglog"    
logfilePrefix = ARGV[2].encode('utf-8')
logger = LoggerFactory.start_default_logger(logfilePrefix)
logger.log("begin 登录")
sleep(5)
#ie.goto('http://hi.baidu.com/hfhuga/blog/create')
ie.goto(ARGV[3].encode('utf-8'))
ie.text_field(:name, 'spBlogTitle').set(ARGV[4].encode('utf-8'))
ie.select_list(:name , "spBlogCatName").select(ARGV[5].encode('utf-8'))
ie.frame(:name, "tangram_editor_iframe_TANGRAM__1").document.body.innerhtml=ARGV[6].encode('utf-8')
ie.hidden(:name, 'spBlogText').value=ARGV[6].encode('utf-8')
logger.log('begin submit') 
#ie.form(:name,'form1').submit
ie.div(:class => 'spblog-btn',:index => 0).click
logger.log('end submit') 
ie.close
