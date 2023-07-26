<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="cn.techtutorial.model.*"%>
    <%@page import="java.util.*"%>
        <%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import=" java.util.* "%>
  <%@page import="cn.techtutorial.dao.CategoryDao"%>
<%@page import="java.sql.*" %>
    
    <%
    User auth=(User)request.getSession().getAttribute("auth");
    if(auth!=null){
    	
    	response.sendRedirect("index.jsp");
    }
    ArrayList<Cart> cart_list=(ArrayList<Cart>)session.getAttribute("cart-list");
    List<Cart> cartProuduct=null;
    if(cart_list !=null){
    	
    	request.setAttribute("cart_list", cart_list);
    }
    CategoryDao cate=new CategoryDao(DbCon.getConnection());
	List<Category> listC=cate.getAllCategory();
	

	request.setAttribute("listCC", listC);
	
	
	String email=request.getParameter("email");
	String password=request.getParameter("n_password");
	int check=0;
	try{
		  
        Connection con;
        Statement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/flower","root","1924052002");
        pst=con.createStatement();
     String  query="select *from users where email=? and password=?";
		rs=pst.executeQuery(query);
     while(rs.next()){
    	 check=1;
    	 pst.executeUpdate("update users set password=? where email=?");
    	 
    	 response.sendRedirect("fp.jsp?msg=done");
     }
     if(check==0){
    	 response.sendRedirect("fp.jsp?msg=invalid");
     }
      
	}catch(Exception e){
		
	}
	
		
	
    %>