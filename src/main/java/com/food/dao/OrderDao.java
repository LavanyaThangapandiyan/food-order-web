package com.food.dao;

import com.food.model.Order;

public interface OrderDao {
	public void insertOrder(Order order);
	public Order selectItem(int id);
}
