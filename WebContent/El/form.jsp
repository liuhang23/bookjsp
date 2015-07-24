<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>  <!--html5标准头  -->
<html>
  <head>
    <title>My JSP 'form.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles.css">
	
  </head>
   
  <body>
	<fieldset>
		<legend>form表单常见问题</legend>
  		<form action="data.jsp" method="post">
  			<p>用户：<input name="username"  autofocus="autofocus"  type="text" placeholder="请输入用户名称"></p><br>
  			<p>密码：<input name="password" maxlength="9" type="password" placeholder="请输入用户密码"></p><br>
  			<p>年龄：<select name="age">
  						<option>12</option>
  						<option>16</option>
  						<option>37</option>
  						<option>69</option>
  					</select><br>
  			<p>性别：<label><input type="radio"  name="male"  value="1" >男</label>
  					<label><input type="radio" name="male"  value="0">女</label> 
  					  <br>  
  			<p>兴趣：<label><input type="checkbox"  name="hobbys" value="看书">看书</label>
  					<label><input type="checkbox"  name="hobbys" value="看电影">看电影</label> 
  					<label><input type="checkbox" name="hobbys" value="游泳">游泳</label>  <br>
  			<p>描述:<textarea  name="description" style="width:290px;height:100px;" ></textarea></p>
  			<p><input type="submit" value="保存"></p><br>	
  		</form>
  	</fieldset>
  	
  
  </body>
</html>
