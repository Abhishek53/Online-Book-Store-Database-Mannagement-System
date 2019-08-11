<%-- 
    Document   : index
    Created on : Nov 10, 2018, 7:52:18 PM
    Author     : ABHISHEK R
--%>

<%@page import="com.java.controllers.models.AccountModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        

        
    </head>
    <body>
        <!-- Navigation --> 
        <%!AccountModel ac = null;%>

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
                                        <%if(ac==null){%>
                                        <li class="nav-item"><a class="nav-link" href="Login_Activity_Page.jsp">Login</a></li>
                                        <li class="nav-item"><a class="nav-link" href="Signup_Activity_Page.jsp">Signup</a></li>
                                        <%}%>
                                        <li class="nav-item"><a class="nav-link" href="About_Activity_Page.jsp">About</a></li>
                                        
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

        <!--- Image Slider -->
        <div id="slides" class="carousel slide" data-ride="carousel">
                <ul class="carousel-indicators">
                        <li data-target="#slides" data-slide-to="0" class="active"></li>
                        <li data-target="#slides" data-slide-to="1"></li>
                        <li data-target="#slides" data-slide-to="2"></li>
                </ul>
                <div class="carousel-inner">
                        <div class="carousel-item active"><img src="img/home-page-img-01.jpg">
                                <div class="carousel-caption">
                                        <h1 class="display-2">Online Book Store</h1>
                                        <h3 class="display-4">Books are uniquely portable magic!!</h3>
                                        <a href="Shop_Activity_Page.jsp"><button type="button" class="btn btn-primary btn-lg">GET STARTED</button></a>
                                        <a href="MannagerLogin.jsp"><button type="button" class="btn btn-primary btn-lg">Admin Login</button></a>
                                </div>
                        </div>
                        <div class="carousel-item"><img src="img/home-page-img-02.jpg"></div>
                        <div class="carousel-item"><img src="img/home-page-img-03.jpg"></div>
                </div>
        </div>

        <!--- Jumbotron -->
        <div class="container-fluid">
                <div class="row Jumbotron text-center">
                        <div class="col-12">
                                <p class="lead">This website specialized on E-commerce area. There are scope on this project. 
                        The website is based on online shopping where customer can order and make a payment of book via internet. 
                        The limit of customer profiling system that it analyzes only registered users and those who filled the survey in the process of registration.
                        In technical side we developed this website and system that is oriented on web design and database system and done by jsp,css and glassfish server.</p>
                        </div>
                </div>
        </div>
        <!--- Welcome Section -->
        <div class="container-fluid padding">
                <div class="row welcome text-center">
                        <div class="col-12">
                                <h1 class="display-4">Built with ease</h1>
                        </div>
                        <hr>
                                <div class="col-12"><p class="lead">Welcome to the Online Book Store Website. Here you can find your favourite books.Search online, Shop online, Pay online. Make your shopping easier and smarter. Books are uniquely portable magic!</p></div>
                        </hr>
                </div>
        </div>


        <!--- Fixed background -->
        <hr class="my-4">
        <figure>
                <div class="fixed-wrap">
                        <div id="fixed">

                        </div>
                </div>
        </figure>


        <!--- Emoji Section -->

        <!--- Show the trending books -->
        <hr class="my-4">
        <div class="container-fluid padding">
                <div class="row Welcome text-center">
                        <div class="col-12">
                                <h1 class="display-4">Trending</h1>
                        </div>
                        <hr>
                </div>
        </div>

        <!--- Cards -->

        <div class="container-fluid padding">
                <div class="row padding text-center">
                        <div class="col-md-4">
                                <div class="card">
                                        <img class="card-img-top" src="img/home-page-img-04.jpg">
                                        <div class="card-body">
                                                <h4 class="card-title">Thrill</h4>
                                                <p class="caed-text">Emotional journey with ones own self happiness</p>
                                        </div>
                                </div>			
                        </div>
                        <div class="col-md-4">
                                <div class="card">
                                        <img class="card-img-top" src="img/home-page-img-05.jpg">
                                        <div class="card-body">
                                                <h4 class="card-title">Love</h4>
                                                <p class="caed-text">A beautiful love story with political drama</p>
                                        </div>
                                </div>			
                        </div>
                        <div class="col-md-4">
                                <div class="card">
                                        <img class="card-img-top" src="img/home-page-img-06.jpg">
                                        <div class="card-body">
                                                <h4 class="card-title">Technology</h4>
                                                <p class="caed-text">How the billaniore of tesla and spacex is shaping out futures</p>
                                        </div>
                                </div>			
                        </div>
                </div>
                </div>

        <!--- Two Column Section -->


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
