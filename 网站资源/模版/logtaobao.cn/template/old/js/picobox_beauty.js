(function(){
   var old_pb_initBox = Picobox._initBox;
   Picobox._initBox = function(title,html,param) {
	old_pb_initBox(title,html,param);
        var height = parseInt($('#picobox').css('height'));
        $('#picobox>table').css('height', height);
        $('#picobox').css('height', 'auto');
	$('#picobox td.content').css('height', height-16);
   };
   $(document).ready(function(){
	 Picobox.init();
	 $('#picobox').attr('id', 'picoboxInner');
	 $('body').append('<div id="picobox" style="display:none;"><table style="width:100%;height:100%" cellspacing="0" cellpadding="0"><tr><td class="rc_lt"></td><td class="top"></td><td class="rc_rt"></td></tr><tr><td class="left"></td><td class="content"></td><td class="right"></td></tr><tr><td class="rc_lb"></td><td class="bottom"></td><td class="rc_rb"></td></tr></table></div>');
	 $('#picobox td.content').append($('#picoboxInner'));
	 $('#picobox h1.picoboxTitle').wrapInner('<div></div>');
	 $('#picobox h1.picoboxTitle a').addClass('close');
	 //$(document).pngFix(); 
   });
})();
