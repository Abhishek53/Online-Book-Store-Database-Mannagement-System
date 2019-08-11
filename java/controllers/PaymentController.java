/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.controllers;
import com.java.controllers.dbconnect;
import com.java.controllers.models.Cart;
import com.java.controllers.models.LineItem;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
/**
 *
 * @author ABHISHEK R
 */
@WebServlet(name = "PaymentController", urlPatterns = {"/PaymentController"})
public class PaymentController extends HttpServlet {
    
    String query;
    String update_copies;
    Cart c;
    Connection conn=null;
    PreparedStatement st=null;
    Statement st1=null;
    Statement st2=null;
    ArrayList <LineItem> items;
    int copies,bk;

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
            out.println("<title>Servlet PaymentController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentController at " + request.getContextPath() + "</h1>");
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
                float total_amount=Float.parseFloat(request.getParameter("total_amount"));
                
                //String []book_id_a=(request.getParameterValues("book_id"));
                //String []quantity_a=request.getParameterValues("quantity");
                //int []a=new int[100];
                //int []b=new int[100];
                //int i=0;
                //int j=0;
                try{
                    dbconnect connect=new dbconnect();
                    conn=connect.connecttodb();
                    
                    query="insert into buys(cust_id,count,payment_status,book_id) values(?,?,?,?);";
                    st=conn.prepareStatement(query);
                    
                    c=(Cart) request.getSession(false).getAttribute("cart");
                    //fail_query="insert into buys(cust_id,count,payment_status,book_id) values(?,?,"+"'Unsuccessful',"+"?"+")";
                    items = c.getItems();

                }
                catch(Exception e){
                    e.printStackTrace();
                }
                /*try{
                    if(conn!=null){
                        for(String k:book_id_a){
                            a[i]=Integer.parseInt(k);
                            i++;
                        }
                        
                        for(String z:quantity_a){
                            b[j]=Integer.parseInt(z);
                            j++;
                        }
                        
                        for(int p=0;p<a.length;p++){
                                int book_id=a[p];
                                int quantity=b[p];
                                st.setInt(1, cust_id);
                                st.setInt(2, quantity);
                                if(cust_id>0 && total_amount>0){
                                    st.setString(3, "Successful");
                                }
                                else{
                                st.setString(3, "Unsuccessful");
                                }
                                st.setInt(4, book_id);
                                int c=st.executeUpdate();
                                if(c>0){
                                    response.sendRedirect("Shop_Activity_Page.jsp");
                                }
                                else{
                                    response.sendRedirect("Cart_Payment.jsp");
                                }

                   
                }
                    }
                }
                catch(Exception e){
                  e.printStackTrace();
                }*/
                try{
                if(c!=null){
                for(LineItem line : items){
                    int book_id=line.getbook_id();
                    int quantity=line.getQuantity();
                    
                        st.setInt(1, cust_id);
                        st.setInt(2, quantity);
                        if(cust_id>0 && total_amount>0){
                            st.setString(3, "Successful");
                        }
                        else{
                        st.setString(3, "Unsuccessful");
                        }
                        st.setInt(4, book_id);
                        int i=st.executeUpdate();
                        st1=conn.createStatement();
                        ResultSet rs1=st1.executeQuery("select copies from books where book_id="+book_id+"");
                                while(rs1.next()){
                                    copies=rs1.getInt("copies");
                                }
                        update_copies="update books set copies="+(copies-quantity)+" where book_id="+book_id+"";
                        st2=conn.createStatement();
                        int o=st2.executeUpdate(update_copies);
                        
                        if(i>0){
                            c.removeAllItems();
                            response.sendRedirect("Shop_Activity_Page.jsp");
                        }
                        else{
                            response.sendRedirect("Cart_Payment.jsp");
                        }
                    
                   
                }     
            }
                else{
                    
                    System.out.println("c is nulllll");
                }
           }
                catch(Exception e){
                    e.printStackTrace();
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
