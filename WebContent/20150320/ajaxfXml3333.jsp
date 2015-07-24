<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax解析xml文件</title>
<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
</head>
<body>

<%
/* 
业务：解析xml文件
时间：2015年4月21
作者：航大
描述：利用ajax解析xml，获取xml数据
form提交（刷新），ajax(无刷新)提交都是发起http请求---- request/response
*/


%>
城市列表：
<select id="citySelect" onchange="selectCity(this)" style="pading:10px;">

</select>


<script type="text/javascript">
//$(); ==jquery的闭包   类似 window.onload=function(){}
$(function(){  		//页面元素加载完以后调用的回调方法
	$.ajax({
		type:"post",
		url:"city.xml",
		data:{"name":name},
		//dataType:"defeault",  //json,xml,txt,text可以省略
		//timeout:2000,    //与服务器交互的时间为2秒，如果与服务器请求时间超过了timeout设定的时间，请求自动断开
		error:function(){}, //与服务器交互失败了进入的回调方法
		beforeSend:function(){},  //页面加载之前的回调方式
		success:function(data){  //与服务器交互成功进入的回调方法
		//data=====out.print(Objec);====>页面返回来得数据
		//xml json--->解决一个数据传递和方便
		//alert(data);  object XMLDocument
	
			//javascript解析xml
		    var cityListArr=data.getElementsByTagName("CityList");
			for(var i=0;i<cityListArr.length;i++){
			var citysArr=cityListArr[i].getElementsByTagName("City");
				for(var j=0;j<citysArr.length;j++){
					var cityName=citysArr[j].getAttribute("Name");
					var description=citysArr[j].getElementsByTagName("Description")[0].childNodes[0].nodeValue;  
			//var description=citysArr[j].getElementsByTagName("Description")[0]
			//	.childNodes[1].nodeValue; 		
					//文本也是一个节点，所以需要使用childNodes
				//alert(cityName+"===="+description);
				}
			}
			//动态创建(效率较低)
			$("#citySelect").append("<option>---请选择---</option>");
			//jquery解析
			$(data).find("City").each(function(){    //$(data); 闭包成jquery对象
				var cityName=$(this).attr("Name");	
				var description=$(this).find("Description").text();
				//动态创建
				var $option=$("<option>");   //创建元素需要使用< >，这样创建出的才是节点元素
				$option.attr({"value":cityName,"description":description}).text(cityName);
				$("#citySelect").append($option);
			});
			
		}
	});
});




</script>

</body>
</html>