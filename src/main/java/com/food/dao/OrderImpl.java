package com.food.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.food.model.Order;
import com.food.util.ConnectionUtil;
import com.food.validation.Validation;

public class OrderImpl implements OrderDao
{
	Validation valid=new Validation();	
	public static final String insert="insert into order_item(customer_id,food_name,price,quantity)values(?,?,?,?);";
	public static final String update="update order_item set amount=? where food_name=?";
	public static final String display="select name,price from food_item where id=?";
	public OrderImpl()
	{
		
	}
	public void insertOrder(Order order)
	{
		Connection con=ConnectionUtil.init();
				try (	
					PreparedStatement ps = con.prepareStatement(insert);)
				  {
				    boolean id=valid.numberValidation(order.getCustomerId());
					boolean price=valid.numberValidation(order.getPrice());
					boolean quantit=valid.numberValidation(order.getQuantity());
					if(id==true&&price==true&&quantit==true)
					{
					ps.setInt(1, order.getCustomerId());
					ps.setString(2, order.getFoodName());
					ps.setInt(3, order.getPrice());
					ps.setInt(4, order.getQuantity());
					int executeUpdate = ps.executeUpdate();
					System.out.println(executeUpdate);
						int amount=order.getQuantity()*order.getPrice();
						PreparedStatement psup=con.prepareStatement(update);
						psup.setInt(1,amount);
						psup.setString(2, order.getFoodName());
						int executeUpdate2 = psup.executeUpdate();
						System.out.println(executeUpdate2);
						String findQuantity="select quantity from food_item where name=?";
						PreparedStatement psfind=con.prepareStatement(findQuantity);
						psfind.setString(1, order.getFoodName());
						ResultSet rs=psfind.executeQuery();
						while(rs.next())
						{
							int total=rs.getInt(1);
							int updateOuantity=total-order.getQuantity();
							String updateQuantity="update food_item set quantity=? where name=?";
							PreparedStatement psq=con.prepareStatement(updateQuantity);
							psq.setInt(1,updateOuantity);
							psq.setString(2, order.getFoodName());
							int executeUpdate3 = psq.executeUpdate();
							System.out.println(executeUpdate3);
						}
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
						
	}
	@Override
	public void deleteOrder(int id) throws SQLException {
		// TODO Auto-generated method stub
		try{Connection con=ConnectionUtil.init();
		String delete="delete from order_item where id=?";
		PreparedStatement ps=con.prepareStatement(delete);
		ps.setInt(1, id);
		int executeUpdate = ps.executeUpdate();
		System.out.println(executeUpdate);
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	@Override
	public void deleteAll(int customerId) throws SQLException {
		// TODO Auto-generated method stub
		try{Connection con=ConnectionUtil.init();
		String delete="delete from  order_item where customer_id=?";
		PreparedStatement ps=con.prepareStatement(delete);
		ps.setInt(1, customerId);
		int executeUpdate = ps.executeUpdate();
		System.out.println(executeUpdate);
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
	}
	
	
	

}
