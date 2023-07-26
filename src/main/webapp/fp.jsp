<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="cn.techtutorial.model.*"%>
    <%@page import="java.util.*"%>
    
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
    %>
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
<div class="container">
<div class="card w-50 mx-auto my-5">
<%String msg=request.getParameter("msg"); %>
<%if("invalid".equals(msg))
	{%>
<h2 class="alert alert-danger" >Thay đổi mật khẩu thất bại</h2>
<%} %>
<%if("valid".equals(msg))
	{%>
<h2 class="alert alert-success" > Thay đổi mật khẩu thành công! Hãy đăng nhập để mua hàng nhé</h2>
<%} %>
<div class="card-header text-center bg-info">Quên mật khẩu</div>
<div class="card-body">
<form action="fp1" method="post">
<div class="form-group">
<label>Email</label>
<input  type="email" class="form-control" name="email" placeholder="Enter your email" required>
</div>
<div class="form-group">
<label>Mật khẩu</label>
<input  type="password" class="form-control" name="password" placeholder="******" required>
</div>
<div class="form-group">
<label>Xác nhận mật khẩu</label>
<input  type="password" class="form-control" name="password1" placeholder="******" required>
</div>
<div class="text-center">
<button type="submit" class="btn btn-primary">Save</button>
</div>
</form>
</div>
</div>
</div>
  
  <div align="center">               
  <p><a href="login.jsp">Login</a></p>
                             
                         </div>
  
<%@include file="includes/footer.jsp" %>
</body>
</html>