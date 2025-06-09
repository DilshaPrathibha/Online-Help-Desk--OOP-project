package servlet;

import model.Ticket;
import services.TicketService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/student/tickets")
public class studentTicketServlet extends HttpServlet {

    private TicketService ticketService = new TicketService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        // Check logged-in student
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("stid") == null) {
            System.out.println("DEBUG: No session or student ID found.");
            response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
            return;
        }

        String studentId = (String) session.getAttribute("stid");
        System.out.println("DEBUG: Logged-in student ID = " + studentId);

        // Fetch tickets for the student
        List<Ticket> tickets = ticketService.getTicketsByStudentId(studentId);
        System.out.println("DEBUG: Number of tickets fetched = " + (tickets != null ? tickets.size() : 0));

        if (tickets != null) {
            for (Ticket t : tickets) {
                System.out.println("DEBUG: Ticket ID = " + t.getTicketId() + ", Subject = " + t.getSubject());
            }
        }

        
        request.setAttribute("tickets", tickets);

        
        request.getRequestDispatcher("/Dilsha/tickets_student.jsp").forward(request, response);
    }
}
