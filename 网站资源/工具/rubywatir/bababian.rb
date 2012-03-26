# coding: utf-8
require 'rubygems'
require 'test/unit'
require 'watir'
$LOAD_PATH << File.dirname(__FILE__)
require 'example_logger1'
class GmailDemo < Test::Unit::TestCase
  def test_gmaildemo
    ie = Watir::IE.new
    ie.goto('http://taobao.bababian.com/')
    ie.text_field(:name, 'userName').set('davidtaobao')
    ie.text_field(:name, 'password').set('hou941111fh')	
    ie.button(:value, " ").click     # Return to the inbox page
    filePrefix = "taobaolog"    
    logger = LoggerFactory.start_default_logger(filePrefix)
    logger.log("begin invite")


begin
  time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
  logger.log(time+'  currentuser:mygirl')  
  ie.goto('http://taobao.bababian.com')
end

end
end