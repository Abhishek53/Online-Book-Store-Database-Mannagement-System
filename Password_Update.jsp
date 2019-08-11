<%-- 
    Document   : Password_Update
    Created on : Nov 23, 2018, 7:42:23 PM
    Author     : ABHISHEK R
--%>

<%@page import="com.java.controllers.models.AccountModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <link href="css/login_sign_up_style.css" rel="stylesheet" type="text/css"/>
        
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
                                                
                                                
                <div class="modal-dialog text-center">
                   <div class="col-sm-8 main-section">
                           <div class="modal-content">




                               <form class="col-12" action="AccountController" method="POST">
                                   <input type="hidden" name="cust_id" value=<%=ac.getCustomer_id()%> >
                                   <input type="hidden" name="cur_pwd" value=<%=ac.getCustomer_password()%>>
                                   <br><br>
                                           <div class="form-group">
                                                   <input type="text" class="form-control" name="old_password" placeholder="Enter Current Password">
                                           </div>
                                           <div class="form-group">
                                                   <input type="text" class="form-control" name="new_password" placeholder="Enter New password">
                                           </div>
                                           <button class="loginsignup btn" name="button" value="pwdupd" type="submit" class="btn">Update</button>
                               </form>
                               <br>
                                   <div class="col-12 forgot"><a href="Accountdetails_Activity_Page.jsp">Back to Account Details?</a></div>


                           </div><!--end of modal content div -->  		
                   </div>

             </div>
                                                
                
    </body>
</html>
