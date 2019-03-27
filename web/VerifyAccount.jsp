<%-- 
    Document   : otpverify
    Created on : Sep 10, 2017, 8:08:49 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
          <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
           <link href="http://www.justinaguilar.com/animations/css/animations.css" rel="stylesheet" type="text/css">
          <link href="https://fonts.googleapis.com/css?family=PT+Sans+Narrow" rel="stylesheet">
        <title>JSP Page</title>
        <style>
            /* The snackbar - position it at the bottom and in the middle of the screen */
#snackbar {
    visibility: hidden; /* Hidden by default. Visible on click */
    min-width: 250px; /* Set a default minimum width */
    margin-left: -125px; /* Divide value of min-width by 2 */
    background-color: #333; /* Black background color */
    color: #fff; /* White text color */
    text-align: center; /* Centered text */
    border-radius: 2px; /* Rounded borders */
    padding: 16px; /* Padding */
    position: fixed; /* Sit on top of the screen */
    z-index: 1; /* Add a z-index if needed */
    left: 50%; /* Center the snackbar */
    bottom: 30px; /* 30px from the bottom */
}

/* Show the snackbar when clicking on a button (class added with JavaScript) */
#snackbar.show {
    visibility: visible; /* Show the snackbar */

/* Add animation: Take 0.5 seconds to fade in and out the snackbar. 
However, delay the fade out process for 2.5 seconds */
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

/* Animations to fade the snackbar in and out */
@-webkit-keyframes fadein {
    from {bottom: 0; opacity: 0;} 
    to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
    from {bottom: 30px; opacity: 1;} 
    to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
}

            .card {
                font-family: 'PT Sans Narrow', sans-serif !important;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    max-width: 50%;
    margin: auto;
    text-align: center;
    font-size: xx-large !important;
}

.title {
    color: grey;
    font-size: 18px;
}

button {
    border: none;
    outline: 0;
    display: inline-block;
    padding: 8px;
    color: white;
    background-color: #000;
    text-align: center;
    cursor: pointer;
    width: 100%;
    font-size: 18px;
}

a {
    text-decoration: none;
    font-size: 22px;
    color: black;
}

button:hover, a:hover {
    opacity: 0.7;
}


/* Style the links inside the sidenav */
#mySidenav a {
    position: absolute; /* Position them relative to the browser window */
    left: -80px; /* Position them outside of the screen */
    transition: 0.3s; /* Add transition on hover */
    padding: 15px; /* 15px padding */
    width: 100px; /* Set a specific width */
    text-decoration: none; /* Remove underline */
    font-size: 20px; /* Increase font size */
    color: white; /* White text color */
    border-radius: 0 5px 5px 0; /* Rounded corners on the top right and bottom right side */
}

#mySidenav a:hover {
    left: 0; /* On mouse-over, make the elements appear as they should */
}

/* The about link: 20px from the top with a green background */
#about {
    top: 20px;
    background-color: #4CAF50;
}

#blog {
    top: 80px;
    background-color: #2196F3; /* Blue */
}

#projects {
    top: 140px;
    background-color: #f44336; /* Red */
}

#contact {
    top: 200px;
    background-color: #555 /* Light Black */
}
.button {
  padding: 15px 25px;
  font-size: 24px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  font-weight: 600;
  background-color: #222;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
  width: 30%;
}

.button:hover {background-color: #666;}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
#myProgress{
    margin-top: 2%;
}
#myBar {
    width: 0%;
    height: 30px;
    background-color: #0f0f0f;
    text-align: center; /* To center it horizontally (if you want) */
    line-height: 30px; /* To center it vertically */
    color: white; 
}
#display{
    visibility: hidden;
   margin-top: 2%;
  -webkit-animation: glow 3s ease-in-out infinite;
  animation: glow 3s ease-in-out infinite;

}


@-webkit-keyframes glow 
{
  50% { box-shadow: 0 0 80px #000; }
}

@keyframes glow 
            </style>
            <script>
                
function sendOTP()
{
var url="SendOTP.jsp";
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
function getInfo(){
if(request.readyState===4){
var val=request.responseText;
alert(val);
}
}
                function show(){
                    document.getElementById('display').style.visibility='visible';
                }
                function move() {
                    sendOTP();
                    document.getElementById('display').style.visibility='hidden';
    var elem = document.getElementById("myBar"); 
    var width = 0;
    var id = setInterval(frame, 80);
    function frame() {
        if (width >= 100) {
            clearInterval(id);
           
            show();
            document.getElementById('butt').style.visibility='hidden';
        } else {
             document.getElementById('butt').disabled=true;
            width++; 
            elem.style.width = width + '%'; 
            elem.innerHTML = width * 1 + '%';
        }
    }
    ///////////
     
    /////////
}
                </script>
    </head>
    <body>
        <%
            String email = request.getParameter("email");
            if(request.getParameter("success")!=null){
            %>
            <div id="snackbar">OTP was incorrect</div>
            <script>
                function myFunction() {
    // Get the snackbar DIV
    var x = document.getElementById("snackbar");

    // Add the "show" class to DIV
    x.className = "show";

    // After 3 seconds, remove the show class from DIV
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}

myFunction();
                
            </script>
            
            <%    
            }
            %>
<div id="mySidenav" class="sidenav">
    <a href="Home.jsp" id="about">Home</a>
    <a href="About.jsp" id="blog">About</a>
    <a href="Order.jsp" id="projects">Order</a>
  <a href="Logout" id="contact">Logout</a>
</div>
<div class="card">
    <img src="images/Logo.jpg" alt="cueathub" style="width:60%">
  <h3>Your Account Email Isn't Verified , Please Click Below To Send OTP</h3>
  <button id="butt" class="button" onclick="move()" >Click Me</button> 
  
 <div id="myProgress">
  <div id="myBar"></div>
</div>
 <div id='display'  >
          Sent To <p class="title"><% out.print(email); %></p>

  <form class="w3-container" action="OTPValidation">
      <input class="w3-input"  name="otp" id="otp" type="text" placeholder="OTP"><br>
      <input type="hidden" value="<% out.print(email); %>" name="email" id="email"/>
      <button type="submit" class="w3-button w3-black">VERIFY ACCOUNT</button>
       <p style="font-size: x-large;">By clicking next , you agree with the terms and conditions , moreover the policy digits of CUEATHUB.</p>
       Didn't received the code , try again
       <button type="reset" onclick="move()" class="w3-button w3-black">RESEND CODE</button>
  </form>
 </div>
</div>
    </body>
</html>
