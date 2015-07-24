<%@page import="org.apache.struts2.json.JSONUtil"%>
<%@ page language="java" import="java.util.*,com.lh.dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.struts2.*" %>
<% 
//获取ajax请求发送过来的省份id参数
String cid=request.getParameter("cityId");
if(cid!=null&&!cid.equals("")){  //一定要判断：如果不判断这行代码，会出现空指针异常
	int cityId=Integer.parseInt(cid);  //不是数字NumberFormationException
	List<HashMap<String,Object>> areas=ConnectionUtil.findAreas(cityId);
	//根据省份id查询对应的城市，通过out输出省份对应的城市
	//JSONUtil.serialize(citys)  将集合对象转换成json格式---list---JsonArr字符串[{},{}]
	//如果是单个对象，转换成----json字符串 { }
	out.print(JSONUtil.serialize(areas));
}else{
	//查询失败
	out.print("fail");
}

%>