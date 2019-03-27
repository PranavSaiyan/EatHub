<%-- 
    Document   : search_ajax
    Created on : Jan 24, 2018, 9:45:47 AM
    Author     : Pranav
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
String key_search = (String)request.getParameter("val");
String output =" ";
try{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
              Statement st = conn.createStatement();
              ResultSet rs = st.executeQuery("SELECT * FROM menu WHERE Item LIKE'%"+key_search+"%' ;");
              
              while(rs.next()){
              output+= "<div style='padding:5px;'><img style='border-radius:10px 10px 10px 10px;' src='itemimages/"+rs.getString(1) +"/"+rs.getString(5)+"' width='100' height='100' /> <a onclick='clearall()' style='font-size:30px;font-family:Mukta Mahee,sans-serif; '  href='#"+rs.getString(5)+"'>"+rs.getString(2)+"</a> </div>";
              }   
                 
              
              conn.close();
   }catch(Exception e){
       e.printStackTrace();
   }
out.print(output);
%>
