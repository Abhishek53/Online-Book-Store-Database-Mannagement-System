package com.java.controllers;

import com.java.controllers.models.Cart;
import com.java.controllers.models.LineItem;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String rmitem=request.getParameter("rmcitem");
        int rmid = Integer.parseInt(request.getParameter("rmcbook_id"));
        int book_id = Integer.parseInt(request.getParameter("book_id"));
        String title = request.getParameter("title");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        float price = Float.parseFloat(request.getParameter("price"));
        HttpSession session = request.getSession();
        Cart cart=(Cart) session.getAttribute("cart");
        if(rmitem.equals("remove"))
        {
            cart.remove(rmid);
            response.sendRedirect("Cart_Payment.jsp");
        }
        else{
        if(cart==null){
            cart=new Cart();
        }
        if(title!=null){
        LineItem lineItem = new LineItem();
        lineItem.setbook_id(book_id);
        lineItem.setTitle(title);
        lineItem.setQuantity(quantity);
        lineItem.setPrice(price);
        cart.add(lineItem);
        PrintWriter out = response.getWriter();
        }
        session.setAttribute("cart", cart);
        response.sendRedirect("Shop_Activity_Page.jsp");
        //request.setAttribute(cart, cart);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
