package cn.techtutorial.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.UserDao;
import cn.techtutorial.model.Cart;
import cn.techtutorial.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/user")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		try(PrintWriter out=response.getWriter()){
			String email=request.getParameter("login-email");
			String password=request.getParameter("login-password");
			ArrayList<Cart> cart_list=(ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			try {
				UserDao udao=new UserDao(DbCon.getConnection());
				User user= udao.userLogin(email, password);
				if(user!=null) {
					request.getSession().setAttribute("auth", user);
					cart_list.clear();
					response.sendRedirect("home");
					//cart_list.clear();
					
					
				
				
			} else {
				
				response.sendRedirect("login.jsp?msg=invalid");
			}
			}catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			
				response.sendRedirect("login.jsp?msg=invalid");
			}
		
			
			
		}
	}
}
	


