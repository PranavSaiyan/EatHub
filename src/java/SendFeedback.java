/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(urlPatterns = {"/SendFeedback"})
public class SendFeedback extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String fname,email,phone,subject,comments;
        try (PrintWriter out = response.getWriter()) {
            fname = request.getParameter("name");
            email = request.getParameter("email");
            phone = request.getParameter("phone");
            subject = request.getParameter("subject");
            comments =request.getParameter("comments");
            
            ServletContext context = getServletContext();
            String host = context.getInitParameter("host");
            String user = context.getInitParameter("user");
            String password = context.getInitParameter("password");
            String to ="pranavsupersaiyan10@gmail.com";
            
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
     String someHtmlMessage= "<html><head><link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\"><link href=\"https://fonts.googleapis.com/css?family=Inconsolata|Indie+Flower\" rel=\"stylesheet\"><style>.card { box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); max-width: 300px; margin: auto; text-align: center; font-family: arial;}.title { color: grey; font-size: 18px;}button { border: none; outline: 0; display: inline-block; padding: 8px; color: white; background-color: #000; text-align: center; cursor: pointer; width: 100%; font-size: 18px;}a { text-decoration: none; font-size: 22px; color: black;}button:hover, a:hover { opacity: 0.7;}p{ font-family: 'Inconsolata', monospace;}</style></head><body><div class=\"card\"><h1 style=\"font-family: 'Indie Flower', cursive;font-weight: bolder;\">"+subject+"</h1><p class=\"title\">"+fname+"</p><p>"+phone+" | "+email+"</p><p>"+comments+"</p><div style=\"margin: 24px 0;\"> <a href=\"#\"><i class=\"fa fa-dribbble\"></i></a> <a href=\"#\"><i class=\"fa fa-twitter\"></i></a> <a href=\"#\"><i class=\"fa fa-linkedin\"></i></a> <a href=\"#\"><i class=\"fa fa-facebook\"></i></a> </div></div></body></html>";   
     MimeMessage message = new MimeMessage(session);  
     message.setFrom(new InternetAddress(user));  
     message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
     message.setSubject("Feedback of CUEathub");  
     message.setContent(someHtmlMessage, "text/html; charset=utf-8");
       
    //send the message  
     Transport.send(message);  
  
     System.out.println("message sent successfully...");  
      RequestDispatcher dispatcher = request.getRequestDispatcher("Contact.jsp?success=1");
      dispatcher.forward(request, response);
     } catch (MessagingException e) {e.printStackTrace();}  
        
        }catch(Exception e){ e.printStackTrace();}
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
