<%-- 
    Document   : Shop_Category_Activity_Page
    Created on : Nov 22, 2018, 5:28:29 PM
    Author     : ABHISHEK R
--%>

<%@page import="com.java.controllers.models.BookDb"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="com.java.controllers.models.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.java.controllers.models.AccountModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Category</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
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
                                        <li class="nav-item "><a class="nav-link" href="index.jsp">Home</a></li>
                                        <li class="nav-item active"><a class="nav-link" href="Shop_Activity_Page.jsp">Shop</a></li>
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
                                        <li class="nav-item"><a  href="Cart_Payment.jsp" class="cart-button nav-link"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                        
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
                                        
        <jsp:declaration>
            String category="";
        </jsp:declaration>
        <jsp:scriptlet>
            category=request.getParameter("category");
            
        </jsp:scriptlet>
                 
                                        
         <br>
        <%
            NumberFormat nf = NumberFormat.getCurrencyInstance();
            BookDb bk = new BookDb();
            ArrayList<Book> books_text = bk.selectAllBooksFromCategory(category);
            int i=-1;
        %>
        <div class="container-fluid bg-light-gray">
            <div class="container">
            <div class="row">
                <h3><%=category%></h3>
            </div>
            <div class="underline-title"></div>
            </div>
        </div>
        <div class="container-fluid padding">            
            <div class="row padding text-center">
                <%
                    for(Book book : books_text){
                        ++i;
                        if(i==4){%>
                            </div></div>
                            <br><br><br><br><br><br>
                            <div class="container-fluid padding">            
                            <div class="row padding text-center">
        
                        <%}
                        
                %>
                <div class="col-md-3 my-column">
                    <div class="card">
                        <img class="card-img-top" src="books_img/<%=book.getbook_id()%>.jpg">
                        <div class="card-body">
                            <p class="card-text"><%=book.gettitle()%> </p>
                            <p class="card-text"><%=book.getdesc()%></p>
                            <p class="card-text"><%=nf.format(book.getprice())%></p>
                            <form action="CartController" method="POST">
                                <input type="hidden" name="rmcbook_id" value=<%=0%>>
                                <input type="hidden" name="rmcitem" value="none">                                
                                <input type="hidden" name="book_id" value=<%=book.getbook_id ()%> />
                                <input type="hidden" name="title" value=<%=book.gettitle()%> />
                                <input type="hidden" name="quantity" value=<%=1%> />
                                <input type="hidden" name="price" value=<%=book.getprice()%> />    
                                <button class="btn" type="submit" name="add" style="background: green; color: white;">ADD TO CART </button>
                            </form>
                        </div>                                
                    </div>                    
                </div>
                <%}
                %>
            </div>
                <br><br><br><br><br><br><br><br><br>
                                
        </div>
        
                                        
                                        
                                        
    </body>
</html>
