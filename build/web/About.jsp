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
       <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Fresca" rel="stylesheet">
       <link href="http://www.justinaguilar.com/animations/css/animations.css" rel="stylesheet" type="text/css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script>
 function openNav() {
    document.getElementById("myNav").style.height = "100%";
}

function closeNav() {
    document.getElementById("myNav").style.height = "0%";
}
       </script>
        <title>About</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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


@media only screen and (max-device-width:480px)  {
    a{
        font-size:large !important;
    }
    img{
        margin:2% !important;
        width: 360px !important;
        height:200px !important;
    }
    h3,p{
    font-size:15px !important;
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
.logo{width: 50% !important;}
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
             i{
                font-size:30px !important;
            }
            .carousel{
                background-color:whitesmoke !important;
                
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
                
                font-size: x-large;
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
            .navbar{
                font-family: cursive;
                font-size: 50px !important;
                height: 120px !important;
                font-weight: bolder;
            }
            .navbar-nav{
                margin-top: 40px !important;
            }
            body{
                background: black;
            }
        </style>
    </head>
    <body>
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
  <span style="color: white;text-align: center;font-size: xx-large;width: 50%;left: 25%;margin-top:1%;margin-bottom:1%;" id="navbar"  onclick="openNav()" class="glyphicon glyphicon-arrow-down"></span>
  </div>
      <div class="row">
          <div class="col-md-5 col-sm-6">
              <img src="images/what-is-espresso-banner.jpg" width="500px" height="250px" style="border-radius: 30px;"/>
          </div>
          <div class="col-md-7 col-sm-6 ">
                <h3 style="background-color: whitesmoke;padding: 30px;border-radius:20px;box-shadow:#cccccc 2px 2px 5px 5px;  ">
              <b><u>MAKING ESPRESSO</u></b><br>
                  There are several types of espresso-based beverages, but all are based on one or more shots of pure espresso. Espresso is brewed in some sort of espresso machine which "presses" hot water through a dense puck of finely ground medium to dark roasted coffee.</h3>
          </div>
      </div>
      <div class="row">
          <div class="col-md-7">
               <h3 style="font-size: medium;background-color: whitesmoke;padding: 30px;border-radius:20px;box-shadow:#cccccc 2px 2px 5px 5px;  ">
                  Preheat your cups, it makes a big difference, particularly if you drink doubles or if you're making for several people. By the time you hit the bottom of your cup, or finished making the coffee for the last person, the first shot can be very cold. Boiling water usually makes the cups too hot to hold, but filling them with hot water from the tap works well. If you put hot tap water in your cups before starting to brew coffee they will be ready by the time you get everything ready. You will also want to warm the brew head before starting. If you do not do this the heat of the water will be dissipated by warming the brew head. If you are making multiple cups leaving the brew head in the machine between cups should keep it warm.

Make sure the coffee is ground for an espresso machine. If the coffee is too coarse the water will go through too fast and will not extract the nectar from the coffee. If the coffee is ground too fine the water will not be able to travel through the grounds properly and may lead to over extraction. Think of salt as a general rule. The best, of course, is to grind your own, but you can tell your coffee supplier to grind for an espresso machine. Until you get the knack of exactly how fine is fine enough you might want to buy pre-ground coffee to get an idea of what is correct. Espresso is definitely one place that a whirly blade grinder will not work.

Make sure the filter basket is full, and tamped correctly. This is another one of those places that a little experimentations is in order. If the coffee is tamped too hard water will not flow through. If it is not tamped hard enough the water will run through the grounds too quickly. Every machine is a little different. Experimentation is the key. So be sure that the coffee is level. If it is not you will be providing a path of least resistance for the water to go through.

Turn off the machine or move the cup away as soon as you see the streams of coffee coming out of the machine have become thin. If you keep going after this point, you're just pumping bitter over extracted garbage into your cup. The more you run out, the worse it will taste (more information on this method). If you want a longer drink, make a double, or add hot water to your espresso (an Americano).
              </h3>
          </div>
          <div class="col-md-5">
              <img src="images/espresso-04.jpg" style="border-radius: 30px;height: 530px;width: 500px"/>
          </div>
      </div>
      
      <div class="row">
          <div class="col-md-2">
              <img src="images/Kaffeemaschine.jpg" style="border-radius: 30px;height: 250px;width: 200px"/>
          </div>
          <div class="col-md-10">
              <h3 style="font-size:large ;background-color: whitesmoke;padding: 30px;border-radius:20px;box-shadow:#cccccc 2px 2px 5px 5px;  "><b><u>HISTORY</u></b><br>The rise of espresso as a popular coffee has paralleled technological advances to the espresso machine during the 20th century. Still, earlier forms of coffee brewing gave rise to the modern espresso. Much like espresso, coffee brewed in an Ibrik (or related brewer) was dark roasted, unfiltered, thick, and bittersweet. Additionally, when brewed correctly, this coffee has a layer of foam much like the crema of espresso. Traditionally served strong and sweet, coffee in the Middle East and Southeastern Europe was a natural step toward the technicalogical developments which would give rise to modern espresso.</h3>
          </div>
      </div>
       <footer style="background-color :#2F2F2F ;box-shadow: #818181 2px 2px 5px 5px;margin-top: 2%;">
          <div class="row">
              <div class="col-md-3 col-sm-3">
                   <h4>APPLY HERE</h4>
                  <ul>
                      <li>Admissions</li>
                      <li>Education Loan</li>
                      <li>Online Admission</li>
                      <li>How to Apply ?</li>
                      <li>Scholarship</li>
                  </ul>
              </div>
              <div class="col-md-3 col-sm-3">
                  <h4>LEARN HERE</h4>
                  <ul>
                      <li>Pay Fee Online</li>
                      <li>Our Institutes</li>
                      <li>Teaching Practices</li>
                      <li>System Of Evaluation</li>
                      <li>Placements</li>
                  </ul>
              </div>
              <div class="col-md-3 col-sm-3">
                   <h4>NEWSLETTER SIGNUP</h4>
                   <p>By subscribing to our mailing list you will always be update with the latest news from us.</p>
                   <input style="font-size: larger;font-family: 'Bellefair', serif; " type="text" placeholder="Enter Your Email">
                   <button style="font-family: 'Bellefair', serif;font-size: larger;" type="submit">SUBMIT</button>
              </div>
              <div class="col-md-3 col-sm-3">
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
              <div class="col-md-3 col-sm-3">
                 <h4>VISIT HERE</h4>
                  <ul>
                      <li>CU Media</li>
                      <li>Campus Tour</li>
                      <li>Maps</li>
                      <li>Distance Calculator</li>
                      <li>General Enquiry</li>
                  </ul>
              </div>
              <div class="col-md-3 col-sm-3">
                  <h4>LIVE HERE</h4>
                  <ul>
                      <li>Hostels</li>
                      <li>Transport</li>
                      <li>Sports</li>
                      <li>Student Welfare</li>
                      <li>Library</li>
                  </ul>
              </div>
              <div class="col-md-3 col-sm-3">
                  <p>
                      Chandigarh University [CU] is one of the Best University in Chandigarh, Punjab and North India that offers various Undergraduate and Post graduate Courses like B.tech, BCA, BBA, HMCT, B.Com, LLB, B.Arch, MBA, M.Tech, Journalism and MCA at an affordable fees in Chandigarh. Apply Now at India's Best University in Chandigarh That provides top placements. 

+ Chandigarh University (CU) Courses Fee Details
                  </p>
              </div>
              <div class="col-md-3 col-sm-3">
                  <img src="images/2017-07-13_13-58-38.png" />
              </div>
          </div>
      </footer>
    </body></html>