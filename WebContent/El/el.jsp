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
表达式：条件运算? : | empty，算术运算（+ - * /）逻辑判断 >(gt) ,<(lt) ,>=(gt),<=(le),==(eq),!=（ne）
只要值放在了application  ,session,request,pageContext作用域里面，那么都可以用el表达式获取通过作用域的key获取对应值
jsp里面el表达式他是一个对null或者空是一个不严格的判断
 -->

<p>&#36;{1+1}===${1+1}</p><br>
<p>&#36;{9*9}===${9*9}</p><br>
<p>&#36;{9/9}===${9/9}</p><br>
<p>&#36;{9%9}===${9%9}</p><br>

<hr>
逻辑判断
${1>2}=====${1 lt 2} <br>
<jsp:useBean id="user" class="com.lh.bean.User"></jsp:useBean>
${empty user?"对象为空":"对象不为空" } <br>

<%
   int a=100;
    int j=200;
    pageContext.setAttribute("a",a);
    pageContext.setAttribute("j",j);
%>
${a+j}
</body>
</html>