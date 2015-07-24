<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>javabean动作指令</title>
</head>
<body>

<!--创建一个User对象user  
User user=page.getAttribute("user"); 
  if(user==null){
  	user=new User();
  	page.setAttribute("user",user);
	}
scope:作用域	（page/request/application/session）
-->
<jsp:useBean id="user" class="com.lh.bean.User" scope="page"></jsp:useBean>

<!--赋值user.setUserName("liuhang");  -->
<jsp:setProperty property="username" name="user"  value="liuhang"/>
<!--取值user.getUserName("") 
page.getAttributr("user").getUserName();
-->
<jsp:getProperty property="username" name="user"/>





</body>
</html>