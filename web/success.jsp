<%-- 
    Document   : success
    Created on : Oct 2, 2017, 10:32:37 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
    </head>
 
        <body >
            <% try{
                String txnid = request.getParameter("txnid");
                 Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
              Statement st = conn.createStatement();
              st.executeUpdate("UPDATE orderlist SET pay=1 WHERE txnid='"+txnid+"';");
               conn.close();
               response.sendRedirect("success_pay.jsp");
    }
    catch(Exception e){
    e.printStackTrace();
    }
              %>
              
    </body>
</html>
