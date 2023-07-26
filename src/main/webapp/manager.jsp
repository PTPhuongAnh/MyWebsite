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
<h3 class="text-center">Danh sách sản phẩm</h3>
</br>
 <a href="addtopr.jsp" type="button" class="btn btn-success btn-block">Thêm SP</a>
                
                     <table class="table table-hover" >
                         <thead  class="thead-dark">
                             <tr >
                                    <th scope="col">Tên</th>
                                    <th scope="col">Loại SP</th>
                                    <th scope="col">Gía</th>
                                    <th scope="col">Hình ảnh</th>
                                     <th scope="col">CID</th>
                                    <th scope="col">Mô tả</th>
                                    <th scope="col">Sửa</th>
                                    <th scope="col">Xóa</th>
                                    
                             </tr>  
                             </thead>
                             <tbody>
                            
                             <%  
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/flower","root","1924052002");
                                
                                  String query = "select * from products";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
            
                             <tr>
                                 <td ><%=rs.getString("name") %></td>
                                 <td><%=rs.getString("category") %></td>
                                 <td><%=rs.getString("price") %></td>
                                 <td><img  style="height:100px;width=100px" src="<%=rs.getString("image") %>"></td>
                           
                                 <td><%=rs.getString("cid") %></td>
                                 <td><%=rs.getString("description") %></td>
                                
                               <td>  <a href="update.jsp?id=<%=id %>" class="btn btn-success">Xem SP</a></td>
  <td>  <a href="delete.jsp?id=<%=id %>" class="btn btn-danger">Xóa</a></td>
                                
                             </tr>
                            
                            
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