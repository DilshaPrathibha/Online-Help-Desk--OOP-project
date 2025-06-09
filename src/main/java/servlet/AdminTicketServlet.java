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
        HttpSession session = request.getSession(false);
        String redirectPath = request.getContextPath() + "/Bupathi/login.jsp";

        // Check whether admin session exists
        if (session == null || session.getAttribute("admin") == null) {
            if (session != null) {
                session.setAttribute("redirectUrl", request.getRequestURI());
                session.setAttribute("error", "Please login as admin to view this page");
            }
            response.sendRedirect(redirectPath);
            return;
        }

        String action = request.getParameter("action");

        if (action == null || action.equals("list")) {
            String search = request.getParameter("search");
            String status = request.getParameter("status");
            String faculty = request.getParameter("faculty");
            String issueType = request.getParameter("issueType"); 

            List<Ticket> tickets;

            if ((search != null && !search.isEmpty()) || 
                (status != null && !status.isEmpty()) || 
                (faculty != null && !faculty.isEmpty()) || 
                (issueType != null && !issueType.isEmpty())) {
                
                tickets = ticketService.searchTickets(
                        search != null ? search : "",
                        faculty != null ? faculty : "",
                        status != null ? status : "",
                        issueType != null ? issueType : ""
                );
            } else {
                // Default- get all
                tickets = ticketService.getAllTickets();
            }

            request.setAttribute("tickets", tickets);
            request.getRequestDispatcher("/Dilsha/tickets_admin.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}