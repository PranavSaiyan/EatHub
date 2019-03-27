<%-- 
    Document   : closed
    Created on : Jan 8, 2018, 5:33:44 PM
    Author     : Pranav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.css" rel="stylesheet" type="text/css">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
       <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
       <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
       <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
       <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Closed</title>
    </head>
      <script>
var count = 5;
    var mytimer =setInterval(function() {
        if(count){
    document.getElementById('timer').innerHTML=count;
    count--;}
    else{
        clearInterval(mytimer);
        window.location="Home.jsp";
    }
},1000);
        </script>
    <body>
        <div class="row" style="margin-top: 10% !important;  font-family: 'Merriweather', serif !important;
                text-align: center !important;">
            <div class="col-md-2 col-sm-2"></div>
            <div class="col-md-8 col-sm-8"><img src="images/Closed-motion.gif" width="50%"/><h1 style="color: #000000;text-align: center;text-shadow: 3px 2px 19px rgba(0, 0, 0, 1); ">Please Wait</h1>
            <h2  style="color: #000;text-align: center;text-shadow: 3px 2px 19px rgba(0,0, 0, 1);">Automatic Redirecting In <i id="timer"></i></h2></div>
            <div class="col-md-2 col-sm-2"> </div>
            
        </div>
        
    </body>
</html>
