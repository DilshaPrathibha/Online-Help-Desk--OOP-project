package servlet;

import services.TicketService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/deleteTicketServlet")
public class AdminDeleteTicketServlet extends HttpServlet {
	
    private TicketService ticketService;

    @Override
    public void init() {
        ticketService = new TicketService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ticketService.deleteTicket(id);
        response.sendRedirect(request.getContextPath() + "/admin/tickets");
    }
}

	

 