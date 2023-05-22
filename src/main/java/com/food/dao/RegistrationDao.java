package com.food.dao;

import java.sql.SQLException;

import com.food.model.User;

public interface RegistrationDao {
	public void insertUserDetails(User user) throws ClassNotFoundException, SQLException;
	public User getUserDetails(String userName,String password) throws ClassNotFoundException, SQLException;
}
