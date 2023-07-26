package cn.techtutorial.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashSet;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.UserDao;
import cn.techtutorial.model.User;


@WebServlet("/register")
public class RegisterSe extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashSet<String> registeredUsernames = new HashSet<>();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		 String name=request.getParameter("name");
		    String email=request.getParameter("email");
		    String pass=request.getParameter("pass");
		    
		   UserDao dao=new UserDao(DbCon.getConnection());
		   User a=dao.Check(email,name);
		   if(a==null) {
			 dao.signup(name,email, pass);
			 response.sendRedirect("register.jsp?msg=valid");	    
	}else {
		 response.sendRedirect("register.jsp?msg=invalid");
	}
	}

	
}
