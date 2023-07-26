<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import=" java.util.* "%>

<%@page import="java.sql.*" %>
<%
CategoryDao cate=new CategoryDao(DbCon.getConnection());
	List<Category> listC=cate.getAllCategory();
	

	request.setAttribute("listCC", listC);
 
   
     
    User auth=(User)request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth", auth);
    	
    }
    %>
      <%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h2 class="alert alert-success" >	Thêm sản phẩm thành công</h2>
<%} %>
<%if("invalid".equals(msg))
	{%>
<h2 class="alert alert-danger" >Sản phẩm đã tồn tại</h2>
<%} %>

<%if("done1".equals(msg))
	{%>
<h2 class="alert alert-success" >Đã xóa sản phẩm thành công</h2>
<%} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
</br>
<h3 class="text-center">Danh sách khách hàng liên hệ</h3>
<a href=""></a>
</br>

                
                     <table class="table table-hover" >
                         <thead  class="thead-dark">
                             <tr >
                                    <th scope="col">Email</th>
                                    <th scope="col">Tên</th>
                                    
                               <th scope="col">Nội dung</th>
                                <th scope="col">SDT</th>
                                    
                                         
                             </tr>  
                             </thead>
                             <tbody>
                            
                             <%  
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/flower","root","1924052002");
                                
String query = "SELECT * from message";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
            
                             <tr>
                             
                                 
                                   <td><%=rs.getString("email") %></td>
                                    <td><%=rs.getString("ten") %></td> 
                                     
                                     
                                 
                                  <td><%=rs.getString("content") %></td>
                           
                                 <td><%=rs.getString("sdt") %></td>
                                   
                                 
                                 
                                 
                                
                              
                            
                            
                                <% }
                               %>
                            </tbody>
                     </table>    
             
                 

<%@include file="includes/footer.jsp" %>
</body>
<script>
function showMess(id){}
var option=comfirm('Bạn muốn có chắc muốn xóa sản phẩm');
if(option===true){
	window.location.href='delete.jsp?id='+id;
}
</script>
</html>