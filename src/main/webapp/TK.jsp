<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import=" java.util.* "%>

<%@page import="java.sql.*" %>
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
    
    
      <%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h2 class="alert alert-success" >	Thêm sản phẩm thành công</h2>
<%} %>
<%if("invalid".equals(msg))
	{%>
<h2 class="alert alert-danger" >Sản phẩm đã tồn tại</h2>
<%} %>
<%int customerCount = 0;
Connection con = null;
// Kết nối đến CSDL
String url = "jdbc:mysql://localhost:3306/flower";
String user = "root";
String password = "1924052002";
try  {
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(url, user, password);
//	 Statement stmt = con.createStatement()
	System.out.println("connected");
    // Thực hiện truy vấn lấy tổng số khách hàng
    String sql = "SELECT COUNT(*) AS total FROM users where iadmin=0 ";
    Statement stmt = con.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery(sql);
    if (rs.next()) {
        customerCount = rs.getInt("total");
    }
    request.setAttribute("customerCount", customerCount);

} catch (Exception e) {
    e.printStackTrace();
} %>

<%int ProductsCount = 0;
Connection conn = null;
// Kết nối đến CSDL
String url1 = "jdbc:mysql://localhost:3306/flower";
String user1 = "root";
String password1 = "1924052002";
try  {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url1, user1, password1);
//	 Statement stmt = con.createStatement()
	System.out.println("connected");
    // Thực hiện truy vấn lấy tổng số khách hàng
    String sql = "SELECT COUNT(*) AS total FROM products ";
    Statement stmt = conn.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery(sql);
    if (rs.next()) {
        ProductsCount = rs.getInt("total");
    }
    request.setAttribute("ProductsCount", ProductsCount);

} catch (Exception e) {
    e.printStackTrace();
} %>



<%int CategoryCount = 0;
Connection conn1 = null;
// Kết nối đến CSDL
String url2 = "jdbc:mysql://localhost:3306/flower";
String user2 = "root";
String password2 = "1924052002";
try  {
	Class.forName("com.mysql.jdbc.Driver");
	conn1 = DriverManager.getConnection(url1, user1, password1);
//	 Statement stmt = con.createStatement()
	System.out.println("connected");
    // Thực hiện truy vấn lấy tổng số khách hàng
    String sql = "SELECT COUNT(*) AS total FROM category";
    Statement stmt = conn1.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery(sql);
    if (rs.next()) {
        CategoryCount = rs.getInt("total");
    }
    request.setAttribute("CategoryCount", CategoryCount);

} catch (Exception e) {
    e.printStackTrace();
} %>



<%int SoldCount = 0;
Connection conn2 = null;
// Kết nối đến CSDL
String url3 = "jdbc:mysql://localhost:3306/flower";
String user3 = "root";
String password3 = "1924052002";
try  {
	Class.forName("com.mysql.jdbc.Driver");
	conn2 = DriverManager.getConnection(url1, user1, password1);
//	 Statement stmt = con.createStatement()
	System.out.println("connected");
    // Thực hiện truy vấn lấy tổng số khách hàng
    String sql = "SELECT SUM(o_quantity) AS total FROM orders";
    Statement stmt = conn2.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery(sql);
    if (rs.next()) {
        SoldCount = rs.getInt("total");
    }
    request.setAttribute("SoldCount", SoldCount);

} catch (Exception e) {
    e.printStackTrace();
} %>
<%int messCount = 0;
Connection connn = null;
// Kết nối đến CSDL
String url5 = "jdbc:mysql://localhost:3306/flower";
String user5 = "root";
String password5 = "1924052002";
try  {
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(url, user, password);
//	 Statement stmt = con.createStatement()
	System.out.println("connected");
    // Thực hiện truy vấn lấy tổng số khách hàng
    String sql = "SELECT COUNT(*) AS total FROM message";
    Statement stmt = con.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery(sql);
    if (rs.next()) {
        messCount = rs.getInt("total");
    }
    request.setAttribute("messCount", messCount);

} catch (Exception e) {
    e.printStackTrace();
} %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Thống kê</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
<section id="portfolio" class="portfolio section-padding">
<div class="container">

<div class="row">
<div class="col-12 col-md-12 col-lg-4" style="margin:10px">
<div class="card text-center bg-white pb-2">
<div class="card-body text-dark">
<div class="img-area mb-2 " style="height:12rem" >
<img src="data:image/jpeg;base64,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" alt="" class="img-fluid">
</div>
<h3 class="card-title"><a href="ThongtinKH.jsp">Khách hàng</a></h3>
<p>${customerCount}</p>
</div>
</div>

</div>


<div class="col-12 col-md-12 col-lg-4" style="margin:10px">
<div class="card text-center bg-white pb-2">
<div class="card-body text-dark">
<div class="img-area mb-2" style="height:12rem">
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSspQpKZHgQFc5KM0Ohd8AEhECWU5Jkjtym6nnrKkax9DuyD4IyZ8sOgoiDv84clRrKUtY&usqp=CAU" alt="" class="img-circle">
</div>
<h3 class="card-title"><a href="ThongtinCate.jsp">Loại sản phẩm</a></h3>
<p>${CategoryCount}</p>
</div>
</div>
</div>
<div class="col-12 col-md-12 col-lg-4" style="margin:10px">
<div class="card text-center bg-white pb-2">
<div class="card-body text-dark">
<div class="img-area mb-2" style="height:12rem">
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9s7Q6AZr7MxHVpsXz6CzaXDEg3raLfB7vvUh2bs556A2EI3jMgvyUU80zzKutkneZvkU&usqp=CAU" alt="" class="img-circle">
</div>
<h3 class="card-title"><a href="manager.jsp">Sản phẩm</a></h3>
<p>${ProductsCount}</p>
</div>
</div>

</div>

<div class="col-12 col-md-12 col-lg-4" style="margin:10px">
<div class="card text-center bg-white pb-2">
<div class="card-body text-dark">
<div class="img-area mb-2" style="height:12rem">
<img src="https://1.bp.blogspot.com/-nqCQAw1cb7I/WdSr1UJ9mcI/AAAAAAAAB3o/2O_aBrmuIYQHJgDgKyi5omeOz9InaW9wgCLcBGAs/s1600/icon%2Bhoa%2Bhong%2B20-10%2B2.jpg" alt="" class="img-fluid">
</div>
<h3 class="card-title"><a href="daban.jsp">Số sản phẩm đã bán</a></h3>
<p>${SoldCount}</p>
</div>
</div>
</div>



<div class="col-12 col-md-12 col-lg-4" style="margin:10px">
<div class="card text-center bg-white pb-2">
<div class="card-body text-dark">
<div class="img-area mb-2" style="height:20rem">
<img src="https://png.pngtree.com/element_our/20190602/ourlarge/pngtree-a-red-telephone-illustration-image_1404348.jpg" alt="" class="img-fluid">
</div>
<h3 class="card-title"><a href="lienhe.jsp">Số lượt liên hệ</a></h3>
<p>${messCount}</p>
</div>
</div>
</div>

</div>

</section>


</body>
</html>