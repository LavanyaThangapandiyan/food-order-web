package com.food.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.food.util.ConnectionUtil;

public class HistoryImpl
{
	
	public void deleteHistory(int id)
	{
		try{Connection con=ConnectionUtil.init();
		String delete="delete from cart where id=?";
		PreparedStatement ps=con.prepareStatement(delete);
		ps.setInt(1, id);
		int executeUpdate = ps.executeUpdate();
		System.out.println(executeUpdate);
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	public void deleteAll(int customerId)
	{
		try{Connection con=ConnectionUtil.init();
		String delete="delete from cart  where customer_id=?";
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
