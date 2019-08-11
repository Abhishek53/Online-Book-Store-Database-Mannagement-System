<%-- 
    Document   : BShop_Activity_Page
    Created on : Nov 17, 2018, 7:51:22 PM
    Author     : ABHISHEK R
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.java.controllers.models.Book, com.java.controllers.models.BookDb, java.text.NumberFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Page</title>
    </head>
    <body>
            <%
            NumberFormat nf = NumberFormat.getCurrencyInstance();
            BookDb bk = new BookDb();
            ArrayList<Book> books = bk.selectAllBooks();

            %>
    <div class="row">

            <% 
            for(Book book : books) {
            %>	<div class="col-md-4" style="padding: 5px;">
                            <div style="margin:3px; padding:10px; background-color: #eee;">
                                    <div class="row">
                                            <div class="col-md-4">
                                                    <a href="./BookLookup?isbn=<%= book.getbook_id()%>" style="max-height: 130px; max-width: 110px;">
                                                            <img src="./book_images/<%= book.getbook_id()%>" alt="<%=book.gettitle()%> cover" style="max-width: inherit; max-height: inherit">
                                                    </a>
                                            </div>
                                            <div class="col-md-8" style="text-align: left; padding-left:10px;">
                                                    <h4><%=book.gettitle() %></h4>
                                                    <h5><%=nf.format(book.getprice()) %></h5>
                                            </div>
                                    </div>
                            </div>
                    </div>
            <%
            }
            %>
    </div>

    </body>
</html>
