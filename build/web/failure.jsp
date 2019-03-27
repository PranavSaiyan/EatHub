<%-- 
    Document   : failure
    Created on : Oct 2, 2017, 10:32:54 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Failure</title>
    </head>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Open+Sans);


body {
    background: #ddd;
    background: linear-gradient(#ddd, #e8e8e8);
    font-family: 'Open Sans', sans-serif;
    height: 100vh;
    margin:0;
}

.thumb {
    width: 70%;
    height: 500px;
    margin: 10px auto;
    perspective: 1000px;
}

.thumb a {
    display: block;
    width: 100%;
    border-radius: 20px 20px 20px 20px;
    height: 100%;
    background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), 
		url("images/Chasing-Late-Payment-The-Crucial-Steps-1.gif");
    background-size: 0, cover;
    transform-style: preserve-3d;
    transition: all 0.5s;
}
.thumb:hover a,.thumb:focus a {
    transform: rotateX(80deg);
    transform-origin: bottom;
}
.thumb a:after {
    content: '';
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 36px;
    background: inherit;
    background-size: cover, cover;
    background-position: bottom;
    transform: rotateX(90deg);
    transform-origin: bottom;
}
.thumb a span {
    color: white;
    text-transform: uppercase;
    position: absolute;
    top: 100%;
    left: 0;
    width: 100%;
    font: bold 12px/36px "Open Sans";
    text-align: center;
    transform: rotateX(-89.99deg);
    transform-origin: top;
    z-index: 1;
}
.thumb a:before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    box-shadow: 0 0 100px 50px rgba(0, 0, 0, 0.5);
    transition: all 0.5s;
    opacity: 0.15;
    transform: rotateX(95deg) translateZ(-80px) scale(0.75);
    transform-origin: bottom;
}

.thumb:hover a:before {
    opacity: 1;
    box-shadow: 0 0 25px 25px rgba(0, 0, 0, 0.5);
    transform: rotateX(0) translateZ(-60px) scale(0.85);
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
    var x = document.getElementById("snackbar")

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
        <body onload="myFunction()">
            <div class="thumb">
                <a href="#">
		    <span>Please Wait... Automatic Redirecting In <i id="timer"></i></span>
	  </a>
</div>
       <div id="snackbar">Payment Failed</div>
    </body>
</html>
