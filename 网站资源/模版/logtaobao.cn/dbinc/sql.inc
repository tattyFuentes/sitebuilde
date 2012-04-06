<?php

function SQL_getConn(){
  $db = new DB_MySQL;
  //$db->connect('C281957_webshuba','mysql509.ixwebhosting.com','C281957_hfhuga','Hfhuga941111');
  $db->connect('logtaobao','127.0.0.1','root','root');
  return $db;
}
function SQL_getAllCat() {
   $catArray=array();
   $db=SQL_getConn();
   $result=$db->query('select * from category order by orders'); 
   $i=0;
   while($db->next_record()) {
     $onecat=array();
     $onecat['name']=$db->f("name");
     $onecat['cid']=$db->f("cid");
     $onecat['bookcount']=$db->f("bookcount");
     $catArray[$i]=$onecat;
     $i=$i+1;
  }
  return $catArray;
} 

function SQL_getCatById($catid) {
   $onecat=array();  
   $db=SQL_getConn();
   $result=$db->query('select * from category where cid=' . $catid); 
   if($db->next_record()) {
     $onecat['cid']=$db->f("cid");
     $onecat['name']=$db->f("name");
     $onecat['bookcount']=$db->f("bookcount");
  }
  return $onecat;
}

function SQL_getBookById($bookid) {
   $onebook=array();  
   $db=SQL_getConn();
   $result=$db->query('select * from book where bid=' . $bookid); 
   if($db->next_record()) {
     $onebook['bid']=$bookid;
     $onebook['name']=$db->f("name");
     $onebook['last_modify_date']=substr($db->f("last_modify_date"),0,10);
     $onebook['description']=$db->f("description");
     $onebook['author']=$db->f("author");
     $onebook['downcount']=$db->f("downcount");
     $onebook['downurl']=$db->f("downurl");
     $onebook['category']=SQL_getCatById($db->f("categoryid"));
  }
  return $onebook;
}

//if $catid=-1 代表不通过分类查找,全局查找
function SQL_getNewBookListByCat($catid,$beginIndex,$pageSize) {
   $bookArray=array();
   $db=SQL_getConn();
   if ($catid==-1)
      $result=$db->query('select bid from book order by last_modify_date desc limit ' . $beginIndex . ',' . $pageSize); 
   else
      $result=$db->query('select bid from book where categoryid=' . $catid . ' order by last_modify_date desc limit ' . $beginIndex . ',' . $pageSize); 	
   $i=0;
   while($db->next_record()) {
     $bookArray[$i]=SQL_getBookById($db->f("bid"));
     $i=$i+1;
  }
  return $bookArray;
}

//if $catid=-1 代表不通过分类查找,全局查找
function SQL_getHotBookListByCat($catid,$beginIndex,$pageSize) {
   $bookArray=array();
   $db=SQL_getConn();
   if ($catid==-1)
      $result=$db->query('select bid from book order by downcount desc limit ' . $beginIndex . ',' . $pageSize); 
   else
      $result=$db->query('select bid from book where categoryid=' . $catid . ' order by downcount desc limit ' . $beginIndex . ',' . $pageSize);  
   $i=0;
   while($db->next_record()) {
     $bookArray[$i]=SQL_getBookById($db->f("bid"));
     $i=$i+1;
  }
  return $bookArray;
}

//if $catid=-1 代表不通过分类查找,全局查找
function SQL_searchBooks($searchStr,$beginIndex,$pageSize) {
   $bookArray=array();
   $db=SQL_getConn();
   $result=$db->query("select bid from book where name like '%" . $searchStr . "%' limit " . $beginIndex . ',' . $pageSize); 
   $i=0;
   while($db->next_record()) {
     $bookArray[$i]=SQL_getBookById($db->f("bid"));
     $i=$i+1;
  }
  return $bookArray;
}

//增加小说
function SQL_addBook($bid,$categoryid,$name,$author,$description,$language,$kindof,$privacy,$size,$commendclass,$faceimage,$downurl,$downcount) {   
   $db=SQL_getConn();
   $sql="insert into book values(" . $bid . "," . $categoryid . ",'" . $name . "','" . $author . "','" 
        . $description . "',now(),'" . $language . "','" . $kindof . "','" . $privacy . "','" 
	. $size . "','" . $commendclass . "','" . $faceimage . "','" . $downurl . "'," . $downcount . ")";
   //return $sql;
   $db->query($sql);
   $sql="update category set bookcount=bookcount+1 where cid=" . $categoryid;
   $db->query($sql);

   //$db->query("select bid from book where name like '%" . $searchStr . "%' limit " . $beginIndex . ',' . $pageSize);
   //$result=$db->query("select bid from book where name like '%" . $searchStr . "%' limit " . $beginIndex . ',' . $pageSize); 
   //while($db->next_record()) {
   //  $bookArray[$i]=SQL_getBookById($db->f("bid"));
  //}
}



?>