package com.food.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.food.dao.OrderImpl;
import com.food.model.Order;
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String submitType=request.getParameter("submit");
		if(submitType.equals("Confirm"))
		{
		doGet(request, response);
		OrderImpl or=new OrderImpl();
		
		int foodId=Integer.parseInt(request.getParameter("foodId"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		int customerId=Integer.parseInt(request.getParameter("customerId"));
		Order order=new Order(customerId, foodId, customerId, quantity, customerId);
		or.insertOrder(order);
		
		request.getRequestDispatcher("total.jsp").forward(request, response);
		
		
	}else
	{
		request.getRequestDispatcher("menuCard.jsp").forward(request, response);
	}
	}
}
