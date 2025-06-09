package servlet;

import model.Ticket;
import services.TicketService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/student/edit-ticket")
public class StudentEditTicketServlet extends HttpServlet {
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
        request.getRequestDispatcher("/Dilsha/tickets_update_student.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("ticketId"));
        String subject = request.getParameter("subject");
        String description = request.getParameter("description");
        String studentId = request.getParameter("studentId");  
        String status = request.getParameter("status");
        String reply = request.getParameter("reply");

        ticketService.updateTicket(id, subject, description, status, reply);

        response.sendRedirect(request.getContextPath() + "/student/tickets");
    }
}
