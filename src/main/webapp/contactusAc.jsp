<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.CategoryDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.sql.*" %>
  <%
    User auth=(User)request.getSession().getAttribute("auth");
    
    ArrayList<Cart> cart_list=(ArrayList<Cart>)session.getAttribute("cart-list");
    List<Cart> cartProuduct=null;
    if(cart_list !=null){
    	
    	request.setAttribute("cart_list", cart_list);
    }
    CategoryDao cate=new CategoryDao(DbCon.getConnection());
	List<Category> listC=cate.getAllCategory();
	

	request.setAttribute("listCC", listC);
	if(auth!=null){
	String email=auth.getEmail();
	String ten=request.getParameter("name");
	String phone=request.getParameter("phone");
	String body=request.getParameter("content");

		 Connection con;
         PreparedStatement pst;
         ResultSet rs;

          Class.forName("com.mysql.jdbc.Driver");
          
          con = DriverManager.getConnection("jdbc:mysql://localhost/flower","root","1924052002");
         pst=con.prepareStatement("insert into message(email,ten,content,sdt) values(?,?,?,?)");
         pst.setString(1,email);
         pst.setString(2,ten); 
         pst.setString(3,body);
         pst.setString(4,phone);
         pst.executeUpdate();
         
         response.sendRedirect("contactus.jsp?msg=valid");
	}else{
		response.sendRedirect("contactus.jsp?msg=done");
	}
	
    %>
    <script>
        function validatePhoneNumber() {
            // Lấy giá trị số điện thoại từ input
            var phoneNumber = document.getElementById("phone").value;

            // Mẫu regex để kiểm tra số điện thoại
            var regex = /^\d{10}$/; // Định dạng: 10 chữ số

            // Kiểm tra số điện thoại với mẫu regex
            if (regex.test(phoneNumber)) {
                alert("Valid phone number");
                return true; // Cho phép submit form
            } else {
                alert("Invalid phone number");
                return false; // Ngăn không cho submit form
            }
        }
    </script>