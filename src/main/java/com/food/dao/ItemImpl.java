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
	public static final String insert="insert into food_item(name,price)values(?,?);";
	public static final String display="select id,name,price from food_item where id=?";
	public static final String show="select *from food_item";
	public static final String update="update food_item set name=?,price=? where id=?;";
	public static final String delete="delete from food_item where id=?";
	
public ItemImpl()
{
	
}
	//insert item
public void insertItem(FoodItem item) throws SQLException
{
	
	System.out.println(insert);
	try(Connection con=ConnectionUtil.init();
			PreparedStatement ps=con.prepareStatement(insert)){
		boolean name=valid.nameValidation(item.getName());
		if(name==true)
		{
		ps.setString(1, item.getName());
		ps.setString(2, item.getPrice());
		System.out.println(ps);
		ps.executeUpdate();
	}else
		System.out.println("Invalid Data");
	}
	catch(Exception e)
	{
		e.printStackTrace();
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
		ps.setInt(3, item.getId());
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
				item=new FoodItem(id,name,price);
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
			item.add(new FoodItem(id,name,price));
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