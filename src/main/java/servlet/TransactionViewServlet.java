package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Student;
import model.Transaction;
import services.TransactionService;

@WebServlet("/TransactionView")
public class TransactionViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final TransactionService transactionService = new TransactionService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        // Check session first
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
            return;
        }
        
        // Check if admin is logged in
        if (session.getAttribute("admin") != null) {
            // Admin view - show all transactions
            try {
                List<Transaction> transactions = transactionService.getAllTransactions();
                request.setAttribute("transactions", transactions);
                request.setAttribute("viewType", "admin"); // Add viewType attribute
                request.getRequestDispatcher("/Bupathi/Admintransactionhistory.jsp").forward(request, response);
                return;
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("error", "Error retrieving transactions: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/Bupathi/Admin.jsp");
                return;
            }
        }
        
        // Student login check
        Student student = (Student) session.getAttribute("student");
        String stid = (String) session.getAttribute("stid");
        
        if (student == null && stid == null) {
            session.setAttribute("error", "Please login to view your transactions");
            response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
            return;
        }
        
        String studentId = student != null ? student.getStdid() : stid;
        
        try {
            List<Transaction> transactions = transactionService.getTransactionsByStudentId(studentId);
            request.setAttribute("transactions", transactions);
            request.setAttribute("studentName", student != null ? student.getFullname() : "User");
            request.setAttribute("viewType", "user"); // Add viewType attribute
            request.getRequestDispatcher("/Bupathi/transactionHistory.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Error retrieving transactions: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
        }
    }
}