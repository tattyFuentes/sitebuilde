<?php
/**
 *   Simple example rendering a user list
 *   ------------------------------------
 *   
 *   @credit - adapt from ptemplates sample
 */
require 'h2o.php';
require_once 'config/settings.inc.php';

$template = new H2o('template/templates/newbooklist.html', array(
    'cache_dir' => dirname(__FILE__)  . "/template/templates"
));
$catArray=SQL_getAllCat();
$total=200;
$page = $_REQUEST['page'];
$pagesize = 10;
if($page==null||$page==""){
	$page=1;
}
$config=array('site_title' => 'TXT小说下载|免费TXT全本小说|免费电子书|','site_description' => 'TXT小说下载网站，主要是TXT下载，TXT小说下载和电子书的下载，提供免费的TXT小说下载和免费的电子书下载，是国内最好的TXT小说下载和电子书下载网站。','site_keywords' => 'TXT，小说下载，TXT小说下载，电子书下载，电子书免费下载，免费TXT小说');


$books=SQL_getNewBookListByCat(-1,($page-1)*$pagesize,$pagesize);       
$show_prev = False;
$show_next = False;
$show_prev = !($page == 1);
$max_page = floor(($total + $pagesize - 1) / $pagesize);
$show_next = !($page == $max_page);
$all_page_list = array();
$index=1;
while ($index<=$max_page){
	$all_page_list[$index]=$index;
	$index=$index+1;
}
$page_list = array();
$cnt = 1;
if ($page<6){
	while ($cnt <= $max_page){
       if ($cnt>10)
          break;
       $page_list[$cnt-1]=$cnt;
       $cnt =$cnt + 1;
	}
}else{
	$cnt=$page-4;
    while ($cnt <= $max_page){
	   if ($cnt>$page+5)
           break;
        $page_list[$cnt-$page+4]=$cnt;
        $cnt =$cnt + 1;
	}                
}


echo $template->render(array(
    'books' => $books,
    'hotbooks' => SQL_getHotBookListByCat(-1,0,10),
	"book_count" => $total,
	'show_prev' => $show_prev,
    'show_next' => $show_next,
	'prev' => $page - 1,
	'next' => $page + 1,
	'currpage' => $page,
	'max_page' => $max_page,
	'page_list' => $page_list,
	'all_page_list'=> $all_page_list,
	'pagesize' => $pagesize,
	'config' => $config,
	'cats' => $catArray
	,	
));
