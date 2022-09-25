package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBcon {
	static String driver="com.mysql.jdbc.Driver";
	static String url="jdbc:mysql://localhost:3306/emaintainance";
	static String username="root";
	static String password="root";
	public static Connection conn;
	public static Connection getCon(){
		try{
			Class.forName(driver);
			conn=DriverManager.getConnection(url, username, password);
			System.out.println("connected");
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}
}
