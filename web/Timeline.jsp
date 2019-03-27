<%-- 
    Document   : Timeline
    Created on : 28-Jun-2017, 12:09:32
    Author     : Saiyan
--%>

<%@page import="java.util.Random"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
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
         <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.css" type="text/css" rel="stylesheet">        <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" type="text/css" rel="stylesheet">
         <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lemonada" rel="stylesheet">
         <link href="https://fonts.googleapis.com/css?family=Bree+Serif" rel="stylesheet">
         <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
  <script src="../../ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="../../maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Arvo" rel="stylesheet">
        <title>Timeline</title>
        <script>
            
        /* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
function mynavbutton() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}
            var myVar;

function myFunction() {
    myVar = setTimeout(showPage, 3000);
}

function showPage() {
  document.getElementById("loader").style.display = "none";
  document.getElementById("myDiv").style.display = "block";
}
            var request;
            function refreshtimeline(){
    var url="TimelineOrderRefresh.jsp";
    if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=timeline;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
    
}

function timeline(){
    if(request.readyState===4){
var val=request.responseText;
document.getElementById('addorders').innerHTML=val;
}}

function loopi(){
    
    setTimeout(refreshtimeline,1000);
    setInterval(refreshtimeline,5000);
    myFunction();
}

 
            </script>
        <style>
           
            i{
                font-size:30px !important;
            }
            .list-group-item{
                text-align: center !important;
                font-family: 'Arvo', serif !important;
            }
            .jumbo{
                width: 100% !important;
                background-color: white !important;
                font-family: 'Arvo', serif;
                font-size: 40px !important;
                box-shadow: #666666 2px 2px 10px 10px !important;
                
            }
            .alert-warning{
                font-size: 35px !important;
                text-align: center !important;
            }
            .jumbo2{
                width: 100% !important;
                background-color: white !important;
                font-family: 'Arvo', serif;
                font-size: 25px !important;
                box-shadow: #666666 2px 2px 10px 10px !important;
            }
            table{
                width:  100%;
                  border:10px black solid!important;
            }
            #avtarchoose{
                z-index: 100;
                position: fixed;
                visibility: hidden;
            }
            td{
                border: 5px black solid !important;
                padding: 10px !important;
                margin: 20px !important;
            }
            tr{
                 border: 5px black solid !important;
            }
            th{ text-align:center;}
            li{
                font-family: 'Bree Serif', serif !important;
            }
            img{
                
            }
            li{
                font-family: cursive;
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
           
            select
            {height: 60px !important;
               font-size: 30px !important;
                font-family: cursive !important;
                font-weight: bolder !important;
                
            }
            
            .input-group{
                border: 2px black solid !important;
            }
            form{
                 background: white;            margin-left: 10%;margin-right: 10%; margin-top: 10%;
                 font-family: cursive !important;
                font-weight: bolder !important;
                font-size: 30px !important;
            }
            body{
                background:black;
            }
            input{
               height: 60px !important;
               font-size: 30px !important;
                font-family: cursive !important;
                font-weight: bolder !important;
            }
            button{
                font-size:20px !important;
                font-family: 'Arvo', serif !important;   
            }
            .paypending{
                width:100px;
            }
            .paid{
                width:100px;
            }
            
            /* Center the loader */
#loader {
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: 1;
  width: 150px;
  height: 150px;
  margin: -75px 0 0 -75px;
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:0 } 
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom { 
  from{ bottom:-100px; opacity:0 } 
  to{ bottom:0; opacity:1 }
}

#myDiv {
  display: none;
  text-align: center;
}
/* Add a black background color to the top navigation */
.topnav {
    background-color: #333;
    overflow: hidden;
}

/* Style the links inside the navigation bar */
.topnav a {
    float: left;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
   font-size: 50px !important;
    font-weight: bolder !important;
    font-family: 'Bree Serif', serif !important;
}

/* Change the color of links on hover */
.topnav a:hover {
    background-color: #ddd;
    color: black;
}

/* Hide the link that should open and close the topnav on small screens */
.topnav .icon {
    display: none;
}
/* When the screen is less than 600 pixels wide, hide all links, except for the first one ("Home"). Show the link that contains should open and close the topnav (.icon) */
@media only screen and (max-device-width:480px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

/* The "responsive" class is added to the topnav with JavaScript when the user clicks on the icon. This class makes the topnav look good on small screens (display the links vertically instead of horizontally) */
@media only screen and (max-device-width:480px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive a.icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}
  @media only screen and (max-device-width:480px){
       /* styles for mobile browsers smaller than 480px; (iPhone) */
       .list-group-item{
                text-align: center !important;
                font-family: 'Arvo', serif !important;
                font-size:30px;
            }
       img{
            width:100px;
           height:60px;
       }
       .col-md-4>img{
           width:300px;
           height:250px;
       }
       .col-sm-4>img{
            width:160px;
           height:130px;
       }
       .col-sm-4,.col-sm-8{
           margin-top:5%;
       }
    }
    .cd-modal-action {
  position: relative;
}
.cd-modal-action .btn {
  width: 12.5em;
  height: 4em;
  background-color: #123758;
  border-radius: 5em;
  transition: color 0.2s 0.3s, width 0.3s 0s;
}
.cd-modal-action .btn.to-circle {
  width: 4em;
  color: transparent;
  transition: color 0.2s 0s, width 0.3s 0.2s;
}
.cd-modal-action .cd-modal-bg {
  position: absolute;
  top: 0;
  left: 50%;
  transform: translateX(-2em);
  width: 4em;
  height: 4em;
  background-color: #123758;
  border-radius: 50%;
  opacity: 0;
  visibility: hidden;
  transition: visibility 0s 0.5s;
}
.cd-modal-action .cd-modal-bg.is-visible {
  opacity: 1;
  visibility: visible;
}
     </style>
     <script>
         var btnRadius = $('.cd-modal-bg').width()/2,
	left = $('.cd-modal-bg').offset().left + btnRadius,
	top = $('.cd-modal-bg').offset().top + btnRadius - $(window).scrollTop(),
	scale = scaleValue(top, left, btnRadius, $(window).height(), $(window).width());
 
function scaleValue( topValue, leftValue, radiusValue, windowW, windowH) {
	var maxDistHor = ( leftValue > windowW/2) ? leftValue : (windowW - leftValue),
		maxDistVert = ( topValue > windowH/2) ? topValue : (windowH - topValue);
	return Math.ceil(Math.sqrt( Math.pow(maxDistHor, 2) + Math.pow(maxDistVert, 2) )/radiusValue);
}
         </script>
    </head>
    <body onload="loopi()" style="margin:0;">
   <%
        HttpSession session1;
          session1 = request.getSession();
          if(session1.getAttribute("usrmail")==null){ 
  RequestDispatcher rd = request.getRequestDispatcher("SignIn.jsp");
  rd.forward(request, response);
  } %>
        
  <div id="loader"></div>
  <div style="display:none;" id="myDiv" class="animate-bottom">       
  <div class="topnav" id="myTopnav">
  <a href="./Home.jsp" ><i class="material-icons">home</i> Home<span class="sr-only">(current)</span></a>
  
  <a href="./About.jsp"><i class="material-icons">description</i> About</a>
  <a href="./Order.jsp"  aria-haspopup="true" aria-expanded="false"><i class="material-icons">local_dining</i> Order</a>
  <a href="./Offers.jsp"><i class="material-icons">stars</i> Offers</a>
  <a href="Logout" aria-haspopup="true" aria-expanded="false"><i class="material-icons">face</i>Logout</a>
  <a href="javascript:void(0);" class="icon" onclick="mynavbutton()">&#9776;</a>
</div>
  
      <%  /*Cookie cookie =null;
             Cookie[] cookies =request.getCookies();
             if(cookies!=null){
                 out.print("Welcome !");
                 for(int i=0;i<cookies.length;i++){
                     cookie = cookies[i];
                     out.print(cookie.getValue());
                 }
                
             }else{
                 out.println("No Cookies Found");
             }*/
          String email=null,fullname=null,about=null,gender=null,interest=null,dob=null,mobile=null,state=null,avtar=null,path=null;
          StringBuilder paylist = new StringBuilder();
          int success=0;
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
              fullname = rs.getString(2)+" "+rs.getString(3);
               about = rs.getString(5);
             gender = rs.getString(6);
               interest = rs.getString(7);
               dob = rs.getString(8);
               mobile = rs.getString(9);
               state = rs.getString(10);
               avtar = rs.getString(11);
               success = rs.getInt(13);
              }
              
              rs = st.executeQuery("SELECT * FROM orderlist WHERE Email='"+email+"' AND pay=0;");
while(rs.next()){
paylist.append("<option value='"+rs.getString(12)+"'>"+rs.getString(3)+"</option>");
}              
///////////////////////////////////
              
              if(success==0){
                  RequestDispatcher rd = request.getRequestDispatcher("VerifyAccount.jsp?email="+email);
                  rd.forward(request, response);
              }else{
                  success=1;
              }
              rs = st.executeQuery("SELECT path FROM avtars WHERE name='"+avtar+"';");
              while(rs.next()){
                  path = rs.getString("path");
              }
              
              if(request.getParameter("avtar")!=null){
                  st.executeUpdate("UPDATE untitled SET Avtar='"+request.getParameter("avtar")+"' WHERE Email='"+email+"';");
                 %>
                 <script>window.location.href='Timeline.jsp'; </script>
                 <%
              }
              
              if(request.getParameter("OrderPlace")!=null && request.getParameter("total")!=null){
              String candidateChars ="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
              StringBuilder sb = new StringBuilder();
  Random random = new Random();
    for (int i = 0; i < 12; i++) {
        sb.append(candidateChars.charAt(random.nextInt(candidateChars
                .length())));
    }

              DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
              Date date = new Date();
              String date_time = dateFormat.format(date).toString();
              String[] data = date_time.split(" ");
              rs = st.executeQuery("SELECT * FROM cart WHERE Email='"+email+"';");
              String des="";
              while(rs.next()){
                  des+=rs.getString(4)+"("+rs.getString(5)+") |";
              }
              st.executeUpdate("INSERT INTO orderlist (Fname,Description,Price,Accept,Cooked,Delivered,Decline,Date,Time,Email,txnid,pay)VALUES('"+fullname+"','"+des+"','"+request.getParameter("total")+"',0,0,0,0,'"+data[0]+"','"+data[1]+"','"+email+"','"+sb+"',0);");
              
              st.executeUpdate("DELETE FROM cart WHERE Email='"+email+"';");
%>
                 <script>window.location.href='Timeline.jsp'; </script>
                 <%
              }
              conn.close();

          }catch(Exception e){
              e.printStackTrace();
          }
              %>
              
              <!-- Trigger the modal with a button -->
              <div class="jumbotron jumbo">
                  <h1 style="text-align: center;margin-bottom: 3%;font-size: 70px !important;color: black !important;">PROFILE</h1>
                 
                  <div class="row">
                      <div class="col-md-4">
                          <img src="<% out.print(path); %>" width="450px" height="400px" style="border-radius: 50%;border: solid black 2px;box-shadow: #666666 2px 2px 8px 8px;">
                          <button type="button" onclick="document.getElementById('avtarchoose').style.visibility='visible';"><i class="material-icons">camera_enhance</i></button>
                          <div id="avtarchoose" style="top:0%;width: 80%;float: left;margin-left: 10%;background-color:black;border-radius: 20px;box-shadow: #666666 4px 4px 8px 8px;">  
                           <div id="avtar" class="row">
                               <button type="button" onclick="document.getElementById('avtarchoose').style.visibility='hidden';" style="float: right;margin-right: 10px;font-weight: 600;">Close</button>
                               <form action="Timeline.jsp" style="margin-top: 5% !important;">
                                  <div class="col-md-2 col-sm-4">
                                      <img src="images/newavtar/tomato.gif"  style="border-radius: 50%" width="150px" height="150px">
                                      <input type="radio" name="avtar" value="tomato">
                                  </div>
                                   <div class="col-md-2 col-sm-4">
                                       <img src="images/animated-apple-image-0017.gif"  style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="apple" >
                                  </div>
                                  <div class="col-md-2 col-sm-4">
                                      <img src="images/Cute-Animated-Gif-Pear.gif"  style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="pear">
                                  </div>
                                  
                                  <div class="col-md-2 col-sm-4">
                                      <img src="images/carrot.gif"  style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="carrot">
                                  </div>
                                  <div class="col-md-2 col-sm-4">
                                      <img src="images/brinjal.gif"  style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="brinjal">
                                  </div>
                                   <div class="col-md-2 col-sm-4">
                                       <img src="images/newavtar/banana.jpg"  style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="banana">
                                  </div>
                                   <div class="col-md-2 col-sm-4">
                                       <img src="images/burger.gif"  style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="burger">
                                  </div>
                                  <div class="col-md-2 col-sm-4">
                                      <img src="images/newavtar/cheese.gif"  style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="cheese">
                                  </div>
                                  <div class="col-md-2 col-sm-4">
                                      <img src="images/newavtar/pizza.gif" style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="pizza">
                                  </div>
                                  <div class="col-md-2 col-sm-4">
                                      <img src="images/newavtar/coconut.gif"  style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="coconut">
                                  </div>
                                  <div class="col-md-2 col-sm-4">
                                      <img src="images/newavtar/egg.gif"  style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="egg">
                                  </div>
                                  <div class="col-md-2 col-sm-4">
                                      <img src="images/newavtar/garlic.gif"  style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="garlic">
                                  </div>
                                  <div class="col-md-2 col-sm-4">
                                      <img src="images/newavtar/grapes.gif"  style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="grapes">
                                  </div>
                                  <div class="col-md-2 col-sm-4">
                                      <img src="images/newavtar/nachos.gif"  style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="nachos">
                                  </div>
                                  <div class="col-md-2 col-sm-4">
                                      <img src="images/newavtar/onion.gif"  style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="onion">
                                  </div>
                                  <div class="col-md-2 col-sm-4">
                                      <img src="images/newavtar/pepper.gif"  style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="pepper">
                                  </div>
                                  <div class="col-md-2 col-sm-4">
                                      <img src="images/newavtar/pineapple.gif"  style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="pineapple">
                                  </div>
                                  <div class="col-md-2 col-sm-4">
                                      <img src="images/newavtar/pomegranate.gif"  style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="pomegranate">
                                  </div>
                                  <div class="col-md-2 col-sm-4">
                                      <img src="images/newavtar/potato.gif"  style="border-radius: 50%" width="150px" height="150px">
                                       <input type="radio" name="avtar" value="potato">
                                  </div>
                                   <div class="col-md-8">
                                    <button type="submit"  style="width: 40%; height: 10%;margin-top: 20%;float: right;margin-right: 10px;font-weight: 600;">Select Avtar</button></div> 
                                   
                              </form>
                              
                          </div>
                              
                          </div>
                
                  </div>
                      <div class="col-md-2 col-sm-4">
                               <ul class="list-group">
                              <li class="list-group-item list-group-item-success"> Name </li>
                              <li class="list-group-item list-group-item-info"> Email </li>
                              <li class="list-group-item list-group-item-warning"> Gender </li>
                              <li class="list-group-item list-group-item-danger"> Interest </li>
                               <li class="list-group-item list-group-item-success"> Mobile </li>
                              <li class="list-group-item list-group-item-info"> About </li>
                              <li class="list-group-item list-group-item-warning"> State </li>
</ul>
                      </div>
                      <div class="col-md-6 col-sm-8">
                          <ul class="list-group">
                              <li class="list-group-item list-group-item-success"><% out.print(fullname); %></li>
                              <li class="list-group-item list-group-item-info"><% out.print(email); %></li>
                              <li class="list-group-item list-group-item-warning"><% out.print(gender); %></li>
                              <li class="list-group-item list-group-item-danger"><% out.print(interest); %></li>
                               <li class="list-group-item list-group-item-success"><% out.print(mobile); %></li>
                              <li class="list-group-item list-group-item-info"><% out.print(about); %></li>
                              <li class="list-group-item list-group-item-warning"><% out.print(state); %></li>
</ul>
                      </div>
                  </div>
                  <style>
                  .button {
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 28px;
  padding: 20px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '$';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover,.button:active span {
  padding-right: 25px;
}

.button:hover,.button:active span:after {
  opacity: 1;
  right: 0;
}
.w3-modal-content{
    height:80% !important;
}
.center-on-page {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
}
select {
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  appearance: none;
  outline: 0;
  box-shadow: none;
  border: 0 !important;
  background: #2c3e50;
  background-image: none;
}
/* Custom Select */
.select {
  position: relative;
  display: block;
  width:100%;
  height:100%;
  line-height: 3;
  background: #2c3e50;
  overflow: hidden;
  border-radius: .25em;
}
select {
  height: 100%;
  width:300px;
  margin: 0;
  padding: 0 0 0 .5em;
  color: #fff;
  cursor: pointer;
}
select::-ms-expand {
  display: none;
}
/* Arrow */
.select::after {
  content: '\25BC';
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  padding: 0 1em;
  background: #34495e;
  pointer-events: none;
}
/* Transition */
.select:hover::after {
  color: #f39c12;
}
.select::after {
  -webkit-transition: .25s all ease;
  -o-transition: .25s all ease;
  transition: .25s all ease;
}
.btnpay {
    margin-top: 5%;
  padding: 15px 25px;
  font-size: 24px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.btnpay:hover {background-color: #3e8e41}

.btnpay:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
                  </style>
                  <button class="button" onclick="document.getElementById('id01').style.display='block'" ><span>Pay</span></button>
              </div>

  <div id="id01" class="w3-modal w3-animate-opacity">
    <div class="w3-modal-content w3-card-4">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-large w3-display-topright">&times;</span>

        
        <div class="center-on-page">
            <form action="PayConfirm.jsp" method="post" style="width: 100%;">
  <div class="select">
      <select style="font-size: large !important;" name="txnid" id="slct">
      <option>Choose Your Order</option>
     <%= paylist %>
    </select>
    </div>
          <button class="btnpay" type="submit" >Next</button> 
      </form>
  
  
</div>
      </header>
    </div>
  </div>
<div class="jumbotron jumbo2" >
    <h1 style="text-align: center;margin-bottom: 3%;font-size: 70px !important;color: black !important;">ORDER HISTORY</h1>
    <div class="row">
        <div class="col-md-12" id="addorders">
            
        </div>
    </div>
    
    
</div>
  </div>
        </body>
</html>
