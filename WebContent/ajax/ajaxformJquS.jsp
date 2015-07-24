<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>  <!--html5标准头  -->
<html>
  <head>
    <title>ajax表单jquery版本serialize()提交</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">	
     	<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
  </head>
  <body>
	<fieldset>
		<legend>form表单常见问题</legend>
  		<form id="userform">
  			<p>用户：<input name="username"  id="username"  autofocus="autofocus"  type="text" placeholder="请输入用户名称"></p><br>
  			<p>密码：<input name="password"  id="password"  maxlength="9" type="password" placeholder="请输入用户密码"></p><br>
  			<p>年龄：<select name="age"  id="age">
  						<option>12</option>
  						<option>16</option>
  						<option>37</option>
  						<option>69</option>
  					</select><br>
  			<p>性别：<label><input type="radio"  name="male"  value="1" >男</label>
  					<label><input type="radio"  name="male"  value="0">女</label> 
  					  <br>  
  			<p>兴趣：<label><input type="checkbox"  name="hobbys" value="看书">看书</label>
  					<label><input type="checkbox"  name="hobbys" value="看电影">看电影</label> 
  					<label><input type="checkbox"  name="hobbys" value="游泳">游泳</label>  <br>
  			<p>描述:<textarea  name="description"  id="description" style="width:290px;height:100px;" ></textarea></p>
  			<p><input type="button"  onclick="tm_savauser()" value="保存"></p><br>	
  		</form>
  	</fieldset>
  	

  	<script type="text/javascript">
  	function tm_savauser(){
  		//serialize()==元素必须要有name
  	   var params=$("#userform").serializeArray();  //节省代码量
  	   params.push({name:"email",value:"liuhang@163.com"});
  	   for(var i=0;i<params.length;i++){
  	  	 alert(params[i].name+"===="+params[i].value);	   
  	   }
  		
  		$.ajax({
  			type:"post",
  			data:params,
  			url:"ajaxdata1.jsp",
  			success:function(data){
  				alert(data);
  			}
  		});

  	}
    </script>
  
  </body>
</html>
