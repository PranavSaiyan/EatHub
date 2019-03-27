<%-- 
    Document   : success_pay.jsp
    Created on : Jan 15, 2018, 10:41:14 PM
    Author     : Pranav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="https://fonts.googleapis.com/css?family=Germania+One" rel="stylesheet">
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
    </head>
    <style>
        body{
            font-family: 'Germania One', cursive;
            background-image: url(images/success.gif);
            background-attachment: fixed;
            background-position:center;
        }
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
        </style>
        <script>
            function myFunction() {
    // Get the snackbar DIV
    var x = document.getElementById("snackbar");

    // Add the "show" class to DIV
    x.className = "show";

    // After 3 seconds, remove the show class from DIV
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 8000);
}
var count = 5;
    var mytimer =setInterval(function() {
        if(count){
    document.getElementById('timer').innerHTML=count;
    count--;}
    else{
        clearInterval(mytimer);
        window.location="https://cueathub.com/FoodCorner/Timeline.jsp";
    }
},1000);
        </script>
        <body onload="myFunction();"></body>
        <h1 style="color: #ffffff;text-align: center;text-shadow: 3px 2px 19px rgba(0, 0, 0, 1); ">Please Wait</h1>
            <h2  style="color: #ffffff;text-align: center;text-shadow: 3px 2px 19px rgba(0,0, 0, 1);">Automatic Redirecting In <i id="timer"></i></h2>
       <div id="snackbar">Your Payment Succeeded. Congrats !</div>
</html>