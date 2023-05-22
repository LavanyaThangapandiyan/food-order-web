package com.food.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.food.dao.OrderImpl;
import com.food.model.Order;
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderImpl orderimpl;
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init()
    {
    	orderimpl=new OrderImpl();
    }   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action=request.getServletPath();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String submitType=request.getParameter("submit");
		if(submitType.equals("Confirm"))
		{
			
			HttpSession session = request.getSession();
	        String customerId = (String)session.getValue("customerId");
	     int csid=Integer.parseInt(customerId);
		Order order=new Order();
		OrderImpl or=new OrderImpl();
		order.setCustomerId(csid);
		order.setFoodName(request.getParameter("name"));
		order.setPrice(Integer.parseInt(request.getParameter("price")));
		order.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		or.insertOrder(order);
		request.getRequestDispatcher("menuCard.jsp").forward(request, response);
		
		
	}else if(submitType.equals("Cancel"))
	{
		request.getRequestDispatcher("order-form.jsp").forward(request, response);
	}
	else
	{
		request.getRequestDispatcher("order-form.jsp").forward(request, response);
	}
	}
	
}
