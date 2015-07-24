<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax解析json文件</title>
<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
</head>
<body>
<body>
	<%
		/* 
		 业务：解析html文件
		 时间：2015年4月21
		 作者：航大
		 描述：利用ajax解析html，获取html数据
		 form提交（刷新），ajax(无刷新)提交都是发起http请求---- request/response
		 */
	%>
	城市列表：<select id="citySelect" onchange="selectCity(this)" style="pading:10px;"></select>
	城市信息：<textarea id="message" style="width: 600px; height: 100px;"></textarea>
    <div id="messagebox"></div>
	<script type="text/javascript">
	$(function(){	 //页面加载完毕以后调用的回调方法
		$("#messagebox").load("city.html",function(data){
			$(this).html($(data).find("#content2").htm());
		});
		
		$.ajax({
			type:"post",   
			url:"city.html",
			success:function(data){
			 // alert(typeof data); 字符串	
			  var jsonArr=eval(data);  //将字符串转换成json对象
			  length=jsonArr.length;
			  html="<option>--请选择--</option>";
			  $(data).find(".city").each(function(){
				  var cityName=$(this).attr("name"); //返回被选中元素值
				  var description=$(this).find(".description").text(); //返回所选元素文本内容
				  html+="<option description='"+description+"' value='"+cityName+"'>"+cityName+"</option>";
			  });
			  $("#citySelect").html(html);
			}
		});
	});
	
	function selectCity(obj){
		var description=$(obj).find("option:selected").attr("description");
		$("#message").val(description);
	}
	
	</script>

</body>
</html>