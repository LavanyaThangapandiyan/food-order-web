package com.food.dao;

import java.sql.SQLException;
import java.util.List;

import com.food.model.Order;

public interface OrderDao {
	public void insertOrder(Order order);
	public void deleteOrder(int id) throws SQLException;
}
