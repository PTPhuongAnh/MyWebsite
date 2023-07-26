package cn.techtutorial.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.ProductDao;
import cn.techtutorial.model.Product;

/**
 * Servlet implementation class AddToProduct
 */
@WebServlet("/add_to_pr123")
public class AddToProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		  String name = request.getParameter("name");
	       String category = request.getParameter("category");
	        String price = request.getParameter("price");
	        String image=request.getParameter("image");
	        String cid=request.getParameter("cid");
	        String description=request.getParameter("description");
	        String submit=request.getParameter("submit");
	      
             ProductDao dao=new ProductDao(DbCon.getConnection());
             Product a=dao.Check(name);
             if(a==null) {
             dao.addtopr(name, category, price, image, cid,description);
             response.sendRedirect("manager.jsp?msg=valid");
	}else {
		response.sendRedirect("manager.jsp?msg=invalid");
	}
	}

	

}
