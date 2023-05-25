package com.food.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.food.dao.OrderImpl;
import com.food.model.Order;

@WebServlet("/alterServlet")
public class alterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public alterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		HttpSession session=request.getSession();
		String customerId=request.getParameter("customerId");
		int cusid=Integer.parseInt(customerId);
		OrderImpl order=new OrderImpl();
		Order or=new Order();
		or.setCustomerId(cusid);
		or.setFoodName(request.getParameter("name"));
		or.setPrice(Integer.parseInt(request.getParameter("price")));
		or.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		order.insertOrder(or);
		request.getRequestDispatcher("break-fast.jsp").forward(request, response);

	}

}
