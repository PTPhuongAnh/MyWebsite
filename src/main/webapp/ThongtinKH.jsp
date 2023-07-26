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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ThongtinKH</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
<a href="chitiet.jsp" type="button" class="btn btn-success " style="margin:20px">Danh sách khách hàng mua hàng</a>
<h3 class="text-center">Thông tin tài khoản khách hàng</h3>
<form action="TTKH" method="post">

                 
                  <div class="panel-body">
                     <table class="table" >
                         <thead>
                             <tr class="table-success">
                                    <th>Tên</th>
                                    <th>Email</th>
                                    <th>Mật khẩu</th>
                                     <th>Chức vụ</th>
                                    <th>Hành động</th>
                                    
                                
                              
                             </tr>  
                            
                             <%  
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/flower","root","1924052002");
                                
                                  String query = "select * from users";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
            
                             <tr>
                                 <td ><%=rs.getString("name") %></td>
                                 <td><%=rs.getString("email") %></td>
                                 <td><%=rs.getString("password") %></td>
                               
                               
                                 <td><%=rs.getString("iadmin") %></td>
                                 
                                 <td>
                             <a href="deleteUser.jsp?id=<%=id%>" class="btn btn-danger">Xóa</a>
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