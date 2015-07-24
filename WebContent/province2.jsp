<%@ page language="java" import="java.util.*,com.lh.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
*{margin:0px;padding:0px;}
body{font-family:微软雅黑;font-size:15px;background:#fff;}
fieldset{margin:100px auto;width:500px;padding:50px;}
#province,#city,#area{padding:20px 0px 20px 20px;}
</style>
<title>省市区三级联动</title>
</head>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<body>

<%
   //将查询的值接收
   List<HashMap<String,Object>> maps= ConnectionUtil.findProvince();
   pageContext.setAttribute("province",maps); 
%>

<fieldset>
 	<legend>省市区三级联动</legend>
	<select id="province"   onchange="select_city(this)">
	   <option>----请选择-----</option>
	  <c:forEach var="pr" items="${province}">
			<option value="${pr.id}">${pr.name}</option>
	  </c:forEach>
	</select>

	<select id="city">
	  <option>----请选择-----</option>
	  <option value="1">长沙</option>
	  <option value="2">武汉</option>
	  <option value="3">岳阳</option>
	</select>
	
	<select id="area">
	  <option>----请选择-----</option>
	  <option value="1">荆州</option>
	  <option value="2">雨花</option>
	</select>
</fieldset>

<script type="text/javascript" >
  function select_city(obj){
	   //var province=obj.value;
	  var privinceId=$(obj).val();
	  $.ajax({
 		  type:"post",
 		  url:"pdao.jsp",
 		  data:{"privinceId":privinceId},
 		  beforeSend:function(){},
 		  success:function(data){
 				var jdata=data.trim();  
 	   		  	if(jdata=="fail"){
 	   		    	alert("查询失败");
 	   		   	}else{
 					var jsonData=eval(jdata);
 					$("#area").html("<option>---请选择----</option>");
 					append_template(jsonData,"city");
 	   		   	}
 	   		  }	  
 	  });
  };   
  
  
  //通用模板
	  function append_template(jsonData,target){
		var length=jsonData.length;
		var html="<option>---请选择----</option>";
		for(var i=0;i<length;i++){
			html+="<option value='"+jsonData[i].id+"'>"+jsonData[i].name+ "</option>";
		}
		$("#"+target).html(html);
   }
			

</script>


</body>
</html>