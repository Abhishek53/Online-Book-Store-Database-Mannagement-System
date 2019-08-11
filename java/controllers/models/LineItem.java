/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.controllers.models;

import java.io.Serializable;
import java.text.NumberFormat;

/**
 *
 * @author ABHISHEK R
 */
public class LineItem implements Serializable {
	private int book_id;
	private String title;
        private int quantity;
	private float price;
	
	
	
	public LineItem(int lineItemId, int transactionId, int book_id,String title, int quantity, float price) {
		this.book_id = book_id;
		this.quantity = quantity;
		this.title = title;
                this.price=price;
	}

	public LineItem() {
		this.book_id = 0;
		this.quantity = 0;
		this.title = "";
                this.price=(float) 0.0;
	}

	public int getbook_id() {
		return book_id;
	}

	public void setbook_id(int book_id) {
		this.book_id = book_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public float getPrice() {
	        return price;
	}
        public void setPrice(float price){
                this.price=price;
    
        }
	
	
	
}