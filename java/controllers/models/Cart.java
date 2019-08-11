/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.controllers.models;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author ABHISHEK R
 */
public class Cart implements Serializable{
	private ArrayList<LineItem> items;

	public Cart(ArrayList<LineItem> items) {
		this.items = items;
	}

	public Cart() {
		this.items = new ArrayList<LineItem>();
	}

	public ArrayList<LineItem> getItems() {
		return items;
	}

	public void setItems(ArrayList<LineItem> items) {
		this.items = items;
	}

	public void add(LineItem item) {
        //If the item already exists in the cart, only the quantity is changed.
        int code = item.getbook_id();
        int quantity = item.getQuantity();
        for (int i = 0; i<items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getbook_id()==code) {
                lineItem.setQuantity(quantity);
                return;
            }
        } 
        items.add(item);
    }
	
	// Used to empty cart after order has been processed
	public void removeAllItems() {
		items = new ArrayList<LineItem>();
	}
    
    public void remove(int bk_id) {
        int code = bk_id;
        for (int i = 0; i<items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getbook_id()==code) {
                items.remove(i);
                return;
            }
        }
    }	
}
