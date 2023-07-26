<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="cn.techtutorial.model.*"%>
    <%@page import="java.util.*"%>
    
    <%
    User auth=(User)request.getSession().getAttribute("auth");
    if(auth!=null){
    	
    	response.sendRedirect("home");
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
    <style>
   
    
    </style>
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
<h3 class="alert alert-danger" >Email hoặc mật khẩu không đúng.</h3>
<%} %>

<%if("ok".equals(msg))
	{%>
<h3 class="alert alert-danger" >Hãy đăng nhập tài khoản để vào giỏ hàng</h3>
<%} %>
<div class="card-header text-center bg-info">Đăng nhập</div>
<div class="card-body">
<form action="user" method="post">
<div class="form-group">
<label>Email </label>
<input  type="email" class="form-control" name="login-email" placeholder="Email" required>
</div>
<div class="form-group">
<label>Mật khẩu</label>
<input  type="password" class="form-control" name="login-password" placeholder="Mật khẩu" required>
</div>
<div class="text-center">
<button type="submit" class="btn btn-primary">Đăng nhập</button>
</div>
</form>
</div>
</div>
</div>
<div align="center">
                            
                             <p><a href="fp.jsp">Quên mật khẩu</a></p>
                            
                            
                         </div>
  
  <div align="center">
                            
                             <p><a href="register.jsp">Đăng kí tài khoản</a></p>
                            
                            
                         </div>
  
<%@include file="includes/footer.jsp" %>
</body>
</html>