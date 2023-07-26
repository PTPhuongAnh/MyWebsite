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
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
 <div class="container" >
           
                <form  method="post" action="add_to_pr123" >
                    
                    <div alight="left">
                        <label class="form-label"> Tên sản phẩm</label>
                        <input type="text" class="form-control" placeholder="Tên sản phẩm" name="name" id="name" required >
                     </div>
                        
                    <div alight="left">
                        <label class="form-label">Loại sản phẩm</label>
                        <input type="text" class="form-control" placeholder="Loại sản phẩm" name="category" id="category" required >
                     </div>
                        
                     <div alight="left">
                        <label class="form-label">Giá</label>
                        <input type="text" class="form-control" placeholder="Giá" name="price" id="price" required >
                     </div>
                      <div alight="left">
                        <label class="form-label">Mô tả</label>
                        <input type="text" class="form-control" placeholder="Mô tả sản phẩm" name="description" id="price" required >
                     </div>
                     <div  class=" form-group" alight="left">
                        <label class="form-label">Hình ảnh</label>
                        <input type="text" class="form-control" placeholder="Hình ảnh" name="image" id="image" required >
                     </div>
                     <div  class=" form-group" alight="left">
                        <label class="form-label">Mã loại sp</label>
                        <input type="text" class="form-control" placeholder="Mã loại sản phẩm" name="cid" id="cid" required >
                     </div>
                         
                        
                     <div  class="form-group" alight="right">
                         <input type="submit" id="submit" value="Xác nhận" name="submit" class="btn btn-primary">
                      
                     </div>  
                        
                </form>
            </div>
            <%@include file="includes/footer.jsp" %>
</body>
</html>