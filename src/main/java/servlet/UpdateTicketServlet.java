package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.TicketService;

@WebServlet("/UpdateTicketStatusServlet")
public class UpdateTicketStatusServlet extends HttpServlet {
    private TicketService ticketService;

    @Override
    public void init() {
        ticketService = new TicketService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int ticketId = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");
        ticketService.updateTicketStatus(ticketId, status);
        response.sendRedirect("admin/tickets");
    }
}
