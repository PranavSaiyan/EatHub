<%-- 
    Document   : Error
    Created on : Jan 9, 2018, 10:41:20 PM
    Author     : Pranav
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% Exception e = (Exception) request.getAttribute("error"); %>
        <% StringWriter sw = new StringWriter();
e.printStackTrace(new PrintWriter(sw));
String exceptionAsString = sw.toString();  %>
        <h1><% out.print(exceptionAsString); %></h1>
    </body>
</html>
