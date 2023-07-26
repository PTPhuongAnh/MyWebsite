<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import=" java.util.* "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
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
    CategoryDao cate=new CategoryDao(DbCon.getConnection());
   	List<Category> listC=cate.getAllCategory();
   	

   	request.setAttribute("listCC", listC);
    %>
<!DOCTYPE html>
<html>
<head>
<title>Flower</title>
<%@include file="includes/head.jsp" %>
</head>
<body>

<%@include file="includes/navbar.jsp" %>
<%@include file="includes/banner.jsp" %>


<div class="container">
<div class="card-header my-3 bg-info text-white" style="text-align:center"><h5>Sản phẩm</h5></div>
<div class="row">
 <c:forEach items="${requestScope.listP }" var="o">
		<div class="col-sm-6 col-lg-3 col-md-12">
		<div class="card w-100" style="width: 18rem;margin: 15px">
		  <img class="card-img-top" src="${o.image}" alt="Card image cap">
		  <div class="card-body ">
		    <h5 class="card-title">
		    <a href="detail.jsp?pid=${o.id }" style="text-decoration:none">${o.name }</a></h5>
		    <h6 class="price">Giá $:${o.price }</h6>
		       <h6 class="category">${o.category}</h6>
		 
		  </div>
		</div>
		</div>
		</c:forEach>


</div>
</div>

<%@include file="includes/footer.jsp" %>
</br>
</br>
</br>
</br>
</br>
   <hr/>   
<%@include file="includes/footer1.jsp" %>
</body>
</html>