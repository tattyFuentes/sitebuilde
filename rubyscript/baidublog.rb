# coding: utf-8
require 'rubygems'
require 'test/unit'
require 'watir'
require 'win32ole'

$LOAD_PATH << File.dirname(__FILE__)
require 'mylogger'
class GmailDemo < Test::Unit::TestCase
  def test_gmaildemo
    autoit = WIN32OLE.new('AutoItX3.Control')
    ie = Watir::IE.new
    ie.goto('https://passport.baidu.com/?login&tpl=mn')
    ie.text_field(:name, 'username').set('hfhuga')
    ie.text_field(:id, 'normModPsp').set('coco2001')	
    ie.checkbox(:name, "mem_pass").clear
    ie.button(:value, " 登录 ").click     # Return to the inbox page
    filePrefix = "logs/baidublog/baidubloglog"    
    logger = LoggerFactory.start_default_logger(filePrefix)
    logger.log("begin 登录")
    sleep(5)
    

begin
  ie.goto('http://hi.baidu.com/hfhuga/blog/create')
  ie.text_field(:name, 'spBlogTitle').set('市场迎来见证奇迹的时刻')
  ie.select_list(:name , "spBlogCatName").select("技术")
  ie.frame(:name, "tangram_editor_iframe_TANGRAM__1").document.body.innerhtml='周一，是2月27日下跌以来的第21天，是3月14日巨阴以来的第9天，大盘刚好跌到2132到2478的黄金分割点38.2％处，裴波那契数列再加上黄金分割点，大盘止跌回升，市场迎来见证奇迹的时刻！低点2339将成为近期重要低点。本周是反弹周，而这个反弹很可能就从周一尾盘开始。
   首先，各位还记得以前笔者一直关注的上证50指数？该指数60日线上穿120日线形成金叉，形成雄鹰展翅之势，而目前指数刚好调整到上升的60日线处，止跌回升概率大。其次，我们不妨研究下大盘日线以下小级别结构。技术分析需要有统领三军般的大局观，有时候也需要有对细微处庖丁解牛似的了如指掌。我们看大盘的30分钟图：'
  ie.hidden(:name, 'spBlogText').value='周一，是2月27日下跌以来的第21天，是3月14日巨阴以来的第9天，大盘刚好跌到2132到2478的黄金分割点38.2％处，裴波那契数列再加上黄金分割点，大盘止跌回升，市场迎来见证奇迹的时刻！低点2339将成为近期重要低点。本周是反弹周，而这个反弹很可能就从周一尾盘开始。
   首先，各位
    还记得以前笔者一直关注的上证50指数？该指数60日线上穿120日线形成金叉，形成雄鹰展翅之势，而目前指数刚好调整到上升的60日线处，止跌回升概率大。其次，我们不妨研究下大盘日线以下小级别结构。技术分析需要有统领三军般的大局观，有时候也需要有对细微处庖丁解牛似的了如指掌。我们看大盘的30分钟图：'
  ie.form(:name,'form1').submit
  sleep(5)
  autoit.Send '{ENTER}'
  
  rescue => err
    time = Time.now.strftime("%Y-%m-%d %H:%M:%S")   
    logger.log('error:'+err)  
end

end
end