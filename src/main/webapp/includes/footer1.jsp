<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <style>
:root {
    --pink: #e84393;
    --black: #1e171a;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    transition: .2s linear;
}

ul {
    list-style: none;
}
ol, ul {
    padding: 0;
}

/*header*/
/*.heading {*/
/*    text-align: center;*/
/*    font-size: 4rem;*/
/*    color: #333;*/
/*    padding: 1rem;*/
/*    margin: 2rem 0;*/
/*    background: rgba(255, 51, 153, .05);*/
/*}*/

/*.heading span {*/
/*    color: #e84393;*/
/*}*/

header .logo {
    font-size: 3rem;
    color: #333;
    font-weight: bolder;
    text-decoration: none;
}

header .logo span {
    color: #e84393;

}

/*header .navbar ul {*/
/*    list-style: none;*/
/*}*/

/*header .navbar ul li {*/
/*    position: relative;*/
/*    float: left;*/
/*    text-align: left;*/
/*}*/

/*header .navbar ul li ul {*/
/*    display: none;*/
/*    position: absolute;*/
/*    background-color: #fff;*/
/*    padding: 20px;*/

/*}*/
/*header .navbar ul li:hover ul {*/
/*    display: block;*/


/*}*/

/*header .navbar ul li ul li {*/
/*    width: 220px;*/
/*    cursor: pointer;*/
/*}*/

/*header .navbar a {*/
/*    font-size: 2rem;*/
/*    padding: 0 1.5rem;*/
/*    color: #666;*/
/*}*/

/*header .navbar a:hover {*/
/*    color: #e84393;*/
/*}*/
.dropdown:hover > .dropdown-menu {
    display: block;
}

.dropdown > .dropdown-toggle:active {
    pointer-events: none;
}

.dropdown-menu li .dropdown-item:hover {
    background-color: #eec5d9;
}

header .icons a {
    font-size: 2.5rem;
    color: #333;
    margin-left: 1.5rem;
}



header #toggler {
    display: none;
}

/*header .fa-bars {*/
/*    font-size: 3rem;*/
/*    color: #333;*/
/*    border-radius: 5px;*/
/*    padding: .5rem 1.5rem;*/
/*    cursor: pointer;*/
/*    border: .1rem solid rgba(0, 0, 0, .3);*/
/*    display: none;*/
/*}*/

/*end header*/
/*main*/


.product-info ul li {
    margin-bottom: 10px;
}


/*.home .content {*/
/*    max-width: 50rem;*/
/*}*/

/*.home .content h2 {*/
/*    font-size: 6rem;*/
/*    color: #333;*/
/*}*/

/*.home .content p {*/
/*    font-size: 1.5rem;*/
/*    color: #605d5d;*/
/*    padding: 1rem 0;*/
/*    line-height: 1.5;*/
/*}*/

/*.products .box-container {*/
/*    display: flex;*/
/*    flex-wrap: wrap;*/
/*    gap: 1.5rem;*/
/*}*/

/*.products .box-container .box {*/
/*    flex: 1 1 30rem;*/
/*    box-shadow: 0 .5rem 1.5rem rgba(0, 0, 0, .1);*/
/*    border-radius: .5rem;*/
/*    border: .1rem solid rgba(0, 0, 0, .1);*/
/*    position: relative;*/
/*}*/

/*.products .box-container .box .discount {*/
/*    position: absolute;*/
/*    top: 1rem;*/
/*    left: 1rem;*/
/*    padding: .7rem 1rem;*/
/*    font-size: 2rem;*/
/*    color: var(--pink);*/
/*    background: rgba(255, 51, 153, .05);*/
/*    z-index: 1;*/
/*    border-radius: .5rem;*/
/*}*/

/*.products .box-container .box .image {*/
/*    position: relative;*/
/*    text-align: center;*/
/*    padding-top: 2rem;*/
/*    overflow: hidden;*/
/*}*/

/*.products .box-container .box .image img {*/
/*    height: 25rem;*/
/*}*/

/*.products .box-container .box:hover .image img {*/
/*    transform: scale(1.2);*/
/*}*/

/*.products .box-container .box .image .icons {*/
/*    position: absolute;*/
/*    bottom: -7rem;*/
/*    left: 0;*/
/*    right: 0;*/
/*    display: flex;*/
/*}*/

/*.products .box-container .box:hover .image .icons {*/
/*    bottom: 0;*/
/*}*/

/*.products .box-container .box .image .icons a {*/
/*    height: 5rem;*/
/*    line-height: 5rem;*/
/*    font-size: 2rem;*/
/*    width: 50%;*/
/*    background: var(--pink);*/
/*    color: white;*/
/*}*/

/*.products .box-container .box .image .icons .cart-btn {*/
/*    border-left: .1rem solid #fff7;*/
/*    border-right: .1rem solid #fff7;*/
/*    width: 100%;*/
/*}*/

/*.products .box-container .box .image .icons a:hover {*/
/*    background: #da6e6e;*/
/*}*/

/*.products .box-container .box .content {*/
/*    padding: 2rem;*/
/*    text-align: center;*/
/*}*/

/*.products .box-container .box .content h3 {*/
/*    font-size: 2.5rem;*/
/*    color: #333;*/
/*}*/

/*.products .box-container .box .content .price {*/
/*    font-size: 2.5rem;*/
/*    color: var(--pink);*/
/*    font-weight: bolder;*/
/*    padding-top: 1rem;*/
/*}*/

/*.products .box-container .box .content .price span {*/
/*    font-size: 1.5rem;*/
/*    color: #333;*/
/*    font-weight: lighter;*/
/*    text-decoration: line-through;*/
/*}*/

/*.row {*/
/*    width: 1000px;*/
/*    height: 600px;*/
/*    display: flex;*/
/*}*/

/*.col-sm-5 {*/
/*    width: 400px;*/
/*    height: 300px;*/
/*    margin: 20px;*/
/*}*/

/*.col-sm-7 ul {*/
/*    list-style: none;*/

/*}*/

/*.col-sm-7 ul li {*/
/*    margin: 20px;*/
/*    font-size: 20px;*/
/*}*/

.btnWrap a {
    display: flex;
    align-items: center;
    color: #ffffff;
    width: max-content;
    border-radius: 5px;
    background-color: #DB7093FF;
    padding: 5px 15px;
    margin-right: 20px;
}

/*.wrapper {*/
/*    width: max-content;*/
/*    padding: 10px;*/
/*    display: flex;*/
/*    align-items: center;*/
/*    justify-content: center;*/
/*    background: white;*/
/*    border: 1px solid palevioletred;*/
/*    border-radius: 5px;*/
/*}*/
.wrapper {
    opacity: 1;
    display: inline-block;
    display: -ms-inline-flexbox;
    display: inline-flex;
    white-space: nowrap;
    vertical-align: top;
}

.is-form {
    overflow: hidden;
    position: relative;
    background-color: #f9f9f9;
    height: 2.2rem;
    width: 1.9rem;
    padding: 0;
    text-shadow: 1px 1px 1px #fff;
    border: 1px solid #ddd;
}

.is-form:focus, .input-text:focus {
    outline: none;
}

.is-form.minus {
    border-radius: 4px 0 0 4px;
}

.is-form.plus {
    border-radius: 0 4px 4px 0;
}

.input-qty {
    background-color: #fff;
    height: 2.2rem;
    text-align: center;
    font-size: 1rem;
    display: inline-block;
    vertical-align: top;
    margin: 0;
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    border-left: 0;
    border-right: 0;
    padding: 0;
}

.input-qty::-webkit-outer-spin-button, .input-qty::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

/*.col-sm-7 button:hover {*/
/*    background: rgb(207, 127, 154);*/
/*}*/

/*.wrapper {*/
/*    height: 100px;*/
/*    width: 200px;*/
/*    display: flex;*/
/*    align-items: center;*/
/*    justify-content: center;*/
/*    background: white;*/
/*    border: 1px solid palevioletred;*/
/*    border-radius: 5px;*/
/*}*/


/*.col-sm-7 .wrapper span .num {*/
/*    font-size: 50px;*/
/*    border-right: 2px solid rgba(0, 0, 0, 0.2);*/
/*    border-left: 2px solid rgba(0, 0, 0, 0.2);*/
/*}*/

/* Tiếp */
/*.contact .row {*/
/*    display: flex;*/
/*    flex-wrap: wrap;*/
/*    gap: 1.5rem;*/
/*}*/

/*.contact .row form {*/
/*    flex: 1 1 40rem;*/
/*    padding: 2rem 2.5rem;*/
/*    box-shadow: 0 .5rem 1.5rem rgba(0, 0, 0, .1);*/
/*    border: .1rem solid rgba(0, 0, 0, .1);*/
/*    background: #fff;*/
/*    border-radius: .5rem;*/
/*}*/

/*.contact .row form .box {*/
/*    padding: 1rem;*/
/*    font-size: 1.7rem;*/
/*    color: #333;*/
/*    text-decoration: none;*/
/*    border: .1rem solid rgba(0, 0, 0, .1);*/
/*    border-radius: .5rem;*/
/*    margin: .7rem 0;*/
/*    width: 100%;*/
/*}*/

/*.contact .row form .box:focus {*/
/*    border-color: var(--pink);*/
/*}*/

/*.contact .row form textarea {*/
/*    height: 15rem;*/
/*    resize: none;*/
/*}*/

/*end-main*/

/*footer*/
/*.footer .box-container {*/
/*    display: flex;*/
/*    flex-wrap: wrap;*/
/*    gap: 1rem;*/
/*    !* width: 100%; *!*/

/*}*/

/*.footer .box-container .box {*/
/*    flex: 1 1 25rem;*/
/*}*/

/*.footer .box-container .box h3 {*/
/*    color: #333;*/
/*    font-size: 2.5rem;*/
/*    padding: 1rem 0;*/
/*}*/

/*.footer .box-container .box a {*/
/*    display: block;*/
/*    color: #666;*/
/*    font-size: 1.5rem;*/
/*    padding: 1rem 0;*/
/*}*/

/*.footer .box-container .box a:hover {*/
/*    color: var(--pink);*/
/*    text-decoration: underline;*/
/*}*/
.footer .box ul li {
    padding: 10px 0;
}

.footer .box ul a {
    text-decoration: none;
    color: #1e171a;
}

#load-more {
    padding: 1rem;
    font-size: 1.7rem;
    color: #333;
    text-decoration: none;
    border: .1rem solid rgba(0, 0, 0, .1);
    border-radius: .5rem;
    margin: .7rem 0;
    width: 100%;
}

#load-more:hover {
    background: var(--pink);
}

@media (max-width: 991px) {
    /*html {*/
    /*    font-size: 55%;*/
    /*}*/
    /*header {*/
    /*    padding: 2rem;*/
    /*}*/
    /*section {*/
    /*    padding: 2rem;*/
    /*}*/
    /*.home {*/
    /*    background-position: left;*/
    /*}*/
}

@media (max-width: 768px) {
    /*html .fa-bars {*/
    /*    display: block;*/
    /*}*/
    /*header .navbar {*/
    /*    position: absolute;*/
    /*    top: 100%;*/
    /*    left: 0;*/
    /*    right: 0;*/
    /*    background: #eee;*/
    /*    border-top: .1rem solid rgba(0, 0, 0, .1);*/
    /*    clip-path: polygon(0 0, 100% 0, 100% 0, 0 0);*/
    /*}*/
    /*.header #togger:checked ~ .navbar {*/
    /*    clip-path: polygon(0 0, 100% 0, 100% 100%, 0% 100%);*/
    /*}*/
    /*header .navbar a {*/
    /*    margin: 1.5rem;*/
    /*    padding: 1.5rem;*/
    /*    background: #fff;*/
    /*    border: .1rem solid rbga(0, 0, 0, .1);*/
    /*    display: block;*/
    /*}*/
    /*.home .content h2 {*/
    /*    font-size: 5rem;*/
    /*}*/
}

@media (max-width: 450px) {
   
}

</style>
<div class="footer container">
		<div class="row">
			<div class="box col-lg-3 col-md-12 col-sm-6">
				<h3>Tìm kiếm nhanh</h3>
				<ul>
					<li><a href="banner1.jsp">Trang chủ</a></li>
					<li><a href="introduce.jsp">Giới thiệu</a></li>
					<li><a href="TakeCare.jsp">Hướng dẫn chăm sóc hoa</a></li>
				</ul>
			</div>
			<div class="box col-lg-3 col-md-12 col-sm-6  ">
				<h3>Thông tin thêm </h3>
				<ul>
					<li><a href="contactus.jsp">Liên hệ với chúng tôi</a></li>
					<li><a href="#">Blog</a></li>
				</ul>
			</div>
			<div class="box col-lg-3 col-md-12 col-sm-6 ">
				<h3>Địa chỉ</h3>
				<ul>
					<li><a href="#">Hồ Chí Minh</a></li>
					<li><a href="#">Hà Nội</a></li>
				</ul>
				<!--            <a href="#">Hồ Chí Minh</a>-->
				<!--            <a href="#">Đà Nẵng</a>-->
				<!--            <a href="#">Hải Phòng</a>-->
			</div>
			<div class="box col-lg-3 col-md-12 col-sm-6 ">
				<h3>Liên hệ </h3>
				<!--            <a href="#">0001234567</a>-->
				<!--            <a href="#">susu123@gmail.com</a>-->
				<!--            <a href="#">Cầu Giấy- Hà Nội</a>-->
				<ul>
					<li><a href="#">0001234567</a></li>
					<li><a href="#">anhhuyenhuy1912@gmail.com</a></li>
					<li><a href="#">Cầu Giấy- Hà Nội</a></li>
				</ul>
			</div>
		</div>
	</div>