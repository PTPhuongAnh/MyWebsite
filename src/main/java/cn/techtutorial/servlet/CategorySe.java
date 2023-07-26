package cn.techtutorial.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.CategoryDao;
import cn.techtutorial.dao.ProductDao;
import cn.techtutorial.model.Category;
import cn.techtutorial.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



/**
 * Servlet implementation class CategorySe
 */
@WebServlet("/category")
public class CategorySe extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String CateId=request.getParameter("cid");
		ProductDao dao= new ProductDao(DbCon.getConnection());
		List<Product> list=dao.getAllProductsByCID(CateId);
		CategoryDao cate=new CategoryDao(DbCon.getConnection());
		List<Category> listC=cate.getAllCategory();
		
		request.setAttribute("listP", list);
		request.setAttribute("listCC", listC);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	
		}
			
		}
		
	

	


