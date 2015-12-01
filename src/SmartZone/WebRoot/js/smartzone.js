var bindDelete = function(){
	$(".delete").click(function(){
		var b = confirm("确定要删除吗?");
		if(!b) return false;
		else return true;
	})
}
var bindCancel = function(){
	$(".cancel").click(function(){
		var b = confirm("确定要取消吗?");
		if(!b) return false;
		else return true;
	})
}
var bindFormClose = function(){
	$(".close").click(function(){
		$(this).parent().hide(100);
	})
}
var bindConfirm = function(){
	$(".confirm").click(function(){
		var b = confirm("确定要执行这个操作吗?");
		if(!b) return false;
		else return true;
	})
}
function formvalidate(form,msg){
	if(msg == undefined){
		msg = '请输入需要输入的内容';
	}
	form.getElementsByTagName("input");
	for( var i = 0 ; i < form.length ; ++i ){
		if(form[i].value == null || form[i].value.trim() == "" ){
			alert(msg);
			$(form[i]).focus();
			return false;
		}
	}
	return true;
}
var validateNecessary = function(form, msg){
	if( msg == null || msg == undefined || msg.length < 1){
		msg = "请把必须要填写的内容填上";
	} 

	var neces = $(form).find("input.necessary");
	var flag = 0;
	$.each(neces,function(){
		var val = $(this).val();
		if(flag < 1 && (val == undefined || val == "") ){
			alert(msg);
			$(this).focus();
			flag = 1;
		}
	});
	if(flag){
		return false;
	}else{
		return true;
	}
}