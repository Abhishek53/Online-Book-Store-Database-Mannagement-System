package com.java.controllers;
import java.sql.*;
import com.java.controllers.models.AccountModel;
//import com.java.controllers.Mannager;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.java.controllers.dbconnect;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    Connection conn;
    Statement st;
    String login_query;
    boolean pass_wrong=false;
    AccountModel cu=null;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
        }
        finally{
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
        String login_email=request.getParameter("login_email");
        String login_password=request.getParameter("login_password");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(login_email);
        out.print(login_password);
        if(login_email.equals("admin@gmail.com")&&login_password.equals("admin1234")){
            cu=new AccountModel();
            cu.setCustomer_name("Admin");
            cu.setCustomer_email("admimn@gmail.com");
            cu.setCustomer_password("admin1234");
            cu.setCustomer_phone("9632579793");
            cu.setCustomer_address("BSK");
                                        
             HttpSession session=request.getSession();
             session.setAttribute("userdetails", cu);
             response.sendRedirect("Mannager_Activity_Page.jsp");
                                        
        }
        else{
        if(!(login_email==null||login_email.isEmpty())&&!(login_password==null||login_password.isEmpty()))
        {
        
            login_query="select * from customer where cust_email='"+login_email+"' and cust_password='"+login_password+"'";     
 
            try{
                dbconnect connect=new dbconnect();
                conn=connect.connecttodb();
                st=conn.createStatement();
                ResultSet rs=st.executeQuery(login_query);
                if (!rs.isBeforeFirst()) {
                    request.setAttribute("isPassOK", "No");
                    RequestDispatcher rd = request.getRequestDispatcher("Login_Activity_Page.jsp");
                    rd.forward(request, response);
		} 
                else {
				if(rs.next()) {
                                        pass_wrong=true;
                                        
                                        cu=new AccountModel();
                                        cu.setCustomer_name(rs.getString("cust_name"));
                                        cu.setCustomer_email(rs.getString("cust_email"));
                                        cu.setCustomer_password(rs.getString("cust_password"));
                                        cu.setCustomer_phone(rs.getString("cust_phone"));
                                        cu.setCustomer_address(rs.getString("cust_address"));
                                        cu.setCustomer_id(rs.getInt("cust_id"));
                                        
                                        HttpSession session=request.getSession();
                                        session.setAttribute("userdetails", cu);
                                        
                                        RequestDispatcher rd=request.getRequestDispatcher("Shop_Activity_Page.jsp");
                                        rd.forward(request, response);
				}
                                
			}
                
            } 
            catch (IOException | ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException | ServletException ex) {
                ex.printStackTrace();
            } 
            
        }
        else
        {
                    request.setAttribute("isPassOK", "No");
                    RequestDispatcher rd = request.getRequestDispatcher("Login_Activity_Page.jsp");
                    rd.forward(request, response);
        }
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
