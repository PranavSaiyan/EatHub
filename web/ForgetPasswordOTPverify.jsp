<%-- 
    Document   : ForgetPasswordOTPverify
    Created on : Sep 24, 2017, 5:34:32 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
String email = request.getParameter("val");
String otpvalidation = request.getParameter("otp");
 String otp=null;
            try{
            Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
             else{
                 Statement st = conn.createStatement();
                 ResultSet rs = st.executeQuery("SELECT OTP FROM untitled WHERE Email='"+email+"';");
                 while(rs.next()){
                  otp = rs.getString("OTP");
              }
              
             }
             conn.close();
     }catch(ClassNotFoundException e){
               System.err.println(e);
           }catch(SQLException e){
               System.err.println(e);
           }
            
            //
            if(otp.equals(otpvalidation)){
                out.print(1);
//                request.setAttribute("email",email);
//            RequestDispatcher rd = request.getRequestDispatcher("ForgetPassword.jsp");
//            rd.forward(request, response);
            }else{
            out.print(0);
            }
%>