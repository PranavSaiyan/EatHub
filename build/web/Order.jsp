  <%-- 
    Document   : Order
    Created on : 01-Jul-2017, 17:04:31
    Author     : Saiyan
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.css" rel="stylesheet" type="text/css">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">
            <!-- Load icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Mukta+Mahee" rel="stylesheet">

       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
       <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
       <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
       <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Bellefair" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Bree+Serif" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Fresca" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Indie+Flower" rel="stylesheet">
 
       <link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.css">
  
  <link href="http://www.justinaguilar.com/animations/css/animations.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
  <script type="text/javascript">
    function clearall(){
        setTimeout(function(){ document.getElementById('search_bar').value='';
        document.getElementById('search_result').style.height="0px"; }, 2000);
        
    }  
    function expandall(){
        document.getElementById('expand').click();
        document.getElementById('collapse').style.display="block";
    }  
    function collapseall() {
    document.getElementById('collapse').click();
}
    function sendSearchhandler(x)
{
    var value_s  = document.getElementById('search_bar').value;
//alert(value_s);
if(value_s==''){document.getElementById('search_result').innerHTML=value_s;
    document.getElementById('search_result').style.height="0px";
        }
else{
var url="search_ajax.jsp?val="+value_s;
document.getElementById('search_result').style.height="300px";
if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}
try
{
request.onreadystatechange=getSearchInfo;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}
}

function getSearchInfo(){
if(request.readyState===4){
var val=request.responseText;
document.getElementById('search_result').innerHTML=val;
}
}  
      // Accordion - Expand All #01
$(function () {
    $("#accordion").accordion({
        collapsible:true,
        active:false
    });
    var icons = $( "#accordion" ).accordion( "option", "icons" );
    $('#expand').click(function () {
        $('.ui-accordion-header').removeClass('ui-corner-all').addClass('ui-accordion-header-active ui-state-active ui-corner-top').attr({
            'aria-selected': 'true',
            'tabindex': '0'
        });
        $('.ui-accordion-header-icon').removeClass(icons.header).addClass(icons.headerSelected);
        $('.ui-accordion-content').addClass('ui-accordion-content-active').attr({
            'aria-expanded': 'true',
            'aria-hidden': 'false'
        }).show();
        $(this).attr("disabled","disabled");
        $('#collapse').removeAttr("disabled");
    });
    $('#collapse').click(function () {
        $('.ui-accordion-header').removeClass('ui-accordion-header-active ui-state-active ui-corner-top').addClass('ui-corner-all').attr({
            'aria-selected': 'false',
            'tabindex': '-1'
        });
        $('.ui-accordion-header-icon').removeClass(icons.headerSelected).addClass(icons.header);
        $('.ui-accordion-content').removeClass('ui-accordion-content-active').attr({
            'aria-expanded': 'false',
            'aria-hidden': 'true'
        }).hide();
        $(this).attr("disabled","disabled");
        $(this).css("display","none");
        $('#expand').removeAttr("disabled");
    });
});


 $( function() {
    $( "#dialog-message" ).dialog({
      modal: true,
      buttons: {
        Ok: function() {
          $( this ).dialog( "close" );
        }
      }
    });
  } );
  
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});
 $(document).ready(function(){
     $(".full").click(function(){
          if(parseInt( document.getElementById('session').value)===0){
               $.alert({    
    title: 'Alert!',
    content: 'Please Sign In to place Order',
});
        }
        else{
           sendInfofull($(this).val());
        } 
     });
 });
 $(document).ready(function(){
 $(".half").click(function (){
    if(parseInt( document.getElementById('session').value)===0){
                $.alert({    
    title: 'Alert!',
    content: 'Please Sign In to place Order',
});
        }
        else{
           sendInfohalf($(this).val());
        }
 });
 });
 $(document).ready(function() {
    $("#refresh").click(function(){
        refreshcart();
    });
});
    
    var request;    
function refreshcart(){
    var url="cartrefresh.jsp";
    if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=refresh;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
    
}
function refresh(){
    if(request.readyState===4){
var val=request.responseText;
document.getElementById('additems').innerHTML=val;
}
}
function sendInfohalf(x)
{
var url="HalfAjax.jsp?val="+x;
if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getInfo;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}
function sendInfofull(x){
  var url="FullAjax.jsp?val="+x;
  if(window.XMLHttpRequest){
      request=new XMLHttpRequest();
  }else if(window.ActiveXObject){
      request=new ActiveXObject("Microsoft.XMLHTTP");
  }
  try{
      request.onreadystatechange=getInfo;
      request.open("GET",url,true);
      request.send();
  }catch(e)
  {
      alert("Unable to connect to server");
  }
}

function getInfo(){
if(request.readyState===4){
var val=request.responseText;
 $.alert({    
    title: 'Alert!',
    content:val
});
}
}
/* Open when someone clicks on the span element */
function openNav() {
    document.getElementById("myNav").style.width = "100%";
}

/* Close when someone clicks on the "x" symbol inside the overlay */
function closeNav() {
    document.getElementById("myNav").style.width = "0%";
}
  
</script>
  <style>
    input[type=text] {
    width: 130px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    /*background-image: url('searchicon.png');*/
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
    
}

input[type=text]:focus {
    width: 100%;
}
       i{
                font-size:30px !important;
            }
      .half{
          box-shadow: #5bc0de 1px 1px 5px 5px !important;
      }
      .full{
          box-shadow: #5bc0de 1px 1px 5px 5px !important;
      }
      table{
          width:100%;padding:5px; border:5px black solid;border-collapse: collapse;
      }
      th{
          text-align: center;
          font-size: 35px;
          font-family: 'Fresca', sans-serif;
      }
      td{
          text-align:center;
          font-size: 28px;
          font-family: 'Bellefair', serif;
      }
      
      .jumbop{
              visibility: hidden;
              position: fixed !important;
              z-index: 1000 !important;
              width: 90% !important;
              margin-left: 5% !important;
              padding: 1% !important;
              height: 600px !important;
              overflow: auto !important;
              float: left !important;
              background-color: #003eff;
              box-shadow: #007fff 2px 2px 10px 10px ;
      }
      .thumbnail{
          display: flex;
          flex-direction: column;
          align-items: center;
          /*box-shadow: #5bc0de 0px 0px 5px 5px !important;*/
      }
      .thumbnail img{
          width: 550px !important;
          height:350px !important;
          border-radius: 10px 10px 10px 10px !important;
          border: 10px solid;
          /*box-shadow:#000 0px 0px 10px 10px !important;*/
          margin-top: 5% !important;
      }
      .caption{
         font-family: 'Lobster', cursive !important;
          text-align: center !important;
      }
      h3{
          font-size: 40px !important;
      }
      .btn{
           font-size: 30px !important;
           font-family: 'Lobster', cursive !important;
           background: #007fff !important;
           margin: 1% !important;
      }
            li{
                 font-family: 'Bree Serif', serif;
                color: white;
            }
            .navbar{
                font-family: cursive;
                font-size: 50px !important;
                height: 120px !important;
                font-weight: bolder;
            }
            .navbar-nav{
                margin-top: 40px !important;
            }
            body{
                background: black;
            }
            h2{
                font-size: 50px !important;
                font-family: 'Merriweather', serif !important;
                text-align: center !important;
                  text-shadow: 3px 3px #000 !important;
                background: #ec971f !important;
            }
            .btn-group{
                width: 80% !important;
                margin-left: 10% !important;
            }
            
            /* The Overlay (background) */
.overlay {
    /* Height & width depends on how you want to reveal the overlay (see JS below) */    
    height: 100%;
    width: 0;
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    background-color: rgb(0,0,0); /* Black fallback color */
    background-color: rgba(0,0,0, 0.9); /* Black w/opacity */
    overflow-x: hidden; /* Disable horizontal scroll */
    transition: 0.5s; /* 0.5 second transition effect to slide in or slide down the overlay (height or width, depending on reveal) */
}

/* Position the content inside the overlay */
.overlay-content {
    position: relative;
    top: 25%; /* 25% from the top */
    width: 100%; /* 100% width */
    text-align: center; /* Centered text/links */
    margin-top: 30px; /* 30px top margin to avoid conflict with the close button on smaller screens */
}

/* The navigation links inside the overlay */
.overlay a {
    padding: 8px;
    text-decoration: none;
    font-size: 36px;
     font-family: 'Fresca', sans-serif;
     font-weight:bolder;
    color: #818181;
    display: block; /* Display block instead of inline */
    transition: 0.3s; /* Transition effects on hover (color) */
}

/* When you mouse over the navigation links, change their color */
.overlay a:hover, .overlay a:focus {
    color: #f1f1f1;
}

/* Position the close button (top right corner) */
.overlay .closebtn {
    position: absolute;
    top: 20px;
    right: 45px;
    font-size: 60px;
}

/* When the height of the screen is less than 450 pixels, change the font-size of the links and position the close button again, so they don't overlap */
@media only screen and (max-device-width:480px) {
    .overlay a {font-size: 80px}
    .overlay .closebtn {
        font-size: 60px;
        top: 15px;
        right: 35px;
    }
}

.menuicon{
    text-align: center;
    width: 60px;
    height:10px;
    background-color:white;
    margin: 6px 50%;
}
 .jconfirm .jconfirm-box {
        width: 300px !important;
        text-align: center !important;
       
}

.accordion-expand-holder {
    margin:10px 0;
}
.accordion-expand-holder .open{
    margin:0 10px 0 0;
}
#collapse {
    display: none; /* Hidden by default */
    position: fixed; /* Fixed/sticky position */
    bottom: 20px; /* Place the button at the bottom of the page */
    right: 30px; /* Place the button 30px from the right */
    z-index: 99; /* Make sure it does not overlap */
    border: none; /* Remove borders */
    outline: none; /* Remove outline */
    background-color: red; /* Set a background color */
    color: white; /* Text color */
    cursor: pointer ; /* Add a mouse pointer on hover */
    padding: 15px; /* Some padding */
    border-radius: 10px ; /* Rounded corners */
    font-size: 18px; /* Increase font size */
}

#collapse:hover {
    background-color: #555 !important; /* Add a dark-grey background on hover */
}
  </style>
        <title>JSP Page</title>
    </head>
    <body>
       
         <% HttpSession session1;
          session1 = request.getSession();
          String email=null;
          String fname=null;
          if(session1.getAttribute("usrmail")!=null){ 
         try{
              email=(String)session1.getAttribute("usrmail");
                Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
              Statement st = conn.createStatement();
              ResultSet rs = st.executeQuery("SELECT * FROM untitled WHERE Email='"+email+"';");
              while(rs.next()){
              fname = rs.getString(2);
              }
                
              conn.close();
          }catch(Exception e){
              e.printStackTrace();
          } 
}
          %>
          
          
          <!-- The overlay -->
<div id="myNav" class="overlay">
  
  <!-- Button to close the overlay navigation -->
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  
  <!-- Overlay content -->
  <div class="overlay-content">
      
    <a href="./Home.jsp"><i class="material-icons">home</i> Home</a>
    <a href="./About.jsp"><i class="material-icons">description</i> About</a>
    <a href="./Order.jsp"  aria-haspopup="true" aria-expanded="false"><i class="material-icons">local_dining</i> Order<span class="sr-only">(current)</span></a>
    <a href="./Offers.jsp"><i class="material-icons">stars</i> Offers</a>
    <% if(session1.getAttribute("usrmail")==null){  
          %><input type="hidden" style="position: fixed;z-index: -100;" value="0" id="session">
          <a href="Signup.jsp" ><i class="material-icons">perm_contact_calendar</i> Sign Up</a>
          <a href="SignIn.jsp" aria-haspopup="true" aria-expanded="false"><i class="material-icons">perm_identity</i> Sign In</a>
           <% }else{  %>
           <input type="hidden" style="position: fixed;z-index: -100;" value="1" id="session">
           <a href="Timeline.jsp"><i class="material-icons">face</i><% out.print(fname); %></a>
           <%  } %>
  </div>

</div>
  
  <div class="accordion-expand-holder" style="display:none ">
    <button id="expand" type="button" >Expand all</button>
</div> 
   <button id="collapse" title="Go to top"><i class="material-icons">close</i></button>
  <div class="row">
      <div class="col-md-2 col-sm-2"></div>
      <div class="col-md-8 col-sm-8">
          <!-- Use any element to open/show the overlay navigation menu -->
<div class="menuicon pulse" onclick="openNav()"></div>
<div class="menuicon pulse" onclick="openNav()"></div>
<div class="menuicon pulse" onclick="openNav()"></div>
      </div>
      

<% if(session1.getAttribute("usrmail")!=null){  
          %>
          <div class="col-md-2 col-sm-2">
              <button style="float: right !important;" class="btn btn-info btn-lg" id="refresh" style="color: black !important" onclick="document.getElementById('cartmenu').style.visibility='visible'"><span class="glyphicon glyphicon-shopping-cart"></span></button></div>
          <% } %>
         
          
<form>
    <input type="text"  name="search" id="search_bar"  placeholder="Search.." onkeyup="sendSearchhandler()" onfocus="expandall()" onblur="clearall()" />
</form>
<!--   <form>
    Search Here :    <input type="text" id="search_bar" class="search_bar" onkeydown="sendSearchhandler()"/>
   </form>-->
   <div id="search_result" style="float: right;overflow: scroll;overflow-x: hidden;z-index:1000 !important;background: white;width:100%;">
   </div>   
  
  </div>     
 
<!--          <nav class="navbar navbar-inverse">
           <div class="container-fluid">
     Brand and toggle get grouped for better mobile display 
    <div class="navbar-header">
         
    </div>

     Collect the nav links, forms, and other content for toggling 
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
          <li><a href="./Home.jsp"><i class="material-icons">home</i> Home<span class="sr-only">(current)</span></a></li>
          <li><a href="./About.jsp"><i class="material-icons">description</i> About</a></li>
        <li class="active">
            <a href="./Order.jsp"  aria-haspopup="true" aria-expanded="false"><i class="material-icons">local_dining</i> Order</a>
        </li>
      </ul>       
      <ul class="nav navbar-nav navbar-right">
          <% if(session1.getAttribute("usrmail")==null){  
          %>
          <input type="hidden" style="position: fixed;z-index: -100;" value="0" id="session">
          <li><a href="Signup.jsp" ><i class="material-icons">perm_contact_calendar</i> Sign Up</a></li>
        <li>
            <a href="SignIn.jsp" aria-haspopup="true" aria-expanded="false"><i class="material-icons">perm_identity</i> Sign In</a>
        </li>
        <% }else{  %>
        <li ><button id="refresh" style="color: black" onclick="document.getElementById('cartmenu').style.visibility='visible'"><i class="material-icons">shopping_cart</i></button>
        </li>      
        <input type="hidden" style="position: fixed;z-index: -100;" value="1" id="session">
        <li><a href="Timeline.jsp"><i class="material-icons">face</i><% //out.print(fname); %></a></li>
        <%  } %>
      </ul>
    </div> /.navbar-collapse 
  </div> /.container-fluid 
          </nav>     -->
      
    <% if(request.getParameter("clear")!=null){
try{
                 Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
              Statement st = conn.createStatement();
              st.executeUpdate("DELETE FROM cart WHERE Email='"+email+"' ;");
              conn.close();
              
%>
               <div class="alert alert-success fade in" style="font-family: 'Indie Flower', cursive; font-size: 40px; text-align: center;">
                 <a href="#" class="close" data-dismiss="alert" aria-label="close" style="font-size: 40px;">&times;</a>
                 <strong >SUCCESS!</strong> ALL ITEMS HAVE BEEN REMOVED FROM THE CART
</div>
              <%
}catch(Exception e){
e.printStackTrace();
 System.err.println("Error Deleting All the Items from cart");
%>
<div class="alert alert-success fade in" style="font-family: 'Indie Flower', cursive; font-size: 40px; text-align: center;">
                 <a href="#" class="close" data-dismiss="alert" aria-label="close" style="font-size: 40px;">&times;</a>
                 <strong >FAILED!</strong> ERROR DELETING ALL ITEMS FROM CART
</div>
<%
}

}
        
        
        if(request.getParameter("item")!=null && request.getParameter("quan")!=null){
              try{
                 Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
              Statement st = conn.createStatement();
              st.executeUpdate("DELETE FROM cart WHERE Item='"+request.getParameter("item")+"' AND Quantity='"+request.getParameter("quan")+"' AND Email='"+email+"' ;");
              conn.close();
              %>
               <div class="alert alert-success fade in" style="font-family: 'Indie Flower', cursive; font-size: 40px; text-align: center;">
                 <a href="#" class="close" data-dismiss="alert" aria-label="close" style="font-size: 40px;">&times;</a>
                 <strong >SUCCESS!</strong> <% out.print(request.getParameter("quan")+" "+request.getParameter("item")); %> HAVE BEEN REMOVED FROM THE CART
</div>
              <%
              }catch(Exception e)
              {
                  e.printStackTrace();
                  System.err.println("Error Deleting the Item from cart");
                  %>
                      <div class="alert alert-success fade in" style="font-family: 'Indie Flower', cursive; font-size: 40px; text-align: center;">
                 <a href="#" class="close" data-dismiss="alert" aria-label="close" style="font-size: 40px;">&times;</a>
                 <strong >FAILED!</strong> ERROR DELETING THE ITEM 
                      </div>
                 <%
              }
          }
%>


      <div class="jumbop" id="cartmenu">
          <div class="jumbotron" id="additems" style="height: 500px !important;overflow: scroll !important;">
          
          </div>
           <button id="close" style="padding: 5px !important;border:2px black solid !important;float: right !important;font-weight: 600;" onclick="document.getElementById('cartmenu').style.visibility='hidden'">Close</button>
      </div>
      <%
       try{
                Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
              Statement st = conn.createStatement();
              ResultSet rs = st.executeQuery("SELECT * FROM Shopstatus;");
              while(rs.next()){
                  if(rs.getString("Status").equals("NO")){
//                  RequestDispatcher rd = request.getRequestDispatcher("closed.jsp");
//                  rd.forward(request, response);
                  %>
                  <script> location.replace("closed.jsp");  </script>      
<%
                  }
              }
              
              rs = st.executeQuery("SELECT * FROM menu WHERE Category='MOMOS';");
              
              %>
      <div id="accordion">
          <h2  >MOMOS</h2>
  <div>
    <div id="MOMOS" class="row">
      <%  while(rs.next()){
     %>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
        <img  id="<%= rs.getString(5) %>" src="itemimages/MOMOS/<%= rs.getString(5) %>" alt="<% out.print(rs.getString(2)); %>" >
      <div class="caption">
        <h3><% out.print(rs.getString(2)); %></h3>
        <p>
            <% if(rs.getInt(3)==0){}else{%><button class="btn half" value="<% out.print(rs.getString(2)); %>" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(3)); %>" >Half</button><% } %>
            <button class="btn full" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(4)); %>" value="<% out.print(rs.getString(2)); %>" >Full</button></p>
      </div>
    </div>
  </div>
  <% } %>
</div>
  </div>
      <%  rs = st.executeQuery("SELECT * FROM menu WHERE Category='RICE';"); %>
  <h2>RICE</h2>
  <div>
   <div class="row">
   <%  while(rs.next()){
     %>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
        <img id="<%= rs.getString(5) %>" src="itemimages/RICE/<%= rs.getString(5) %>" alt="<% out.print(rs.getString(2)); %>" >
      <div class="caption">
        <h3><% out.print(rs.getString(2)); %></h3>
        <p>
            <% if(rs.getInt(3)==0){}else{%><button class="btn half" value="<% out.print(rs.getString(2)); %>" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(3)); %>" >Half</button><% } %>
            <button class="btn full" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(4)); %>" value="<% out.print(rs.getString(2)); %>" >Full</button></p>
      </div>
    </div>
  </div>
  <% } %>
</div>
  </div>
  <%  rs = st.executeQuery("SELECT * FROM menu WHERE Category='CHOWMEIN';"); %>
  <h2>CHOWMEIN</h2>
  <div>
      <div class="row">
    <%  while(rs.next()){
     %>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
        <img id="<%= rs.getString(5) %>" src="itemimages/CHOWMEIN/<%= rs.getString(5) %>" alt="<% out.print(rs.getString(2)); %>" >
      <div class="caption">
        <h3><% out.print(rs.getString(2)); %></h3>
        <p>
            <% if(rs.getInt(3)==0){}else{%><button class="btn half" value="<% out.print(rs.getString(2)); %>" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(3)); %>" >Half</button><% } %>
            <button class="btn full" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(4)); %>" value="<% out.print(rs.getString(2)); %>" >Full</button></p>
      </div>
    </div>
  </div>
  <% } %>
      </div>
  </div>
       <%  rs = st.executeQuery("SELECT * FROM menu WHERE Category='PASTA';"); %>
  <h2>PASTA</h2>
  <div>
    <div class="row">
    <%  while(rs.next()){
     %>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
        <img id="<%= rs.getString(5) %>" src="itemimages/PASTA/<%= rs.getString(5) %>" alt="<% out.print(rs.getString(2)); %>" >
      <div class="caption">
        <h3><% out.print(rs.getString(2)); %></h3>
       <p>
            <% if(rs.getInt(3)==0){}else{%><button class="btn half" value="<% out.print(rs.getString(2)); %>" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(3)); %>" >Half</button><% } %>
            <button class="btn full" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(4)); %>" value="<% out.print(rs.getString(2)); %>" >Full</button></p>
      </div>
    </div>
  </div>
  <% } %>
</div>
  </div>
<%  rs = st.executeQuery("SELECT * FROM menu WHERE Category='TIKKA';"); %>
   <h2>TIKKA</h2>
  <div>
    <div class="row">
   <%  while(rs.next()){
     %>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
        <img id="<%= rs.getString(5) %>" src="itemimages/TIKKA/<%= rs.getString(5) %>" alt="<% out.print(rs.getString(2)); %>" >
      <div class="caption">
        <h3><% out.print(rs.getString(2)); %></h3>
      <p>
            <% if(rs.getInt(3)==0){}else{%><button class="btn half" value="<% out.print(rs.getString(2)); %>" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(3)); %>" >Half</button><% } %>
            <button class="btn full" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(4)); %>" value="<% out.print(rs.getString(2)); %>" >Full</button></p>
      </div>
    </div>
  </div>
  <% } %>
</div>
  </div>
<%  rs = st.executeQuery("SELECT * FROM menu WHERE Category='CHICKEN';"); %>
   <h2>CHICKEN</h2>
  <div>
   <div class="row">
  <%  while(rs.next()){
     %>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
        <img id="<%= rs.getString(5) %>" src="itemimages/CHICKEN/<%= rs.getString(5) %>" alt="<% out.print(rs.getString(2)); %>" >
      <div class="caption">
        <h3><% out.print(rs.getString(2)); %></h3>
       <p>
            <% if(rs.getInt(3)==0){}else{%><button class="btn half" value="<% out.print(rs.getString(2)); %>" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(3)); %>" >Half</button><% } %>
            <button class="btn full" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(4)); %>" value="<% out.print(rs.getString(2)); %>" >Full</button></p>
      </div>
    </div>
  </div>
  <% } %>
</div>
  </div>
<%  rs = st.executeQuery("SELECT * FROM menu WHERE Category='SOUP';"); %>
   <h2>SOUP</h2>
  <div>
   <div class="row">
 <%  while(rs.next()){
     %>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
        <img id="<%= rs.getString(5) %>" src="itemimages/SOUP/<%= rs.getString(5) %>" alt="<% out.print(rs.getString(2)); %>" >
      <div class="caption">
        <h3><% out.print(rs.getString(2)); %></h3>
     <p>
            <% if(rs.getInt(3)==0){}else{%><button class="btn half" value="<% out.print(rs.getString(2)); %>" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(3)); %>" >Half</button><% } %>
            <button class="btn full" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(4)); %>" value="<% out.print(rs.getString(2)); %>" >Full</button></p>
      </div>
    </div>
  </div>
  <% } %>
</div>
  </div>
<%  rs = st.executeQuery("SELECT * FROM menu WHERE Category='ROLLS';"); %>
   <h2>ROLLS</h2>
  <div>
   <div class="row">
 <%  while(rs.next()){
     %>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
        <img id="<%= rs.getString(5) %>" src="itemimages/ROLLS/<%= rs.getString(5) %>" alt="<% out.print(rs.getString(2)); %>" >
      <div class="caption">
        <h3><% out.print(rs.getString(2)); %></h3>
        <p>
            <% if(rs.getInt(3)==0){}else{%><button class="btn half" value="<% out.print(rs.getString(2)); %>" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(3)); %>" >Half</button><% } %>
            <button class="btn full" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(4)); %>" value="<% out.print(rs.getString(2)); %>" >Full</button></p>
      </div>
    </div>
  </div>
  <% } %>
</div>
  </div>
<%  rs = st.executeQuery("SELECT * FROM menu WHERE Category='VEG';"); %>
   <h2>VEG</h2>
  <div>
  <div class="row">
  <%  while(rs.next()){
     %>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
        <img id="<%= rs.getString(5) %>" src="itemimages/VEG/<%= rs.getString(5) %>" alt="<% out.print(rs.getString(2)); %>" >
      <div class="caption">
        <h3><% out.print(rs.getString(2)); %></h3>
         <p>
            <% if(rs.getInt(3)==0){}else{%><button class="btn half" value="<% out.print(rs.getString(2)); %>" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(3)); %>" >Half</button><% } %>
            <button class="btn full" data-toggle="tooltip" data-placement="bottom" title="Rs.<% out.print(rs.getInt(4)); %>" value="<% out.print(rs.getString(2)); %>" >Full</button></p>
      </div>
    </div>
  </div>
  <% } %>
</div>
  </div>
</div>
 <%
              conn.close();
          }catch(Exception e){
              e.printStackTrace();
             request.setAttribute("error", e);
              RequestDispatcher rd = request.getRequestDispatcher("Error.jsp");
              rd.forward(request, response);
          } 
          %>
    </body>
 <script>
       
        
 
       /* function full(e){
             if(parseInt( document.getElementById('session').value)===0){
                alert("Please Sign In to place order");
        }else{
          
        }
        
        */
        
        </script>
</html>
