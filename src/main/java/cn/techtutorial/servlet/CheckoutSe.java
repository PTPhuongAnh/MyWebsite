package cn.techtutorial.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.OrderDao;
import cn.techtutorial.model.Cart;
import cn.techtutorial.model.Order;
import cn.techtutorial.model.User;

@WebServlet("/check-out-cart")
public class CheckoutSe extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out=response.getWriter()){
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date=new Date();
			//retrive all cart prodcuts
			ArrayList<Cart> cart_list=(ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			//user authe
			User auth=(User)request.getSession().getAttribute("auth");
			//check auth and cart list
			
			if(cart_list !=null && auth!=null) {
				for(Cart c:cart_list) {
					//prepare the order o
						Order order=new Order();
						order.setId(c.getId());
						order.setUid(auth.getId());
						order.setQuantity(c.getQuantity());
						order.setDate(formatter.format(date));
						//instantitae the dao class
						OrderDao oDao=new OrderDao(DbCon.getConnection());
					boolean result=	oDao.insertOrder(order);
						if(!result) break;
				}
				cart_list.clear();
				response.sendRedirect("orders.jsp");
				
			}else {
				if(auth==null) response.sendRedirect("login.jsp");
				response.sendRedirect("cart.jsp");
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
