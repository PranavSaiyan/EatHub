<%-- 
    Document   : OrderList
    Created on : 07-Jul-2017, 23:16:07
    Author     : Saiyan
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
            response.setHeader("Cache-Control","no-cache");
            response.setHeader("Cache-Control","no-store");
            response.setDateHeader("Expires", 0);
            response.setHeader("Pragma","no-cache");
%>
<!DOCTYPE html>
<html>
    <head>
     
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-112514885-1');
</script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/css?family=Zilla+Slab" rel="stylesheet">
         <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.css" rel="stylesheet" type="text/css">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
       <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
       <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
      <link href="https://fonts.googleapis.com/css?family=Acme|Zilla+Slab+Highlight" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
        <style>
            
.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #4CAF50;
  color: white;
}
            button{
                width: 80%;
                margin-left: 10%;
            }
            body{
                background:black;
                font-size: 40px;
                
            }
            table{
                width: 100%;
                border: 5px black solid;
                font-family: 'Acme', sans-serif;
                background:whitesmoke;
            }
            th{
                text-align: center;
            }
            tr{
                border: 5px black solid;
                margin: 5px;
            }
            td{
                padding: 5px;
                margin: 5px;
                border:5px #000 solid;
            }

a:hover {
    background-color: #ddd;
    color: black;
}

.previous {
    background-color: #4CAF50;
    color: white;
}

.next {
    background-color: #D32847;
    color: white;
}

.round {
    border-radius: 40%;
    
}
        </style>
    </head>
    <script>
        var request;    
        var request2;
        var request3;
        var request4;
        var request5;
        function shopoff(){
            var url="Shopoff.jsp";
    if(window.XMLHttpRequest){
request5=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request5=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request5.onreadystatechange=shoprefresh;
request5.open("GET",url,true);
request5.send();
}
catch(e)
{
alert("Unable to connect to server");
}  
    }
        function shopon(){
            var url="Shopon.jsp";
    if(window.XMLHttpRequest){
request5=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request5=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request5.onreadystatechange=shoprefresh;
request5.open("GET",url,true);
request5.send();
}
catch(e)
{
alert("Unable to connect to server");
}  
    }
    function shoprefresh(){
              if(request5.readyState===4){
                var val=request5.responseText;
         $.alert({    
            title: 'Hey,',
              content: val
                });
}
        }
        function cooked(e){
    var url="CookedRefresh.jsp?email="+e.value;
    if(window.XMLHttpRequest){
request4=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request4=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request4.onreadystatechange=refreshcooked;
request4.open("GET",url,true);
request4.send();
}
catch(e)
{
alert("Unable to connect to server");
}  
}
function refreshcooked(){
    if(request4.readyState===4){
var val=request4.responseText;
 $.alert({    
    title: 'Alert!',
    content: 'Item is cooked',
});
}}
        function accept(e){
    var url="AcceptRefresh.jsp?email="+e.value;
    if(window.XMLHttpRequest){
request3=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request3=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request3.onreadystatechange=refreshaccept;
request3.open("GET",url,true);
request3.send();
}
catch(e)
{
alert("Unable to connect to server");
}  
}
function refreshaccept(){
    if(request3.readyState===4){
var val=request3.responseText;
 $.alert({    
    title: 'Alert!',
    content: 'Item is accepted',
});
}}



  function refreshcompletedorder(){
    var url="OrderCompetedListRefresh.jsp";
    if(window.XMLHttpRequest){
request2=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request2=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request2.onreadystatechange=refreshcompleted;
request2.open("GET",url,true);
request2.send();
}
catch(e)
{
alert("Unable to connect to server");
}
    
}

function refreshcompleted(){
    if(request2.readyState===4){
var val=request2.responseText;
document.getElementById('addcompleteditems').innerHTML=val;
}}

function refreshpendingorder(){
    var url="OrderPendingListRefresh.jsp";
    if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=refreshpending;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
    
}

function refreshpending(){
    if(request.readyState===4){
var val=request.responseText;
document.getElementById('addpendingitems').innerHTML=val;
}}
function loopi(){
    setInterval(refreshpendingorder,2000);
    setTimeout(refreshcompletedorder,2000);
}
        </script>
        <%if(request.getParameter("Delivered")!=null){
        
   try{
          Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
              Statement st = conn.createStatement();
              st.executeUpdate("UPDATE orderlist SET Delivered=1 WHERE ID="+Integer.parseInt(request.getParameter("Delivered"))+"");
             
              conn.close();
   }catch(Exception e){
       e.printStackTrace();
   }
        }
        if(request.getParameter("Declined")!=null){
        try{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
              Statement st = conn.createStatement();
              st.executeUpdate("UPDATE orderlist SET Decline=1,pay=2 WHERE ID="+Integer.parseInt(request.getParameter("Declined"))+";");
              
             
              conn.close();
   }catch(Exception e){
       e.printStackTrace();
   }
        }
            %>
        
        <body onload="loopi()">
            <% HttpSession session1;
          session1 = request.getSession();
          if(session1.getAttribute("usrname")==null){ 
  RequestDispatcher rd = request.getRequestDispatcher("AdminLogin.jsp");
  rd.forward(request, response);
  } %>
  <div class="topnav" style="font-family: 'Zilla Slab Highlight';">
      <a class="active"><i class="material-icons">account_circle</i> <%  out.print(session1.getAttribute("usrname")); %></a>
      <div class="shop_buttons" style="float: right;">
          
          <a href="#" style="
    text-decoration: none;
    display: inline-block;
    padding: 8px 16px;
   " class="previous round" onclick="shopon()" >On</a>
          <a href="#" style="
    text-decoration: none;
    display: inline-block;
    padding: 8px 16px;
   " class="next round" onclick="shopoff()">Off</a>  </div>
      <div style="float: right; margin-right: 2%;"><i style="color: white;">Shop : </i></div>
      <a class="active" href="OrderList.jsp"><i class="material-icons">cached</i> Refresh</a>
      <a class="active" href="AdminLogout.jsp"><i class="material-icons">power_settings_new</i> Logout</a>
  
  

</div>
            <button style="font-family: 'Zilla Slab Highlight', cursive;" data-toggle="collapse" data-target="#pending">Pending Orders</button>
            <div id="pending" class="collapse" style=" height: 50% !important;overflow: scroll !important;">
<table id="addpendingitems">
          
        </table>
</div>
            <button style="font-family: 'Zilla Slab Highlight', cursive;" data-toggle="collapse" data-target="#completed">Completed Orders</button>
            <div id="completed" class="collapse" style="height: 50% !important;overflow: scroll !important;">
<table id="addcompleteditems">
          
        </table>
</div>
        
    </body>
</html>
