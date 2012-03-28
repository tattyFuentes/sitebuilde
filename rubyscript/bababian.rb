# coding: utf-8
require 'rubygems'
require 'watir'
require 'win32ole'

$LOAD_PATH << File.dirname(__FILE__)
require 'mylogger'
    autoit = WIN32OLE.new('AutoItX3.Control')
    ie = Watir::IE.new
    ie.goto('http://www.bababian.com/phoinfo/750B5F0C4283A4DED3A12715ACE4AA6FDT') 
    puts('111111111111111111111111')	
    puts(ARGV[0])
    ie.text_field(:name, 'comment').set(ARGV[0].encode('utf-8'))
    #ie.text_field(:id, 'password').set('ARGV[1]')