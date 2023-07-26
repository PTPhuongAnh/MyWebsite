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
    <%ProductDao dao=new ProductDao(DbCon.getConnection());
    
    Product p=(Product)request.getSession().getAttribute("p");
    Product p2=(Product)request.getSession().getAttribute("p2");
    Product p3=(Product)request.getSession().getAttribute("p3");
    Product p4=(Product)request.getSession().getAttribute("p4");
  
    Product last1=dao.getAllProducts1();
	 Product last2=dao.getAllProducts2();
	 Product last3=dao.getAllProducts3();
	 Product last4=dao.getAllProducts4();
	request.setAttribute("p", last1);
	request.setAttribute("p2", last2);
	request.setAttribute("p3", last3);
	request.setAttribute("p4", last4);
	
	
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"  />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" ></script>
</head>
    <style>
    .multi-item-carousel{
  .carousel-inner{
    > .item{
      transition: 500ms ease-in-out left;
    }
    .active{
      &.left{
        left:-33%;
      }
      &.right{
        left:33%;
      }
    }
    .next{
      left: 33%;
    }
    .prev{
      left: -33%;
    }
    @media all and (transform-3d), (-webkit-transform-3d) {
      > .item{
        // use your favourite prefixer here
        transition: 500ms ease-in-out left;
        transition: 500ms ease-in-out all;
        backface-visibility: visible;
        transform: none!important;
      }
    }
  }
}
    </style>
<body>
<nav class="navbar  navbar-expand-lg  sticky-top navbar-light bg-info ">
<div class="container">
  <a class="navbar-brand text-white" href="home"><h3>Flower Fresh</h3></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
</div>
</nav>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="https://blog.dktcdn.net/articles/thiet-ke-shop-hoa-tuoi.jpg" height="500px" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://noithatnewdecor.com/wp-content/uploads/2019/03/THI%E1%BA%BET-K%E1%BA%BE-SHOP-HOA-%C4%90%E1%BA%B8P-e1557593915350.jpg" height="500px" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://cdn.hpdecor.vn/wp-content/uploads/2022/05/thiet-ke-cua-hang-hoa-tuoi-nho-6.jpg" height="500px"  alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</br>
</br>
<!-- <a  href="home" type="button" class="btn btn-info" style="magrin-left:50px">Shop Now</a> -->
<div class="card-header my-3 bg-info text-white" style="text-align:center"><h4>Sản phẩm mới nhất</h4></div>

<div class="container">

<div class="row">

		<div class="col-md-3">
		<div class="card w-100" style="width: 18rem;margin: 15px">
		  <img class="card-img-top" src="${p.image }" alt="Card image cap">
		  <div class="card-body ">
		    <h5 class="card-title">
		    <a href="detail.jsp?pid=${p.id }" style="text-decoration:none">${p.name}</a></h5>
		    <h6 class="price">Price:${p.price}</h6>
		       <h6 class="category">${p.category }</h6>
		 
		  </div>
		</div>
		</div>
		<div class="col-md-3">
		<div class="card w-100" style="width: 18rem;margin: 15px">
		  <img class="card-img-top" src="${p2.image }" alt="Card image cap">
		  <div class="card-body ">
		    <h5 class="card-title">
		    <a href="detail.jsp?pid=${p2.id }" style="text-decoration:none">${p2.name}</a></h5>
		    <h6 class="price">Price:${p2.price}</h6>
		       <h6 class="category">${p2.category }</h6>
		 
		  </div>
		</div>
		</div>
		
		<div class="col-md-3">
		<div class="card w-100" style="width: 18rem;margin: 15px">
		  <img class="card-img-top" src="${p3.image }" alt="Card image cap">
		  <div class="card-body ">
		    <h5 class="card-title">
		    <a href="detail.jsp?pid=${p3.id }" style="text-decoration:none">${p3.name}</a></h5>
		    <h6 class="price">Price:${p3.price}</h6>
		       <h6 class="category">${p3.category }</h6>
		 
		  </div>
		</div>
		</div>
		
		
		
		<div class="col-md-3">
		<div class="card w-100" style="width: 18rem;margin: 15px">
		  <img class="card-img-top" src="${p4.image }" alt="Card image cap">
		  <div class="card-body ">
		    <h5 class="card-title">
		    <a href="detail.jsp?pid=${p4.id }" style="text-decoration:none">${p4.name}</a></h5>
		    <h6 class="price">Price:${p4.price}</h6>
		       <h6 class="category">${p4.category }</h6>
		 
		  </div>
		</div>
		</div>
		


</div>
</div>


<div class="card-header my-3 bg-info text-white" style="text-align:center"><h4>Giới thiệu</h4></div>
<section id="about" class="about section-padding">
<div class="container">
<div class="row">
<div class="col-lg-4 col-md-12 col-12">
<div class="about-img">
<img src="https://www.studytienganh.vn/upload/2021/05/102795.jpg"  height="100%"alt="" class="img-fluid">
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

<div class="card-header my-3 bg-info text-white" style="text-align:center"><h4>Chăm sóc hoa</h4></div>
<section id="about" class="about section-padding">
<div class="container">
<div class="row">
<div class="col-lg-4 col-md-12 col-12">
<div class="about-img">
<img src="https://i.pinimg.com/originals/35/39/5e/35395e4cc7748223cd7fd9501cfbfa72.jpg"  height="100%"alt="" class="img-fluid">
</div>
</div>
<div class="col-lg-8 col-md-12 col-12 ps-lg-5 mt-md-5">
<div class="about-text">
<h2 class="text-success">Flower Fresh</h2>
<p>- Những bó hoa tươi của chúng tôi được giao kèm với nước bên dưới để giữ hoa luôn tươi. Bạn có thể lựa chọn giữ nguyên hoặc chuyển hoa vào bình.</p>


<p>- Hãy luôn đảm bảo bình hoa của bạn được rửa sạch để vi khuẩn không tấn công và làm giảm thời gian tươi lâu của hoa.</p>


<p>- Khi có cánh hoa bị héo, bạn phải bỏ ra ngay để tránh ảnh hưởng tới những bông còn tươi.</p>


<p>- Bỏ những cánh hoa rụng trong bình. Điều này vừa giúp bình hoa trông đẹp hơn mà còn ngăn chặn vi khuẩn phát triển.</p>


<p>- Cắt cành theo đường chéo bằng dao và để ngập cành trong nước.</p>


<p>- Hoa giữ được độ tươi lâu hơn trong khí hậu lạnh, luôn giữ hoa tránh ánh nắng trực tiếp hoặc nơi có hơi nóng.</p>


<p>- Để hoa tránh xa bệ cửa sổ, lỗ thông hơi và quạt vì điều này sẽ làm hoa mau mất nước.</p>


<p>- Không trưng hoa gần trái cây! Khí ethylene sẽ làm giảm thời gian tươi của hoa.</p>

 

<p>Quan trọng nhất là bạn phải luôn vệ sinh bình hoa sạch sẽ và thay nước sau 2 đến 3 ngày.
</p>

</div>

</div>

</div>
</div>
</section>


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