<%-- 
    Document   : EncryptionAES
    Created on : Nov 5, 2017, 3:53:07 PM
    Author     : user
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="java.math.BigInteger"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="javax.crypto.SecretKey"%>
<%! /**
     * Encrypts plainText in AES using the secret key
     * @param plainText
     * @param secKey
     * @return
     * @throws Exception
     */
     byte[] encryptText(String plainText,SecretKey secKey) throws Exception{
        // AES defaults to AES/ECB/PKCS5Padding in Java 7
        Cipher aesCipher = Cipher.getInstance("AES");
        aesCipher.init(Cipher.ENCRYPT_MODE, secKey);
        byte[] byteCipherText = aesCipher.doFinal(plainText.getBytes());
        return byteCipherText;
    }
    String  bytesToHex(byte[] hash) {
        return DatatypeConverter.printHexBinary(hash);
    }

    %>
    <%  String email = request.getParameter("hashemail");
        String password =  request.getParameter("hashpass");
        ServletContext context = getServletContext();
        String secretkey = context.getInitParameter("secretkey");
        byte[] yourBytes = new BigInteger(secretkey, 16).toByteArray();
        SecretKey s2 = new SecretKeySpec(yourBytes, "AES");
        byte[] cipherText = encryptText(password, s2);
        String finalcipher = email+" "+bytesToHex(cipherText);
        final ByteArrayOutputStream baos = new ByteArrayOutputStream();
        final ObjectOutputStream oos = new ObjectOutputStream(baos);
        oos.writeObject(finalcipher);
        oos.flush();
        final String result = new String(Base64.getEncoder().encode(baos.toByteArray()));
        
        out.println(result);
        %>
