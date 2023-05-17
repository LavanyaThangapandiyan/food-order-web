package com.food.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.food.model.Order;
import com.food.util.ConnectionUtil;
import com.food.validation.Validation;

public class OrderImpl implements OrderDao
{
	Validation valid=new Validation();
	
	public static final String insert="insert into order_item(customer_id,food_id,quantity)values(?,?,?);";
	public static final String find="select price from food_item where id=?";
	public static final String update="update order_item set amount=? where food_id=?";
	public static final String display="select id,food_id,quantity,amount from order_item where id=?";
	public OrderImpl()
	{
		
	}
	
	public void insertOrder(Order order)
	{
		System.out.println(insert);
		Connection con=ConnectionUtil.init();
				
				try (
						
					PreparedStatement ps = con.prepareStatement(insert);)
				  {
					boolean id=valid.numberValidation(order.getCustomerId());
					boolean foodId=valid.numberValidation(order.getFoodId());
					boolean quantit=valid.numberValidation(order.getQuantity());
					if(id==true&&foodId==true&&quantit==true)
					{
					ps.setInt(1, order.getCustomerId());
					ps.setInt(2, order.getFoodId());
					ps.setInt(3, order.getQuantity());
					int executeUpdate = ps.executeUpdate();
					System.out.println(executeUpdate);
					PreparedStatement psFind=con.prepareStatement(find);
					psFind.setInt(1,order.getFoodId());
					ResultSet rs=psFind.executeQuery();
					while(rs.next())
					{
						int price = rs.getInt(1);
						System.out.println(price);	
						int quantity=order.getQuantity();
						int payment=price*quantity;
					PreparedStatement psup=con.prepareStatement(update);
					psup.setInt(1, payment);
					psup.setInt(2, order.getFoodId());
					int executeUpdate1 = psup.executeUpdate();
					System.out.println(executeUpdate1);
					System.out.println(psup);
					
					}
					}else
						System.out.println("Invalid");
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
						
	}
	public Order selectItem(int id)
	{
		Order order=null;
		try(Connection con=ConnectionUtil.init();
				PreparedStatement ps=con.prepareStatement(display);){
			ps.setInt(1, id);
			System.out.println(ps);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				int id1=rs.getInt(1);
				int foodId=rs.getInt(2);
				int quantity=rs.getInt(3);
				int amount=rs.getInt(4);
				order=new Order(id1, foodId, quantity, amount);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return order;
		
		
	}

}
