package com.food.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminValidation")
public class AdminValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminValidation() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String name=request.getParameter("userName");
		String password=request.getParameter("password");
		if(name.equals("Lavanya")&&password.equals("Lavanya@26"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("item-list.jsp");
			rd.forward(request, response);
			
		}else
		{
		    out.println("<p>Invalid User Please Register First.</p>");
			RequestDispatcher rd1=request.getRequestDispatcher("AdminLogin.jsp");
			rd1.forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("AdminLogin.jsp");
		HttpSession session=request.getSession();
		String name=request.getParameter("userName");
		session.setAttribute("name",name);
		response.sendRedirect("ItemServlet");
		
	}

}
