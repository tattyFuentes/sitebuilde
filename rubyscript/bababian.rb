# coding: utf-8
require 'rubygems'
require 'watir'
require 'win32ole'

$LOAD_PATH << File.dirname(__FILE__)
require 'mylogger'
    autoit = WIN32OLE.new('AutoItX3.Control')
    ie = Watir::IE.new
    ie.goto('http://taobao.bababian.com/')
    ie.text_field(:name, 'userName').set(ARGV[0])
    ie.text_field(:id, 'password').set('ARGV[1]')	
    
