package cn.techtutorial.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbCon {
	public static Connection getConnection() {
		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/flower";
		String user = "root";
		String password = "1924052002";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
			System.out.println("connected");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
}

