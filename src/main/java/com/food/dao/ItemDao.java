package com.food.dao;

import java.sql.SQLException;
import java.util.List;

import com.food.model.FoodItem;


public interface ItemDao {
	public void insertItem(FoodItem item) throws SQLException;
	public boolean updateItem(FoodItem item) throws SQLException, ClassNotFoundException;
	public FoodItem selectItem(int id) throws ClassNotFoundException, SQLException;
	public List<FoodItem> selectAllItems() throws ClassNotFoundException;
	public boolean deleteItem(int id) throws SQLException, ClassNotFoundException;
}
