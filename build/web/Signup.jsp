<%-- 
    Document   : Signup
    Created on : 01-Jul-2017, 11:30:51
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

        <title>SignUp</title>
        <meta charset="UTF-8">
        <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.css" rel="stylesheet" type="text/css">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Bellefair" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Bree+Serif" rel="stylesheet">
       <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Fresca" rel="stylesheet">
       <link href="http://www.justinaguilar.com/animations/css/animations.css" rel="stylesheet" type="text/css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="http://www.justinaguilar.com/animations/css/animations.css" rel="stylesheet" type="text/css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   
   
     <link href="SignInCss.css" type="text/css" rel="stylesheet">
     
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
            function myfunction(){
            var states = "AndraPradesh,Hyderabad,ArunachalPradesh,Patna,Chhattisgarh,Goa,Gujarat,Gandhinagar,Haryana,Chandigarh,HimachalPradesh,JammuandKashmir,Jharkhand,Bangalore,Kerala,Thiruvananthapuram,MadyaPradesh,Maharashtra,Mumbai,Orissa,Punjab,Rajasthan,Jaipur,Sikkim,Gangtok,TamilNadu,Chennai,Uttaranchal,Lucknow,WestBengal,Kolkata";
        var arr = states.split(",");
        var output =" ";
        for(var i=0;i<arr.length;i++){
            output+="<option>"+arr[i]+"</option>";
        }
        
        document.getElementById('state').innerHTML=output;}
    
    function chkPasswordStrength(txtpass,strenghtMsg,errorMsg)
    {
        var desc = new Array();
        desc[0] = "Very Weak";
        desc[1] = "Weak";
        desc[2] = "Better";
        desc[3] = "Medium";
        desc[4] = "Strong";
        desc[5] = "Strongest";

        errorMsg.innerHTML = '';
        var score   = 0;

        //if txtpass bigger than 6 give 1 point
        if (txtpass.length > 6) score++;

        //if txtpass has both lower and uppercase characters give 1 point
        if ( ( txtpass.match(/[a-z]/) ) && ( txtpass.match(/[A-Z]/) ) ) score++;

        //if txtpass has at least one number give 1 point
        if (txtpass.match(/\d+/)) score++;

        //if txtpass has at least one special caracther give 1 point
        if ( txtpass.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/) ) score++;

        //if txtpass bigger than 12 give another 1 point
        if (txtpass.length > 12) score++;

        strenghtMsg.innerHTML = desc[score];
        strenghtMsg.className = "strength" + score;

        if (txtpass.length < 6)
        {
            errorMsg.innerHTML = "Password Should be Minimum 6 Characters"
            errorMsg.className = "errorclass"
        }


    }
    /* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
function myFunc() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}
 
        </script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            label{
                font-family: 'Josefin Sans', sans-serif;
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
    font-size:x-large;
    font-weight: 600;
    font-family: 'Fresca', sans-serif;
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
  label{
                font-family: 'Josefin Sans', sans-serif;
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
    float:none !important;
    display: block;
    font-weight: 600;
    text-align: left;
  }
            .strength0
{
	width:100%;
	background:#B20E37;
	text-align: center;
	font-weight: bold;
	
}

.strength1
{
	width:100%;
	background:#D32847;
	text-align: center;
	font-weight: bold;
}

.strength2
{
	width:100%;
	background:#ff5f5f;
	text-align: center;
	font-weight: bold;
}

.strength3
{
	width:100%;
	background:#83D680;
	text-align: center;
	font-weight: bold;
}

.strength4
{
	background:#4dcd00;
	width:100%;
	text-align: center;
	font-weight: bold;
}

.strength5
{
	background:#399800;
	width:100%;
	text-align: center;
	font-weight: bold;
}

.errorclass
{
	font-weight:bold;
	font-family: Arial;
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
                font-size: 20px !important;
                font-weight: bolder;
            }
            .navbar-nav{
                margin-top: 20px !important;
            }
           
            select{
            height:50px !important;
               font-size: 20px  !important;
                
            }
            span{
                font-family: cursive !important;
                font-weight: bolder !important;
                text-align: left !important;
                font-size: 10px !important;
                
            }
           
            

form {
    background: white;
    margin-left: 2% !important;
    margin-right: 4% !important;
    margin-top: 5% !important;
    font-family: cursive !important;
    box-shadow: #fff 4px 4px 10px 10px;
    font-weight: bolder !important;
    font-size: 16px !important;
    text-align: center;
}
            body{
                background:#245580;
            }
            .alert{
                font-size:30px !important;
            }
            .jumbotron{
                width: 100% !important;
                margin:auto !important;
                background: black; border-radius: 20px !important;
                box-shadow: #aaa 2px 2px 10px 10px !important;
            }
            input{
                 font-family: cursive !important;
                font-weight: bolder !important;
            }
            .input-group-addon{
                width: 100% !important;
            }
}  
            .strength0
{
	width:200px;
	background:#B20E37;
	text-align: center;
	font-weight: bold;
	
}

.strength1
{
	width:200px;
	background:#D32847;
	text-align: center;
	font-weight: bold;
}

.strength2
{
	width:200px;
	background:#ff5f5f;
	text-align: center;
	font-weight: bold;
}

.strength3
{
	width:200px;
	background:#83D680;
	text-align: center;
	font-weight: bold;
}

.strength4
{
	background:#4dcd00;
	width:200px;
	text-align: center;
	font-weight: bold;
}

.strength5
{
	background:#399800;
	width:200px;
	text-align: center;
	font-weight: bold;
}

.errorclass
{
	font-weight:bold;
	font-family: Arial;
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
           
            select{height: 60px;
               font-size: 30px;
                font-family: cursive !important;
                font-weight: bolder !important;
                
            }
            span{
                font-family: cursive !important;
                font-weight: bolder !important;
                text-align: left !important;
                font-size: 20px !important;
                
            }
           
            form{
                 background: white;            margin-left: 10%;margin-right: 10%; margin-top: 10%;
                 font-family: cursive !important;
                 box-shadow: #fff 4px 4px 10px 10px;
                font-weight: bolder !important;
                font-size: 30px;
                text-align: center;
                
            }
            body{
                background:#245580;
            }
            .jumbotron{
                width: 60%;
                margin-left: 20%;
                background: black; border-radius: 20px !important;
                box-shadow: #aaa 2px 2px 10px 10px !important;
            }
            input{
               height: 50px !important;
               
                font-family: cursive !important;
                font-weight: bolder !important;
            }
            .input-group-addon{
                width: 30% !important;
            }
            </style>
    </head>
    <body onload="myfunction()">
        <p id="para"></p>
        <div class="topnav" id="myTopnav">
        <a href="Signup.jsp"  ><i class="material-icons">perm_contact_calendar</i> Sign Up</a>
  <a href="./Home.jsp"><i class="material-icons">home</i> Home</a>
 <a href="./About.jsp"><i class="material-icons">description</i> About</a>
   <a href="./Order.jsp"><i class="material-icons">local_dining</i> Order</a>
   <a href="./Offers.jsp"><i class="material-icons">stars</i> Offers</a>
   <a href="Contact.jsp"><i class="material-icons">home</i> Contact</a>
        
          <a href="SignIn.jsp"  style="float: right;" aria-haspopup="true" aria-expanded="false"><i class="material-icons">perm_identity</i> Sign In</a>
  <a href="javascript:void(0);" class="icon" onclick="myFunc()">&#9776;</a>
</div>
        <br>
        <% if(request.getParameter("error")==null){ %>
        
        <div class="jumbotron">
            
            <div class="alert alert-info" style=" font-family: 'Bree Serif', serif;text-align: center;font-size: 40px;">
                <strong>Registration Form</strong> 
</div>
            <% }else{ %>
            
            <div class="jumbotron">
            <div class="alert alert-info" style=" font-family: 'Bree Serif', serif;text-align: center;font-size: 40px;">
                <strong>Sorry! Email Already Exists </strong> 
</div>
                <% } %>
 
               
            <form action="registration" method="post">
                <div class="form-group">
  <label for="usr">Email <i class="glyphicon glyphicon-envelope"></i></label>
  <input id="email"  type="email" class="form-control" name="email" placeholder="Enter Your Email" required>
                </div><hr>
                <div class="form-group">
  <label for="usr">First Name <i class="glyphicon glyphicon-user"></i></label>
   <input id="fname" type="text" class="form-control" name="fname" placeholder="Enter First Name" required>
                </div><hr>
       <div class="form-group">
  <label for="usr">Last Name <i class="glyphicon glyphicon-user"></i></label>
 <input id="lname" type="text" class="form-control" name="lname" placeholder="Enter Last Name" required>
       </div>     <hr>
                  <div class="form-group">
  <label for="usr">Password <i class="glyphicon glyphicon-lock"></i></label>
 <input id="password" type="password" class="form-control" name="password" placeholder="Enter Your Password" onkeyup="chkPasswordStrength(this.value,document.getElementById('strendth'),document.getElementById('error'))" required>
    
    <h3 id="strendth" class="form-control strength5" style="width: 100% ;padding: 5px;color: white;">Password Strength</h3>
                <h3  id="error" style="width: 100% ;padding: 5px;color: black" class="error"></h3>
                  </div><hr>
                 <div class="form-group">
  <label for="usr">About <i class="glyphicon glyphicon-align-center"></i></label>
 <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info" required>
                 </div>     <hr>
                 <div class="form-group">
                     <label for="usr">Gender <i class="glyphicon glyphicon-asterisk"></i></label><br>
  <input id="male" type="radio" name="gender" value="Male"> Male 
    <input id="female" type="radio"  name="gender" value="Female"> Female
                 </div>    <hr>
                 <div class="form-group">
                     <label for="usr">Interests <i class="glyphicon glyphicon-send"></i></label><br>
    <input type="checkbox" name="interest" id="interest" value="Chinese"> Chinese
    <input type="checkbox" name="interest" id="interest" value="Spanish"> Spanish 
    <input type="checkbox" name="interest" id="interest" value="French"> French 
    <input type="checkbox" name="interest" id="interest" value="Italian"> Italian 
    <input type="checkbox" name="interest" id="interest" value="Indian"> Indian 
                 </div>     <hr>
   <div class="form-group">
  <label for="usr">Birth <i class="glyphicon glyphicon-time"></i></label>
    <input type="date" name="date" class="form-control" id="date" required>
   </div>     <hr>
             <div class="form-group">
  <label for="usr">Mobile Number <i class="glyphicon glyphicon-phone-alt"></i></label>
    <input type="number" name="number" class="form-control" id="number"  required>
             </div>   <div class="form-group"><hr>
  <label for="usr">State <i class="glyphicon glyphicon-map-marker"></i></label>
    <select class="form-control" name="state" id="state" required> </select>
             </div>   <hr>
       <div class="form-group">
           <i  class="glyphicon glyphicon-trash"></i>
           <input style="width: 30%;" type="reset"  value="Clear" name="clear" id="clear">
            
        <input style="width: 30%;" type="submit" value="Register" name="submit" id="submit">
        <i class="glyphicon glyphicon-check"></i>
        
       
       
   
</div>            
               
                
</form>
        </div>
      
        
    </body>
</html>
