<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    CategoryDao cate=new CategoryDao(DbCon.getConnection());
   	List<Category> listC=cate.getAllCategory();
   	request.setAttribute("listCC", listC);
    DecimalFormat dcf=new DecimalFormat("#.###");
    request.setAttribute("dcf", dcf);
    User auth=(User)request.getSession().getAttribute("auth");
    List<Order> orders=null;
    if(auth!=null){
    	request.setAttribute("auth", auth);
    	orders =new OrderDao(DbCon.getConnection()).userOrders(auth.getId());
    	
    }else{
    	//response.sendRedirect("login.jsp");
    }
    ArrayList<Cart> cart_list=(ArrayList<Cart>)session.getAttribute("cart-list");
    List<Cart> cartProuduct=null;
    if(cart_list !=null){
    	
    	request.setAttribute("cart_list", cart_list);
    }
    %>
    
<!DOCTYPE html>
<html>
<head>
<title>Order</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
<div class="container">
<div class="card-header my-3 text-center bg-info text-white">Danh sách Đơn hàng</div>
<table class="table ">
<thead>
<tr class="table-success">
<th scope="col">Ngày đặt</th>
<th scope="col">Tên sản phẩm</th>
<th scope="col">Loại sản phẩm</th>
<th scope="col">Số lượng</th>
<th scope="col">Tổng tiền</th>
<th scope="col">Hủy</th>

</tr>
</thead>
<tbody>
<%
if(orders!=null){
	for(Order o:orders){%>
	<tr>
	<td><%=o.getDate() %></td>
	<td><%=o.getName() %></td>
	<td><%=o.getCategory() %></td>
	<td><%=o.getQuantity()%></td>
	<td><%= dcf.format(o.getPrice()) %></td>
	<td><a class="btn btn-sm btn-danger"  href="cancel-order?id=<%= o.getOrderId()%>">Hủy </a></td>
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