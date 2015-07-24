<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/hd.tld" prefix="hd"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{padding:0px;margin:0px;}
	body{font-family:"微软雅黑";font-size:18px;}
	fieldset{padding:30px;margin:0 auto;width:640px;}
	#box p{margin-left:25px;color:red;font-weight:700;}
</style>
</head>
<body>
<fieldset>

		<div>自定义标签=----函数自定义标签</div>
		<div id="box" style="border-bottom:1px solid #ccc;">
			 知识点和步骤：
			  <p>1.定义一个普通的类：TmFunctions</p>
			  <p>2.在类中定义一个静态方法即可</p>
			  <p>
			  	3.注册在tld文件<br>
			     &nbsp;
			     tld:jsp一个配置自定义标签和函数标签的一个xml文件，自定义标签tld文件一定要存放在web-inf，或则（META-INF）   
			  </p>
			  <p>4.在页面中通过taglib引入tld文件</p>
			  <p>5.通过el表达式处理业务</p>
		</div>
		
		<div>1:大小写转换</div>
			&nbsp;&nbsp;&nbsp;aaabbbccc----${hd:toUpper("aaabbbccc")} 
		<div>2:日期格式化</div>
		&nbsp;&nbsp;获取年份：${hd:dateFormat('2012-12-12','yyyy') }===2012<br/>
		&nbsp;&nbsp;获取日期：${hd:dateFormat('2012-12-12','MM') }===12
		<div>3:性别判断</div>
		
		<div>4:空判断 isEmpty</div>
		&nbsp;&nbsp;空判断：${hd:isEmpty("")}
		<div>5:数字转中文</div>101------一百零一<br>
		${hd:intToChnNumConverter(101) }
		<div>6:时间转字符串</div>
		&nbsp;&nbsp;${hd:dateToString("2015-4-26 15:21:23") }	
		<div>7:将数字转换成对应的字母1==A</div>
		&nbsp;&nbsp;${hd:getCharacter(1) };${hd:getCharacter(2) };${hd:getCharacter(3)}
		<div>8:将每周数字转换为对应中文1==一</div>
		&nbsp;&nbsp;${hd:getWeekChinesee(1)}
		
</fieldset>

<%
  String str="1111";
  pageContext.setAttribute("str",str);
%>
${hd:isEmpty(str)?"我是一个空值":"我有值"}===等价${empty str?"我是一个空值":"我有值" }<br>
${hd:isNotEmpty(str)?"我有值":"我是一个空值" }===等价于${!empty str?"我有值":"我是一个空值" }
  <script type="text/javascript">
  </script>
</body>
</html>