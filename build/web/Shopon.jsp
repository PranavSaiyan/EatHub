<%-- 
    Document   : Shoponoff
    Created on : Dec 14, 2017, 4:25:34 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%
   try{
          Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
              Statement st = conn.createStatement();
              st.executeUpdate("UPDATE Shopstatus SET Status='YES'");             
              conn.close();
   }catch(Exception e){
       e.printStackTrace();
   }
   
    out.print("Shop is Open");
%>
