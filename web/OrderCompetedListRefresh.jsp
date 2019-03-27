<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.*"%>
<%
  String output="<tr><th>Name</th><th>Description</th><th>Price</th><th>Status</th></tr>";
   try{
          Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
              Statement st = conn.createStatement();
              ResultSet rs = st.executeQuery("SELECT * FROM orderlist WHERE Delivered=1 OR Decline=1 ORDER BY Time DESC");
              while(rs.next()){
              output+="<tr><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>Rs."+rs.getString(4)+"</td><td>";
             if(rs.getInt(7)==1){
             output+="Delivered</td></tr>";
             }else{
             output+="Declined</td></tr>";
             } 
              }
              
              conn.close();
   }catch(Exception e){
       e.printStackTrace();
   }
   out.print(output);

%>
