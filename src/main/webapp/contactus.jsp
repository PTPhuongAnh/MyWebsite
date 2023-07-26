<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.dao.CategoryDao"%>
<%@page import="cn.techtutorial.model.*"%>

      <%
    User auth=(User)request.getSession().getAttribute("auth");
   
    ArrayList<Cart> cart_list=(ArrayList<Cart>)session.getAttribute("cart-list");
    List<Cart> cartProuduct=null;
    if(cart_list !=null){
    	
    	request.setAttribute("cart_list", cart_list);
    }
    CategoryDao cate=new CategoryDao(DbCon.getConnection());
	List<Category> listC=cate.getAllCategory();
	

	request.setAttribute("listCC", listC);
    %>
    <%String msg=request.getParameter("msg"); %>
<%if("valid".equals(msg))
	{%>
<h2 class="alert alert-success">Gửi thành công</h2>
<%} %>
<%if("done".equals(msg))
	{%>
<h2 class="alert alert-danger">Bạn phải có tài khoản để liên hệ với chúng tôi.</h2>
<%} %>

    <!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"  />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" ></script>
</head>
<body>

<nav class="navbar  navbar-expand-lg  sticky-top navbar-light bg-info ">
<div class="container">
  <a class="navbar-brand text-white" href="home"><h3>Flower Fresh</h3></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
</div>
</nav>
</br>
</br>
<form method="post" action="contactusAc.jsp" onsubmit="return validatePhoneNumber()"><h4 class="text-center">Liên hệ với chúng tôi<h4> 
<section id="contact" class="contact section-padding">
<div class="container">
<div class="row m-0">
<div class="col-md-12 p-0 pt-4 p-4 m-auto">
<div class="row">
<div class="col-md-12">
<div class="mb-3">
<input type="text" class="form-control"  name="name" required placeholder="Họ tên">
</div>
</div>

<div class="col-md-12">
<div class="mb-3">
<input type="number" class="form-control"  name="phone" required placeholder="Số điện thoại">
</div>
</div>

<div class="col-md-12">
<div class="mb-3">
<textarea rows="3" class="form-control"  name="content" required placeholder="Nội dung"></textarea>
</div>
</div>

<button class="btn btn-warning btn-lg btn-block mt-3">Gửi</button>
</div>
</div>
</div>
</div>
</section></form>


          </br>   
          
          </br> 
          
          </br> 
          
          </br> 
          
          </br>   
          <hr/>          
<%@include file="includes/footer1.jsp" %>
</body>
</html>