package cn.techtutorial.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.CategoryDao;
import cn.techtutorial.dao.ProductDao;
import cn.techtutorial.model.Category;
import cn.techtutorial.model.Product;

/**
 * Servlet implementation class SearchPr
 */
@WebServlet("/search12")
public class SearchPr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		String txtSearch=request.getParameter("txt");
		ProductDao dao=new ProductDao(DbCon.getConnection());
		List<Product> list=dao.SearchByName(txtSearch);
		 CategoryDao cate=new CategoryDao(DbCon.getConnection());
			List<Category> listC=cate.getAllCategory();
			
      
		request.setAttribute("listCC", listC);
		request.setAttribute("listP", list);
		request.setAttribute("txtS", txtSearch);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

	
}
