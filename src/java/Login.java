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
import java.sql.SQLException;
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
 * @author Saiyan
 */
public class Login extends HttpServlet {
    String result,decryptemail,decryptpass;
    boolean noemail = false;
    UDM udm = new UDM();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           result = request.getParameter("hashcode");
           final String base64String = result;
        final byte[] objToBytes = Base64.getDecoder().decode(base64String);
        ByteArrayInputStream bais = new ByteArrayInputStream(objToBytes);
        ObjectInputStream ois = new ObjectInputStream(bais);
        String cipherText = (String)ois.readObject();
        String[] values= cipherText.split(" ");
        decryptemail = values[0];
        decryptpass = values[1];
           
           boolean val = readfile();
           if(noemail){
           if(val){
               Cookie fname = new Cookie("f_name",udm.getFname());
               Cookie lname = new  Cookie("l_name",udm.getLname());
               fname.setMaxAge(60*60*1);
               lname.setMaxAge(60*60*1);
               response.addCookie(fname);
               response.addCookie(lname);
               HttpSession session = request.getSession(true);
               Date createddate = new Date(session.getCreationTime());
               Date lastAccesstime = new Date(session.getLastAccessedTime());
               session.setAttribute("usrmail",udm.getEmail());
               
               request.setAttribute("model",udm);
            response.setHeader("Cache-Control","no-cache");
            response.setHeader("Cache-Control","no-store");
            response.setDateHeader("Expires", 0);
            response.setHeader("Pragma","no-cache");
            response.sendRedirect("Timeline.jsp");
//               RequestDispatcher rd = request.getRequestDispatcher("Timeline.jsp");
//               rd.forward(request, response);
           }else{
               response.sendRedirect("SignIn.jsp?error=1");
//               RequestDispatcher rd = request.getRequestDispatcher("SignIn.jsp?error=1");
//               rd.forward(request, response);
           }
           }
           else{
               response.sendRedirect("SignIn.jsp?error=2");
//            RequestDispatcher rd = request.getRequestDispatcher("SignIn.jsp?error=2");
//               rd.forward(request, response);
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
                 ResultSet rt = st.executeQuery("SELECT * FROM untitled WHERE Email='"+decryptemail+"';");
                 while(rt.next()){
                        noemail=true;
                        String getpassword = rt.getString(4);
                        ServletContext context = getServletContext();
                        String secretkey = context.getInitParameter("secretkey");
                        byte[] yourBytes = new BigInteger(secretkey, 16).toByteArray();
                        SecretKey s2 = new SecretKeySpec(yourBytes, "AES");
                        byte[] cipherText = encryptText(getpassword, s2);
                        String encryptpass= bytesToHex(cipherText);
                     
                 if(encryptpass.equals(decryptpass)){
                     udm.setFname(rt.getString(2));
                    udm.setLname(rt.getString(3));
                    udm.setEmail(rt.getString(1));
                    udm.setPassword(rt.getString(4));
                    udm.setDob(rt.getString(8));
                    udm.setAbout(rt.getString(5));
                    udm.setGender(rt.getString(6));
                    udm.setInterest(rt.getString(7));
                    udm.setState(rt.getString(10));
                    val=true;
                    break;
                 }else{val=false;}
                 }
             }
             conn.close();
     }catch(Exception e){
     e.printStackTrace();
     }
            
            
//            FileReader fr = new FileReader("C:\\Users\\user\\Documents\\NetBeansProjects\\WebApplication1\\web\\Data\\details.txt");
//            BufferedReader br = new BufferedReader(fr);
//            String data;
//            while((data=br.readLine())!=null){
//                String[] text = data.split(" ");
//                if(text[0].equals(email)&&text[3].equals(password)){
//                    udm.setFname(text[1]);
//                    udm.setLname(text[2]);
//                    udm.setEmail(email);
//                    udm.setPassword(password);
//                    udm.setDob(text[7]);
//                    udm.setAbout(text[4]);
//                    udm.setGender(text[5]);
//                    udm.setInterest(text[6]);
//                    udm.setState(text[9]);
//                    val=true;
//                    break;         
//                    
//                }
//                else{
//                    val=false;
//                }
//            }
//            br.close();
//            fr.close();
//            
//         
       
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
