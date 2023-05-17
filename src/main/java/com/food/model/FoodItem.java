package com.food.model;

public class FoodItem {
	int id;
	String name;
	String price;
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
	
}