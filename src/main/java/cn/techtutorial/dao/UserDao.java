package cn.techtutorial.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import cn.techtutorial.model.User;


public class UserDao {
private Connection con;
private String query;
private PreparedStatement pst;
private ResultSet rs;

public UserDao(Connection con) {
	this.con = con;
}


public User userLogin(String email,String password) {
	User user=null;
	try {
		query="select * from users where email=? and password=?";
		pst=this.con.prepareStatement(query);
		pst.setString(1,email);
		pst.setString(2, password);
		rs=pst.executeQuery();
		if(rs.next()) {
			user=new User();
			user.setId(rs.getInt("id"));
			user.setName(rs.getString("name"));
			user.setEmail(rs.getString("email"));
			user.setIadmin(rs.getString("iadmin"));
			
		}
		} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	return user;
}

public  void signup(String name,String user,String pass) {
try {
	query="insert into users(name,email,password,iadmin) values(?,?,?,0)";
	pst=this.con.prepareStatement(query);
	pst.setString(1, name);
	pst.setString(2,user);
	pst.setString(3, pass);
	
	pst.executeUpdate();
} catch (Exception e) {
	// TODO: handle exception
}
}
public User Check(String email,String name) {
	User user=null;
	try {
		query="select * from users where email=? or name=? ";
		pst=this.con.prepareStatement(query);
		pst.setString(1,email);
		pst.setString(2, name);
		rs=pst.executeQuery();
		if(rs.next()) {
			user=new User();
			user.setId(rs.getInt("id"));
			user.setName(rs.getString("name"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setIadmin(rs.getString("iadmin"));
			
		}
		} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	return user;
}

public void updateP(String pass) {
try {
	query="update users set password=? where email=?";
	pst=this.con.prepareStatement(query);
	pst.setString(1, pass);
	pst.executeUpdate();
} catch (Exception e) {
	// TODO: handle exception
}
}
}
