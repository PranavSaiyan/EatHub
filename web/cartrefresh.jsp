<%-- 
    Document   : cartrefresh
    Created on : 07-Jul-2017, 13:47:34
    Author     : Saiyan
--%>

<%@page import="javax.naming.Context"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.*"%>
<% HttpSession httpSession2;
   httpSession2=request.getSession();
   String email = (String)httpSession2.getAttribute("usrmail");
   boolean flag=false;
   int Total=0;
   String output="<table ><tr><th>CATEGORY</th><th>ITEM</th><th>QUANTITY</th><th>PRICE</th></tr>";
    try{
      
          Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
              Statement st = conn.createStatement();
              ResultSet rs = st.executeQuery("SELECT * FROM cart WHERE Email='"+email+"';");
              while (rs.next()) {                      
                      flag=true;
                      output+="<tr><td>"+rs.getString(7)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td> Rs."+rs.getInt(6)+"</td><td><a href='Order.jsp?item="+rs.getString(4)+"&quan="+rs.getString(5)+"'>X</a></td></tr>";
                      Total+=rs.getInt(6);
                  }
              if(!flag){
                  output="<div class='alert alert-danger' style='font-family: Indie Flower, cursive; font-size: 40px; text-align: center;'><strong>Sorry !</strong> No Items found in the cart</div>";
              }else{
                  double GST = 0.18*Total;
                  double t =GST+Total;
                  DecimalFormat df=new DecimalFormat("#.00");
                  output+="<tr><td></td><td></td><td>GST %</td><td>Rs."+df.format(GST)+"</td></tr><tr><td></td><td></td><td>Total <span class='glyphicon glyphicon-hand-right'></span></td><td>Rs."+df.format(t)+"</td></tr></table>";
                  
                  output+="<div class='btn-group btn-group-justified'><a href='Timeline.jsp?OrderPlace=yes&total="+t+"' class='btn btn-primary'>Place Order</a><a href='Order.jsp?clear=yes' class='btn btn-primary'>Empty Your Cart</a></div>";
              }
              
              conn.close();
   }catch(Exception e){
       e.printStackTrace();
   }
 
    out.print(output);
%>