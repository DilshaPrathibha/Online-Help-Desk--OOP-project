// add auto redirect if not logged in as an admin
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
        String action = request.getParameter("action");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            // For testing only — simulate admin session
            session = request.getSession(true);
            session.setAttribute("admin", true);
            session.setAttribute("firstName", "Test");
            session.setAttribute("lastName", "Admin");
            session.setAttribute("picture", "default.jpg");
            // No redirect
        }

        request.setAttribute("firstName", session.getAttribute("firstName"));
        request.setAttribute("lastName", session.getAttribute("lastName"));
        request.setAttribute("picture", session.getAttribute("picture"));

        if (action == null || action.equals("list")) {
            List<Ticket> tickets = ticketService.getAllTickets();
            request.setAttribute("tickets", tickets);
            request.getRequestDispatcher("/Dilsha/tickets_admin.jsp").forward(request, response);
        } else if (action.equals("view")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Ticket ticket = ticketService.getTicket(id);
            request.setAttribute("ticket", ticket);
            request.getRequestDispatcher("/Dilsha/ticket_view.jsp").forward(request, response);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // No post actions yet (like editing/deleting tickets), but reserved for future
        doGet(request, response);
    }
}

