package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Student;
import services.Cardservice;

@WebServlet("/deletecard")
public class DeleteCardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int cardId = Integer.parseInt(request.getParameter("cardId"));
            Student student = (Student) request.getSession().getAttribute("student");
            
            if (student == null) {
                request.getSession().setAttribute("error", "User not logged in");
                response.sendRedirect("login");
                return;
            }
            
            Cardservice cardService = new Cardservice();
            if (cardService.deleteCard(cardId, student.getStdid())) {
                request.getSession().setAttribute("message", "Card deleted successfully");
            } else {
                request.getSession().setAttribute("error", "Failed to delete card. It may not exist or you don't have permission.");
            }
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid card ID format");
        } catch (Exception e) {
            request.getSession().setAttribute("error", "An error occurred: " + e.getMessage());
        }
        
        response.sendRedirect("creditcard");
    }
}