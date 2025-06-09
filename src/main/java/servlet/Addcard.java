package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CreditCard;
import model.Student;
import services.Cardservice;

@WebServlet("/addCard")
public class Addcard extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Cardservice cardService = new Cardservice();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        
        // Check if student is logged in
        if (student == null) {
            session.setAttribute("error", "Please login to add a card");
            response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
            return;
        }

        try {
            CreditCard card = new CreditCard();
            // Set card details from request
            card.setCardNumber(request.getParameter("cardNumber"));
            card.setCardName(request.getParameter("cardName"));
            card.setExpiryDate(request.getParameter("expiryDate"));
            card.setCvv(request.getParameter("cvv"));
            card.setCardType(request.getParameter("cardType"));
            card.setBillingAddress(request.getParameter("billingAddress"));
            card.setZipCode(request.getParameter("zipCode"));
            card.setSaveCard(request.getParameter("saveCard") != null);
            
            // Set the student ID from session
            card.setStudentStid(student.getStdid());  // Make sure this matches your Student class

            // Validate required fields
            if (card.getCardNumber() == null || card.getCardNumber().isEmpty() ||
                card.getExpiryDate() == null || card.getExpiryDate().isEmpty() ||
                card.getCvv() == null || card.getCvv().isEmpty()) {
                session.setAttribute("error", "Required fields are missing");
                response.sendRedirect(request.getContextPath() + "/addCard.jsp");
                return;
            }

            boolean saved = cardService.saveCard(card);
            if (saved) {
                session.setAttribute("message", "Card added successfully");
                response.sendRedirect(request.getContextPath() + "/Bupathi/dummydash.jsp");
            } else {
                session.setAttribute("error", "Failed to add card");
                response.sendRedirect(request.getContextPath() + "/addCard.jsp");
            }
        } catch (Exception e) {
            session.setAttribute("error", "Error: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}