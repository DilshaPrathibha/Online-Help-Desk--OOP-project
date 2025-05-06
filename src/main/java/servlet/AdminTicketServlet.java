//session checks are commented

package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Ticket;
import services.TicketService;

@WebServlet("/admin/tickets")
public class AdminTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TicketService ticketService;

    @Override
    public void init() throws ServletException {
        super.init();
        ticketService = new TicketService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session check for admin login
        HttpSession session = request.getSession(false);
        
        // Temporary check for testing (Simulating an admin session)
        if (session == null || session.getAttribute("admin") == null) {
            // For testing only — simulate admin session
            session = request.getSession(true);
            session.setAttribute("admin", true);
            session.setAttribute("firstName", "Test");
            session.setAttribute("lastName", "Admin");
            session.setAttribute("picture", "default.jpg");
            // No redirect during testing
        }

        // If this were in production, this block would redirect non-admins to login
        // if (session == null || session.getAttribute("admin") == null) {
        //     response.sendRedirect(request.getContextPath() + "/login.jsp");
        //     return;
        // }

        // Set session attributes for admin
        request.setAttribute("firstName", session.getAttribute("firstName"));
        request.setAttribute("lastName", session.getAttribute("lastName"));
        request.setAttribute("picture", session.getAttribute("picture"));

        // Handle the action parameter to determine the page behavior
        String action = request.getParameter("action");

        if (action == null || action.equals("list")) {
            // Fetch all tickets for the admin to manage
            List<Ticket> tickets = ticketService.getAllTickets();
            request.setAttribute("tickets", tickets);
            request.getRequestDispatcher("/Dilsha/tickets_admin.jsp").forward(request, response);
        } else if (action.equals("view")) {
            // Fetch and display a specific ticket's details
            int id = Integer.parseInt(request.getParameter("id"));
            Ticket ticket = ticketService.getTicket(id);
            request.setAttribute("ticket", ticket);
            request.getRequestDispatcher("/Dilsha/ticket_view.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Reserved for future post actions (e.g., ticket editing/deletion)
        doGet(request, response);
    }
}
