package com.java.controllers;

import java.sql.*;
import com.java.controllers.dbconnect;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SignupController", urlPatterns = {"/SignupController"})
public class SignupController extends HttpServlet {
    
    Connection conn;
    Statement st;
    String signup_query;
    String test_query;    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("alkjflkasjdflkkasjdflk");
        String signup_name=request.getParameter("su_name");
        String signup_email=request.getParameter("su_email");
        String signup_phone=request.getParameter("su_phone");
        String signup_address=request.getParameter("su_address");
        String signup_password=request.getParameter("su_password");
        String signup_repassword=request.getParameter("su_repassword");        
        if(!(signup_name==null||signup_name.isEmpty())&&!(signup_email==null||signup_email.isEmpty())&&
               !(signup_phone==null||signup_phone.isEmpty())&&!(signup_address==null||signup_address.isEmpty())&&
               !(signup_password==null||signup_password.isEmpty())&&!(signup_repassword==null||signup_repassword.isEmpty())     
           )
           {
                 if(signup_password.equals(signup_repassword))
                 {
                     test_query="select * from customer where cust_email='"+signup_email+"' and cust_password='"+signup_password+"'";     
                     signup_query="insert into customer(cust_name,cust_email,cust_password,cust_phone,cust_address) values('"+signup_name+"','"+signup_email+"','"+signup_password+"','"+signup_phone+"','"+signup_address+"')";
                     try{
                         dbconnect connect=new dbconnect();
                         conn=connect.connecttodb();
                         st=conn.createStatement();
                         ResultSet rst=st.executeQuery(test_query);
                         if(!rst.next()){
                             int rs=st.executeUpdate(signup_query);
                             if(rs>0){
                                 response.sendRedirect("Login_Activity_Page.jsp");
                             }
                             else{
                                 response.sendRedirect("Signup_Activity_Page.jsp");
                             }
                         }
                         else{
                             response.sendRedirect("Signup_Activity_Page.jsp");
                         }
                         
                        }
                     catch(IOException | ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e){
                         out.print(e);
                         e.printStackTrace();
                     }
                 }
                 else{
                     response.sendRedirect("Signup_Activity_Page.jsp");
                 }
           }
        else{
                     response.sendRedirect("Signup_Activity_Page.jsp");
                 }
        
        
}

    
}
