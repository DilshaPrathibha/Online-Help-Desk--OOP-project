package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.TicketService;



@WebServlet("/student/deleteTicketServlet")
public class StudentDeleteTicketServlet extends HttpServlet {
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
        response.sendRedirect(request.getContextPath() + "/student/tickets"); 
    }
}

	

 