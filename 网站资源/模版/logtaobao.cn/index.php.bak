<?php
/**
 *   Simple example rendering a user list
 *   ------------------------------------
 *   
 *   @credit - adapt from ptemplates sample
 */
require 'h2o.php';
require_once 'config/settings.inc.php';


$template = new H2o('template/templates/index.htm', array(
    'cache_dir' => dirname(__FILE__)  . "/template/templates/cache"
));

$time_start = microtime(true);
$catArray=SQL_getAllCat();
$totalBookCount=0;
for ($i=0; $i<sizeof($catArray); $i++)
{
  $totalBookCount=$totalBookCount+$catArray[$i]['bookcount'];
}


$config=array('site_title' => 'TXT小说下载|免费TXT全本小说|免费电子书|','site_description' => 'TXT小说下载网站，主要是TXT下载，TXT小说下载和电子书的下载，提供免费的TXT小说下载和免费的电子书下载，是国内最好的TXT小说下载和电子书下载网站。','site_keywords' => 'TXT，小说下载，TXT小说下载，电子书下载，电子书免费下载，免费TXT小说');



$categorybooklist = array();
$cnt=0;
while ($cnt < sizeof($catArray)/2){
	$pageItem=array();
	$pageItem['leftitem']=array('cat' => $catArray[$cnt*2],'books'=> SQL_getNewBookListByCat($catArray[$cnt*2]['cid'],0,12));
	$pageItem['rightitem']=array('cat' => $catArray[$cnt*2+1],'books'=> SQL_getNewBookListByCat($catArray[$cnt*2+1]['cid'],0,12));	
	$categorybooklist[$cnt]=$pageItem;
	$cnt =$cnt + 1;
}	

if (sizeof($catArray) % 2==1){	
    $pageItem=array();
    $pageItem['leftitem']=array('cat' => $catArray[sizeof($catArray)-1],'books'=> SQL_getNewBookListByCat($catArray[sizeof($catArray)-1]['cid'],0,12));
	$categorybooklist[$cnt]=$pageItem;   
}
   
echo $template->render(array(
    'cats' => $catArray,
	"mytitle" => 'hello david',
	"newbooks" => SQL_getNewBookListByCat(-1,0,20),
	"hotbooks" => SQL_getHotBookListByCat(-1,0,20),
	"totalbook" => $totalBookCount,
	"config" => $config,
	"pageitems" => $categorybooklist
));
?>