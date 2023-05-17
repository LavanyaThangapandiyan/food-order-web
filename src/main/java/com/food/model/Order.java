package com.food.model;

public class Order {
int id;
int foodId;
int customerId;
int quantity;
int amount;

public Order(int foodId, int quantity) {
	super();
	this.foodId = foodId;
	this.quantity = quantity;
}
public Order() {
	super();
}
public Order(int id, int foodId, int quantity) {
	super();
	this.id = id;
	this.foodId = foodId;
	this.quantity = quantity;
}
public Order(int id, int foodId, int quantity, int amount) {
	super();
	this.id = id;
	this.foodId = foodId;
	this.quantity = quantity;
	this.amount = amount;
}

public Order(int id, int foodId, int customerId, int quantity, int amount) {
	super();
	this.id = id;
	this.foodId = foodId;
	this.customerId = customerId;
	this.quantity = quantity;
	this.amount = amount;
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


}
