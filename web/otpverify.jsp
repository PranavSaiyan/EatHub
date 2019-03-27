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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
          <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
            </style>
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
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 5000);
}

myFunction();
                
            </script>
            
            <%    
            }
            %>

<div class="card">
    <img src="images/Logo.jpg" alt="cueathub" style="width:100%">
  <h1>Enter Confirmation Code</h1>
  <p class="title">Sent to <% out.print(email); %></p>
  <form class="w3-container" action="OTPValidation">
      <input class="w3-input"  name="otp" id="otp" type="text" placeholder="OTP"><br>
      <input type="hidden" value="<% out.print(email); %>" name="email" id="email"/>
      <button type="submit" class="w3-button w3-black">CREATE ACCOUNT</button>
  </form>
  <p style="font-size: x-large;">By clicking next , you agree with the terms and conditions , moreover the policy digits of CUEATHUB.</p>
  <p>
  <form class="w3-container" action="OTPGenerator">Didn't received the code , try again
      <input type="hidden" value="<% out.print(email); %>" name="email" id="email"/>
      <button type="submit" class="w3-button w3-black">RESEND CODE</button></form></p>
</div>
    </body>
</html>
