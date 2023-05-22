package com.food.model;

public class FoodItem {
	int id;
	String name;
	String price;
	String category;
	String food_type;
	int quantity;
	public FoodItem(int id, String name, String price) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
	}
	public FoodItem(String name, String price) {
		super();
		this.name = name;
		this.price = price;
	}
	public FoodItem() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		category = category;
	}
	public String getFood_type() {
		return food_type;
	}
	public void setFood_type(String food_type) {
		this.food_type = food_type;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		quantity = quantity;
	}
	public FoodItem(int id, String name, String price, String category, String food_type, int quantity) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.category = category;
		this.food_type = food_type;
		this.quantity = quantity;
	}
	
	
}