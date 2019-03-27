/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedWriter;
import java.io.FileWriter;
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
 * @author Saiyan
 */
public class registration extends HttpServlet {
 String email,fname,lname,password,msg,gender,date,state,number;
        String[] interests;
        StringBuilder interest = new StringBuilder();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        email = request.getParameter("email");
        fname = request.getParameter("fname");
        lname = request.getParameter("lname");
        password = request.getParameter("password");
        msg = request.getParameter("msg");
        gender = request.getParameter("gender");
        interests= request.getParameterValues("interest");
        date=request.getParameter("date");
        number=request.getParameter("number");
        state=request.getParameter("state");  
         if (interests != null) 
   {
      for (int i = 0; i < interests.length; i++) 
      {
        interest.append(interests[i]+" ");
      }
   }
   else { interest.append( "None"); }
             response.setContentType("text/html;charset=UTF-8");
    
           try{
            Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.err.println("connection failed");
        }
             else{
                 Statement st = conn.createStatement();
                 ResultSet rs = st.executeQuery("SELECT * FROM untitled WHERE Email='"+email+"';");
                 boolean flag =true;
                 while(rs.next()){
                 flag=false;
                 }
                 if(flag){
              st.executeUpdate("INSERT INTO untitled (Email,FirstName,LastName,Password,About,Gender,Interest,DOB,Mobile,State,Avtar,OTP,Success) VALUES ('"+email+"','"+fname+"','"+lname+"','"+password+"','"+msg+"','"+gender+"','"+interest+"','"+date+"','"+number+"','"+state+"','default','12345678',0 ); ");   
            writefile();
            UDM udm = new UDM (fname,lname,gender,date,interest.toString(),state,email,password,number,msg);
            request.setAttribute("model", udm);
           // RequestDispatcher rd = request.getRequestDispatcher("Login.jsp?successfull=1");
           RequestDispatcher rd = request.getRequestDispatcher("OTPGenerator");
            rd.forward(request, response);  
                 }else{
                 RequestDispatcher rd = request.getRequestDispatcher("Signup.jsp?error=1");
            rd.forward(request, response);  
                 }
             }
           }catch(ClassNotFoundException e){
               System.err.println(e);
           }catch(SQLException e){
               System.err.println(e);
           }
        }
    }
    void  writefile(){
        try{
            FileWriter fw = new FileWriter("C:\\Users\\user\\Documents\\NetBeansProjects\\WebApplication1\\web\\Data\\details.txt",true);
            fw.write(email+" "+fname+" "+lname+" "+password+" "+msg+" "+gender+" "+interest+" "+date+" "+number+" "+state+"\n");
            fw.close();
            
        }catch(IOException io){
            io.printStackTrace();
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
