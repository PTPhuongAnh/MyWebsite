
    <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import=" java.util.* "%>

<%@page import="java.sql.*" %>
 <%
    User auth=(User)request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth", auth);
    	
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flower</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
<%
        String cid = request.getParameter("cid");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/flower","root","1924052002");
        pst = con.prepareStatement("delete from category where cid = ?");
         pst.setString(1, cid);
        pst.executeUpdate();  
       response.sendRedirect("ThongtinCate.jsp?msg=done1");
       
       
        
        %>
        
       <!--  <script>
            
            alert("Record Deletee");
            
       </script> -->
<%@include file="includes/footer.jsp" %>

</body>
</html>