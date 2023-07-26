<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="includes/head.jsp" %>
</head>
<style>
ul li{
list-style:none;
}
</style>
<body>
<%@include file="includes/navbar.jsp" %>
<%@include file="includes/banner.jsp" %>

<div class="container py-5">
		<div class="row">
			<div class="col-lg-6 col-md-12">
				
				<a><img src="<%=pr.getImage() %>" alt="" width="80%"
					style="border-radius: 20px"></a>
			</div>
			<div class="col-lg-6 col-md-12 product-info">
				<ul >
					
					<li><h3><%=pr.getName() %></h3></li>
					
					<li>Giá $:<span><%=pr.getPrice() %></span></li>
					<li>Mô tả sản phẩm:<span><%=pr.getDescription()%></span></li>
					
					<div class="mt-5 d-flex justify-content-between">
		  <a href="add-to-cart?id=<%=pr.getId()%>" class="btn btn-dark btn-lg">Thêm vào giỏ hàng</a>
		   <a href="add-to-cart?quantity=1&id=<%=pr.getId() %>" class="btn btn-primary btn-lg">Mua ngay</a>
		 </div>
					</ul>
					</div>
					</div>
					</div>
					
					
					


			
					
</br>
</br>
</br>
</br>
</br>
<%@include file="includes/footer.jsp" %>
   <hr/>   
<%@include file="includes/footer1.jsp" %>
</body>
</html>