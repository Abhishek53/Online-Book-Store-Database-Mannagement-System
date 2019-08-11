/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.controllers;

import com.java.controllers.models.AccountModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.java.controllers.dbconnect;
/**
 *
 * @author ABHISHEK R
 */
@WebServlet(name = "AccountController", urlPatterns = {"/AccountController"})
public class AccountController extends HttpServlet {
    Connection conn;
    Statement st;
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AccountController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
                
        int cust_id=Integer.parseInt(request.getParameter("cust_id"));
        String btn_value=request.getParameter("button");
        if(btn_value.equals("pwdsub")){
            response.sendRedirect("Password_Update.jsp");
        }
        if(btn_value.equals("pwdupd")){
            String old_password=request.getParameter("old_password");
            String new_password=request.getParameter("new_password");
            String curr_password=request.getParameter("cur_pwd");
            String upd_query="update customer set cust_password='"+new_password+"' where cust_id="+cust_id+";";
            if(curr_password.equals(old_password)){
                try{
                    dbconnect connect=new dbconnect();
                    conn=connect.connecttodb();
                    st=conn.createStatement();
                    int u=st.executeUpdate(upd_query);
                    response.sendRedirect("Accountdetails_Activity_Page.jsp");
                }
                catch(Exception e){
                    
                }
                
            }
            else{
                response.sendRedirect("Password_Update.jsp");
            }
        }
        if(btn_value.equals("delacc")){
            String del_query="delete from customer where cust_id="+cust_id+";";
            try{
                    dbconnect connect=new dbconnect();
                    conn=connect.connecttodb();
                    st=conn.createStatement();
                    int u=st.executeUpdate(del_query);
                    response.sendRedirect("Logout_Activity.jsp");
                }
                catch(Exception e){
                    
                }
                
            
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
