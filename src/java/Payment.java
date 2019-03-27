///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//
//import com.instamojo.wrapper.api.*;
//import com.instamojo.wrapper.exception.ConnectionException;
//import com.instamojo.wrapper.exception.InvalidPaymentOrderException;
//import com.instamojo.wrapper.model.PaymentOrder;
//import com.instamojo.wrapper.response.CreatePaymentOrderResponse;
//import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
///**
// *
// * @author user
// */
//public class Payment extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     * @throws com.instamojo.wrapper.exception.ConnectionException
//     * @throws com.instamojo.wrapper.exception.InvalidPaymentOrderException
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException, ConnectionException, InvalidPaymentOrderException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//           PaymentOrder order = new PaymentOrder();
//           order.setName("John Smith");
//order.setEmail("john.smith@gmail.com");
//order.setPhone("12345678790");
//order.setCurrency("INR");
//order.setAmount(9D);
//order.setDescription("This is a test transaction.");
//order.setRedirectUrl("http://www.someexample.com");
//order.setWebhookUrl("http://www.someurl.com/");
//order.setTransactionId("dxg234");
//
//Instamojo api = null;
//
//try {
//	// gets the reference to the instamojo api
//	api = InstamojoImpl.getApi("9eb0dTpD3sEhv5jqbKdVW3LSGsvz0q6dWTPOzVR1", "sjj28QxHwvZVtY7yOlFUew2wXbqVyLvziLESOEID01vp3Dw6GmjxN7ogKEK6iqAj9GqiTiH534k8QZnY8nHKv2w7hy8N0TA1XE6AJVtua1dW02fzvQY2XNpxOQxaP9tT", "https://test.instamojo.com/v2/", "https://test.instamojo.com/oauth2/token/");
//} catch (ConnectionException e) {
//	LOGGER.log(Level.SEVERE, e.toString(), e);
//}
//
//boolean isOrderValid = order.validate();
//
//if (isOrderValid) {
//	try {
//		CreatePaymentOrderResponse createPaymentOrderResponse = api.createNewPaymentOrder(order);
//	    // print the status of the payment order.
//		System.out.println(createPaymentOrderResponse.getPaymentOrder().getStatus());
//	} catch (InvalidPaymentOrderException e) {
//	    LOGGER.log(Level.SEVERE, e.toString(), e);
//
//	    if (order.isTransactionIdInvalid()) {
//	        System.out.println("Transaction id is invalid. This is mostly due to duplicate  transaction id.");
//	    }
//	    if (order.isCurrencyInvalid()) {
//	        System.out.println("Currency is invalid.");
//	    }
//	} catch (ConnectionException e) {
//	    LOGGER.log(Level.SEVERE, e.toString(), e);
//    }
//} else {
//	// inform validation errors to the user.
//	if (order.isTransactionIdInvalid()) {
//	    System.out.println("Transaction id is invalid.");
//	}
//	if (order.isAmountInvalid()) {
//	  System.out.println("Amount can not be less than 9.00.");
//	}
//	if (order.isCurrencyInvalid()) {
//	  System.out.println("Please provide the currency.");
//	}
//	if (order.isDescriptionInvalid()) {
//	  System.out.println("Description can not be greater than 255 characters.");
//        }
//	if (order.isEmailInvalid()) {
//	  System.out.println("Please provide valid Email Address.");
//	}
//	if (order.isNameInvalid()) {
//	  System.out.println("Name can not be greater than 100 characters.");
//	}
//	if (order.isPhoneInvalid()) {
//	  System.out.println("Phone is invalid.");
//	}
//	if (order.isRedirectUrlInvalid()) {
//	  System.out.println("Please provide valid Redirect url.");
//	}
//	
//	if (order.isWebhookInvalid()) {
//      System.out.println("Provide a valid webhook url");
//    }
//}
//
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            processRequest(request, response);
//        } catch (ConnectionException | InvalidPaymentOrderException ex) {
//            Logger.getLogger(Payment.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            processRequest(request, response);
//        } catch (ConnectionException | InvalidPaymentOrderException ex) {
//            Logger.getLogger(Payment.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
