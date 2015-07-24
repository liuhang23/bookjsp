package com.lh.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * 
 * 数据库连接 ConnectionUtil<BR>
 * 创建人:航大 <BR>
 * 时间：2015年4月18日-下午4:36:05 <BR>
 * 
 * @version 1.0.0
 *
 */

public class ConnectionUtil {
	private static String url = "jdbc:mysql://127.0.0.1/Country";
	private static String username = "root";
	private static String password = "3785810";

	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,username,password);
			System.out.println("连接成功");
			return connection;
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 *查询省  
	 *findxxx  查询多条（返回集合）   getxxx()查询单条
	 * 方法名：findProvince<BR>
	 * 创建人：航大 <BR>
	 * 时间：2015年4月18日-下午5:10:38 <BR>
	 * @return List<HashMap<String,Object>><BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	
	public static  List<HashMap<String,Object>> findProvince(){
		//定义一个连接
		Connection connection=null;
		//定义处理块
		PreparedStatement  statement=null;
		//结果集
		ResultSet rs=null;
		List<HashMap<String,Object>> maps=null;
		try{
			String sql="select *from tm_province order by sort asc";
			connection=getConnection();
			statement=connection.prepareStatement(sql);
			rs=statement.executeQuery();
			//初始化装载省份数据的集合
			maps=new ArrayList<HashMap<String,Object>>();
			HashMap<String,Object> map=null;
			while(rs.next()){
				map=new HashMap<String,Object>();
				map.put("id", rs.getInt("id"));
				map.put("name",rs.getString("province"));
				maps.add(map);
			}
			return maps;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
			if(rs!=null)rs.close();
			if(statement!=null)statement.close();
			if(connection!=null)connection.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	
	/**
	 *根据省份id查询省份对应的城市 
	 * 方法名：findCitys<BR>
	 * 创建人：航大 <BR>
	 * 时间：2015年4月19日-上午10:18:59 <BR>
	 * @return List<HashMap<String,Object>><BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static List<HashMap<String,Object>> findCitys(int provinceId){
		Connection connection=null;
		PreparedStatement statement=null;
		ResultSet rs=null;
		List<HashMap<String,Object>> maps=null;
		try{
			String sql="select *from tm_city where province_id=?";
			connection=getConnection();
			statement=connection.prepareStatement(sql);
			statement.setInt(1, provinceId);
			rs=statement.executeQuery();
			maps=new ArrayList<HashMap<String,Object>>();
			HashMap<String,Object> map=null;
			while(rs.next()){
				map=new HashMap<String,Object>();
				map.put("id",rs.getInt("id"));
				map.put("name", rs.getString("city"));
				maps.add(map);
			}
			return maps;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(statement!=null)statement.close();
				if(connection!=null)connection.close();
			}catch(Exception e){
				e.printStackTrace();
				
			}
		}			
	}
	
	
	/**
	 * 根据城市id查询省份对应区域   success  executeQuery executeUpdata
	 * 方法名：findCitys<BR>
	 * 创建人：航大 <BR>
	 * 时间：2015年4月19日-上午10:18:59 <BR>
	 * @return List<HashMap<String,Object>><BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static List<HashMap<String,Object>> findAreas(int cityId){
		Connection connection=null;
		PreparedStatement statement=null;
		ResultSet rs=null;
		List<HashMap<String,Object>> maps=null;
		try{
			String sql="select *from tm_area where city_id=?";
			connection=getConnection();
			statement=connection.prepareStatement(sql);
			statement.setInt(1, cityId);
			rs=statement.executeQuery();
			maps=new ArrayList<HashMap<String,Object>>();
			HashMap<String,Object> map=null;
			while(rs.next()){
				map=new HashMap<String,Object>();
				map.put("id",rs.getInt("id"));
				map.put("name", rs.getString("area"));
				maps.add(map);
			}
			return maps;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(statement!=null)statement.close();
				if(connection!=null)connection.close();
			}catch(Exception e){
				e.printStackTrace();
				
			}
		}			
	}
	
	

	
	
	public static void main(String[] args) {
		System.out.println(getConnection());
		List<HashMap<String,Object>> maps=findProvince();
		for(HashMap<String,Object> hashMap:maps){
			System.out.println(hashMap.get("id")+"===="+hashMap.get("name"));
		}
		
	}


}
