<%-- 
    Document   : AdminLogout
    Created on : Dec 14, 2017, 2:18:27 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
            response.setHeader("Cache-Control","no-cache");
            response.setHeader("Cache-Control","no-store");
            response.setDateHeader("Expires", 0);
            response.setHeader("Pragma","no-cache");
%>
<%
               session.invalidate();
               %>
               <script>
                   location.replace("AdminLogin.jsp");
               </script>
             