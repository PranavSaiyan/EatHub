<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.*"%>
<%int email = Integer.parseInt(request.getParameter("email"));
 
 
   try{
          Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
              Statement st = conn.createStatement();
              st.executeUpdate("UPDATE orderlist SET Cooked=1 WHERE ID="+email+"");
             
              conn.close();
   }catch(Exception e){
       e.printStackTrace();
   }
 
%>
