<%-- 
    Document   : Login
    Created on : 01-Jul-2017, 11:30:11
    Author     : Saiyan
--%>

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

        <title>Login</title>
        <meta charset="UTF-8">
        <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.css" rel="stylesheet" type="text/css">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Bellefair" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Bree+Serif" rel="stylesheet">
       <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Fresca" rel="stylesheet">
       <link href="http://www.justinaguilar.com/animations/css/animations.css" rel="stylesheet" type="text/css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript">
    function openNav() {
    document.getElementById("myNav").style.height = "100%";
}

function closeNav() {
    document.getElementById("myNav").style.height = "0%";
} 
</script>
    <style>
        .overlay {
    height: 0%;
    width: 100%;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0, 0.9);
    overflow-y: hidden;
    transition: 0.5s;
}

.overlay-content {
    position: relative;
    top: 25%;
    width: 100%;
    text-align: center;
    margin-top: 30px;
}

.overlay a {
    padding: 8px;
    text-decoration: none;
    font-family: 'Bree Serif', serif;
                color: white;
    font-size: 55px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.overlay a:hover, .overlay a:focus {
    color: #f1f1f1;
}

.overlay .closebtn {
    position: absolute;
    top: 20px;
    right: 45px;
    font-size: 60px;
}

@media screen and (max-height: 450px) {
  .overlay {overflow-y: auto;}
  .overlay a {font-size: 20px}
  .overlay .closebtn {
    font-size: 40px;
    top: 15px;
    right: 35px;
  }
}
        i{
                font-size:30px !important;
            }
            img{
                border-radius:40% ;
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
           
            select{height: 60px !important;
               font-size: 30px !important;
                font-family: cursive !important;
                font-weight: bolder !important;
                
            }
            span{
                font-family: cursive !important;
                font-weight: bolder !important;
                text-align: left !important;
                font-size: 20px !important;
                
            }
            .input-group{
                border: 2px black solid !important;
            }
           
            body{
                background:#245580;
            }
            .jumbotron{
                width: 50% !important;
                margin-left: 25% !important;
                background: black;
                border-radius: 20px !important;
                box-shadow: #007fff 2px 2px 10px 10px !important;
            }
            input{
               height: 60px !important;
               font-size: 30px !important;
                font-family: cursive !important;
                font-weight: bolder !important;
            }
            </style>
    </head>
    <body>
          <div id="myNav" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="overlay-content">
   <a href="./Home.jsp"><i class="material-icons">home</i> Home<span class="sr-only">(current)</span></a>
   <a href="./About.jsp"><i class="material-icons">description</i> About</a>
   <a href="./Order.jsp"><i class="material-icons">local_dining</i> Order</a>
    <a href="#"><i class="material-icons">home</i> Contact</a>
    
          <a href="Signup.jsp" ><i class="material-icons">perm_contact_calendar</i> Sign Up</a>
        
            <a href="Login.jsp" aria-haspopup="true" aria-expanded="false"><i class="material-icons">perm_identity</i> Sign In</a>
  </div>
</div>
  <div class="pulse">
  <span style="color: white;text-align: center;font-size: xx-large;width: 50%;left: 25%;margin-top:1%;margin-bottom:1%;" id="navbar"  onclick="openNav()" class="glyphicon glyphicon-arrow-down"></span>
  </div>
          <p id="para"></p>
        <div class="jumbotron">
            <% if(request.getParameter("successfull")!=null){ %>
            <div class="alert alert-info" style=" font-family: 'Bree Serif', serif;text-align: center;font-size: 40px;">
                <strong>Registration Successful </strong> 
</div>
            <%  }else if(request.getParameter("logout")!=null){ %>
            <div class="alert alert-info" style=" font-family: 'Bree Serif', serif;text-align: center;font-size: 40px;">
                <strong>Logout Successful </strong> 
</div>
            <% } %>
        
            <form action="Login" method="post">
      <div class="form-group">
  <label for="usr"><span class="input-group-addon">Email <i class="glyphicon glyphicon-envelope"></i></span></label>
  <input type="email" class="form-control" name="email" placeholder="Enter Your Email">
</div>
<div class="form-group">
  <label for="pwd"><span class="input-group-addon">Password <i class="glyphicon glyphicon-lock"></i></span></label>
  <input type="password" class="form-control" id="password" name="password" placeholder="Enter Your Password">
</div>
<!--            <div class="form-group">
                <label for="pwd"><span class="input-group-addon"><input type="checkbox" value="">Remember Me</span></label>
            </div>-->
            <div class="form-group">
                <label class="checkbox-inline"><span class="input-group-addon"> 
        <input type="submit" value="Register" name="submit" id="submit">
        <i class="glyphicon glyphicon-check"></i></span></label>
            </div>
            </form>
            <form action="SendMail" method="post">
                <input type="submit" value="Send Mail" name="mail" id="mail"/>
            </form>
          
        </div>
    </body>
</html>
