<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
    <%@page import="cn.techtutorial.dao.CategoryDao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import=" java.util.* "%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import=" java.util.Date "%>

<%@page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    DecimalFormat dcf=new DecimalFormat("#.###");
    request.setAttribute("dcf", dcf);
    User auth=(User)request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth", auth);
    	
    }
    ArrayList<Cart> cart_list=(ArrayList<Cart>)session.getAttribute("cart-list");
    List<Cart> cartProuduct=null;
    if(cart_list !=null){
    	ProductDao pDao=new ProductDao(DbCon.getConnection());
    	cartProuduct=pDao.getCartProducts(cart_list);
    double total=pDao.getTotalCartPrice(cart_list);
    	request.setAttribute("cart_list", cart_list);
    	request.setAttribute("total", total);
    }
    CategoryDao cate=new CategoryDao(DbCon.getConnection());
   	List<Category> listC=cate.getAllCategory();
   	

   	request.setAttribute("listCC", listC);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="includes/head.jsp" %>

<title>Insert title here</title>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
<div class="container">
<div class="d-flex py-3"><h3>Tổng tiền:${(total>0)?dcf.format(total):0}</h3>
<a class="mx-3 btn btn-primary" href="check-out-cart">Xác nhận</a>
</div>
<div class="panel-body">
                     <table class="table table-hover" >
                         <thead>
                             <tr class="table-info">
                                    <th>Tên sản phẩm</th>
                                    <th>Loại sản phẩm</th>
                                     <th>Giá</th>
                                      <th>Số lượng</th>
                                       
                                         
                                   
                             </tr>  
                             </thead>
                             <tbody>
<%
if(cart_list!=null){
	for(Cart c:cartProuduct){%>
		<tr class="table-success">
		<td class="table-success"><%=c.getName() %></td>
		<td class="table-success"><%=c.getCategory() %></td>
		<td class="table-success"><%=dcf.format(c.getPrice())  %></td>
		<td class="table-success"><%=c.getQuantity() %>
		</td>
		</tr>
		
	<%}
}

%>
</tbody>
</table>
</div>
<%@include file="includes/footer.jsp" %>

</body>
</html>