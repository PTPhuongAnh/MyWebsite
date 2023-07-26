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
 * Servlet implementation class SearchCate
 */
@WebServlet("/search_to_cate")
public class SearchCate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		String txtSearch=request.getParameter("txt");
		CategoryDao dao=new CategoryDao(DbCon.getConnection());
		List<Category> list=dao.SearchByName(txtSearch);
		
		if( txtSearch==null) {
			list=null;
			response.sendRedirect("ThongtinCate.jsp");
			return;
		}

			
		
		request.setAttribute("listP", list);
		request.setAttribute("txtS", txtSearch);
		request.getRequestDispatcher("ThongtinCate.jsp").forward(request, response);
		
	}

}
