<%-- 
    Document   : saveboxscore
    Created on : Mar 17, 2019, 3:37:53 PM
    Author     : Pranav
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   HttpSession httpSession;
   httpSession=request.getSession();
   int score = Integer.parseInt(request.getParameter("score"));
   String email = (String)httpSession.getAttribute("usrmail");
   String fullname=null;
   String state=null;
   
   try{
   Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
              Statement st = conn.createStatement();
              ResultSet rs = st.executeQuery("SELECT * FROM untitled WHERE Email='"+email+"';");
              while(rs.next()){
              fullname = rs.getString(2)+" "+rs.getString(3);
              state = rs.getString(10);
              }
              
              st.executeUpdate("INSERT INTO boxmaster VALUES('"+email+"','"+state+"',"+score+",'"+fullname+"',CURRENT_TIMESTAMP)");
              conn.close();
   
   }catch(SQLException e){
       e.printStackTrace();
   }

   out.print("Score - "+score+" for "+fullname+" has been saved");
%>
