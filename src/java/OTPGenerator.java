/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Math.random;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class OTPGenerator extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email=null;
        if(request.getParameter("email")==null){
        UDM udm = (UDM)request.getAttribute("model");
        email=udm.email;
        }else{
        email=request.getParameter("email");
        }
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
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
           }catch(SQLException e){
               System.err.println(e);
           }
            ServletContext context = getServletContext();
            String host = context.getInitParameter("host");
            String user = context.getInitParameter("user");
            String password = context.getInitParameter("password");
            String to = email;
            
             //Get the session object  
   Properties props = new Properties();  
   props.put("mail.smtp.host",host);  
   props.put("mail.smtp.auth", "true");  
     
   Session session = Session.getDefaultInstance(props,  
    new javax.mail.Authenticator() {  
      @Override
      protected PasswordAuthentication getPasswordAuthentication() {  
    return new PasswordAuthentication(user,password);  
      }  
    });  
  
   //Compose the message  
    try {  
     String someHtmlMessage= "<html><head><link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\"><link href=\"https://fonts.googleapis.com/css?family=Inconsolata|Indie+Flower\" rel=\"stylesheet\"><style>.card { box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); max-width: 300px; margin: auto; text-align: center; font-family: arial;}.title { color: grey; font-size: 18px;}button { border: none; outline: 0; display: inline-block; padding: 8px; color: white; background-color: #000; text-align: center; cursor: pointer; width: 100%; font-size: 18px;}a { text-decoration: none; font-size: 22px; color: black;}button:hover, a:hover { opacity: 0.7;}p{ font-family: 'Inconsolata', monospace;}</style></head><body><div class=\"card\"> <img src=\"https://lh3.googleusercontent.com/ex-xpHy1Fwfwt3mjWJX-T1U0bmORjQrD4ggDyFdXm9ViJjj5BjztUJF6zO8W5T5uE7DfKGF4tbcbG884Hz4d0kHreFCw1gGf07Hd1GSQJ2-VZ7P5TaaBIy9iow4IaBVH-_1ULpd97AvjUvEMYH7kcs8gM6-qRiUcYx_PRgEc87BVvHt_Tx34Yfhf9q1oQIF4exFkujZZbRkxMBH3ojsRUFDYlCR4_cilbamqqQJlolzuDjxfIGKj7ZLmrhdZn9tuan9TDytT5dRgmjWSb6rUfDEUBEGC85-Lu4i60LD6tIfvuPs1GO_kl9tSbwJJYs9NDH9WbcA-3iJyTvigTC1va2Qm_ADuUOrBQWFPy-DbEySOYDMB3k8JGSXq2HnMWcGE6qWnU-_y-E2cLv9-2ybpQCKmLN8LwMylqn78ZOznRUWG2vwczwKGZqfzxUW6yK4bPX_Nnsc5LTutI0LNhgwfUg7c2Pg3xlGPRvHMeszzduIzaZEHd2Zvh1W-g-RUZxsTjZ6DHFI7cxHoJilNSSI4Z1pdpejQan8P_hohyinNRoCgYLRbrD3hqQlYomf3hA=w1364-h628\" alt=\"cueathub\" style=\"width:100%\"> <h1 style=\"font-family: 'Indie Flower', cursive;font-weight: bolder;\">CUEathub</h1> <p class=\"title\">&quot;There is no sincerer love than the love of food.&quot; </p> <p>CUEathub offers fast ordering , secure payments , and time to time status of order.</p> <p>OTP for account verification :";   
     String someHtmlMessage2 ="</p><div style=\"margin: 24px 0;\"> <a href=\"#\"><i class=\"fa fa-dribbble\"></i></a> <a href=\"#\"><i class=\"fa fa-twitter\"></i></a> <a href=\"#\"><i class=\"fa fa-linkedin\"></i></a> <a href=\"#\"><i class=\"fa fa-facebook\"></i></a> </div> <p><button><a href=\"http://cueathub.com/FoodCorner/Contact.jsp\">Contact</a></button></p></div></body></html>";
     MimeMessage message = new MimeMessage(session);  
     message.setFrom(new InternetAddress(user));  
     message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
     message.setSubject("Welcome To CUeathub");  
     message.setContent(someHtmlMessage+OTP+someHtmlMessage2, "text/html; charset=utf-8");
       
    //send the message  
     Transport.send(message);  
  
     System.out.println("message sent successfully...");  
   
     } catch (MessagingException e) {e.printStackTrace();}  
        
            RequestDispatcher dispatcher = request.getRequestDispatcher("otpverify.jsp?email="+email);
             dispatcher.forward(request, response);

        }catch(Exception e){ e.printStackTrace();}
    }
        public static String generateRandomChars(String candidateChars, int length) {
    StringBuilder sb = new StringBuilder();
    Random random = new Random();
    for (int i = 0; i < length; i++) {
        sb.append(candidateChars.charAt(random.nextInt(candidateChars
                .length())));
    }

    return sb.toString();
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
