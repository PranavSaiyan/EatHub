/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Saiyan
 */
public class Logout extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Cookie cookie=null;
            Cookie[] cookies = request.getCookies();
            if(cookies!=null){
                for(int i=0;i<cookies.length;i++){
                    cookie=cookies[i];
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                }
                HttpSession session = request.getSession();
                session.invalidate();
                response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
                response.sendRedirect("SignIn.jsp?logout=1");
//                RequestDispatcher rd = request.getRequestDispatcher("SignIn.jsp?logout=1");
//                rd.forward(request, response);
            }else{
                out.println("<h3><i><b>No Cookies Found</b></i></h3>");
                response.setHeader("Cache-Control","no-cache");
                response.setHeader("Cache-Control","no-store");
                response.setHeader("Pragma","no-cache");
                response.setDateHeader ("Expires", 0);
                response.sendRedirect("SignIn.jsp?logout=1");
//                 RequestDispatcher rd = request.getRequestDispatcher("SignIn.jsp?logout=1");
//                rd.forward(request, response);
            }
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
