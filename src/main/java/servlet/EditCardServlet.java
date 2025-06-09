package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Student;
import model.CreditCard;
import services.Cardservice;

@WebServlet("/editcard")
public class EditCardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int cardId = Integer.parseInt(request.getParameter("id"));
        Cardservice cardService = new Cardservice();
        CreditCard card = null;
		try {
			card = cardService.getCardById(cardId);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        // Verify ownership using student_stid
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if (card == null || !card.getStudentStid().equals(student.getStdid())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        
        request.setAttribute("card", card);
        request.setAttribute("editMode", true);
        request.getRequestDispatcher("/Bupathi/addcard.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int cardId = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        
        CreditCard card = new CreditCard();
        card.setId(cardId);
        card.setStudentStid(student.getStdid()); // Using stid instead of studentId
        card.setCardNumber(request.getParameter("cardNumber"));
        card.setCardName(request.getParameter("cardName"));
        card.setExpiryDate(request.getParameter("expiryDate"));
        card.setCvv(request.getParameter("cvv"));
        card.setCardType(request.getParameter("cardType"));
        card.setBillingAddress(request.getParameter("billingAddress"));
        card.setZipCode(request.getParameter("zipCode"));
        
        Cardservice cardService = new Cardservice();
        try {
			if (cardService.updateCard(card)) {
			    session.setAttribute("message", "Card updated successfully");
			} else {
			    session.setAttribute("error", "Failed to update card");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        response.sendRedirect("creditcard");
    }
}