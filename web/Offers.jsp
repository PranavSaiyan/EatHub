<%-- 
    Document   : Offers
    Created on : Nov 1, 2017, 7:56:04 PM
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
        <title>Offers</title>
        <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.css" rel="stylesheet" type="text/css">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <link href="https://fonts.googleapis.com/css?family=Fresca" rel="stylesheet">
       <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
             <link href="https://fonts.googleapis.com/css?family=Inconsolata|Indie+Flower|Noto+Serif" rel="stylesheet">
       <link href="http://www.justinaguilar.com/animations/css/animations.css" rel="stylesheet" type="text/css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      
       <script>
$(document).ready(function(){
     $("#playgame1").click(function(){
          if(parseInt( document.getElementById('session').value)===0){
               $.alert({    
    title: 'Alert!',
    content: 'Please Sign In to place Order'
});
        }
        else{
           window.location.href='blocks_master/index.html';
        } 
     });
 });
 
$(document).ready(function(){
     $("#playgame2").click(function(){
          if(parseInt( document.getElementById('session').value)===0){
               $.alert({    
    title: 'Alert!',
    content: 'Please Sign In to place Order'
});
        }
        else{
           window.location.href='monster_kong/index.html';
        } 
     });
 }); 
 function openNav() {
    document.getElementById("myNav").style.height = "100%";
}

function closeNav() {
    document.getElementById("myNav").style.height = "0%";
}

function myFunction() {
  // Declare variables 
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}
</script>
<style>
    body{
        background-color: window;
    }
    #myInput {
    background-image: url('/css/searchicon.png'); /* Add a search icon to input */
    background-position: 10px 12px; /* Position the search icon */
    background-repeat: no-repeat; /* Do not repeat the icon image */
    width: 100%; /* Full-width */
    font-size: 16px; /* Increase font-size */
    padding: 12px 20px 12px 40px; /* Add some padding */
    border: 1px solid #ddd; /* Add a grey border */
    margin-bottom: 12px; /* Add some space below the input */
}

#myTable {
    border-collapse: collapse; /* Collapse borders */
    width: 100%; /* Full-width */
    border: 1px solid #ddd; /* Add a grey border */
    font-size: 18px; /* Increase font-size */
}

#myTable th, #myTable td {
    text-align: left; /* Left-align text */
    padding: 12px; /* Add padding */
}

#myTable tr {
    /* Add a bottom border to all table rows */
    border-bottom: 1px solid #ddd; 
}

#myTable tr.header, #myTable tr:hover {
    /* Add a grey background color to the table header and on hover */
    background-color: #f1f1f1;
}
              .coupon {
    border: 5px dotted #bbb;
    width: 90%;
    border-radius: 15px;
    margin: 0 auto;
}

.container {
    width: 100%;
    padding: 2px 16px;
    background-color: #f1f1f1;

}

.promo {
    background: #ccc;
    padding: 3px;
}

.expire {
    color: red;
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
.buttonload{margin-left: 40%;}

@media only screen and (max-device-width:480px)  {
    .coupon {
height: 1200px;}
    input#myInput{
        font-size: 35px !important;
    }
    td,th{font-size: 35px !important;}
    .row{
        font-size: 35px !important;
    }
    button.buttonload{font-size: 35px !important;}
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
/* Style buttons */
.buttonload {
    background-color: #4CAF50; /* Green background */
    border: none; /* Remove borders */
    color: white; /* White text */
    padding: 12px 16px; /* Some padding */
    font-size: 16px /* Set a font size */
}
</style>
    <body>
        
<div id="myNav" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="overlay-content">
      <a href="#" style="display: block;">  <img class="logo" src="images/Photo_1507406926754.png" width="20%"/>   </a>
   <a href="./Home.jsp"><i class="material-icons">home</i> Home<span class="sr-only">(current)</span></a>
   <a href="./About.jsp"><i class="material-icons">description</i> About</a>
   <a href="./Order.jsp"><i class="material-icons">local_dining</i> Order</a>
   <a href="./Offers.jsp"><i class="material-icons">stars</i> Offers<span class="sr-only">(current)</span></a>
   <a href="Contact.jsp"><i class="material-icons">home</i> Contact</a>
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
    <% if(session1.getAttribute("usrmail")==null){  %>
          <input type="hidden" style="position: fixed;z-index: -100;" value="0" id="session">
          <a href="Signup.jsp" ><i class="material-icons">perm_contact_calendar</i> Sign Up</a>
          <a href="SignIn.jsp" aria-haspopup="true" aria-expanded="false"><i class="material-icons">perm_identity</i> Sign In</a>
        
        <% }else{  %>
        <input type="hidden" style="position: fixed;z-index: -100;" value="1" id="session">
       <a href="Timeline.jsp"><i class="material-icons">face</i><% out.print(fname); %></a>
        <%  } %>
  </div>
</div>
  <div class="pulse">
  <span style="text-align: center;font-size: xx-large;width: 50%;left: 25%;margin-top:1%;margin-bottom:1%;" id="navbar"  onclick="openNav()" class="glyphicon glyphicon-arrow-down"></span>
  </div>
  <div class="row">
      <div class="col-md-6 col-sm-6"><div class="coupon">
  <div class="container">
      <h3 style="text-align: center;font-family: 'Indie Flower', cursive;"> Offer Code 1</h3>
  </div>
      <img src="itemimages/PASTA/maxresdefault.jpg" alt="Avatar" style="width:100%;">
  <div class="container" style="background-color:white;font-family: 'Noto Serif', serif;">
    <h2><b>20% OFF YOUR PURCHASE</b></h2> 
    <p>An assortment of ingredients ranging from onions and garlic to peppercorns, herbs and bay leaves offer their unique flavours to this intense tomato-based sauce, making the Pasta in Red Sauce an experience that will remain in your memory forever.</p>
  </div>
  <div class="container" style="margin-bottom: 0% !important;font-family: 'Inconsolata', monospace;">
    <p>Use Promo Code: <span class="promo">BOH232</span></p>
    <p class="expire">Expires: Dec 31, 2019</p>
  </div>
</div></div>
      <div class="col-md-6 col-sm-6"><div class="coupon">
              <div class="container" >
    <h3 style="text-align: center;font-family: 'Indie Flower', cursive;">  Offer Code 2</h3>
  </div>
              <img src="itemimages/CHICKEN/chicken-curry_625x350_61430904532.jpg" alt="Avatar" style="width:100%;">
  <div class="container" style="background-color:white;font-family: 'Noto Serif', serif;">
    <h2><b>40% OFF YOUR PURCHASE</b></h2> 
    <p>Chicken curry is a common delicacy in South Asia, Southeast Asia, as well as in the Caribbean. A typical South Asian curry consists of chicken stewed in an onion and tomato-based sauce, flavored with ginger, garlic, mango chutney and so on.</p>
  </div>
  <div class="container" style="margin-bottom: 0% !important; font-family: 'Inconsolata', monospace;">
    <p>Use Promo Code: <span class="promo">Available to topper</span></p>
    <p class="expire">Expires: Dec 31, 2019</p>
  </div>
</div></div>
  </div>
  <div class="row" style="margin-top: 2%;">
      <div class="col-md-1 col-sm-1"></div>
      <div class="col-md-10 col-sm-10">
          <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names..">

<table id="myTable">
  <tr class="header">
    <th style="width:40%;">Name</th>
    <th style="width:30%;">State</th>
    <th style="width:30%;">Score</th>
  </tr>
  <% 
      try{
          Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
              Statement st = conn.createStatement();
              ResultSet rs = st.executeQuery("SELECT DISTINCT Email,State,Score,Name FROM boxmaster ORDER BY Score DESC");
              
              while(rs.next()){
      %>
  <tr>
      <td><%=rs.getString(4)  %></td>
      <td><%=rs.getString(2) %></td>
      <td><%=rs.getString(3) %></td>
  </tr>
  <% 
        }  
            conn.close();
          }catch(Exception e){
              e.printStackTrace();
             request.setAttribute("error", e);
              RequestDispatcher rd = request.getRequestDispatcher("Error.jsp");
              rd.forward(request, response);
          } 
          %>
</table>
          
      </div>
      <div class="col-md-1 col-sm-1"></div>
  </div>
  
<!-- Add font awesome icons to buttons (note that the fa-spin class rotates the icon) -->
<button class="buttonload" id="playgame1" style="width: 20%;margin-top: 2%;">
  <i class="fa fa-spinner fa-spin"></i> Play Game 1
</button>
<button class="buttonload" id="playgame2" style="width: 20%;margin-top: 2%;">
  <i class="fa fa-spinner fa-spin"></i> Play Game 2
</button>
    </body>
</html>
