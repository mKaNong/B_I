<%@ page language="java" contentType="text/html; utf-8"   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>参数设置</title>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/css/main.min.css">
</head>
<body>
<jsp:include page="${pageContext.servletContext.contextPath}/platform/index/menu?id=params_p"  ></jsp:include>
<div class="wrapper">
    <div class="main">
        <div class="operate-data setting">
            <div class="operate-list">
                <div class="sys-title title-deg"><span>店铺层级设置</span></div>
                <div class="setting-list">
                    <div class="setting-item">
                        <div class="floor">第一层级：</div>
                        <input type="text" class="text" value="0" disabled>
                        <span>到</span>
                        <input class="text" type="text">
                        <input  type="hidden">
                        <!-- <input class="btn del" type="button" value="删除">
                        <input class="btn change" type="button" value="修改"> -->
                    </div>
                    <div class="setting-item">
                        <div class="floor">第二层级：</div>
                        <input type="text" class="text">
                        <span>到</span>
                        <input class="text" type="text"> <input  type="hidden">
                    </div>
                    <div class="setting-item">
                        <div class="floor">第三层级：</div>
                        <input type="text"   class="text">
                        <span>到</span>
                        <input class="text" type="text"> <input  type="hidden">
                    </div>
                    <div class="setting-item">
                        <div class="floor">第四层级：</div>
                        <input type="text" class="text">
                        <span>到</span>
                        <input class="text" type="text"> <input  type="hidden">
                    </div>
                    <div class="setting-item">
                        <div class="floor">第五层级：</div>
                        <input type="text" class="text">
                         <input  type="hidden" value="0">
                          <input  type="hidden">
                        <span>以上</span>
                    </div>
                </div>
                <div class="setting-btns">
                    <span></span>
                    <input type="button" value="确定" class="setting-floor-submit">
                </div>
            </div>
            <div class="operate-list">
                <div class="sys-title title-deg"><span>新会员设置</span></div>
                <div class="setting-date">
                    <a class="date-scope" href="javascript:;" title="7">7天之内</a>
                    <a class="date-scope" href="javascript:;" title="10">10天之内</a>
                    <a class="date-scope" href="javascript:;" title="15">15天之内</a>
                    <a class="date-scope" href="javascript:;" title="30">30天之内</a>
                    <input type="button" value="确定" class="date-btn">
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.servletContext.contextPath}/static/js/plugins/jquery.js"></script>

<script type="text/javascript">
   //会员设置
   
   var day_num='<c:choose><c:when test="${memlist!=null}">${memlist.day_num}</c:when><c:otherwise>7</c:otherwise></c:choose>';
   var uuid='${memlist.uuid}';
   var shopvalue=${shoplist};
   $(function(){
	   if(shopvalue.length>0){
		   $(".setting-item") .each(function(){
			    for(var i=0;i<shopvalue.length;i++){
			    	shopValueObj = shopvalue[i];
			    	if(shopValueObj.name==$(this).find("div").text()){
			    		$(this).find("input").eq(0).val(shopValueObj.start);
			    		$(this).find("input").eq(1).val(shopValueObj.end);
			    		$(this).find("input").eq(2).val(shopValueObj.uuid);
			    	}
			    }
			    
			  });
		   
	   }
	   
	   
	      $(".date-scope") .each(function(){
		    if(day_num!="7"&&$(this).attr("title")=="${memlist.day_num}"){
		    	$(this).addClass("active");
		    	 
		    }
		  });
	   
	      if(day_num=="7"){
	    	  $(".date-scope").eq(0).addClass("active");
	      }
	      
	   $(".date-scope").on("click",function(e){
		   day_num= $(this).attr("title") ;
	   });
	  
	   $(".date-btn").on("click",function(e){
		   ajaxlogin();
		    if(window.confirm("是否保存")){
		    	 $(".date-btn") .attr("disabled",true);
		    	var params;
		    	if(uuid!=""){
		    		  params={dayNum:day_num,uuid:uuid};
		    	}else{
		    		  params={dayNum:day_num };
		    	}
		    	
		    	$.post("${pageContext.servletContext.contextPath}/platform/shopHierarchy/saveNewMember",params,function(date){
		    		if(date!=undefined){
		    			uuid=date.msg;
		    			 alert("设置成功");
		    			 
		    		}
		    		 $(".date-btn") .attr("disabled",false);
		    	},"json");
		    }
		   
		   
	   });
	   
	   
	   
		   /********店铺层级name  start end*/
		   var listv=[];
		   $(".setting-floor-submit").on("click",function(e){
			   ajaxlogin();
			   if(  $(".setting-btns").find("span").text()==""){
			    if(window.confirm("是否保存")){
			    	 $(".setting-floor-submit") .attr("disabled",true);
			    	  $(".setting-item") .each(function(){
						   var params;
						   var end =$(this).find("input").eq(1).val();
						   var uuid = $(this).find("input").eq(2).val();
						   if(end!=undefined){
							   params= {uuid:uuid,name:$(this).find("div").text(),start:$(this).find("input").eq(0).val(),end:end};
						   }else{
							   params= {uuid:uuid,name:$(this).find("div").text(),start:$(this).find("input").eq(0).val(),end:0};
						   }
						   listv.push(params);
						  });
			    	   $.post("${pageContext.servletContext.contextPath}/platform/shopHierarchy/saveshop",{listVo:JSON.stringify(listv)},function(date){
					    	  
					    	  if(date.code=="1"){
					    		  alert("设置成功");
					    		  listv=[];
					    	  }
					    	  $(".setting-floor-submit") .attr("disabled",false);
					      },"json");
			    }
			   }
			 
		          
			    
	      });

   });
</script>
<script src="${pageContext.servletContext.contextPath}/static/js/setting.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/ajaxlogin.js"></script>
</body>
</html>