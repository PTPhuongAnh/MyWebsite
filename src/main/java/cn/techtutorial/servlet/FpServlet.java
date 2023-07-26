package cn.techtutorial.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.UserDao;

@WebServlet("/fp1")
public class FpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setContentType("text/html");
			String  email=request.getParameter("email");
			String password=request.getParameter("password");
			String password1=request.getParameter("password1");
			if(password.equals(password1)) {
			Connection  conn=DbCon.getConnection();
			PreparedStatement ps=conn.prepareStatement("update users set password=? where email=?");
			ps.setString(2, email);
			ps.setString(1, password);
			int i=ps.executeUpdate();
			if(i>0) {
				response.sendRedirect("fp.jsp?msg=valid");
			}else {
				response.sendRedirect("fp.jsp?msg=invalid");
			}
			}else {
				response.sendRedirect("fp.jsp?msg=invalid");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	

}
