<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.sql.*"%>
 <%
 CategoryDao cate=new CategoryDao(DbCon.getConnection());
	List<Category> listC=cate.getAllCategory();
	

	request.setAttribute("listCC", listC);
    User auth=(User)request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth", auth);
    	
    }
    
    ProductDao pd= new ProductDao(DbCon.getConnection());
    List<Product> products=pd.getAllProducts();
    ArrayList<Cart> cart_list=(ArrayList<Cart>)session.getAttribute("cart-list");
    List<Cart> cartProuduct=null;
    if(cart_list !=null){
    	
    	request.setAttribute("cart_list", cart_list);
    }
    %>
    <%ProductDao prd=new ProductDao(DbCon.getConnection());
    
    Product pr=prd.getSingleProduct1(request.getParameter("pid"));
    
    
    %>
    <%
 


 %>
  <%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h2 class="alert alert-success" >	Thêm loại sản phẩm thành công</h2>
<%} %>
<%if("invalid".equals(msg))
	{%>
<h2 class="alert alert-danger" >Sản phẩm đã tồn tại</h2>
<%} %>

<%if("done1".equals(msg))
	{%>
<h2 class="alert alert-success" >Đã xóa  loại sản phẩm thành công</h2>
<%} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ThongtinKH</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
<h3 class="text-center">Thông tin loại sản phẩm</h3>
</br>

<a href="addcategory.jsp" type="button" class="btn btn-success ">Thêm loại sản phẩm mới</a>
</br>

  

</br>
</br>
<form action="TTKH" method="post">

                 
                  <div class="panel-body">
                     <table class="table" >
                         <thead>
                             <tr class="table-success">
                                    <th>Id</th>
                                    <th>Name</th>
                                    
                                    <th>Action</th>
                                    
                                
                              
                             </tr>  
                            
                             <%  
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/flower","root","1924052002");
                                
                                  String query = "select * from category";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("cid");
                                   %>
            
                             <tr>
                                 <td ><%=rs.getString("cid") %></td>
                                 <td><%=rs.getString("cname") %></td>
                                  <td> <a href="deleteCate.jsp?id=<%=id%>" class="btn btn-danger">Xóa</a>
                                  
                                  
                                  
                                </td>
                                
                                 
                                
                             </tr>
                            
                            
                                <% }
                               %>
                            
                     </table>    
                 </div>
                 
                             </form>
                              <div align="right">
                            
                             <p class="text-center"><a href="TK.jsp">Quay lại trang</a></p>
                            
                            
                         </div>
<%@include file="includes/footer.jsp" %>
</body>
</html>