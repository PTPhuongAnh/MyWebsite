package cn.techtutorial.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.techtutorial.model.Category;
import cn.techtutorial.model.Product;


public class CategoryDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public CategoryDao(Connection con) {
		this.con = con;
	}
	public List<Category> getAllCategory(){
		List<Category> products=new ArrayList<Category>();
		try {
			query="select *from category";
			pst=this.con.prepareStatement(query);
			rs=pst.executeQuery();
			while(rs.next()) {
				products.add(new Category(rs.getString(1),
						rs.getString(2)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return products;
	}
	public List<Category> getSingleCategory(String cid){
		List<Category> products=new ArrayList<Category>();
		try {
			query="select *from products where cid=?";
			pst=this.con.prepareStatement(query);
			rs=pst.executeQuery();
			while(rs.next()) {
				products.add(new Category(rs.getString(1),
						rs.getString(2)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return products;
	}
	
	
	public  void addtocatgory(String name) {
		try {
			query="insert into  category(cname) values(?)";
			pst=this.con.prepareStatement(query);
		        pst.setString(1, name);
		       
		        
		        pst.executeUpdate(); 
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		}
	
	public Category Check(String name) {
		Category user=null;
		try {
			query="select * from category where cname=? ";
			pst=this.con.prepareStatement(query);
			
			pst.setString(1, name);
			rs=pst.executeQuery();
			if(rs.next()) {
				user=new Category();
				user.setCid(rs.getString("cid"));
				user.setCname(rs.getString("cname"));
				
				
				
			}
			} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return user;
	}
	public List<Category> SearchByName(String txtSearch){
		List<Category> products=new ArrayList<Category>();
		try {
			query="select *from category where cname like ? ";
			pst=this.con.prepareStatement(query);
			pst.setString(1, "%"+txtSearch+"%");
			rs=pst.executeQuery();
			while(rs.next()) {
				Category row=new Category();
				row.setCid(rs.getString("cid"));
				row.setCname(rs.getString("cname"));
				
				products.add(row);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return products;
	}
	
	
}
