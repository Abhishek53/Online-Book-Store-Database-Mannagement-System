/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.controllers;
import java.sql.*;
/**
 *
 * @author ABHISHEK R
 */
public class dbconnect {
    private Connection conn=null;
    public Connection connecttodb() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
        
        try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
                
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/online-book-store?useSSL=false","root","abhi1234");
        }
        catch(ClassNotFoundException | SQLException e){
            System.out.println("where is ur db");
            System.out.println(e);
            e.printStackTrace();
            
        }
        
        return conn;
    }
}
