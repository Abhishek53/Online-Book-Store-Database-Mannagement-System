<%-- 
    Document   : Accountdetails_Activity_Page
    Created on : Nov 19, 2018, 8:20:15 PM
    Author     : ABHISHEK R
--%>

<%@page import="com.java.controllers.dbconnect"%>
<%@page import="java.sql.*"%>
<%@page import="com.java.controllers.models.AccountModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%!AccountModel ac;%>

        <%
	ac = (AccountModel) session.getAttribute("userdetails");
	%>
        
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account_Details_Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        
    </head>
            <body>
                <nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
                <div class="container-fluid">
                        <a><i class="fa fa-book book-icon"></i></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                                <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarResponsive">
                                <ul class="navbar-nav ml-auto">
                                        <li class="nav-item active"><a class="nav-link" href="#">Home</a></li>
                                        <li class="nav-item"><a class="nav-link" href="Shop_Activity_Page.jsp">Shop</a></li>
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                               area-haspopus="true" aria-expanded="false">View</a>
                                            <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background: #d5d5d5">
                                                <a class="dropdown-item" href="Shop_All_Activity_Page.jsp">All Books</a>
                                                <a></a>
                                                <%--<form action="Shop_Category_Activity_Page.jsp" method="POST">                    
                                                  <input type="submit" name="category" value=<%="Mystery/Thriller"%> />
                                                </form>
                                                <a class="dropdown-item" href="#">Text Books</a>
                                                <a class="dropdown-item" href="#">Technology</a>
                                                <a class="dropdown-item" href="#">Animation</a>--%>
                                            </div>
                                        </li>
                                        
                                        <li class="nav-item"><a class="nav-link" href="About_Activity_Page.jsp">About</a></li>
                                        
                                        
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                               area-haspopus="true" aria-expanded="false"><i class="fa fa-user" aria-hidden="true"></i> Account</a>
                                            <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background: #d5d5d5">
                                                <a class="dropdown-item" href="Accountdetails_Activity_Page.jsp">Account Settings</a>
                                                <a class="dropdown-item" href="Logout_Activity.jsp">Signout</a>
                                                
                                            </div>
                                        </li>
                                        
                                </ul>
                        </div>
                </div>

                </nav>

                
                
                
            <center>
                <div class="container-fullwidth">
                        <div class="jumbotron col-md-6 col-md-offset-3"
                                style="margin-top: 50px">
                                <div class="row">
                                        <div class="profile-head col-md-10 col-md-offset-1">
                                                <div class="col-md-4 ">
                                                        <img class="img-circle img-responsive" alt="" src="image/user.png">
                                                </div>


                                                <div class="col-md-6 ">
                                                        <h2><%=ac.getCustomer_name()%></h2>
                                                        <ul>
                                                                <li class="navli"><span class="glyphicon glyphicon-home"></span>
                                                                        <%=ac.getCustomer_address()%></li>
                                                                <li class="navli"><span class="glyphicon glyphicon-phone"></span><%=ac.getCustomer_phone()%></li>
                                                                <li class="navli"><span class="glyphicon glyphicon-envelope"></span><%=ac.getCustomer_email()%></li>
                                                        </ul>
                                                </div>
                                        </div>
                                </div>
                                <div class="row">
                                        <div class="account_details col-md-10 col-md-offset-1"
                                                style="margin-top: 30px;">
                                                <h2>Account Details</h2>
                                                <hr class="divider">
                                                <table class="table table-user-information col-md-6">
                                                        <tbody>
                                                                <tr>
                                                                        <td><b>User Name:</b></td>
                                                                        <td><%=ac.getCustomer_name()%></td>
                                                                </tr>
                                                                <tr>
                                                                        <td><b>Account id:</b></td>
                                                                        <td><%=ac.getCustomer_id()%></td>
                                                                </tr>
                                                                
                                                                <tr>
                                                                        <td><b>Phone Number</b></td>
                                                                        <td><%=ac.getCustomer_phone()%></td>
                                                                </tr>
                                                                <tr>
                                                                        <td><b>Email</b></td>
                                                                        <td><a href="mailto:" +<%=ac.getCustomer_email()%>><%=ac.getCustomer_email()%></a></td>
                                                                </tr>
                                                                
                                                        </tbody>
                                                </table>
                                        </div>
                                </div>
                        </div>
                         <form action="AccountController" method="POST">
                             <input type="hidden" name="cust_id" value=<%=ac.getCustomer_id()%> >
                            <button type="submit" class="btn" name="button" value="delacc" style="background-color: orangered; color: white; margin-right: 20px;">Delete Account</button>                                    
                            <button type="submit" class="btn btn-primary" name="button" value="pwdsub" style="color: white; margin-left: 20px;">Change Password</button>    
                         </form>
                         
                         
                         <hr class="my-4">
                        
                        <button class="fun choice-pay-btn" data-toggle="collapse" data-target="#orders">My Orders Details</button>
                        <div class="creditCardForm" id="orders">
                            <%
                                Connection conn=null;
                                CallableStatement stmt=null;
                                String query="{CALL order_details(?)}";
                                dbconnect connect=new dbconnect();
                                conn=connect.connecttodb();
                                stmt=conn.prepareCall(query);
                                stmt.setInt(1, ac.getCustomer_id());
                                ResultSet rs=stmt.executeQuery();
                                                            
                            %>
                           <table cellpadding="20" cellspacing="3" class="col-12 text-center">
                               <tr>
                                    <th>Image</th>
                                    <th>     Book Name      </th>
                                    <th>Payment Status</th>
                                    <th>Number Of Copies</th>
                                </tr>

                               <%
                                   while(rs.next()){
                               %>
                                
                                <tr>
                                    <td><img class="payment-img" src="books_img/<%=rs.getInt("book_id")%>.jpg"></td>
                                    <td><%=rs.getString("title")%></td>
                                    <td><%=rs.getString("payment_status")%></td>
                                    <td><%=rs.getInt("count")%></td>

                                </tr>
                                
                            <%  }
                            %>
                            </table> 
                            

                        </div>                                        
                            
                </div>
              </center>
        </body>
</html>
