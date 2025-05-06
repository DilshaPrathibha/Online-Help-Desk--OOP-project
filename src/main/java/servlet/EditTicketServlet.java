package servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Ticket;
import services.TicketService;

@WebServlet("/admin/edit-ticket")
public class EditTicketServlet extends HttpServlet {
    private TicketService ticketService;

    @Override
    public void init() {
        ticketService = new TicketService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Ticket ticket = ticketService.getTicket(id);
        request.setAttribute("ticket", ticket);
        request.getRequestDispatcher("/Dilsha/tickets_update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("ticketId"));
        String subject = request.getParameter("subject");
        String description = request.getParameter("description");
        String status = request.getParameter("status");

        ticketService.updateTicket(id, subject, description, status);
        response.sendRedirect(request.getContextPath() + "/admin/tickets");
    }
}
