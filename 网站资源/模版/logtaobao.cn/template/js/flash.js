<script language="javascript">
				//<![CDATA[
				var $=function(objName)
				{
					if(document.getElementById)
					{
						return eval('document.getElementById("'+objName+'")')
					}
					else
					{
						return eval('document.all.'+objName)
					}
				}
				function picData(pTitle,pImgSrc,pUrl)
				{
					this.title=pTitle;
					this.imgSrc=pImgSrc;
					this.url=pUrl;
					this.showTitle=picData_doTitle;
				}
				function picData_doTitle()				
				{
					var titleHtml="";
					titleHtml="<a href='"+this.url+"' target='_blank' class='f14white'>"+this.title+"</a>";
					return titleHtml;
				}
				var picArr=new Array();
				{dede:arclist flag='f' row='5'}
				picArr[[field:global.autoindex/]-1]=new picData();
                                picArr[[field:global.autoindex/]-1].url = "[field:arcurl/]";
				picArr[[field:global.autoindex/]-1].imgSrc  = "[field:litpic/]";
				picArr[[field:global.autoindex/]-1].title = "[field:title function='html2text(@me)'/]";
				{/dede:arclist}
                                picArr[1-1]=new picData();
				picArr[1-1].title="简单四招省钱搞定肌肤美白";
				picArr[1-1].imgSrc="/uploads/allimg/090610/1534011K9-0_lit.jpg";
				picArr[1-1].url="/meirong/hufu/meibai/2009/0610/1840.html";

				picArr[2-1]=new picData();
				picArr[2-1].title="春季飘香盘点最美的十款香水";
				picArr[2-1].imgSrc="/uploads/allimg/c090505/124150913934430-146394.jpg";
				picArr[2-1].url="/meirong/meiti/xiangti/2009/0505/670.html";

				picArr[3-1]=new picData();
				picArr[3-1].title="让发色时刻Fresh的绝技";
				picArr[3-1].imgSrc="/uploads/allimg/c090505/12415134B25H0-1551A.jpg";
				picArr[3-1].url="/meirong/meifa/ranfa/2009/0505/1069.html";

				picArr[4-1]=new picData();
				picArr[4-1].title="09年男装：“腿要短 肩要宽”";
				picArr[4-1].imgSrc="/uploads/allimg/c090505/1241520001R5F-131355.jpg";
				picArr[4-1].url="/fushi/fushichaoliu/2009/0505/1365.html";

				//初始化开始
				var numHtml="";
				var numBgHtml="";
				var picDiv="";
				var curPicId=0;
				var focusImgTime=5000;//切换时间间隔：单位毫秒
				for(i=picArr.length;i>0;i--)
				{					
					if (i==1)
					{
						numBgHtml+="<label id='picBtn"+(i-1)+"' class='current'></label>";
						numHtml+="<div class='numDiv'><label id='picNumBtn"+(i-1)+"' onclick='javascript:clickPic("+(i-1)+")'  class='current'>"+i+"</label></div>";
					}
					else {
						numBgHtml+="<label id='picBtn"+(i-1)+"'></label>";
						numHtml+="<div class='numDiv'><label id='picNumBtn"+(i-1)+"' onclick='javascript:clickPic("+(i-1)+")'>"+i+"</label></div>";
					}						
					if(i==1)
					{
						picDiv+='<div id="focusImgDiv'+(i-1)+'" class="focusImgArea" style="z-index:'+((picArr.length+1)*10)+'"><a href="'+picArr[(i-1)].url+'" target="_blank"><img class="picImg" src="'+picArr[(i-1)].imgSrc+'" width="318" height="390" alt="" /></a></div>';
					}
					else
					{
						picDiv+='<div id="focusImgDiv'+(i-1)+'" class="focusImgArea" style="z-index:'+(i*10)+';opacity:0;filter:alpha(opacity=0);"><a href="'+picArr[(i-1)].url+'" target="_blank"><img class="picImg" src="'+picArr[(i-1)].imgSrc+'" width="318" height="390" alt="" /></a></div>';
					}	
				}
				$('numLink').innerHTML=numHtml;
				$('numBg').innerHTML=numBgHtml;
				$('focusImg').innerHTML=picDiv;
				$("titleArea").innerHTML=picArr[0].showTitle();				
				var myPicTime;
				var animateOpacityTime;
				myPicTime=setInterval(autoPicPlay,focusImgTime);
 
				//初始化完成
				function doPic(picId)
				{
					curPicId=picId;
					for(z=0;z<picArr.length;z++)
					{						
						if(eval($("focusImgDiv"+z).style.zIndex)==(picArr.length+1)*10)//如果当前为最顶层图片，降到第二层
						{
							$("focusImgDiv"+z).style.zIndex=(picArr.length+1)*10-5;
							setOpacity(100,$("focusImgDiv"+z));
						}
						else {$("focusImgDiv"+z).style.zIndex=(z+1)*10;}
					}
					$("focusImgDiv"+picId).style.zIndex=(picArr.length+1)*10;
					setOpacity(0,$("focusImgDiv"+picId));
					myOpacity=0;
				    clearInterval(animateOpacityTime);
					animateOpacityTime=setInterval(function(){animateOpacity($("focusImgDiv"+picId))},10);
 
					for(i=0;i<picArr.length;i++)
					{
						$("picBtn"+i).className=$("picBtn"+i).className.replace('current','');
						$("picNumBtn"+i).className=$("picNumBtn"+i).className.replace('current','');
					}
					$("picBtn"+picId).className+=" current";
					$("picNumBtn"+picId).className+=" current";
					$("picBtn"+picId).blur();
					$("titleArea").innerHTML=picArr[picId].showTitle();
 
				}
 
				function setOpacity(opacity, theId) {
					var object = theId.style;
					if (navigator.userAgent.indexOf("Firefox") != -1) {
						if (opacity == 100) { opacity = 99.9999; }
					}
					object.filter = "alpha(opacity=" + opacity + ")"; // IE/Win
					object.opacity = (opacity / 100);                 // Safari 1.2, Firefox+Mozilla
				}
				var myOpacity=0;
				function animateOpacity(obj)
				{
					myOpacity+=20;
					setOpacity(myOpacity,obj);
					if(myOpacity>=95)
					{
						setOpacity(100,obj);
						clearInterval(animateOpacityTime);
					}
 
				}
				function clickPic(cId)
				{
				   clearInterval(myPicTime);
				   doPic(cId);
				   myPicTime=setInterval(autoPicPlay,focusImgTime);
				}
				function autoPicPlay()
				{
					curPicId++;										
					if(curPicId>=picArr.length)
					{
						curPicId=0;
					}
					doPic(curPicId);
				}
				//]]>
				</script>