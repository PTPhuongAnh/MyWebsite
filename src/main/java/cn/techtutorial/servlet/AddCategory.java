package cn.techtutorial.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.CategoryDao;
import cn.techtutorial.dao.ProductDao;
import cn.techtutorial.model.Category;
import cn.techtutorial.model.Product;

/**
 * Servlet implementation class AddCategory
 */
@WebServlet("/add_to_category")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String name = request.getParameter("name");
          CategoryDao dao=new CategoryDao(DbCon.getConnection());
          Category a=dao.Check(name);
          if(a==null) {
          dao.addtocatgory(name);
          response.sendRedirect("ThongtinCate.jsp?msg=valid");
	}else {
		response.sendRedirect("ThongtinCate.jsp?msg=invalid");
	}
	}

	
}
