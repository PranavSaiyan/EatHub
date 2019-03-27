/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author user
 */
public class AdminSignin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     String decryptemail,decryptpass;
     boolean nouser  =false;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String hashcode= request.getParameter("hashcode");
       
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
        final String base64String = hashcode;
        final byte[] objToBytes = Base64.getDecoder().decode(base64String);
        ByteArrayInputStream bais = new ByteArrayInputStream(objToBytes);
        ObjectInputStream ois = new ObjectInputStream(bais);
        String cipherText = (String)ois.readObject();
        String[] values= cipherText.split(" ");
        decryptemail = values[0];
        decryptpass = values[1];
        
        boolean val = readfile();
        out.println(decryptemail+" "+decryptpass);
        if(nouser){
           if(val){
               HttpSession session = request.getSession(true);
               Date createddate = new Date(session.getCreationTime());
               Date lastAccesstime = new Date(session.getLastAccessedTime());
               session.setAttribute("usrname",decryptemail);
//               RequestDispatcher rd = request.getRequestDispatcher("OrderList.jsp");
//               rd.forward(request, response);
                response.sendRedirect("OrderList.jsp");
           }else{
               RequestDispatcher rd = request.getRequestDispatcher("AdminLogin.jsp?error=1");
               rd.forward(request, response);
           }
           }
           else{
            RequestDispatcher rd = request.getRequestDispatcher("AdminLogin.jsp?error=2");
               rd.forward(request, response);
           }
           
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    boolean readfile(){
        boolean val = false;
               try{
            Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
             else{
                 Statement st = conn.createStatement();
                 ResultSet rt = st.executeQuery("SELECT * FROM Admins WHERE Username='"+decryptemail+"';");
                 while(rt.next()){
                        nouser=true;
                        String getpassword = rt.getString(4);
                        ServletContext context = getServletContext();
                        String secretkey = context.getInitParameter("secretkey");
                        byte[] yourBytes = new BigInteger(secretkey, 16).toByteArray();
                        SecretKey s2 = new SecretKeySpec(yourBytes, "AES");
                        byte[] cipherText = encryptText(getpassword, s2);
                        String encryptpass= bytesToHex(cipherText);
                        if(encryptpass.equals(decryptpass)){
                            val=true;
                            break;
                        }else{
                            val=false;
                        }
                 }
             }
               conn.close();
     }catch(Exception e){
     e.printStackTrace();
     }
               return val;
    }
    
     /**
     * Encrypts plainText in AES using the secret key
     * @param plainText
     * @param secKey
     * @return
     * @throws Exception
     */
    public static byte[] encryptText(String plainText,SecretKey secKey) throws Exception{
        // AES defaults to AES/ECB/PKCS5Padding in Java 7
        Cipher aesCipher = Cipher.getInstance("AES");
        aesCipher.init(Cipher.ENCRYPT_MODE, secKey);
        byte[] byteCipherText = aesCipher.doFinal(plainText.getBytes());
        return byteCipherText;
    }
    /**
     * Decrypts encrypted byte array using the key used for encryption.
     * @param byteCipherText
     * @param secKey
     * @return
     * @throws Exception
     */
    String decryptText(byte[] byteCipherText, SecretKey secKey) throws Exception {
        // AES defaults to AES/ECB/PKCS5Padding in Java 7
        Cipher aesCipher = Cipher.getInstance("AES");
        aesCipher.init(Cipher.DECRYPT_MODE, secKey);
        byte[] bytePlainText = aesCipher.doFinal(byteCipherText);
        return new String(bytePlainText);
    }
    /**
     * Convert a binary byte array into readable hex form
     * @param hash
     * @return
     */
    String  bytesToHex(byte[] hash) {
        return DatatypeConverter.printHexBinary(hash);
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
