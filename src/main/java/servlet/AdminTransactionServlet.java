package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Transaction;
import services.TransactionService;

@WebServlet("/AdminTransactionView")
public class AdminTransactionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final TransactionService transactionService = new TransactionService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            List<Transaction> transactions = transactionService.getAllTransactions();
            request.setAttribute("transactions", transactions);
            request.getRequestDispatcher("/admin/transactionView.jsp").forward(request, response);
            
        } catch (Exception e) {
            request.setAttribute("error", "Error retrieving transactions: " + e.getMessage());
            request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
        }
    }
}