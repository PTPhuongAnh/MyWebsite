package cn.techtutorial.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import cn.techtutorial.model.Cart;



/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/add-to-cart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html;charset=utf-8");
	try(PrintWriter out=response.getWriter()){
		ArrayList<Cart> cartList=new ArrayList<>();
		int id=Integer.parseInt(request.getParameter("id"));
		Cart cm=new Cart() ;
			cm.setId(id);
			cm.setQuantity(1);
			HttpSession session= request.getSession();
		ArrayList<Cart> cart_list=	(ArrayList<Cart>) session.getAttribute("cart-list");
		if(cart_list==null) {
			cartList.add(cm);
			session.setAttribute("cart-list", cartList);
			response.sendRedirect("home");
			
		}else {
			cartList=cart_list;
			boolean exist=false;
		//	cartList.contains(cm);
			
			for(Cart c:cartList) {
				if(c.getId()==id) {
					exist=true;
					out.print("<h3 style='color:crimson; text-align:center'>Item already exist in cart.<a href='cart.jsp'>Go to Cart Page</a>");
				}
			}
				if(!exist) {
					cartList.add(cm);
					response.sendRedirect("home");
				}
		
		}
		
			
			
		}
	
	}
	}

	

