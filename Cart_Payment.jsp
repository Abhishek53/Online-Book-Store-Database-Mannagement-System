<%-- 
    Document   : Cart_Payment
    Created on : Nov 15, 2018, 12:14:57 PM
    Author     : ABHISHEK R
--%>

<%@page import="com.java.controllers.models.AccountModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.java.controllers.models.LineItem"%>
<%@page import="com.java.controllers.models.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Pyment Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <%!AccountModel ac = null;
    %>

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
                                        <li class="nav-item active"><a  href="Cart_Payment.jsp" class="cart-button nav-link"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                        
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
        <br>
        
        <table cellpadding="20" cellspacing="3" class="col-12 text-center">
            <tr>
                <th>Image</th>
                <th>     Book Name      </th>
                <th>Price</th>
                <th>Option</th>
            </tr>
            <%!Cart c = null;
               ArrayList <LineItem> items;
            %>
            <%
                
                int a[]=new int[100];
                int b[]=new int[100];
                float total=0;
                c=(Cart)session.getAttribute("cart");
                items = c.getItems();
                int i=0;
            %>
            
            <%
                if(c!=null){
                for(LineItem line : items){
                    a[i]=line.getbook_id();
                    b[i]=line.getQuantity();
                    i++;
                    total=total+line.getPrice();
            %>
            
            <tr>
                <td><img class="payment-img" src="books_img/<%=line.getbook_id()%>.jpg"></td>
                <td><%=line.getTitle()%></td>
                <td><%=line.getPrice()%></td>
                <td>
                    <form action="CartController" method="POST">
                     <input type="hidden" name="rmcbook_id" value=<%=line.getbook_id()%>>
                     <input type="hidden" name="book_id" value=<%=0%> />
                     <input type="hidden" name="title" value="" />
                     <input type="hidden" name="quantity" value=<%=0%> />
                     <input type="hidden" name="price" value=<%=0%> />    
                     <input  type="hidden" name="add" >
                        <button class="btn" name="rmcitem" value="remove" style="background-color: orangered; color: white;">Remove</button>
                    </form>
                </td>
                
            </tr>
            
            <%}
            }
            else{
                response.sendRedirect("Shop_Activity_Page.jsp");
            }

            %>
            
        </table>
            <br><br>
            <table class=total-table>
                <tr>
                <td><h3>Total Price</h3><td>
                <td><h3><%=total%></h3></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                </tr>
            </table>
         <%
             
             session.setAttribute("paymentobj",c);
         %>
        <hr class="my-4">
        <h3 class="col-12 text-center">Choose Payment Method</h3>
        <button class="fun choice-pay-btn" data-toggle="collapse" data-target="#debit-card">Debit Card</button>
        <div class="creditCardForm" id="debit-card">
            <div class="payment">
                <form action="PaymentController" method="POST">
                    <div class="form-group" id="card-number-field">
                        <label for="cardNumber">Card Number</label>
                        <input type="text" class="form-control" id="cardNumber">
                    </div>
                    <div class="form-group owner">
                        <label for="owner">Name On Card</label>
                        <input type="text" class="form-control" id="owner">
                    </div>
                    <div class="form-group CVV">
                        <label for="cvv">CVV</label>
                        <input type="text" class="form-control" id="cvv">
                    </div>
                    
                    <div class="form-group" id="expiration-date">
                        <label>Expire Date</label>
                        <select>
                            <option value="01">Jan</option>
                            <option value="02">Feb </option>
                            <option value="03">Mar</option>
                            <option value="04">Apr</option>
                            <option value="05">May</option>
                            <option value="06">Jun</option>
                            <option value="07">Jul</option>
                            <option value="08">Aug</option>
                            <option value="09">Sep</option>
                            <option value="10">Oct</option>
                            <option value="11">Nov</option>
                            <option value="12">Dec</option>
                        </select>
                        <select>
                            <option value="16"> 2016</option>
                            <option value="17"> 2017</option>
                            <option value="18"> 2018</option>
                            <option value="19"> 2019</option>
                            <option value="20"> 2020</option>
                            <option value="21"> 2021</option>
                            <option value="22"> 2022</option>
                            <option value="23"> 2023</option>
                            <option value="24"> 2024</option>                            
                            <option value="25"> 2025</option>
                            <option value="26"> 2026</option>                            
                            <option value="27"> 2027</option>
                            <option value="28"> 2028</option>
                            <option value="29"> 2029</option>
                            <option value="30"> 2030</option>
                        </select>
                    </div>
                    <div class="form-group" id="credit_cards">
                        <img src="img/visa.jpg" id="visa">
                        <img src="img/mastercard.jpg" id="mastercard">
                    </div>
                        <input type="hidden" name="cust_id" value=<%=ac.getCustomer_id()%>>
                        <%for(int k:a){%>
                        <input type="hidden" name="book_id" value=<%=k%>>
                        <%}%>
                        <%for(int j:b){%>
                        <input type="hidden" name="quantity" value=<%=j%>>
                        <%}%>
                        <input type="hidden" name="total_amount" value=<%=total%> />                        
                        <button type="submit" class="btn btn-default" id="confirm-purchase">Pay Now</button>
                        
                    
                </form>
            </div>
        </div>
        
        
        <button class="fun" data-toggle="collapse" data-target="#credit-card">Credit Card</button>
        <div class="creditCardForm" id="credit-card">
            <div class="payment">
                <form>
                    <div class="form-group" id="card-number-field">
                        <label for="cardNumber">Card Number</label>
                        <input type="text" class="form-control" id="cardNumber">
                    </div>
                    <div class="form-group owner">
                        <label for="owner">Name On Card</label>
                        <input type="text" class="form-control" id="owner">
                    </div>
                    <div class="form-group CVV">
                        <label for="cvv">CVV</label>
                        <input type="text" class="form-control" id="cvv">
                    </div>
                    
                    <div class="form-group" id="expiration-date">
                        <label>Expire Date</label>
                        <select>
                            <option value="01">Jan</option>
                            <option value="02">Feb </option>
                            <option value="03">Mar</option>
                            <option value="04">Apr</option>
                            <option value="05">May</option>
                            <option value="06">Jun</option>
                            <option value="07">Jul</option>
                            <option value="08">Aug</option>
                            <option value="09">Sep</option>
                            <option value="10">Oct</option>
                            <option value="11">Nov</option>
                            <option value="12">Dec</option>
                        </select>
                        <select>
                            <option value="16"> 2016</option>
                            <option value="17"> 2017</option>
                            <option value="18"> 2018</option>
                            <option value="19"> 2019</option>
                            <option value="20"> 2020</option>
                            <option value="21"> 2021</option>
                            <option value="22"> 2022</option>
                            <option value="23"> 2023</option>
                            <option value="24"> 2024</option>                            
                            <option value="25"> 2025</option>
                            <option value="26"> 2026</option>                            
                            <option value="27"> 2027</option>
                            <option value="28"> 2028</option>
                            <option value="29"> 2029</option>
                            <option value="30"> 2030</option>
                        </select>
                    </div>
                    <div class="form-group" id="credit_cards">
                        <img src="img/visa.jpg" id="visa">
                        <img src="img/mastercard.jpg" id="mastercard">
                    </div>
                    <div class="form-group" id="pay-now">
                        <input type="hidden" name="cust_id" value=<%=ac.getCustomer_id()%>/>
                        <input type="hidden" name="total_ampunt" value=<%=total%> />
                        <button type="submit" class="btn btn-default" id="confirm-purchase">Pay Now</button>
                    </div>
                </form>
            </div>
        </div>
        

    </body>
</html>
