<%-- 
    Document   : Logout_Activity
    Created on : Nov 19, 2018, 9:04:22 PM
    Author     : ABHISHEK R
--%>

<%
session.invalidate();
response.sendRedirect("index.jsp");
%>