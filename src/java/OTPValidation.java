/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class OTPValidation extends HttpServlet {

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
        String otpvalidation = request.getParameter("otp");
        String email = request.getParameter("email");
        try (PrintWriter out = response.getWriter()) {
            
             String otp=null;
            try{
            Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
             else{
                 Statement st = conn.createStatement();
                 ResultSet rs = st.executeQuery("SELECT OTP FROM untitled WHERE Email='"+email+"';");
                 while(rs.next()){
                  otp = rs.getString("OTP");
              }
              
             }
             conn.close();
     }catch(ClassNotFoundException e){
               System.err.println(e);
           }catch(SQLException e){
               System.err.println(e);
           }
            
            //
            if(otp.equals(otpvalidation)){
            RequestDispatcher rd = request.getRequestDispatcher("SignIn.jsp?successfull=1");
            
            try{
            Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
             else{
                 Statement st = conn.createStatement();
                 st.executeUpdate("UPDATE untitled SET Success=1 WHERE Email='"+email+"';");                 
             }
              conn.close();
     }catch(ClassNotFoundException e){
               System.err.println(e);
           }catch(SQLException e){
               System.err.println(e);
           }
            
            rd.forward(request, response);
            }else{
                RequestDispatcher dispatcher = request.getRequestDispatcher("otpverify.jsp?email="+email+"&success=no");
                dispatcher.forward(request, response);
            }
           //
        }
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
