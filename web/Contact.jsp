<%-- 
    Document   : Contact
    Created on : Nov 1, 2017, 7:55:21 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
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
        <title>Contact Us</title>
         <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.css" rel="stylesheet" type="text/css">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
       <link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
       <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <link href="http://www.justinaguilar.com/animations/css/animations.css" rel="stylesheet" type="text/css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <link rel="stylesheet" href="sweet-modal/dist/min/jquery.sweet-modal.min.css" />
<script src="sweet-modal/dist/min/jquery.sweet-modal.min.js"></script>
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
     <link href="https://fonts.googleapis.com/css?family=Fresca" rel="stylesheet">
    </head>
       <script>
 function openNav() {
    document.getElementById("myNav").style.height = "100%";
}

function closeNav() {
    document.getElementById("myNav").style.height = "0%";
}
</script>
    <style>@import url(https://fonts.googleapis.com/css?family=Lato:300,400,700);
        .menuicon{
    text-align: center;
    width: 60px;
    height:10px;
    background-color:white;
    margin: 6px 50%;
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
                color: white;
    font-size:xx-large;
    font-weight: bolder;
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




body {
	background: #f29107;
	color: #fff;
	font-weight: 400;
	font-size: 1em;
	font-family: 'Lato', Arial, sans-serif;
	margin:0;
	padding:0;
	padding-bottom:60px;
}
.ccheader {
	margin: 0 auto;
	padding: 2em;
	text-align: center;
}

.ccheader h1 {
	margin: 0;
	font-weight: 300;
	font-size: 2.5em;
	line-height: 1.3;
}
.ccheader {
	margin: 0 auto;
	padding: 2em;
	text-align: center;
}

.ccheader h1 {
	margin: 0;
	font-weight: 300;
	font-size: 2.5em;
	line-height: 1.3;
}
.jconfirm .jconfirm-box {
        width: 50% !important;
        text-align: center !important;
}

/* Form CSS*/
.ccform {
   margin: 0 auto;
    width: 800px;
}
.ccfield-prepend{
	margin-bottom:10px;
	width:100%;
}

.ccform-addon{
	color:#f8ae45; 
	float:left;
	padding:8px;
	width:8%;
	background:#FFFFFF;
	text-align:center;	
}

.ccformfield {
	color:#000000; 
	background:#FFFFFF;
	border:none;
	padding:15.5px;
	width:91.9%;
	display:block;
	font-family: 'Lato',Arial,sans-serif;
	font-size:14px;
}

.ccformfield {
	font-family: 'Lato',Arial,sans-serif;
}
.ccbtn{
	display:block;
	border:none;
	background:#f8ae45;
	color:#FFFFFF;
	padding:12px 25px;
	cursor:pointer;
	text-decoration:none;
	font-weight:bold;
}
.ccbtn:hover{
	background:#d8850e;

}
.credit {
  width: 800px;
  clear:both;
margin:0 auto;
  line-height:25px;
 padding: 25px 50px; 
text-align: center;
}
.credit em{
margin-right:5px;
}
.credit a {
color: #000;
font-weight: bold;
text-decoration: none;
}
.card {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    margin-top: 20%;
    margin-left: 23%;
    width: 60%;
    border-radius: 5px;
    background:#F5EEE5;
}

.card:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

img {
    border-radius: 5px 5px 0 0;
}

.container {
    padding: 2px 16px;
    color: black;
}
@media only screen and (max-device-width:480px)  {
   
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
</style>
<body>
            
          <!-- The overlay -->
<% HttpSession session1;
          session1 = request.getSession();
          String email=null;
          String fname=null;
          if(session1.getAttribute("usrmail")!=null){ 
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
              fname = rs.getString(2);
              }
              conn.close();
          }catch(Exception e){
              e.printStackTrace();
          } }
         %>
         
<div id="myNav" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="overlay-content">
      <a href="#" style="display: block;">  <img class="logo" src="images/Photo_1507406926754.png" width="20%"/>   </a>
   <a href="./Home.jsp"><i class="material-icons">home</i> Home<span class="sr-only">(current)</span></a>
   <a href="./About.jsp"><i class="material-icons">description</i> About</a>
   <a href="./Order.jsp"><i class="material-icons">local_dining</i> Order</a>
   <a href="./Offers.jsp"><i class="material-icons">stars</i> Offers</a>
   <a href="./Contact.jsp"><i class="material-icons">home</i> Contact</a>
    <% if(session1.getAttribute("usrmail")==null){  %>
          <a href="Signup.jsp" ><i class="material-icons">perm_contact_calendar</i> Sign Up</a>
        
          <a href="SignIn.jsp" aria-haspopup="true" aria-expanded="false"><i class="material-icons">perm_identity</i> Sign In</a>
        
        <% }else{  %>
       <a href="Timeline.jsp"><i class="material-icons">face</i><% out.print(fname); %></a>
        <%  } %>
  </div>
</div>
<% if(request.getParameter("success")!=null){
   out.print("<script>   $.alert({  title: 'Congratulations',content: 'Your feedback is sent',});</script>"); 
}
    %>
  
    <!-- Use any element to open/show the overlay navigation menu -->
<div class="menuicon pulse" onclick="openNav()"></div>
<div class="menuicon pulse" onclick="openNav()"></div>
<div class="menuicon pulse" onclick="openNav()"></div>

    <div class="row">
        <div class="col-md-5 col-sm-12">
                <div class="card">
        <img src="images/male3-512.png" alt="Avatar" style="width:100%">
  <div class="container">
    <h4><b>Pranav Gupta</b></h4> 
    <p>Full Stack Developer</p> 
  </div>
</div>
            </div>
        <div class="col-md-7 col-sm-12">
            <header class="ccheader">
     <h1>Feel free to contact</h1>	
</header>
            <div class="wrapper">
    <form method="post" action="SendFeedback" class="ccform">
    <div class="ccfield-prepend">
        <span class="ccform-addon"><i class="fa fa-user fa-2x"></i></span>
        <input class="ccformfield" type="text" placeholder="Full Name" name="name" required>
    </div>
    <div class="ccfield-prepend">
        <span class="ccform-addon"><i class="fa fa-envelope fa-2x"></i></span>
        <input class="ccformfield" type="text" placeholder="Email" name="email" required>
    </div>
    <div class="ccfield-prepend">
        <span class="ccform-addon"><i class="fa fa-mobile-phone fa-2x"></i></span>
        <input class="ccformfield" type="text" placeholder="Phone" name="phone">
    </div>
     <div class="ccfield-prepend">
        <span class="ccform-addon"><i class="fa fa-info fa-2x"></i></span>
        <input class="ccformfield" type="text" placeholder="Subject" name="subject" required>
    </div>
    <div class="ccfield-prepend">
        <span class="ccform-addon"><i class="fa fa-comment fa-2x"></i></span>
        <textarea class="ccformfield" name="comments" rows="8" placeholder="Message" required></textarea>
    </div>
    <div class="ccfield-prepend">
        <input class="ccbtn" type="submit" value="Submit">
    </div>
    </form>
</div>
        </div>
            
    </div>

<div class="credit">
    <p><span class="glyphicon glyphicon-envelope"></span> &nbsp;pranavsupersaiyan10@gmail.com | <span class="glyphicon glyphicon-phone"></span> &nbsp;+(91)-9906902048</p>

</div>
    
</body>
</html>
