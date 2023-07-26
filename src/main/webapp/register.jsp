<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="cn.techtutorial.model.*"%>
    <%@page import="java.util.*"%>
      <%
    User auth=(User)request.getSession().getAttribute("auth");
    if(auth!=null){
    	
    	response.sendRedirect("index.jsp");
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
<div class="whysign">
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3 class="alert alert-success" >Đăng kí tài khoản thành công</h3>
<%} %>
<%if("invalid".equals(msg))
	{%>
<h3 class="alert alert-danger" >Đã tồn tại tài khoản này</h3>
<%} %>
</div>
<div class="card-header text-center bg-info">Đăng kí tài khoản</div>

<div class="card-body">
<form action="register" method="post">
<div class="form-group">
<div class="form-group">
<label>Tên tài khoản</label>
<input  type="text" class="form-control" name="name" placeholder="Tên tài khoản" required>
</div>
<label>Email</label>
<input  type="email" class="form-control" name="email" placeholder="Email" required>
</div>
<div class="form-group">
<label>Mật khẩu</label>
<input  type="password" class="form-control" name="pass" placeholder="Mật khẩu" required>
</div>

<div class="text-center">
<button type="submit" class="btn btn-primary">Đăng kí</button>
</div>
</form>
</div>
</div>

</div>

<%@include file="includes/footer.jsp" %>
</body>
</html>