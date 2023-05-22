package com.food.model;

public class Order {
int id;
int foodId;
int price;
int customerId;
int quantity;
int amount;
String foodName;





public Order(int foodId, int price, String foodName) {
	super();
	this.foodId = foodId;
	this.price = price;
	this.foodName = foodName;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getFoodId() {
	return foodId;
}
public void setFoodId(int foodId) {
	this.foodId = foodId;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public int getCustomerId() {
	return customerId;
}
public void setCustomerId(int customerId) {
	this.customerId = customerId;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public int getAmount() {
	return amount;
}
public void setAmount(int amount) {
	this.amount = amount;
}
public String getFoodName() {
	return foodName;
}
public void setFoodName(String foodName) {
	this.foodName = foodName;
}
public Order(int price, int customerId, int quantity, String foodName) {
	super();
	this.price = price;
	this.customerId = customerId;
	this.quantity = quantity;
	this.foodName = foodName;
}
public Order() {
	super();
}





}
