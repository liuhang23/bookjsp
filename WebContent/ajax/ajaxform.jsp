<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>  <!--html5标准头  -->
<html>
  <head>
    <title>ajax表单js版本提交</title>
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
  					<label><input type="radio" name="male"  value="0">女</label> 
  					  <br>  
  			<p>兴趣：<label><input type="checkbox"  name="hobbys" value="看书">看书</label>
  					<label><input type="checkbox"  name="hobbys" value="看电影">看电影</label> 
  					<label><input type="checkbox"  name="hobbys" value="游泳">游泳</label>  <br>
  			<p>描述:<textarea  name="description"  id="description" style="width:290px;height:100px;" ></textarea></p>
  			<p><input type="button"  onclick="tm_savauser()" value="保存"></p><br>	
  		</form>
  	</fieldset>
  	

  	<script type="text/javascript">
  	   
  	   function $$(id){
  		   return document.getElementById(id);
  	   }
  	   //封装
  	   function checkvalue(name){
  		    var arr=[];
  		    var hobbys=$$("userform")[name];  /* 传递form表单name */
  		    var hobbys=$$("userform").hobbys;
		    for(var i=0;i<hobbys.length;i++){
		    	if(hobbys[i].checked){
		    		arr.push(hobbys[i].value);
		    	}
		    }
		    return arr.toString();
  	   }
  	   
  		//保存用户
  	  	function tm_savauser(){
  			//js方式获取值
  			var username=$$("username").value;
  			var password=$$("password").value;
  			var age=$$("age").value;
  		    var male=$$("userform").male.value; 
  		    var hobbys=checkvalue(hobbys);  //获取到爱好的值
  		   	var description=$$("description").value;
  			//alert(username+"====="+password+"=="+age+"===="+male+"===="+description);
  			var params={
  					"username":username,
  	  				"password":password,
  	  				"age":age,
  	  				"male":male,
  	  				"hobbys":hobbys,
  	  				"description":description
  	  				};
  			
  			$.ajax({
  	  			type:"post",
  	  			url:"ajaxdata.jsp",
  	  			data:params, /*往服务器发送的数据*/
  	  			beforSend:function(){},
  	  			success:function(data){
  	  				/* request:将客户端的信息传递给服务器  response:服务器将数据传递给客户端 */
  	  				alert(data.trim().length);
  	  			}
  	  		});
  		}
  		
  		//goole 火狐浏览器是正确
  		//ie 7 8错误
  		var obj={
  			name:"xx",
  			age:1,
  			password:""    /*结尾不能打, */
  		}
  	
     </script>
  
  </body>
</html>
