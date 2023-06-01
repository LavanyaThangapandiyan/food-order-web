package com.food.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.food.dao.CustomerImpl;
import com.food.dao.RegistrationImpl;
import com.food.exception.EmailException;
import com.food.exception.PasswordException;
import com.food.model.User;
import com.food.validation.Validation;

/**
 * Servlet implementation class UserRegister
 */
@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Validation valid=new Validation();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegister() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		User user=new User();
		
		doGet(request, response);
		CustomerImpl customer=new CustomerImpl();
		RegistrationImpl reg=new RegistrationImpl();
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		String submitType=request.getParameter("submit");
		user=reg.getUserDetails(userName, password);
	try{if(submitType.equals("Login")&&user.getFirstName()!=null&&user.getLastName()!=null&&user.getEmail()!=null&&user.getUserName()!=null&&user.getPassword()!=null)
		{
		
			int customerId=customer.findCustomerId(userName);
			String id=String.valueOf(customerId);
			HttpSession session=request.getSession(true);
			session.putValue("customerId", id);
			session.putValue("userName", userName);
			response.sendRedirect("menuCard.jsp");
			request.setAttribute("message",user.getFirstName());
			request.setAttribute("message", user.getLastName());
			
			request.setAttribute("message",user.getEmail());
			//request.getRequestDispatcher("menuCard.jsp").forward(request, response);	
		}
	   else if(submitType.equals("Register"))
	    { 
		//boolean email=valid.emailValidation(request.getParameter("email"));
		//boolean password1=valid.passwordValidation(request.getParameter("password"));
		 user.setFirstName(request.getParameter("firstname"));
		 user.setLastName(request.getParameter("lastname"));
		 user.setEmail(request.getParameter("email"));
		 user.setUserName(request.getParameter("userName"));
		 user.setPassword(request.getParameter("password"));
		 reg.insertUserDetails(user);
		 request.getRequestDispatcher("register.jsp").forward(request, response);
		 
		 //request.setAttribute("SuccessMessage", "Registration done,Please login to Continue..");
	     }
	 else {
		request.setAttribute("message","Data Not Found,Click On Register");
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	    }
	}catch(Exception e)
		{
		e.printStackTrace();
		}	}
}
