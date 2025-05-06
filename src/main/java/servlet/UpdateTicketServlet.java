package servlet;

import services.TicketService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/update-ticket")
public class UpdateTicketServlet extends HttpServlet {
    private TicketService ticketService;

    @Override
    public void init() {
        ticketService = new TicketService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int ticketId = Integer.parseInt(request.getParameter("ticketId"));
        String subject = request.getParameter("subject");
        String description = request.getParameter("description");
        String status = request.getParameter("status");

        ticketService.updateTicket(ticketId, subject, description, status);
        response.sendRedirect(request.getContextPath() + "/admin/tickets");
    }
}
