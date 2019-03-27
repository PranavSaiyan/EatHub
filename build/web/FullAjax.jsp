<%-- 
    Document   : HalfAjax
    Created on : 01-Jul-2017, 22:43:13
    Author     : Saiyan
--%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.*"%>
<% HttpSession httpSession2;
   httpSession2=request.getSession();
   String fullname=null;
   String mobile=null;
   String email = (String)httpSession2.getAttribute("usrmail");
   String val= request.getParameter("val");
   String category=null;
   int fullprice=0;
   out.print("Full "+val);  
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
              mobile = rs.getString(9);
              }   
              
              rs=st.executeQuery("SELECT * FROM menu WHERE Item='"+val+"';");
              while(rs.next()){
                  category=rs.getString(1);
                  fullprice=rs.getInt(4);
              }
              
              st.executeUpdate("INSERT INTO cart VALUES('"+fullname+"','"+email+"','"+mobile+"','"+val+"','Full',"+fullprice+",'"+category+"')");
              
              conn.close();
   }catch(Exception e){
       e.printStackTrace();
   }
   out.print(" is added to cart");
%>