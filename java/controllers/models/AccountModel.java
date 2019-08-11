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
public class AccountModel {
    
    String customer_name, customer_email, customer_password, customer_phone, customer_address;
    int customer_id;
    
    public int getCustomer_id(){
        return customer_id;
    }
    public void setCustomer_id(int id){
        this.customer_id=id;
    }
    
    public String getCustomer_name(){
        return customer_name;
    }
    public void setCustomer_name(String name){
        this.customer_name=name;
    }
    
    public String getCustomer_email(){
        return customer_email;
    }
    public void setCustomer_email(String email){
        this.customer_email=email;
    }
    
    public String getCustomer_password(){
        return customer_password;
    }
    public void setCustomer_password(String password){
        this.customer_password=password;
    }
    
    public String getCustomer_phone(){
        return customer_phone;
    }
    public void setCustomer_phone(String phone){
        this.customer_phone=phone;
    }
    
    public String getCustomer_address(){
        return customer_address;
    }
    public void setCustomer_address(String address){
        this.customer_address=address;
    }
    
}
