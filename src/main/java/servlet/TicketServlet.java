package servlet;

import model.Ticket;
import services.TicketService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

@WebServlet("/ticket")   // refers /ticket to come from forms.. 
public class TicketServlet extends HttpServlet {
    private TicketService ticketService = new TicketService();  //

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action");

            if ("create".equals(action)) {
                createTicket(request, response);
            } else if ("update".equals(action)) {
                updateTicket(request, response);
            } else if ("delete".equals(action)) {
                deleteTicket(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // create a custom error page if needed
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action");

            if (action == null || action.isEmpty()) {          // Default - runs when action is NULL 
                response.sendRedirect("Dilsha/tickets.jsp");   //(runs when it's the first time)
                return;
            }
            
            if ("list".equals(action)) {
                listTickets(request, response);
            } else if ("get".equals(action)) {
                getTicketById(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); //
        }
    }

    private void createTicket(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String issueType = request.getParameter("issueType");
            String description = request.getParameter("description");
            String attachment = request.getParameter("attachment");
            String status = "Open";
            Timestamp createdAt = new Timestamp(System.currentTimeMillis());

            Ticket ticket = new Ticket();
            ticket.setName(name);
            ticket.setEmail(email);
            ticket.setIssueType(issueType);
            ticket.setDescription(description);
            ticket.setAttachment(attachment);
            ticket.setStatus(status);
            ticket.setCreatedAt(createdAt);

            boolean isCreated = ticketService.createTicket(ticket);
            response.sendRedirect(request.getContextPath() + "/Dilsha/tickets.jsp?success=" + isCreated); // when not entered to db // add error msg
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private void updateTicket(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int ticketId = Integer.parseInt(request.getParameter("ticketId"));
            String status = request.getParameter("status");

            boolean isUpdated = ticketService.updateTicketStatus(ticketId, status);
            response.sendRedirect("Dilsha/tickets.jsp?updated=" + isUpdated);   //  add something?
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private void deleteTicket(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int ticketId = Integer.parseInt(request.getParameter("ticketId"));

            boolean isDeleted = ticketService.deleteTicket(ticketId);
            response.sendRedirect("Dilsha/tickets.jsp?deleted=" + isDeleted);  //  add something?
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private void listTickets(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Ticket> tickets = ticketService.getAllTickets();
            request.setAttribute("tickets", tickets);
            request.getRequestDispatcher("Dilsha/tickets.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private void getTicketById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int ticketId = Integer.parseInt(request.getParameter("ticketId"));
            Ticket ticket = ticketService.getTicket(ticketId);

            if (ticket != null) {
                List<Ticket> ticketList = new ArrayList<>();
                ticketList.add(ticket);
                request.setAttribute("ticketList", ticketList);
            } else {
                request.setAttribute("ticketList", Collections.emptyList());
            }
            request.getRequestDispatcher("Dilsha/tickets_admin.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
