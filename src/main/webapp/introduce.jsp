<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.dao.CategoryDao"%>
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
<section id="about" class="about section-padding">
<div class="container">
<div class="row">
<div class="col-lg-4 col-md-12 col-12">
<div class="about-img" >
<img src="https://www.studytienganh.vn/upload/2021/05/102795.jpg"  height="100%" alt="" class="img-fluid">
</div>
</div>
<div class="col-lg-8 col-md-12 col-12 ps-lg-5 mt-md-5">
<div class="about-text">
<h2 class="text-success">Flower Fresh</h2>
<p>Sứ mệnh của chúng tôi là giúp bạn trao đi tâm tư và biến mọi dịp trọng đại của bạn trở nên đặc biệt hơn
.

Đi cùng đội ngũ giàu kinh nghiệm đã và đang hoạt động trong ngành hoa - quà tặng nhiều năm liền, chúng tôi luôn đảm bảo đem đến cho bạn những bó hoa tươi nhất được gói cùng các loại nguyên vật liệu chất lượng cao với nhiều chủng loại hoa, kích thước và thiết kế khác nhau phù hợp cho bất kỳ dịp nào bạn cần. Bên cạnh đó, các sản phẩm quà tặng khác như gấu bông, hoa sáp, nến thơm,... cũng đều là những sản phẩm đã qua lựa chọn cẩn thận, chắc chắn sẽ đem đến sự hài lòng cho khách hàng.

 

Thông qua nền tảng trực tuyến, chúng tôi mong muốn đem đến cho bạn trải nghiệm thật tiện lợi, dễ dàng và tràn đầy niềm vui.
</p>

</div>

</div>

</div>
</div>
</section>
</br>
</br>
</br>
</br>
</br>
<hr/>
<%@include file="includes/footer1.jsp" %>
</body>
</html>