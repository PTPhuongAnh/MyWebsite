package cn.techtutorial.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.techtutorial.model.Cart;
import cn.techtutorial.model.Category;
import cn.techtutorial.model.Product;
import cn.techtutorial.model.User;

public class ProductDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public ProductDao(Connection con) {
		this.con = con;
	}
	public List<Product> getAllProducts(){
		List<Product> products=new ArrayList<Product>();
		try {
			query="select *from products";
			pst=this.con.prepareStatement(query);
			rs=pst.executeQuery();
			while(rs.next()) {
				Product row=new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setDescription(rs.getString("description"));
				products.add(row);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return products;
	}
	
	public Product getAllProducts1(){
		 Product row=null;
		try {
			query="SELECT * FROM products LIMIT 1 ";
			pst=this.con.prepareStatement(query);
			rs=pst.executeQuery();
			while(rs.next()) {
				row=new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setDescription(rs.getString("description"));
			
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return row;
	}
	
	public Product getAllProducts2(){
		 Product row=null;
		try {
			query="SELECT * FROM products LIMIT 1,1 ";
			pst=this.con.prepareStatement(query);
			rs=pst.executeQuery();
			while(rs.next()) {
				row=new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setDescription(rs.getString("description"));
			
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return row;
	}
	
	public Product getAllProducts3(){
		 Product row=null;
		try {
			query="SELECT * FROM products LIMIT 2,1 ";
			pst=this.con.prepareStatement(query);
			rs=pst.executeQuery();
			while(rs.next()) {
				row=new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setDescription(rs.getString("description"));
			
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return row;
	}
	
	
	public Product getAllProducts4(){
		 Product row=null;
		try {
			query="SELECT * FROM products LIMIT 3,1 ";
			pst=this.con.prepareStatement(query);
			rs=pst.executeQuery();
			while(rs.next()) {
				row=new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setDescription(rs.getString("description"));
			
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return row;
	}
	public Product getSingleProduct(int id) {
		Product row=null;
		try {
			query="select *from products where id=?";
			pst=this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs=pst.executeQuery();
			while(rs.next()) {
				row=new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setDescription(rs.getString("description"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return row;
	}
	
	
	public Product getSingleProduct1(String id) {
		Product row=null;
		try {
			query="select *from products where id=?";
			pst=this.con.prepareStatement(query);
			pst.setString(1, id);
			rs=pst.executeQuery();
			while(rs.next()) {
				row=new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setDescription(rs.getString("description"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return row;
	}
	public List<Product> getAllProductsByCID(String cid){
		List<Product> products=new ArrayList<Product>();
		try {
			query="select *from products where cid=?";
			pst=this.con.prepareStatement(query);
			pst.setString(1, cid);
			rs=pst.executeQuery();
			while(rs.next()) {
				Product row=new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setDescription(rs.getString("description"));
				products.add(row);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return products;
	}
	
	
	public List<Product> SearchByName(String txtSearch){
		List<Product> products=new ArrayList<Product>();
		try {
			query="select *from products where name like ? ";
			pst=this.con.prepareStatement(query);
			pst.setString(1, "%"+txtSearch+"%");
			rs=pst.executeQuery();
			while(rs.next()) {
				Product row=new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setDescription(rs.getString("description"));
				products.add(row);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return products;
	}
	
	public List<Product> SearchByCategory(String txtSearch){
		List<Product> products=new ArrayList<Product>();
		try {
			query="select *from products where cate ? ";
			pst=this.con.prepareStatement(query);
			pst.setString(1, "%"+txtSearch+"%");
			rs=pst.executeQuery();
			while(rs.next()) {
				Product row=new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setDescription(rs.getString("description"));
				products.add(row);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return products;
	}
	
	
	
	public List<Cart> getCartProducts(ArrayList<Cart> cartList){
		List<Cart> products=new ArrayList<Cart>();
		try {
			if(cartList.size()>0) {
				for(Cart item:cartList) {
					query="select *from products where id=?";
					pst=this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs=pst.executeQuery();
					while(rs.next()) {
						Cart row=new Cart();
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setCategory(rs.getString("category"));
						
						row.setPrice(rs.getDouble("price")*item.getQuantity());
						row.setQuantity(item.getQuantity());
						products.add(row);
						
						
						
						
						
					}
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			
		}
		return products;
	}
	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum=0;
		try {
			if(cartList.size()>0){
				for(Cart item:cartList) {
					query="select price from products where id=?";
					pst=this.con.prepareStatement(query);
					pst.setInt(1,item.getId());
					rs=pst.executeQuery();
					while(rs.next()) {
						sum+=rs.getDouble("price")*item.getQuantity();
					}
				}
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return sum;
		
	}

	
	
	public  void addtopr(String name,String category,String price,String image,String cid,String description) {
		try {
			query="insert into products(name,category,price,image,cid,description) values(?,?,?,?,?,?)";
			pst=this.con.prepareStatement(query);
		        pst.setString(1, name);
		        pst.setString(2, category);
		        pst.setString(3, price);
		        pst.setString(4,image);
		        pst.setString(5,cid);
		        pst.setString(6, description);
		        
		        pst.executeUpdate(); 
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		}
	
	
	public Product Check(String name) {
		Product user=null;
		try {
			query="select * from products where name=? ";
			pst=this.con.prepareStatement(query);
			
			pst.setString(1, name);
			rs=pst.executeQuery();
			if(rs.next()) {
				user=new Product();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setCategory(rs.getString("category"));
				user.setPrice(rs.getDouble("price"));
				user.setImage(rs.getString("image"));
				user.setDescription(rs.getString("description"));
				
			}
			} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return user;
	}
}
