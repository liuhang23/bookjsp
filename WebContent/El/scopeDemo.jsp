<%@ page language="java"  import="java.util.*,com.lh.bean.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	//假如这个数据是从数据库中查询出来（数据类型返回的常用操作）
	//一.List<User> users=Conneciton.findUsers();
	List<User> users=new ArrayList<User>();
   for(int i=1;i<5;i++){
	   User user=new User();
	   user.setAge(12);
	   user.setUsername("航大"+i);
	   user.setPassword("123"+i);
	   users.add(user);
   }
   //根据实际情况合理选择作用域
   pageContext.setAttribute("users",users);
   for(User user:users){
	   System.out.println(user.getAge()+"==="+user.getUsername()+"==="+user.getPassword());
   }
   
   //二、使用map集合来存放获取的值
   Map<String,Object> map=new HashMap<String,Object>();
   map.put("age",12);
   map.put("username","邯郸");
   map.put("password","123");
   pageContext.setAttribute("map",map);
   
   //三.适用创建对象的形式
   User user2=new User();
   user2.setUsername("ke");
   user2.setPassword("123");
   pageContext.setAttribute("user2",user2);
%>
<!--输出值的方式，el表达式输出  -->
${map.age}===${map.username}====${map.password}  <br/>
${user2.username}====${user2.password}

<c:forEach var="user" items="${users}">
 	<p>${user.age}
 	${user.username}
 	${user.password}</p>
</c:forEach>
<!--key value 输出形式  -->
<c:forEach var="map" items="${map}">
	<p>${map.key}===${map.value} </p>
</c:forEach>

</body>
</html>