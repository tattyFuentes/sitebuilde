var Picomask = {
  'init':function() {
    if (!Picomask.inited) {
		var html='<div id="picoboxMask"></div>';
		$('body').append(html);
		$('#picoboxMask').css({
		 "height":window.screen.height+"px",
		 "width":window.screen.width+"px"
		});
	}
    Picomask.inited=1;
  },
  '_initMask':function(param){
    Picomask.init();
    param = param || {};
    param.opacity = param.opacity || 0;
    param.color = param.color || '#fff';
	param.click = param.click || function(){Picomask.hide()};
	$('#picoboxMask').unbind('click', Picomask.click);
	Picomask.click = param.click;
	$('#picoboxMask').click(Picomask.click);
    $('#picoboxMask').css({
        'backgroundColor':param.color,
        'filter':'alpha(opacity='+(param.opacity*100)+');)',
        'opacity':param.opacity,
        'top':"0",
        "height":window.screen.height+$(window).scrollTop()+"px"
    });
  },
  '_show':function() {
    $('#picoboxMask').css('display','block');//show();
    //document.documentElement.style.overflow="hidden";
    if ($.browser.msie && $.browser.version < 7) {
      $('select').css('visibility','hidden');
      $('#picobox select').css('visibility','visible');
    }
  },
  'show':function(param) {
    Picomask._initMask(param);
    Picomask._show();
  },
  'hide':function(){
    $('#picoboxMask').css('display', 'none'); //hide();
    //document.documentElement.style.overflow="";
    if ($.browser.msie && $.browser.version < 7) {
      $('select').css('visibility','visible');
    }
  }
};
var Picobox = {
  'init':function() {
    if (Picobox.inited) {return;}
	Picomask.init(this.hide);
    var html='<div id="picobox"><h1 class="picoboxTitle"><span></span><a href="#" onclick="Picobox.hide();return false;">X</a></h1><div class="picoboxBody"></div></div>';
    $('body').append(html);
    Picobox.inited=1;
  },
  '_initBox':function(title,html,param){
	Picobox.init();
    param = param || {};
    param.width = param.width || 400;
    param.height = param.height || 300;
    $('#picobox h1.picoboxTitle span').text(title);
    $('#picobox div.picoboxBody').html(html);
    $('#picobox').css({
        'width':param.width+'px',
        'height':param.height+'px',
	'top':$(window).height()/2+$(window).scrollTop(),
        'marginLeft':(-param.width/2)+'px',
        'marginTop':(-param.height/2)+'px'
    });
  },
  '_show':function(param) {
    param = param || {};
	maskParam = {
	click:Picobox.hide,
	opacity:param.maskOpacity || 0.3,
    color:param.maskColor || '#000'
	};
    Picomask.show(maskParam);
    $('#picobox').css('display', 'block'); //show();
    //document.documentElement.style.overflow="hidden";
  },
  'show':function(title,html,param) {
	param = param || {};
    Picobox._initBox(title,html,param);
    Picobox._show(param);
  },
  'showTextBox':function(title,text,param) {
    Picobox._initBox(title,'',param);
    $('#picobox div.picoboxBody').text(text);
    Picobox._show(param);
  },
  'showIFrameBox':function(title,url,param) {
    var html = "<iframe class='picoboxIFrame' frameborder='0' src='"+url+"'></iframe>";
    Picobox._initBox(title,html,param);
    Picobox._show(param);
    var height = param.height-$('#picobox h1.picoboxTitle').height()
        -parseInt($('#picobox').css('paddingTop'))
        -parseInt($('#picobox').css('paddingBottom'));
    $('#picobox iframe.picoboxIFrame').css({
        'width':'100%',
        'height':height+'px',
        'border':'none',
        'overflow':'auto'
    });
  },
  'showDOMBox':function(title,selector,param) {
    var html = $(selector).html();
    Picobox.show(title,html,param);
  },
  'showAjaxBox':function(title,url,param,callback) {
    callback = callback || function(){};
    if(jQuery.isFunction(param)){
        callback=param;
        param=null;
    }
    $.get(url,{no_cache:Math.random()},function(data){
      Picobox.show(title,data,param);
      callback.call(data);
    });
  },
  'hide':function(){
    $('#picobox').css('display', 'none'); //hide();
    $('#picoboxMask').css('display', 'none'); //hide();
    //document.documentElement.style.overflow="";
    if ($.browser.msie && $.browser.version < 7) {
      $('select').css('visibility','visible');
    }
  }
};
