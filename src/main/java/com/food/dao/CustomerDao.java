package com.food.dao;

import java.sql.SQLException;
import java.util.List;

import com.food.model.User;

public interface CustomerDao {
	public boolean updateCustomer(User user) throws SQLException;
	public User selectCustomer(int id);
    public int findCustomerId(String name) throws SQLException;
}
