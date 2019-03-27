<%-- 
    Document   : SignIn
    Created on : Sep 14, 2017, 1:29:42 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% response.setHeader("Cache-Control","no-cache");
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
        <title>SignIn</title>
         <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.css" rel="stylesheet" type="text/css">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Bellefair" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Bree+Serif" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Fresca" rel="stylesheet">
       <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans:600'>
       <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
       <link href="SignInCss.css" type="text/css" rel="stylesheet">
       <link href="http://www.justinaguilar.com/animations/css/animations.css" rel="stylesheet" type="text/css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
   <script>
   
  $( function() {
    $( "#dialog" ).dialog({
      autoOpen: false,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
  } );
  </script>
       <script>
           var timer=null;
           var flag=0;            
           function runbabyrun(){
               document.getElementById('lock1').innerHTML="lock_open";
               document.getElementById('lock2').innerHTML="lock_open";
               var pass = document.getElementById('pass').value;
               var mail = document.getElementById('emailing').value;
               if(pass==='' || mail==='' ){ runEffect('#buttontofate');flag=0; }
               else{   if(flag===0){callback('#buttontofate');flag=1;}     }
           }
           function checkpassemail(){
              clearInterval(timer);
              flag=0;
               runEffect('#formsubmit');
               timer=setInterval(function(){runbabyrun();},2000);             
           }
            function runEffect(e) {
      // get effect type from
      var selectedEffect ="fade";
 
      // Most effect types need no options passed by default
      var options = {};
      // some effects have required parameters
      if ( selectedEffect === "scale" ) {
        options = { percent: 50 };
      } else if ( selectedEffect === "size" ) {
        options = { to: { width: 200, height: 60 } };
      }
 
      // Run the effect
      $(e).hide( selectedEffect, options);
    };
 
//    // Callback function to bring a hidden box back
    function callback(e) {
      setTimeout(function() {
        $(e).removeAttr( "style" ).hide().fadeIn();
      }, 1000 );
    };
           
           
           function validateEmail($email) {
  var emailReg = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
  return emailReg.test( $email );
}
            //Encryption email AJAX 
      function encryptemailpass(){
        var mail = document.getElementById('emailing').value;
        var pass = document.getElementById('pass').value;
            
            if( !validateEmail(mail)) { 
             $("#dialogvalue").text('Please Enter Email In Proper Format');
            $( "#dialog" ).dialog( "open" );
            $('#loginform').submit(function() {
    return false;
});
            }
        else{
                 var url="EncryptionAES.jsp?hashemail="+mail+"&hashpass="+pass;
        if(window.XMLHttpRequest){
            request=new XMLHttpRequest();
        }
        else if(window.ActiveXObject){
            request=new ActiveXObject("Microsoft.XMLHTTP");
        }
         try
        {  
                 request.onreadystatechange=encryptionpassresponse;
                request.open("GET",url,true);
                request.send();
        }
        catch(e)
        {
            alert("Unable to connect to server");
        }
         clearInterval(timer); 
         runEffect('#buttontofate');
         document.getElementById('lock1').innerHTML="lock";
         document.getElementById('lock2').innerHTML="lock";
   callback('#formsubmit');
  
            }   
    
}     
             

function encryptionpassresponse(){
    if(request.readyState===4){
var val=request.responseText;
document.getElementById('hashcode').value=val.replace(/\s/g, '');
}
}
//////////////
 function openNav() {
    document.getElementById("myNav").style.height = "100%";
}

function closeNav() {
    document.getElementById("myNav").style.height = "0%";
}

function verifyOTP()
{
    
var email = document.getElementById('forgetemail').value;  
var otp = document.getElementById('otpcol').value;
if(otp===''){   $.dialog({
    title: 'Text content!',
    content: 'Fill up OTP field first'
}); }
else{
var url="ForgetPasswordOTPverify.jsp?val="+email+"&otp="+otp;
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
}  
var universalmail;
function sendOTP()
{    
var email = document.getElementById('forgetemail').value;    
universalmail = email;
if(email===''){   $.dialog({
    title: 'Text content!',
    content: 'Enter Email to send OTP!'
}); }
else{
    document.getElementById('display').innerHTML='Sent To '+email;
    move();

var url="ForgetPasswordOTP.jsp?val="+email;
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
}
function getInfo(){
if(request.readyState===4){
var val=request.responseText;
if(val==1){ 
    document.getElementById('email').value = universalmail;
                document.getElementById('id01').style.display='block';  
             }
else if(val==0){myFunction()}
}
}

function show(){
                    document.getElementById('display').style.visibility='visible';
                }
function move() {
    var elem = document.getElementById("myBar"); 
    var width = 10;
    var id = setInterval(frame, 200);
    function frame() {
        if (width >= 100) {
            show();
            clearInterval(id);
           
            
        } else {
            width++; 
            elem.style.width = width + '%'; 
            elem.innerHTML = width * 1 + '%';
        }
    }
}
function myFunction() {
    // Get the snackbar DIV
    var x = document.getElementById("snackbar");

    // Add the "show" class to DIV
    x.className = "show";

    // After 3 seconds, remove the show class from DIV
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 8000);
}
</script>
    </head>
    <style> 
        .jconfirm .jconfirm-box {
        width: 300px !important;
        text-align: center !important;
       
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

  
        body{
            font-family: 'Bree Serif', serif;
            font-size: x-large ;
        }
        label{
             font-family: 'Bree Serif', serif;
            font-size: xx-large !important;
        }
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
@media (min-width: 768px){
.container {
    width: 612px;
}
}
.overlay-content {
    position: relative;
    top:5%;
    width: 100%;
    text-align: center;
    margin-top: 30px;
}

.overlay a {
    padding: 8px;
    text-decoration: none;
     font-family: 'Fresca', sans-serif;
     font-weight:bolder;
     font-size: xx-large;
    color: #818181;
    display: inline-block;
    transition: 0.3s;
}

.overlay a:hover, .overlay a:focus {
    color: #f1f1f1;
}

.overlay .closebtn {
    position: absolute;
    top: 5px;
    right: 45px;
    font-size: 60px;
}
.login-wrap{min-height: 700px; }

@media only screen and (max-device-width:480px){
    label{
        font-size: 48px !important;
    }  
    .login-html{font-size:40px; }
  .login-wrap {
    width: 100%;
    margin: auto;
    margin-top: 30% !important;
    max-width: 800px !important;
    min-height: 1000px !important;
    position: relative;
    background: url(images/bg.jpg) no-repeat;
    box-shadow: 0 12px 15px 0 rgba(0,0,0,.24), 0 17px 50px 0 rgba(0,0,0,.19);
}
.logo{width: 50%;}
.carousel-inner{
    width:100% !important;
}
  .item>img{
      height:280px !important;
      margin-left:0% !important;
      width:100% !important;
    
  }
  .overlay-content {
    top:1%;
}
  .overlay {overflow-y: auto;}
  .overlay a {margin-top: 5%;font-size: 50px;display: block !important;}
  .overlay .closebtn {
    font-size: 40px;
    margin-top:  0%;
    float: right;
  }
}
span{
    color: white;
}
.login-html{
    color: #aaa !important;
}
#myBar {
    width: 0%;
    height: 30px;
    background-color: #4CAF50;
    text-align: center; /* To center it horizontally (if you want) */
    line-height: 30px; /* To center it vertically */
    color: white; 
}

#display{
    text-align: center;
    visibility: hidden;
   margin-top: 2%;
  -webkit-animation: glow 3s ease-in-out infinite;
  animation: glow 3s ease-in-out infinite;

}
.title {
    color: grey;
    font-size: 18px;
}
/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
    text-align: center;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}

@-webkit-keyframes glow 
{
  50% { box-shadow: 0 0 80px #000; }
}

@keyframes glow 



    </style>
    <body onpageshow="runEffect('#buttontofate');runEffect('#formsubmit');">
        <%  
            HttpSession session1;
          session1 = request.getSession();
          if(session1.getAttribute("usrmail")!=null){ 
  RequestDispatcher rd = request.getRequestDispatcher("Timeline.jsp");
  rd.forward(request, response);
  } %>
        <div id="dialog" title="Basic dialog">
            <p id="dialogvalue"></p>
</div>
        <div id="id01" class="modal">
  
            <form class="modal-content animate" action="ForgetPassword.jsp" method="post">
    <div class="imgcontainer">
        <img src="images/password-.gif" alt="Avatar" class="avatar">
    </div>
    <div class="container">
        <label><b style="text-align: center">Click below button to change password for</b></label>
        <input style="width: 60%;margin-left: 20%;margin-right: 20%;text-align: center;" id="email" name="email" type="text"  />         
      <button type="submit">Confirm</button>
    </div>
  </form>
</div>
       <div id="myNav" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="overlay-content">
      <a href="#" style="display: block;">  <img class="logo" src="images/Photo_1507406926754.png" width="20%"/>   </a>
   <a href="./Home.jsp"><i class="material-icons">home</i> Home<span class="sr-only">(current)</span></a>
   <a href="./About.jsp"><i class="material-icons">description</i> About</a>
   <a href="./Order.jsp"><i class="material-icons">local_dining</i> Order</a>
   <a href="./Offers.jsp"><i class="material-icons">stars</i> Offers</a>
   <a href="Contact.jsp"><i class="material-icons">home</i> Contact</a>
  </div>
</div>
        <div class="pulse">
  <span style="text-align: center;font-size: xx-large;width: 50%;left: 25%;margin-top:1%;margin-bottom:1%;" id="navbar"  onclick="openNav()" class="glyphicon glyphicon-arrow-down"></span>
  </div>
            
            <% if(request.getParameter("successfull")!=null){ %>
            
            <div class="alert alert-info" style=" font-family: 'Bree Serif', serif;text-align: center;font-size: 40px;">
                <strong>Registration Successful </strong> 
</div>
           
            <%  }else if(request.getParameter("logout")!=null){ %>
            
            <div class="alert alert-info" style=" font-family: 'Bree Serif', serif;text-align: center;font-size: 40px;">
                <strong>Logout Successful </strong> 
            </div>
            
            <% }else if(request.getParameter("change")!=null){ %>
            <div class="alert alert-info" style=" font-family: 'Bree Serif', serif;text-align: center;font-size: 40px;">
                <strong>Password Reset Successful</strong> 
            </div>
            <% }else if(request.getParameter("error")!=null){ %>
            <div class="alert alert-info" style=" font-family: 'Bree Serif', serif;text-align: center;font-size: 40px;">
                <strong><% if(Integer.parseInt(request.getParameter("error"))==1){ out.print("Wrong Credentials");}
                else{out.print("Account does'nt exists");}
                    %></strong> 
            </div>
          
            <!-- The Modal -->
<div id="id02" class="modal">
  <span onclick="document.getElementById('id02').style.display='none'" 
class="close" title="Close Modal">&times;</span>

  <!-- Modal Content -->
  <form class="modal-content animate" action="SignIn.jsp">
    <div class="imgcontainer">
        <img src="images/tumblr_nkqwugRG3O1s141c3o1_r1_540.gif" alt="Avatar" class="avatar">
    </div>
       <div class="container">
        <label><b><% if(Integer.parseInt(request.getParameter("error"))==1){ out.print("Wrong Password");}
                else{out.print("Account does'nt exists");}
                    %></b></label>
       </div>
    <div class="container" style="background-color:#f1f1f1">
        <label><button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">Try Again</button></label>
    </div>
  </form>
</div>
              <script>document.getElementById('id02').style.display='block';</script>
            <%}%>
        <div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Forget Password</label>
		<div class="login-form">
                    <div class="sign-in-htm">
				<div class="group">
					<label for="user" class="label">Email</label>
                                        <i id="lock1" class="material-icons">lock_open</i><input id="emailing" name="email" type="email" class="input" data-type="email" onfocus="checkpassemail()"  >
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
                                        <i id="lock2" class="material-icons">lock_open</i><input id="pass" name="password" type="password" class="input" data-type="password"  onfocus="checkpassemail()">
				</div>
				<div class="group">
					<input id="check" type="checkbox" class="check" checked>
					<label for="check"><span class="icon"></span> Keep me Signed in</label>
				</div>
				
                            
			
			
                        <form action="Login" method="GET" id="loginform">
                            <input type="hidden" name="hashcode" id="hashcode"/>
			<div class="group">
                            <input type="button" id="buttontofate" class="button" value="Click Here To Begin" onclick="encryptemailpass()" />
                            <input type="submit" id="formsubmit" class="button" value="Sign In" />
				</div>
                        </form>
                        Didn't have any account <a href="Signup.jsp">Register Here</a>
                    </div>
			<div class="sign-up-htm">
				<div class="group">
					<label for="user" class="label">Enter Registered Email</label>
                                        <input id="forgetemail" type="email" name="email" class="input">
				</div>
				<div class="group">
                                    <input class="button" onclick='sendOTP();' type="button" value="SEND CODE" name="otp" >
				</div>
                            <div id="myProgress">
  <div id="myBar"></div>
</div>
                            <div id='display'  >
                                
                            </div>
				<div class="group">
					<label for="pass" class="label">Enter OTP</label>
                                        <input id="otpcol" type="password" class="input" data-type="password" >
				</div>
				<div class="group">
                                    <input id="otpverify" type="button" onclick="verifyOTP();" class="button" name="otpverify" value="RESET PASSWORD">
				</div>
			</div>
		</div>
	</div>
</div>
        <div id="snackbar">OTP was incorrect</div>
    </body>
</html>
