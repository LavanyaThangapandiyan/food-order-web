package com.food.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.food.model.FoodItem;
import com.food.util.ConnectionUtil;
import com.food.validation.Validation;

public class ItemImpl implements ItemDao {
	Validation valid=new Validation();
	public static final String insert="insert into food_item(name,price,Category,food_type,Quantity)values(?,?,?,?,?)";
	public static final String display="select id,name,price,Category,food_type,Quantity from food_item where id=?";
	public static final String show="select *from food_item";
	public static final String update="update food_item set name=?,price=?,Category=?,food_type=?,Quantity=? where id=?;";
	public static final String delete="delete from food_item where id=?";
	
public ItemImpl()
{
	
}
	//insert item
public void insertItem(FoodItem item) throws SQLException
{
	
	System.out.println(insert);
	       Connection con=ConnectionUtil.init();
	        String find="select name from food_item where Category=?";
			PreparedStatement psf=con.prepareStatement(find);
			psf.setString(1,item.getCategory());
			ResultSet rs=psf.executeQuery();
			while(rs.next())
			{
				String foodName=rs.getString(1);
				String name = item.getName();
				if(foodName != name)
				{
					PreparedStatement ps=con.prepareStatement(insert);
					ps.setString(1, item.getName());
					ps.setString(2, item.getPrice());
					ps.setString(3, item.getCategory());
					ps.setString(4, item.getFood_type());
					ps.setInt(5, item.getQuantity());
					System.out.println(ps);
					int executeUpdate = ps.executeUpdate();
					System.out.println(executeUpdate);	
				}else
					System.out.println("Data Not Inserted");
			}			
	}
//update food item
public boolean updateItem(FoodItem item) throws SQLException
{
	boolean rowUpdated;
	try(Connection con=ConnectionUtil.init();
			PreparedStatement ps=con.prepareStatement(update);)
	{
		ps.setString(1, item.getName());
		ps.setString(2, item.getPrice());
		ps.setString(3, item.getCategory());
		ps.setString(4, item.getFood_type());
		ps.setInt(5, item.getQuantity());
		ps.setInt(6, item.getId());
		rowUpdated=ps.executeUpdate()>0;
	}	
	return rowUpdated;
}
//Select Item By id
public FoodItem selectItem(int id)
{
	FoodItem item=null;
	try(Connection con=ConnectionUtil.init();
			PreparedStatement ps=con.prepareStatement(display);){
			ps.setInt(1, id);
			System.out.println(ps);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				String name=rs.getString("name");
				String price=rs.getString("price");
				String category=rs.getString("category");
				String type=rs.getString("food_type");
				int quantity=rs.getInt("Quantity");
				item=new FoodItem(id, name, price, category, type, quantity);
			}
	}catch(SQLException ex)
	{
	ex.printStackTrace();		
	}
	
	return item;	
}
public List<FoodItem> selectAllItems()
{
	List<FoodItem> item=new ArrayList<>();
	try(Connection con=ConnectionUtil.init();
			PreparedStatement ps=con.prepareStatement(show);){
		System.out.println(ps);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			int id=rs.getInt("id");
			String name=rs.getString("name");
			String price=rs.getString("price");
			String category=rs.getString("Category");
			String type=rs.getString("food_type");
			int quantity=rs.getInt("Quantity");
			item.add(new FoodItem(id, name, price, category, type, quantity));
			
		}
	}catch(SQLException e)
	{
		printSQLException(e);
	}
	
	return item;
	
}
public boolean deleteItem(int id) throws SQLException
{
	boolean rowDeleted;
	try(Connection con=ConnectionUtil.init();
			PreparedStatement ps=con.prepareStatement(delete)){
		ps.setInt(1, id);
		rowDeleted =ps.executeUpdate()>0;
	}
	return rowDeleted;
	
}

private void printSQLException(SQLException ex)
{
	for (Throwable e : ex) {
		if (e instanceof SQLException) {
			e.printStackTrace(System.err);
			System.err.println("SQLState: " + ((SQLException) e).getSQLState());
			System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
			System.err.println("Message: " + e.getMessage());
			Throwable t = ex.getCause();
			while (t != null) {
				System.out.println("Cause: " + t);
				t = t.getCause();
			}
		}
	}
}
}