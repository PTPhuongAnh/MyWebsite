package cn.techtutorial.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.CategoryDao;
import cn.techtutorial.dao.ProductDao;
import cn.techtutorial.model.Category;
import cn.techtutorial.model.Product;

/**
 * Servlet implementation class HomeSe
 */
@WebServlet("/home")
public class HomeSe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		HttpSession session= request.getSession();
		
		ProductDao dao= new ProductDao(DbCon.getConnection());
		CategoryDao cate=new CategoryDao(DbCon.getConnection());
		List<Product> list=dao.getAllProducts();
		List<Category> listC=cate.getAllCategory();
		
		
		 Product last1=dao.getAllProducts1();
		 Product last2=dao.getAllProducts2();
		 Product last3=dao.getAllProducts3();
		 Product last4=dao.getAllProducts4();
		
		request.setAttribute("p", last1);
		request.setAttribute("p2", last2);
		request.setAttribute("p3", last3);
		request.setAttribute("p4", last4);
		request.setAttribute("listP", list);
		request.setAttribute("listCC", listC);
		
	
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

	

}
