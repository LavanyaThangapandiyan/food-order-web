package com.food.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.food.dao.CustomerImpl;
import com.food.model.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("//")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
private CustomerImpl customer;
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
public void init()
{
	customer =new CustomerImpl();
}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action=request.getServletPath();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		int id=Integer.parseInt(request.getParameter("id"));
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String email=request.getParameter("email");
		String uname=request.getParameter("uname");
		String password=request.getParameter("password");
		User book=new User(id, fname, lname, email, uname, password);
		try {
			customer.updateCustomer(book);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("list");
	}
}
