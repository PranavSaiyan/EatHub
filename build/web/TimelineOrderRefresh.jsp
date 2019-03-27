<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.*"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<% try{
    HttpSession session1 = request.getSession();
               String email=(String)session1.getAttribute("usrmail");
               int srno=1;
               String tablecreation="<table class='table table-hover'><thead><tr><th>#</th><th>Description</th><th>Price</th><th>Date</th><th>Time</th><th>Status</th><th>Payment</th></tr></thead><tbody>";
                 Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
              Statement st = conn.createStatement();
              ResultSet rs = st.executeQuery("SELECT * FROM orderlist WHERE Email='"+email+"' ORDER BY ID DESC;");
              int flag=0;
              while(rs.next()){
              flag=1;
              tablecreation+="<tr><td>"+srno+"</td><td>"+rs.getString(3)+"</td><td>Rs."+rs.getString(4)+"</td><td>"+rs.getString(9)+"</td><td>"+rs.getString(10)+"</td><td>";
              if(rs.getInt(13)==0){
              if(rs.getInt(8)!=1){
              if(rs.getInt(5)==1){
                                if(rs.getInt(6)==1){
                                    if(rs.getInt(7)==1){
                                    tablecreation+="<img class='deliver' src='images/delivered-logo.png' width='200px' height='80px' /></td><td><img class='paid' src='https://www.vogue.in/wp-content/themes/vogue/images/check-circle.gif' width='200px' height='80px'/></td></tr>";
                                    }else{
                                    tablecreation+="<img class='ready' src='images/delivery-boy.gif' width='200px' height='80px'  /></td><td><img class='paypending' src='images/molumen_red_round_error_warning_icon.png' width='200px' height='80px'/></td></tr>";
                                    }
                           }else{
                                tablecreation+="<img class='cook' src='images/a218f772a59aad480fcded754fa01824.gif' width='200px' height='80px'  /></td><td><img class='paypending' src='images/molumen_red_round_error_warning_icon.png' width='200px' height='80px'/></td></tr>";
                                }
              }else{
              tablecreation+="<img class='process' src='images/200w_d (1).gif' width='200px' height='80px' /></td><td><img class='paypending' src='images/molumen_red_round_error_warning_icon.png' width='200px' height='80px'/></td></tr>";
              } 
              }else{
              tablecreation+="<img src='images/denied_logo.jpg' width='200px' height='80px'/></td></tr>";
              }
              srno++;
              }else{
              if(rs.getInt(8)!=1){
              if(rs.getInt(5)==1){
                                if(rs.getInt(6)==1){
                                    if(rs.getInt(7)==1){
                                    tablecreation+="<img class='deliver' src='images/delivered-logo.png' width='200px' height='80px' /></td><td><img class='paid' src='https://www.vogue.in/wp-content/themes/vogue/images/check-circle.gif' width='200px' height='80px'/></td></tr>";
                                    }else{
                                    tablecreation+="<img class='ready' src='images/delivery-boy.gif' width='200px' height='80px'  /></td><td><img class='paid' src='https://www.vogue.in/wp-content/themes/vogue/images/check-circle.gif' width='200px' height='80px'/></td></tr>";
                                    }
                           }else{
                                tablecreation+="<img class='cook' src='images/a218f772a59aad480fcded754fa01824.gif' width='200px' height='80px' /></td><td><img class='paid' src='https://www.vogue.in/wp-content/themes/vogue/images/check-circle.gif' width='200px' height='80px'/></td></tr>";
                                }
              }else{
              tablecreation+="<img class='process' src='images/200w_d (1).gif' width='200px' height='80px' /></td><td><img class='paid' src='https://www.vogue.in/wp-content/themes/vogue/images/check-circle.gif' width='200px' height='80px'/></td></tr>";
              } 
              }else{
              tablecreation+="<img src='images/denied_logo.jpg' width='200px' height='80px'/></td></tr>";
              }
              srno++;
              }
              }
              if(flag==0){
              out.print("<div class='alert alert-warning'><strong>NO!</strong> ORDERS ARE PLACED YET </div>");
              }else{
              tablecreation+="</tbody></table>";
              out.print(tablecreation);
              }
              conn.close();
    }
    catch(Exception e){
    e.printStackTrace();
    }
    %>
    
    