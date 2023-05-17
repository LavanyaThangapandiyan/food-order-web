package com.food.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.food.dao.RegistrationImpl;
import com.food.model.User;

/**
 * Servlet implementation class UserRegister
 */
@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		RegistrationImpl reg=new RegistrationImpl();
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		String submitType=request.getParameter("submit");
		User user=new User();
		user=reg.getUserDetails(userName, password);
		
		if(submitType.equals("Login")&&user.getFirstName()!=null&&user.getLastName()!=null&&user.getEmail()!=null&&user.getUserName()!=null&&user.getPassword()!=null)
		{
			
			request.setAttribute("message",user.getFirstName());
			request.setAttribute("message", user.getLastName());
			request.setAttribute("message",user.getEmail());
			request.getRequestDispatcher("menuCard.jsp").forward(request, response);
		}
	else if(submitType.equals("Register"))
	{
		user.setFirstName(request.getParameter("firstname"));
		user.setLastName(request.getParameter("lastname"));
		user.setEmail(request.getParameter("email"));
		user.setUserName(request.getParameter("userName"));
		user.setPassword(request.getParameter("password"));
		 reg.insertUserDetails(user);
		 request.setAttribute("SuccessMessage", "Registration done,Please login to Continue..");
		 request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	else {
		request.setAttribute("message","Data Not Found,Click On Register");
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}
	}
}