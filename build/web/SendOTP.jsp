<%-- 
    Document   : SendOTP
    Created on : Sep 19, 2017, 7:29:23 PM
    Author     : user
--%>

<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>
<%@page import="javax.mail.*" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
        String generateRandomChars(String candidateChars, int length) {
    StringBuilder sb = new StringBuilder();
    Random random = new Random();
    for (int i = 0; i < length; i++) {
        sb.append(candidateChars.charAt(random.nextInt(candidateChars
                .length())));
    }

    return sb.toString();
}
    
    %>
<% 
  String email = (String)session.getAttribute("usrmail");
  String OTP  = generateRandomChars(
            "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890", 8);
  try{
            Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
             else{
                 Statement st = conn.createStatement();
                 st.executeUpdate("UPDATE untitled SET OTP='"+OTP+"' WHERE Email='"+email+"';");                 
             }
     }catch(ClassNotFoundException e){
               System.err.println(e);
               out.print("ClassNotFoundException");
           }catch(SQLException e){
               System.err.println(e);
               out.print("SQLException");
           }
  

  //Creating a result for getting status that messsage is delivered or not!
    String result;
    // Get recipient's email-ID, message & subject-line from index.html page
    final String to =email;
    final String subject = "Account Verification"; 
    final String messg = "<html><head><link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\"><link href=\"https://fonts.googleapis.com/css?family=Inconsolata|Indie+Flower\" rel=\"stylesheet\"><style>.card { box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); max-width: 300px; margin: auto; text-align: center; font-family: arial;}.title { color: grey; font-size: 18px;}button { border: none; outline: 0; display: inline-block; padding: 8px; color: white; background-color: #000; text-align: center; cursor: pointer; width: 100%; font-size: 18px;}a { text-decoration: none; font-size: 22px; color: black;}button:hover, a:hover { opacity: 0.7;}p{ font-family: 'Inconsolata', monospace;}</style></head><body><div class=\"card\"> <img src=\"https://lh3.googleusercontent.com/ex-xpHy1Fwfwt3mjWJX-T1U0bmORjQrD4ggDyFdXm9ViJjj5BjztUJF6zO8W5T5uE7DfKGF4tbcbG884Hz4d0kHreFCw1gGf07Hd1GSQJ2-VZ7P5TaaBIy9iow4IaBVH-_1ULpd97AvjUvEMYH7kcs8gM6-qRiUcYx_PRgEc87BVvHt_Tx34Yfhf9q1oQIF4exFkujZZbRkxMBH3ojsRUFDYlCR4_cilbamqqQJlolzuDjxfIGKj7ZLmrhdZn9tuan9TDytT5dRgmjWSb6rUfDEUBEGC85-Lu4i60LD6tIfvuPs1GO_kl9tSbwJJYs9NDH9WbcA-3iJyTvigTC1va2Qm_ADuUOrBQWFPy-DbEySOYDMB3k8JGSXq2HnMWcGE6qWnU-_y-E2cLv9-2ybpQCKmLN8LwMylqn78ZOznRUWG2vwczwKGZqfzxUW6yK4bPX_Nnsc5LTutI0LNhgwfUg7c2Pg3xlGPRvHMeszzduIzaZEHd2Zvh1W-g-RUZxsTjZ6DHFI7cxHoJilNSSI4Z1pdpejQan8P_hohyinNRoCgYLRbrD3hqQlYomf3hA=w1364-h628\" alt=\"cueathub\" style=\"width:100%\"> <h1 style=\"font-family: 'Indie Flower', cursive;font-weight: bolder;\">CUEathub</h1> <p class=\"title\">&quot;There is no sincerer love than the love of food.&quot; </p> <p>CUEathub offers fast ordering , secure payments , and time to time status of order.</p> <p>OTP for account verification :"+OTP+"</p><div style=\"margin: 24px 0;\"> <a href=\"#\"><i class=\"fa fa-dribbble\"></i></a> <a href=\"#\"><i class=\"fa fa-twitter\"></i></a> <a href=\"#\"><i class=\"fa fa-linkedin\"></i></a> <a href=\"#\"><i class=\"fa fa-facebook\"></i></a> </div> <p><button><a href=\"http://cueathub.com/FoodCorner/Contact.jsp\">Contact</a></button></p></div></body></html>";
    // Sender's email ID and password needs to be mentioned
    final String from ="services@cueathub.com";
    final String pass = "Boruto@Uzu4";
 
    // Defining the gmail host
    String host = "cueathub.com";
 
    // Creating Properties object
    Properties props = new Properties();
 
    // Defining properties
    props.put("mail.smtp.host", host);
    props.put("mail.transport.protocol", "smtp");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.user", from);
    props.put("mail.password", pass);
    props.put("mail.port", "465");
 
    // Authorized the Session object.
    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, pass);
        }
    });
 
    try {
        // Create a default MimeMessage object.
        MimeMessage message = new MimeMessage(mailSession);
        // Set From: header field of the header.
        message.setFrom(new InternetAddress(from));
        // Set To: header field of the header.
        message.addRecipient(Message.RecipientType.TO,
                new InternetAddress(to));
        // Set Subject: header field
        message.setSubject(subject);
        // Now set the actual message
        message.setContent("<h3>"+messg+"</h3>" ,"text/html");
        // Send message
        Transport.send(message);
        result = "Your mail sent successfully....";
    } catch (MessagingException mex) {
        mex.printStackTrace();
        result = "Error: unable to send mail....";
    }
 out.println(result);
%>
