<%-- 
    Document   : About_Activity_Page
    Created on : Nov 11, 2018, 11:43:29 AM
    Author     : ABHISHEK R
--%>

<%@page import="com.java.controllers.models.AccountModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
        <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <%!AccountModel ac = null;%>

	<%
            ac = (AccountModel)session.getAttribute("userdetails");
	%>
    </head>
    <body>
        <!-- Navigation --> 
        <nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
                <div class="container-fluid">
                    <a><i class="fa fa-book book-icon"></i></a>
                        
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                                <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarResponsive">
                                <ul class="navbar-nav ml-auto">
                                        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
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
                                        <%if(ac==null){%>
                                        <li class="nav-item "><a class="nav-link" href="Login_Activity_Page.jsp">Login</a></li>
                                        <li class="nav-item"><a class="nav-link" href="Signup_Activity_Page.jsp">Signup</a></li>
                                        <%}%>
                                        <li class="nav-item active"><a class="nav-link" href="#">About</a></li>
                                        
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
        
                <!--- Jumbotron -->
        <div class="container-fluid">
                <div class="row Jumbotron text-center">
                    <div class="col-12">
                                <h1 class="display-4">Built with ease</h1>
                        </div>
                    <hr class="light"></hr>
                    
                        <div class="col-12">
                                <p class="lead">This website specialized on E-commerce area. There are scope on this project. 
                        The website is based on online shopping where customer can order and make a payment of book via internet. 
                        The limit of customer profiling system that it analyzes only registered users and those who filled the survey in the process of registration.
                        In technical side we developed this website and system that is oriented on web design and database system and done by jsp,css and glassfish server.</p>
                        </div>
                </div>
        </div>
        
        <!--- Connect -->
        <hr class="my-4">
        <div class="container-fluid padding">
                <div class="row text-center padding">
                        <div class="col-12">
                                <h2>Connect</h2>
                        </div>

                        <div class="col-12 social padding">
                                <a href="#"><i class="fab fa-facebook"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-google-plus-g"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>

                        </div>
                </div>
        </div>

        <!--- Footer -->
        <footer>
                <div class="container-fluid padding">
                        <div class="row text-center">
                                <div class="col-md-4">
                                        <hr class="light">
                                        <h5>Contact</h5>
                                        <hr class="light">
                                        <p>+91-9632579793</p>
                                        <p>abhishekr.ar53@gmial.com</p>
                                        <p>B.N.M Institute Of Technology</p>
                                        <p>Bsk,Bengaluru-560070</p>
                                </div>
                                <div class="col-md-4">
                                        <hr class="light">
                                        <h5>Sevices</h5>
                                        <hr class="light">
                                        <p>Mon-Fri</p>
                                        <p>Free Delivery</p>
                                        <p>Return Policy</p>
                                        <p>Terms and Conditions</p>				
                                </div>
                                <div class="col-md-4">
                                        <hr class="light">
                                        <h5>DBMS Mini Project</h5>
                                        <hr class="light">
                                        <p>Online Book Store</p>
                                        <p>Abhishek R</p>
                                        <p>1BG16CS004</p>
                                        <p>V CSE-A</p>				
                                </div>
                                <div class="col-12">
                                        <hr class="light-100">
                                        <h5></h5>
                                </div>
                        </div>
                </div>
        </footer>
    </body>
</html>
