<%-- 
    Document   : Mannager_Activity_Page
    Created on : Nov 24, 2018, 2:47:42 AM
    Author     : ABHISHEK R
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.java.controllers.dbconnect"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.java.controllers.models.AccountModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mannager Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        

        
    </head>
    <body>
        <!-- Navigation --> 
        <%!AccountModel ac = null;
            Connection conn=null;
            String stk;
            String color;
        
        %>

	<%
            ac = (AccountModel)session.getAttribute("userdetails");
	%>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
                <div class="container-fluid">
                        <a><i class="fa fa-book book-icon"></i></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                                <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarResponsive">
                                <ul class="navbar-nav ml-auto">
                                        <%if(ac!=null){%>
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                               area-haspopus="true" aria-expanded="false"><i class="fa fa-user" aria-hidden="true"></i> Account</a>
                                            <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background: #d5d5d5">
                                                <a class="dropdown-item" href="Accountdetails_Activity_Page.jsp">Account Settings</a>
                                                <a class="dropdown-item" href="Logout_Activity.jsp">Signout</a>
                                                
                                            </div>
                                        </li>
                                        <%}%>
                                </ul>
                            
                        </div>
                </div>

        </nav>
                                
         <div class="col-12 text-center">
                                <h1 class="display-4">Book Details</h1>
                                <hr class="light">
         </div>
         <button class="fun choice-pay-btn" data-toggle="collapse" data-target="#books">Get All Books</button>
                        <div class="creditCardForm" id="books">
                            <%
                                conn=null;
                                Statement stmt=null;
                                String query="select * from books";
                                dbconnect connect=new dbconnect();
                                conn=connect.connecttodb();
                                stmt=conn.createStatement();
                                ResultSet rs=stmt.executeQuery(query);
                                                            
                            %>
                           <table cellpadding="20" cellspacing="3" class="col-12 text-center">
                               <tr>
                                    <th>Image</th>
                                    <th>     Book Name      </th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Copies</th>
                                </tr>

                               <%
                                   while(rs.next()){
                               %>
                                
                                <tr>
                                    <td><img class="payment-img" src="books_img/<%=rs.getInt("book_id")%>.jpg"></td>
                                    <td><%=rs.getString("title")%></td>
                                    <td><%=rs.getString("type")%></td>
                                    <td><%=rs.getFloat("price")%></td>
                                    <td><%=rs.getInt("copies")%></td>

                                </tr>
                                
                            <%  }
                            %>
                            </table> 
                      
                        </div>
                           
                            
                            
                            
                        <div class="col-12 text-center">
                                <h1 class="display-4">Customer Details</h1>
                                <hr class="light">
                        
                        </div>
         
                        <button class="fun choice-pay-btn" data-toggle="collapse" data-target="#customers">Get All Customers</button>
                        <div class="creditCardForm" id="customers">
                            <%
                                conn=null;
                                String query1="select * from customer";
                                conn=connect.connecttodb();
                                stmt=conn.createStatement();
                                ResultSet rs1=stmt.executeQuery(query1);
                                                            
                            %>
                           <table cellpadding="20" cellspacing="3" class="col-12 text-center">
                               <tr>
                                    <th>Name</th>
                                    <th>     Email      </th>
                                    <th>Phone</th>
                                    <th>Address</th>
                                    
                                </tr>

                               <%
                                   while(rs1.next()){
                               %>
                                
                                <tr>
                                    <td><%=rs1.getString("cust_name")%></td>
                                    <td><a href="mailto:"+<%=rs1.getString("cust_email")%>><%=rs1.getString("cust_email")%></a></td>
                                    <td><%=rs1.getLong("cust_phone")%></td>
                                    <td><%=rs1.getString("cust_address")%></td>

                                </tr>
                                
                            <%  }
                            %>
                            </table> 
                            

                        </div>
                            
                            
                        <div class="col-12 text-center">
                                <h1 class="display-4">Stock Details</h1>
                                <hr class="light">
                        
                        </div>
         
                        <button class="fun choice-pay-btn" data-toggle="collapse" data-target="#stock">Get All Stock Info</button>
                        <div class="creditCardForm" id="stock">
                            <%
                                conn=null;
                                String query2="select B.title,B.book_id,S.book_id,S.sup_id,S.in_out_stock,K.sup_id,K.sup_name,K.sup_phone from books B,supplied_by S,supplier K where B.book_id=S.book_id and S.sup_id=K.sup_id";
                                conn=connect.connecttodb();
                                stmt=conn.createStatement();
                                ResultSet rs2=stmt.executeQuery(query2);
                                                            
                            %>
                           <table cellpadding="20" cellspacing="3" class="col-12 text-center">
                               <tr>
                                   <th>Image</th>
                                    <th>Book Name</th>
                                    <th> Supplier Name      </th>
                                    <th>Phone</th>
                                    <th>Status</th>
                                    
                                </tr>

                               <%
                                   while(rs2.next()){       
                                        if(rs2.getInt("in_out_stock")==0){
                                            stk="Out Of Stock";
                               %>
                                 <tr style="background:linear-gradient(to right,#b5ac49 0%,orangered 100%)">
                               
                                <%
                                        }
                                        else{
                                            stk="In Stock";
                                 %>
                                     <tr style="background:linear-gradient(to right,#b5ac49 0%,#3ca55c 100%)">
                               
                                 <%}
                                 %>
                                    
                                    <td><img class="payment-img" src="books_img/<%=rs2.getInt("book_id")%>.jpg"></td>
                                    <td><%=rs2.getString("title")%></td>
                                    <td><%=rs2.getString("sup_name")%></td>
                                    <td><%=rs2.getLong("sup_phone")%></td>
                                    <td><%=stk%></td>

                                </tr>
                                
                            <%  }
                            %>
                            </table> 
                            

                        </div>
</body>
</html>
