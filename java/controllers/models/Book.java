/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.controllers.models;

/**
 *
 * @author ABHISHEK R
 */
import java.io.Serializable;
import java.util.ArrayList;


public class Book implements Serializable {
	private int book_id;
	private int auth_id;
	private int pub_id;
	private String title;
	private String pub_year;
	private String type;
	private float price;
        private String desc;
        private String auth_name;
        private String pub_name;
	
	public Book(int book_id, int auth_id, int pub_id, String title,
			String pub_year, String type, float price,
			String desc, String auth_name,String pub_name) {
		this.book_id = book_id;
		this.auth_id = auth_id;
		this.pub_id = pub_id;
		this.title = title;
		this.pub_year = pub_year;
		this.type = type;
		this.price = price;
		this.desc = desc;
                this.auth_name=auth_name;
                this.pub_name=pub_name;
	}
	
	public Book() {
		
		this.book_id = 0;
		this.auth_id = 0;
		this.pub_id = 0;
		this.title = "";
		this.pub_year = "";
		this.type = "";
		this.price = (float) 0.0;
		this.desc = "";
                this.auth_name="";
                this.pub_name="";
	}

	public int getbook_id() {
		return book_id;
	}

	public void setbook_id(int book_id) {
		this.book_id = book_id;
	}
        
        public int getauth_id() {
		return auth_id;
	}

	public void setauth_id(int auth_id) {
		this.auth_id = auth_id;
	}
        
        public int getpub_id() {
		return pub_id;
	}

	public void setpub_id(int pub_id) {
		this.pub_id = pub_id;
	}
        
        public String gettitle() {
		return title;
	}

	public void settitle(String title) {
		this.title = title;
	}
        
        public String getpub_year() {
		return pub_year;
	}

	public void setpub_year(String pub_year) {
		this.pub_year = pub_year;
	}
        
        public String gettype() {
		return type;
	}

	public void settype(String type) {
		this.type = type;
	}
        
        public String getdesc() {
		return desc;
	}

	public void setdesc(String desc) {
		this.desc = desc;
	}
        
        
        public String getauth_name() {
		return auth_name;
	}

	public void setauth_name(String auth_name) {
		this.auth_name = auth_name;
	}
        
        public String getpub_name() {
		return pub_name;
	}
        public void setpub_name(String pub_name) {
		this.pub_name = pub_name;
	}
     
        public float getprice() {
		return price;
	}
        
	public void setprice(float price) {
		this.price = price;
	}

	
        
}
