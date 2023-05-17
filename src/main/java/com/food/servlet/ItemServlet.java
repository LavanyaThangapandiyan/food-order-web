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

import com.food.dao.ItemImpl;
import com.food.model.FoodItem;

@WebServlet("/")
public class ItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private ItemImpl itemImpl ;
    public ItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init()
    {
    	itemImpl =new ItemImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action=request.getServletPath();
		try {
			switch(action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertItem(request, response);
				break;
			case "/delete":
				deleteItem(request,response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateItem(request, response);
				break;
			default :
				listItem(request, response);
				break;
					
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private void listItem(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		List<FoodItem> listItem=itemImpl.selectAllItems();
		request.setAttribute("listItem", listItem);
		RequestDispatcher dispatcher=request.getRequestDispatcher("item-list.jsp");
		dispatcher.forward(request, response);
	}
	
	
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("item-form.jsp");
		dispatcher.forward(request, response);
	}
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		FoodItem olditem=itemImpl.selectItem(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("item-form.jsp");
		request.setAttribute("item", olditem);
		dispatcher.forward(request, response);
	}
	private void insertItem(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		String name=request.getParameter("name");
		String price=request.getParameter("price");
		FoodItem newItem=new FoodItem(name,price);
		itemImpl.insertItem(newItem);
		response.sendRedirect("list");
	}
	private void updateItem(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException{
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		String price=request.getParameter("price");
		FoodItem book=new FoodItem(id, name, price);
		itemImpl.updateItem(book);
		response.sendRedirect("list");
	}
	private void deleteItem(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		itemImpl.deleteItem(id);
		response.sendRedirect("list");
	}
	
}
