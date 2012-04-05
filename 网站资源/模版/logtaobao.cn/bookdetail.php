<?php
/**
 *   Simple example rendering a user list
 *   ------------------------------------
 *   
 *   @credit - adapt from ptemplates sample
 */
require 'h2o.php';
require_once 'config/settings.inc.php';

$template = new H2o('template/templates/bookdetail.html', array(
    'cache_dir' => dirname(__FILE__)  . "/template/templates"
));

$catArray=SQL_getAllCat();
$config=array('site_title' => 'TXT小说下载|免费TXT全本小说|免费电子书|','site_description' => 'TXT小说下载网站，主要是TXT下载，TXT小说下载和电子书的下载，提供免费的TXT小说下载和免费的电子书下载，是国内最好的TXT小说下载和电子书下载网站。','site_keywords' => 'TXT，小说下载，TXT小说下载，电子书下载，电子书免费下载，免费TXT小说');


$totalBookCount=0;
for ($i=0; $i<sizeof($catArray); $i++)
{
  $totalBookCount=$totalBookCount+$catArray[$i]['bookcount'];
}

$bid = $_REQUEST['bid'];
if($bid==null||$bid==""){
	$bid=2411;
}
$book=SQL_getBookById($bid);

if ($book.bid>5000){
  echo $template->render(array(
    'book' => $book,
    'hotbooks' => SQL_getHotBookListByCat($book['category']['cid'],0,20),
	'cats' => $catArray,
	'changetitle' => 1
	,	
   ));
}else{
   echo $template->render(array(
    'book' => $book,
    'hotbooks' => SQL_getHotBookListByCat($book['category']['cid'],0,20),
	'config' => $config, 
	'cats' => $catArray	  
	,	
    )); 
}

