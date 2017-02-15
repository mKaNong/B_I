//判断是否登陆coe 0未登陆
function ajaxlogin(){
	
	$.get("/platform/isLoginout",null,function(data){
		if(data.code=="0"){
			window.location.reload();
		}
		
	});
}