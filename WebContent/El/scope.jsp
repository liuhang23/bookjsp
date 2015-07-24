<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--
	九大隐式对象作用域    El表达式
	application 	   applicationScope
	session 		   sessionScope
	request		       requestScope
	pageContext        pageScope
  -->
<%
  String username="航大今天很帅";
  //应用上下文
  application.setAttribute("username","application:"+username);
  //会话
  session.setAttribute("username","session"+username);
  //请求
  request.setAttribute("username","reqeust"+username);
  //页面上下文
  pageContext.setAttribute("username","pageContext"+username);
%>
${username}






</body>
</html>