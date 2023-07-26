package cn.techtutorial.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.techtutorial.model.Comfirm;
import cn.techtutorial.model.Product;

public class ComfirmDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public ComfirmDao(Connection con) {
		this.con = con;
	}
	public List<Comfirm> getAllCfs(){
		List<Comfirm> products=new ArrayList<Comfirm>();
		try {
			query="select *from comfirm";
			pst=this.con.prepareStatement(query);
			rs=pst.executeQuery();
			while(rs.next()) {
				Comfirm row=new Comfirm();
				row.setCmid(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setEmail(rs.getString("email"));
				row.setAddress(rs.getString("address"));
				row.setPhone(rs.getString("phone"));
				products.add(row);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return products;
	}
}
