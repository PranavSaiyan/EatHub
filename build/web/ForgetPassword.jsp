<%-- 
    Document   : ForgetPassword
    Created on : Sep 20, 2017, 11:52:25 PM
    Author     : user
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

   <link href="https://fonts.googleapis.com/css?family=Permanent+Marker" rel="stylesheet">
          <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.css" rel="stylesheet" type="text/css">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
  body{font-family: 'Permanent Marker', cursive;
       font-size: xx-large;}
/* Style all input fields */
input {
    width: 80%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
}

/* Style the submit button */
input[type=submit] {
   background-color: #03093e;
    color: #cec9d8;
    width: 50%;
}

/* Style the container for inputs */
.container {
  background-color: #000;
    padding: 20px;
    width: 80%;
    text-align: center;
}

/* The message box is shown when the user clicks on the password field */
#message {
    display:none;
    background: #f1f1f1;
    color: #000;
    position: relative;
    padding: 20px;
    margin-top: 10px;
}

#message p {
    padding: 10px 35px;
    font-size: 18px;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
    color: green;
}

.valid:before {
    position: relative;
    left: -35px;
    content: "✔";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
    color: red;
}

.invalid:before {
    position: relative;
    left: -35px;
    content: "✖";
}
</style>
</head>
<body>
    <% String email  = request.getParameter("email");   %>
    <div class="row">
        <div class="col-md-6 col-sm-12">
            <img src="images/password-.gif" alt="password_reset"/>
        </div>
        <div class="col-md-6 col-sm-12">
            <form style="padding: 5%;" action="ChangePassword" method="post">
    <label for="psw">New Password</label>
    <input type="password" id="psw" name="psw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>

    <label for="psw">Confirm Password</label>
    <input type="password" id="psw1" name="psw1"   required>
    <input type="hidden" value="<% out.print(email); %>" name="email"/>
    <input id="submit" type="submit" value="Submit" disabled="true">
  </form>

<div id="message">
  <h3>Password must contain the following:</h3>
  <p id="secondfield" class="invalid">Both <b>fields matches</b></p>
	<p id="letter" class="invalid">A <b>lowercase</b> letter</p>
	<p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
	<p id="number" class="invalid">A <b>number</b></p>
	<p id="length" class="invalid">Minimum <b>8 characters</b></p>
</div>
        </div>
    </div>
<script>
var myInput = document.getElementById("psw");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");
var secondfield = document.getElementById("secondfield");
var myInput2=document.getElementById("psw1");

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
    document.getElementById("message").style.display = "block";
}
myInput2.onfocus = function() {
    document.getElementById("message").style.display="block";
}
// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
    document.getElementById("message").style.display = "none";
}
myInput2.onblur = function() {
    document.getElementById("message").style.display = "none";
}
// When the user starts to type something inside the password field
myInput2.onkeyup = function() {
    if(myInput.value==myInput2.value){
        secondfield.classList.remove("invalid");
        secondfield.classList.add("valid");
        document.getElementById('submit').disabled=false;
    }
}
myInput.onkeyup = function() {
  // Validate lowercase letters
  var lowerCaseLetters = /[a-z]/g;
  if(myInput.value.match(lowerCaseLetters)) {  
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
  }
  
  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(upperCaseLetters)) {  
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {  
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }
  
  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}
</script>

</body>
</html>
