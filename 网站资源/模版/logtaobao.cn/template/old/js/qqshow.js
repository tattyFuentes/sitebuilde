document.write("<div id='wanyxShowAD' style='position:absolute; z-index: 100; onclick='CloseIVR();'>");
document.write('<img src="/adfile/UploadPic/2009-4/200942114363552648.gif" width="240" height="160" border="0" usemap="#ivrinMap">');
document.write('<map name="ivrinMap"><area shape="rect" coords="130,0,200,0" href="#" target="_self"><area shape="rect" coords="0,1,256,183" href="http://www.yxbao.com/?2009" target="_blank"></map>');
document.write("</div>");

var _wanyx_bodyfrm = ( document.compatMode.toLowerCase()=="css1compat" ) ? document.documentElement : document.body;
var _wanyx_adst = document.getElementById("wanyxShowAD").style;
function CloseIVR(){
 _wanyx_adst.display='none';
}
function _wanyx_moveR() {
_wanyx_adst.top = ( _wanyx_bodyfrm.scrollTop + _wanyx_bodyfrm.clientHeight - 160 ) + "px";
_wanyx_adst.left = ( _wanyx_bodyfrm.scrollLeft + _wanyx_bodyfrm.clientWidth - 240 ) + "px";
}
setInterval( '_wanyx_moveR()' , 100 );