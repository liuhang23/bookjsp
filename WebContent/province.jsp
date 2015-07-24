<%@ page language="java" import="java.util.*,com.lh.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>省市区三级联动</title>
<style type="text/css">
  *{margin:0px;padding:0px;}
  body{font-family:微软雅黑;font-size:13px;background:#f9f9f9;}
  fieldset{padding:100px;width:560px;margin:0 auto;}
  #provice,#city,#area{padding:8px;}
</style>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
</head>
<body>
  
  <c:forEach var="i" begin="1" end="9">
	<c:forEach  var="j" begin="1"  end="${i}">
		${j}*${i}=${i*j}  &nbsp;&nbsp;
	</c:forEach>
	 <br>
  </c:forEach>  <br/> <br/>

<!--业务：省市区三级联动
	描述：利用ajax和数据库查询实现省市区三级联动，jsp，taglib,数据库技术，jquery ajax  
   
   1.编写页面   
   2.定义数据库连接，查询省市区   
   3.将查询的数据返回到对应的select
   4.难点：需要给数据库分类	
   
   tm_provice 省份表 
      id:1     name:湖南 
      id:2     name:湖北  
   tm_city  城市表    查询所有湖南的城市  select *from where province_id=1;
  	 ================================
  	 id:1  name:长沙   province_id:1
  	 id:2  name:株洲   province_id:1
  	 id:3  name:衡阳   province_id:1
     id:5  name:武汉	  province_id:2
     id:6  name:荆州	  province_id:2
     id:7  name:宜昌	  province_id:2
   tm_area  区域表     查询所有城市的县级地区 select *from where city_id=1
     ================================
     id:1  name:长沙   city_id:1
  	 id:2  name:株洲   city_id:1
  	 id:3  name:衡阳   city_id:1
     id:5  name:武汉	  city_id:2
     id:6  name:荆州	  city_id:2
     id:7  name:宜昌	  city_id:2
 -->
 <%
  //业务查询
  List<HashMap<String,Object>> maps=ConnectionUtil.findProvince();
  pageContext.setAttribute("provinces",maps);
 %>
 
 
<fieldset>
	<legend>省市区三级联动</legend>
	省份：
	<select id="provice"  onchange="select_city(this)">
		<option value="" >----请选择---</option>
		<c:forEach var="pv" items="${provinces}">
			<option value="${pv.id }">${pv.name}</option>
		</c:forEach>
	</select> &nbsp;&nbsp; 
	城市：
	<select id="city" onchange="select_area(this)">
		
	</select> &nbsp;&nbsp;
	区域：
	<select id="area">

	</select>
</fieldset>
	
  <script type="text/javascript">
   //通过省份id查询所有的城市信息
    function select_city(obj){
      //var provice=obj.value;
      var privinceId=$(obj).val();
      //var text=$(obj).find("option:selected").text();
   	  //alert("您当前选择的省份"+text+" 对应的id是:"+privinceId);
   	  //发送一个ajax根据privaceId查询对应的城市，select *from tm_city where procice_id=1;
   	  $.ajax({
   		  type:"post",
   		  url:"pdao.jsp",  //请求对应的地址
   		  data:{"privinceId":privinceId},  /*数据不能请求需要check请求地址,往服务器传递的参数，相当于<input name="privinceId" value=1>*/
   		  success:function(data){    //服务器交互成功调用的回调函数，data就是服务器端传递回来的数据
   			 // alert("您当前选择的省份"+data.text+" 对应的id是:"+data);
   		  	var jdata=data.trim();  
   		  	if(jdata=="fail"){
   		    	alert("查询失败");
   		   	}else{
   		   		//alert(typeof jdata);  //Srting
   		   		//格式[{"id":"1","name":"长勺"},{"id":"1","name":"郴州"}]
   		   	/*	var jsonData=eval(jdata);  //将字符串的json对象转换成json
   		   		//每次选择之前清空城市
   		   		$("#city").html("<option>---请选择----</option>");
   		  	 	$("#area").html("<option>---请选择----</option>");
   		   		$("#area").empty();
				for(var i=0;i<jsonData.length;i++){
					//alert(jsonData[i].id+"===="+jsonData[i].city);
					$("#city").append("<option value='"+jsonData[i].id+"'>"+jsonData[i].city+ "</option>");
				}  */
				//优化方式
				var jsonData=eval(jdata);
				var length=jsonData.length;
				var html="<option>---请选择----</option>";
				$("#area").html("<option>---请选择----</option>");
				for(var i=0;i<length;i++){
					html+="<option value='"+jsonData[i].id+"'>"+jsonData[i].city+ "</option>";
				}
				$("#city").html(html);
   		   	}
   		  }	  
   	  });
   	  
   } 
   
   function select_area(obj){
	   var cityId=$(obj).val();
	   //发送一个ajax根据cityId查询对应的城市，将查询的区域信息添加到id=area的select框中
	   $.ajax({
	   		  type:"post",
	   		  url:"cdao.jsp",  //请求对应的地址
	   		  data:{"cityId":cityId},  /*数据不能请求需要check请求地址,往服务器传递的参数，相当于<input name="privinceId" value=1>*/
	   		  success:function(data){    //服务器交互成功调用的回调函数，data就是服务器端传递回来的数据
	   			 // alert("您当前选择的省份"+data.text+" 对应的id是:"+data);
	   		  	var jdata=data.trim();  
	   		  	if(jdata=="fail"){
	   		    	alert("查询失败");
	   		   	}else{
	   		   		//alert(typeof jdata);  //Srting
	   		   		//格式[{"id":"1","name":"长勺"},{"id":"1","name":"郴州"}]
	   		  /*	var jsonData=eval(jdata);  //将字符串的json对象转换成json
	   		   		//每次选择之前清空城市
	   		   		$("#area").html("<option>---请选择----</option>");
					for(var i=0;i<jsonData.length;i++){    //jsonData.length，会拿多次
						//alert(jsonData[i].id+"===="+jsonData[i].city);
						$("#area").append("<option value='"+jsonData[i].id+"'>"+jsonData[i].area+ "</option>");
					}  */
					var jsonData=eval(jdata); 
					var length=jsonData.length; //只拿一次
					var html="<option>---请选择----</option>";
					for(var i=0;i<length;i++){
						html+="<option value='"+jsonData[i].id+"'>"+jsonData[i].area+ "</option>";
					}
					$("#area").html(html);
	   		   	}
	   		  }	  
	   	  }); 
   }
   
   
  </script>
</body>
</html>