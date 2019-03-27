<%-- 
    Document   : Home
    Created on : 01-Jul-2017, 11:28:58
    Author     : Saiyan
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Global site tag (gtag.js) - Google Analytics -->
 
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-112514885-1');
</script>

        <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.css" rel="stylesheet" type="text/css">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Bellefair" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Bree+Serif" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Fresca" rel="stylesheet">
       <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
       <link href="http://www.justinaguilar.com/animations/css/animations.css" rel="stylesheet" type="text/css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      
       <script>
           // When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction();};

 function openNav() {
    document.getElementById("myNav").style.height = "100%";
}

function closeNav() {
    document.getElementById("myNav").style.height = "0%";
}
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}



function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("myBtn").style.display = "block";
    } else {
        document.getElementById("myBtn").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0; // For Chrome, Safari and Opera 
    document.documentElement.scrollTop = 0; // For IE and Firefox
}
       </script>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>  
            #myBtn {
    display: none; /* Hidden by default */
    position: fixed; /* Fixed/sticky position */
    bottom: 20px; /* Place the button at the bottom of the page */
    right: 30px; /* Place the button 30px from the right */
    z-index: 99; /* Make sure it does not overlap */
    border: none; /* Remove borders */
    outline: none; /* Remove outline */
    background-color: #f44336; /* Set a background color */
    color: white; /* Text color */
    cursor: pointer; /* Add a mouse pointer on hover */
    padding: 15px; /* Some padding */
    border-radius: 10px; /* Rounded corners */
}

#myBtn:hover,#myBtn:focus,#myBtn:active{
    background-color: #818181;
    color: black;
    /* Add a dark-grey background on hover */
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
    font-family: 'Bree Serif', serif;
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


@media only screen and (max-device-width:480px)  {
h3,p{
    font-size:20px !important;
}
.carousel-caption {
    position: absolute;
    right: 20% !important;
    bottom: 20px;
    left: 0% !important;
    z-index: 10;
    padding-top: 20px;
    padding-bottom: 20px;
    color: #fff;
    text-align: center;
    text-shadow: 0 1px 2px rgba(0,0,0,.6);
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
  .overlay a {font-size: 15px;display: block !important;}
  .overlay .closebtn {
    font-size: 40px;
    top: 5px;
    right: 35px;
  }
}
            
             i{
                font-size:20px !important;
            }
            .carousel{
              
            }
            h4{
                font-family: 'Roboto', sans-serif;
                font-weight: 600;
                color: #cccccc;
                text-transform: capitalize;
                font-size: xx-large ;
                text-justify: kashida;
            }
            h3{
                font-family: 'Fresca', sans-serif;
                
                font-size: xx-large;
            }
            p{
                font-family: 'Bellefair', serif;
                color: whitesmoke;
                font-size: larger;
              
            }
            li{
                font-family: 'Bree Serif', serif;
                color: white;
            }
            body{
                background: black !important;
            }
            #navbar{
                color: white !important;
                font-size: xx-large !important;
            }
            i {
    display: inline-block;
    padding: 3px;
}
.down {
    transform: rotate(45deg);
    -webkit-transform: rotate(45deg);
}

        </style>
    </head>
    <body>
        <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="material-icons">arrow_upward</i></button>
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
  <div class="pulse">
  <span style="text-align: center;font-size: xx-large;width: 50%;left: 25%;margin-top:1%;margin-bottom:1%;" id="navbar"  onclick="openNav()" class="glyphicon glyphicon-arrow-down"></span>
  </div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
        <img style="margin-left: 10%;width: 80%;height:600px;" src="images/19598535_1197888833651167_5899357858360461191_n.jpg" alt="Chania">
      <div class="carousel-caption">
        <h3>The Espresso</h3>
        <p style="font-size: x-large ">The atmosphere in Espresso has a touch of Florence and Venice.</p>
      </div>
    </div>

    <div class="item">
        <img style="margin-left: 10%;width: 80%;height: 600px;" src="images/19429873_1197603260346391_5746150428359978648_n.jpg" alt="Chania">
      <div class="carousel-caption">
        <h3>The Espresso</h3>
        <p style="font-size: x-large">Having the best environment.</p>
      </div>
    </div>

    <div class="item">
        <img style="margin-left: 10%;width: 80%;height: 600px;" src="images/19599017_1197890000317717_6340450501867230977_n.jpg" alt="Flower">
      <div class="carousel-caption">
        <h3>The Espresso</h3>
        <p style="font-size: x-large">Have best memories with your Friends.</p>
      </div>
    </div>

    <div class="item">
        <img style="margin-left: 10%;width: 80%;height: 600px;" src="images/19601619_1197889996984384_8952759959929775443_n.jpg" alt="Flower">
      <div class="carousel-caption">
        <h3>The Espresso</h3>
        <p style="font-size: x-large">Praised by new admissions.</p>
      </div>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
      <div class="row">
          <div class="col-md-7">
              <h3 style="background-color: whitesmoke;padding: 30px;border-radius:20px;box-shadow:#cccccc 2px 2px 5px 5px;  ">
                  <b>Espresso</b> is the name of a highly concentrated, bittersweet coffee originating in Italy in the early 20th century. Translated from <b>Italian</b>, the word espresso refers to the speed and single-serve nature of the coffee compared with slower and more communal methods of brewing coffee. Each shot of espresso is made to order upon customer request, as opposed to being brewed in anticipation of demand. Typically served in a demitasse cup or used with other ingredients to create another beverage such as a cappuccino or a caffè corretto, espresso has become representative of coffee culture in many coffee-consuming regions.
              </h3>
              <h3 style="background-color: whitesmoke;padding: 30px;border-radius:20px;box-shadow:#cccccc 2px 2px 5px 5px;  ">
                  <u> <b> CHARACTERISTICS</b><br></u>
While the taste of espresso will vary widely depending on the coffee (including the roast), the quality of grind, and technique used to brew it, a well-made espresso will generally have a heavy body, rich texture, and a bittersweet taste. Each shot should have a layer of crema (foam) on the surface, generally golden to dark tan in color. A single shot of espresso is generally made with seven to eight grams of ground coffee and results in between one to one and a half ounces of coffee. This ratio represents a highly concentrated coffee, containing more caffeine per volume and generally considered to be stronger than drip brewed coffee.
              </h3>
          </div>
          <div class="col-md-5">
              <img src="images/Espresso_types.jpg"  width="100%"/>
          </div>
      </div>
      <footer style="background-color :#2F2F2F">
          <div class="row">
              <div class="col-md-3">
                   <h4>APPLY HERE</h4>
                  <ul>
                      <li>Admissions</li>
                      <li>Education Loan</li>
                      <li>Online Admission</li>
                      <li>How to Apply ?</li>
                      <li>Scholarship</li>
                  </ul>
              </div>
              <div class="col-md-3">
                  <h4>LEARN HERE</h4>
                  <ul>
                      <li>Pay Fee Online</li>
                      <li>Our Institutes</li>
                      <li>Teaching Practices</li>
                      <li>System Of Evaluation</li>
                      <li>Placements</li>
                  </ul>
              </div>
              <div class="col-md-3">
                   <h4>NEWSLETTER SIGNUP</h4>
                   <p>By subscribing to our mailing list you will always be update with the latest news from us.</p>
                   <input style="font-size: larger;font-family: 'Bellefair', serif; " type="text" placeholder="Enter Your Email">
                   <button style="font-family: 'Bellefair', serif;font-size: larger;" type="submit">SUBMIT</button>
              </div>
              <div class="col-md-3">
                   <h4>GET IN TOUCH</h4>
                   <p><b>T: </b>1800 200 2045</p>
                   <p><b>Email: </b>admissions@cuchd.in</p>
                   <p><b>Chandigarh University</b></p>
                   <p>NH-95 Chandigarh-Ludhiana Highway, Mohali, Punjab (INDIA)
General Helpline No:+91-160-3051003
Toll Free: 1800 200 0025</p>
                   
              </div>
          </div>
          
          <div class="row">
              <div class="col-md-3">
                 <h4>VISIT HERE</h4>
                  <ul>
                      <li>CU Media</li>
                      <li>Campus Tour</li>
                      <li>Maps</li>
                      <li>Distance Calculator</li>
                      <li>General Enquiry</li>
                  </ul>
              </div>
              <div class="col-md-3">
                  <h4>LIVE HERE</h4>
                  <ul>
                      <li>Hostels</li>
                      <li>Transport</li>
                      <li>Sports</li>
                      <li>Student Welfare</li>
                      <li>Library</li>
                  </ul>
              </div>
              <div class="col-md-3">
                  <p>
                      Chandigarh University [CU] is one of the Best University in Chandigarh, Punjab and North India that offers various Undergraduate and Post graduate Courses like B.tech, BCA, BBA, HMCT, B.Com, LLB, B.Arch, MBA, M.Tech, Journalism and MCA at an affordable fees in Chandigarh. Apply Now at India's Best University in Chandigarh That provides top placements. 

+ Chandigarh University (CU) Courses Fee Details
                  </p>
              </div>
              <div class="col-md-3">
                  <img src="images/2017-07-13_13-58-38.png" />
              </div>
          </div>
      </footer> 
    </body>
</html>

