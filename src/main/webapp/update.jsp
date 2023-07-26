<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import=" java.util.* "%>

<%@page import="java.sql.*" %>
 <%
    User auth=(User)request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth", auth);
    	
    }
    %>
    <%
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String image= request.getParameter("image");
        String cid= request.getParameter("cid");
        String description=request.getParameter("description");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/flower","root","1924052002");
        pst = con.prepareStatement("update products set name = ?,category =?,price= ?,image=?,cid=?,description=? where id = ?");
        pst.setString(1, name);
        pst.setString(2, category);
        pst.setString(3, price);
        pst.setString(4, image);
        pst.setString(5,cid);
        pst.setString(6,description);
         pst.setString(7, id);
        pst.executeUpdate();  
        
      
    }
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flower</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
 <h2 style="text-align:center;margin-top:20px">Cập nhật thông tin sản phẩm</h2>
        
        
        <div class="container">
           
                <form  method="POST" action="#" >
                    
                    <%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                          con = DriverManager.getConnection("jdbc:mysql://localhost/flower","root","1924052002");
                          
                          String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from products where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
                     <div alight="left">
                        <label class="form-label">STT</label>
                        <input type="text" class="form-control" placeholder="STT" value="<%= rs.getString("id")%>" name="id" id="id" readonly >
                     </div>
                    <div alight="left">
                        <label class="form-label">Tên sản phẩm</label>
                        <input type="text" class="form-control" placeholder="Tên sản phẩm" value="<%= rs.getString("name")%>" name="name" id="name" required >
                     </div>
                        
                    <div alight="left">
                        <label class="form-label">Loại sản phẩm</label>
                        <input type="text" class="form-control" placeholder="Loại sản phẩm" name="category" value="<%= rs.getString("category")%>" id="category" required >
                     </div>
                        
                     <div alight="left">
                        <label class="form-label">Giá</label>
                        <input type="text" class="form-control" placeholder="Giá" name="price"  value="<%= rs.getString("price")%>"id="price" required >
                     </div>
                      <div alight="left">
                        <label class="form-label">Mô tả</label>
                        <input type="text" class="form-control" placeholder="Mô tả sản phẩm" name="description"  value="<%= rs.getString("description")%>" id="price" required >
                     </div>
                    
                    
                     <div alight="left">
                        <label class="form-label">Hình ảnh</label>
                        <input type="text" class="form-control" placeholder="Hình ảnh" name="image" id="price" value="<%= rs.getString("image")%>" required >
                     </div>
                     
                     <div alight="left">
                        <label class="form-label">Mã loại sản phẩm</label>
                        <input type="text" class="form-control" placeholder="Mã loại sản phẩm" name="cid" id="cid" value="<%= rs.getString("cid")%>" required >
                     </div>
                    
                    <% }  %>
                    
                    
                    
                         </br>
                        
                     <div alight="right">
                         <input type="submit" id="submit" value="xác nhận" name="submit" class="btn btn-primary">
                        
                     </div>  
                        
                         <div align="right">
                            
                             <p><a href="manager.jsp">Quay lại trang</a></p>
                            
                            
                         </div>
  
                </form>
            </div>          
      
       
        <%@include file="includes/footer.jsp" %>
</body>
</html>