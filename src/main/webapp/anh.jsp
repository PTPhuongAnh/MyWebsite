<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
    <%@page import="cn.techtutorial.dao.ProductDao"%>
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
   	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Date date=new Date();
  if(auth!=null){
	  if(request.getParameter("submit")!=null)
	    {
	        String name = request.getParameter("name");
	        String address=request.getParameter("address");
	        String phone=request.getParameter("phone");
	        String email=auth.getEmail();
	        int u_id=auth.getId();;
	        Connection con;
	        PreparedStatement pst;
	        ResultSet rs;
	        
	        Class.forName("com.mysql.jdbc.Driver");
	        con = DriverManager.getConnection("jdbc:mysql://localhost/flower","root","1924052002");
	        pst = con.prepareStatement("insert into comfirm(name,email,address,phone,u_id) values(?,?,?,?,?)");
	        pst.setString(1, name);
	        pst.setString(2, email);
	        pst.setString(3,address);
	        pst.setString(4,phone);
	        pst.setInt(5,u_id);
	        pst.executeUpdate();  
	        response.sendRedirect("complete.jsp");
	        %> 
	    <script>  
	        alert("Success comfirm");    
	    </script>
	    <%            
	    }else{
	    	if (auth==null) response.sendRedirect("login.jsp");
	    }
  }
    %>
    
<!DOCTYPE html>
<html>
<head>
<title>Flower</title>
<%@include file="includes/head.jsp" %>
<style type="text/css">
.table tbody td{
vartical-align:middle;

}
.btn-incre, .btn-decre{
box-shadow:none;
font-size:25px;
}
</style>
</head>
<body>


<%@include file="includes/navbar.jsp" %>
<div class="container">
<div class="d-flex py-3"><h3>Tổng tiền $:${(total>0)?dcf.format(total):0}</h3>
<!-- <a class="mx-3 btn btn-primary" href="check-out-cart">Check Out</a> -->
</div>
<table class="table table-loght">
<thead>
<tr>
<th scope="col">Tên sản phẩm</th>
<th scope="col">Loại sản phẩm</th>
<th scope="col">Giá</th>
<th scope="col">Số lượng</th>
<th scope="col">Tổng tiền</th>

</tr>
</thead>
<tboby>
<%
if(cart_list!=null){
	for(Cart c:cartProuduct){%>
		<tr>
		<td><%=c.getName() %></td>
		<td><%=c.getCategory() %></td>
		<td><%=dcf.format(c.getPrice())  %></td>
		<td>
		<form  action="complete.jsp" method="post" class="form-inline">
		<input type="hidden" name="id" value="<%=c.getId() %>" class="form-input">
		<div class="form-group d-flex justify-content-between ">
		<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
		<input type="text" name="quantity" class="form-control " value="<%=c.getQuantity() %>" readonly>
		<a class="btn btn-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a>
		</div>

		</form>
		</td>
		<td><%=dcf.format(c.getPrice())  %></td>
		</tr>
	<%}
}

%>
<div class="card-header text-center">Thông tin khách hàng</div>
<div class="card-body">
<form action="#" method="post">
<div class="form-group">
<label>Tên khách hàng</label>
<input  type="text" class="form-control" name="name" placeholder="Tên khách hàng" required>
</div>
<div class="form-group">
<label>Địa chỉ nhận hàng</label>
<input  type="text" class="form-control" name="address" placeholder="Địa chỉ nhận hàng" required>
</div>
<div class="form-group">
<label>Số điện thoại</label>
<input  type="text" class="form-control" name="phone" placeholder="Số điện thoại" required>
</div>
 <div  class="form-group" alight="right">
 <input type="submit" id="submit" value="Xác nhận" name="submit" class="btn btn-primary">
                      
</div>  
</form>
</div>
</div>
</div>

  
</tboby>
</table>
</div>

<%@include file="includes/footer.jsp" %>
</body>
</html>