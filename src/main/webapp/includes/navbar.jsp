<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.CategoryDao"%>
<%@page import="cn.techtutorial.model.Category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
CategoryDao catego=new CategoryDao(DbCon.getConnection());
List<Category> categorys=catego.getAllCategory();
List<Category> cat=catego.getSingleCategory(request.getParameter("cid"));

    
    %>
<nav class="navbar  navbar-expand-lg  sticky-top navbar-light  bg-info">
<div class="container">
  <a class="navbar-brand text-white" href="home"><h3>Flower Fresh</h3></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
     
     <li class="nav-item">
        <a class="nav-link text-white" href="cart.jsp">Giỏ hàng<span class="badge badge-danger px-1">${cart_list.size()}</span></a>
      </li>
      <%
    if(auth!=null && auth.getIadmin().equals("1") ){ %>
    	  <li class="nav-item"><a class="nav-link text-white" href="orders.jsp">Đơn hàng</a></li>
        <li class="nav-item"><a class="nav-link  text-white" href="log-out">Đăng xuất</a></li>
         <li class="nav-item">
        <a class="nav-link text-white" href="TK.jsp">Quản lý 
       </a>
        
      </li>
     <%}else if(auth!=null && auth.getIadmin().equals("0") ){ %>
      
    	  <li class="nav-item"><a class="nav-link text-white" href="orders.jsp">Đơn hàng</a></li>
        <li class="nav-item"><a class="nav-link text-white" href="log-out">Đăng xuất</a></li>
       

       
     <%}else{%>
    	 <li class="nav-item">
         <a class="nav-link text-white" href="login.jsp">Đăng nhập</a>
       </li>
     <% }%>


    <li class="dropdown show">
  <a class="btn dropdown-toggle text-white" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Sản phẩm
  </a>

  <div class="dropdown-menu bg-light" aria-labelledby="dropdownMenuLink">
  <c:forEach items="${requestScope.listCC}" var="o">
  <a class="dropdown-item" href="category?cid=${o.cid}">${o.cname }</a> 
  </c:forEach>
  
 
  </div>
</li>
    </ul>
     <form action="search12" method="post" class="form-inline my-2 my-lg-0 ">
      <input   value="${txtS}"name="txt" class="form-control mr-sm-2" type="text" placeholder="Tìm kiếm" aria-label="Small">
      <button class="btn btn-outline-success btn-number text-white" type="submit">Tìm kiếm</button>
    </form> 
  </div>
  </div>
</nav>
