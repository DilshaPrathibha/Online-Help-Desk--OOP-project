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
import model.CreditCard;
import services.Cardservice;

@WebServlet("/creditcard")
public class CardViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final Cardservice cardService = new Cardservice();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("=== ENTERING CardViewServlet ===");
        HttpSession session = request.getSession(false);
        String redirectPath = request.getContextPath() + "/Bupathi/login.jsp";

        // ===== 1. Session Validation =====
        if (session == null || session.getAttribute("student") == null) {
            if (session != null) {
                session.setAttribute("redirectUrl", request.getRequestURI());
                session.setAttribute("error", "Please login to view your cards");
            }
            response.sendRedirect(redirectPath);
            return;
        }

        Student student = (Student) session.getAttribute("student");
        
        // ===== 2. Debug: Verify Student Data =====
        System.out.println("[DEBUG] Student ID: " + student.getStdid());
        System.out.println("[DEBUG] Student Username: " + student.getUsername());

        try {
            // ===== 3. Fetch Cards =====
            List<CreditCard> cards = cardService.getCardsByStudentId(student.getStdid());
            
            // ===== 4. Debug: Verify Cards =====
            System.out.println("[DEBUG] Cards Found: " + (cards != null ? cards.size() : 0));
            if (cards != null) {
                for (CreditCard card : cards) {
                    System.out.println("[DEBUG] Card ID: " + card.getId() + " | Last 4: " 
                        + card.getCardNumber().substring(card.getCardNumber().length() - 4));
                }
            }

            // ===== 5. Set Attributes =====
            request.setAttribute("cards", cards);
            request.setAttribute("studentName", student.getFullname());
            
            // ===== 6. Forward to JSP =====
            request.getRequestDispatcher("/Bupathi/creditcard.jsp").forward(request, response);
            
        } catch (Exception e) {
            // ===== 7. Error Handling =====
            System.err.println("[ERROR] Failed to load cards for student " + student.getStdid());
            e.printStackTrace();
            
            if (session != null) {
                session.setAttribute("error", "Error retrieving cards: " + e.getMessage());
            }
            response.sendRedirect(redirectPath);
        }
    }
}
