package servlet;

import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.TransactionService;

@WebServlet("/CreateTransaction")
public class CreateTransaction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get session and verify student is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("stid") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String stid = (String) session.getAttribute("stid");
        String cardIdStr = request.getParameter("card_id");
        String materialName = request.getParameter("material_name");
        String priceStr = request.getParameter("price");
        String remarks = request.getParameter("remarks");
        
        // Validate parameters
        if (cardIdStr == null || cardIdStr.isEmpty() || 
            materialName == null || materialName.isEmpty() ||
            priceStr == null || priceStr.isEmpty()) {
            
            request.setAttribute("error", "Missing required parameters");
            request.getRequestDispatcher("paymentError.jsp").forward(request, response);
            return;
        }
        
        try {
            int cardId = Integer.parseInt(cardIdStr);
            BigDecimal price = new BigDecimal(priceStr);
            
            // Process transaction through service class
            TransactionService transactionService = new TransactionService();
            boolean success = transactionService.createTransaction(stid, cardId, materialName, 
                                                                 price.doubleValue(), remarks);
            
            if (success) {
                // Redirect to success page with transaction details
                response.sendRedirect("TransactionView");
            } else {
                request.setAttribute("error", "Transaction processing failed");
                request.getRequestDispatcher("paymentError.jsp").forward(request, response);
            }
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format");
            request.getRequestDispatcher("paymentError.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "System error: " + e.getMessage());
            request.getRequestDispatcher("paymentError.jsp").forward(request, response);
        }
    }
}