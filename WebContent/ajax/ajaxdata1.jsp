<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8");
//与form表单中name属性值对应（服务器是获取name属性值）
//获取用户的文本值
String username=request.getParameter("username");
//获取密码  
String password=request.getParameter("password");
//年龄 select name="age"
String age=request.getParameter("age");
//性别 radio
String male=request.getParameter("male");
//兴趣 chekbox
String[] hobbys=request.getParameterValues("hobbys");
StringBuffer buf=new StringBuffer();
for(String h:hobbys){
	  buf.append(h+"  ");
 }
//描述  
String description=request.getParameter("description");
//输出
StringBuffer buffer=new StringBuffer();
buffer.append("用户姓名："+username+"<br>");
buffer.append("用户密码："+password+"<br>");
buffer.append("用户性别："+age+"<br>");
buffer.append("用户兴趣："+male+"<br>");
buffer.append("用户爱好："+buf+"<br>");
buffer.append("用户描述："+description+"<br>");
out.print(buffer.toString());
%>
