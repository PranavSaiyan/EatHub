<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.*"%>
<%
  String output="<tr><th>Name</th><th>Description</th><th>Price</th><th>Control</th></tr>";
   try{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
              Statement st = conn.createStatement();
              ResultSet rs = st.executeQuery("SELECT * FROM orderlist WHERE Delivered=0 AND Decline=0");
              while(rs.next()){
              if(rs.getInt(13)==0){ output+="<tr style='background:red;'>"; }
              else{ output+="<tr style='background:green;'>"; }
              output+="<td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>Rs."+rs.getString(4)+"</td><td id='control'>";
              if(rs.getInt(5)==1){
                  if(rs.getInt(6)==1){                   
                      output+="<div class='btn-group-horizontal'><a href='OrderList.jsp?Delivered="+rs.getInt(1)+"'><button type='button' class='btn btn-primary'>Delivered</button></a><a href='OrderList.jsp?Declined="+rs.getInt(1)+"'><button type='button' class='btn btn-primary'>Decline</button></a></div></td></tr>";
                  }else{
                  output+="<div class='btn-group-horizontal'><button type='button' class='btn btn-primary' onclick='cooked(this)' value='"+rs.getInt(1)+"'>Cooked</button><a href='OrderList.jsp?Declined="+rs.getInt(1)+"'><button type='button' class='btn btn-primary'>Decline</button></a></div></td></tr>";
                  }
              }else{
                  output+="<div class='btn-group-horizontal'><button type='button' class='btn btn-primary' onclick='accept(this)' value='"+rs.getInt(1)+"'>Accept</button><a href='OrderList.jsp?Declined="+rs.getInt(1)+"'><button type='button' class='btn btn-primary'>Decline</button></a></div></td></tr>";
              }
              
              
              }
              
              conn.close();
   }catch(Exception e){
       e.printStackTrace();
   }
   out.print(output);

%>
