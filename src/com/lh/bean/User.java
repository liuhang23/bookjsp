package com.lh.bean;

/**
 * 
 * 
 * User<BR>
 * 创建人:航大 <BR>
 * 时间：2015年4月22日-上午9:44:23 <BR>
 * @version 1.0.0
 *
 */
public class User {  //类是public 类的首字母为大写
	private String username;
	private String password;
	private String userName;
	private Boolean isFlag;
	private Integer age;
	
	public User(){
		System.out.println("无参构造方法进入了吗？");
	}
	
	//快捷键command+option+s
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Boolean getIsFlag() {
		return isFlag;
	}
	public void setIsFlag(Boolean isFlag) {
		this.isFlag = isFlag;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	
	public static void main(String[] args) {
		User user=new User();
		//赋值
		user.setAge(10);
		//取值
		user.getAge();
	}
	
	

}
