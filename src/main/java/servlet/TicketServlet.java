package servlet;

import model.Ticket;
import services.TicketService;
import model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

// enable file uploading and set limits
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,   
    maxFileSize = 1024 * 1024 * 10,        
    maxRequestSize = 1024 * 1024 * 15      
)
@WebServlet("/student/ticket")
public class TicketServlet extends HttpServlet {
    private TicketService ticketService = new TicketService();

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
            response.sendRedirect(request.getContextPath() + "/Dilsha/error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String redirectPath = request.getContextPath() + "/Bupathi/login.jsp";

        if (session == null || (session.getAttribute("admin") == null && session.getAttribute("student") == null)) {
            if (session != null) {
                session.setAttribute("redirectUrl", request.getRequestURI());
                session.setAttribute("error", "Please login to view this page");
            }
            response.sendRedirect(redirectPath);
            return;
        }

        try {
            String action = request.getParameter("action");

            if (action == null || action.isEmpty()) {
                listTickets(request, response);
                return;
            }

            if ("list".equals(action)) {
                listTickets(request, response);
            } else if ("get".equals(action)) {
                getTicketById(request, response);
            } else if ("student".equals(action)) {
                listStudentTickets(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Dilsha/error.jsp");
        }
    }

    private void createTicket(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            String name = request.getParameter("name");
            String studentId = request.getParameter("studentId");
            String faculty = request.getParameter("faculty");
            String subject = request.getParameter("subject");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String issueType = request.getParameter("issueType");
            String description = request.getParameter("description");
            String status = "Open";
            Timestamp createdAt = new Timestamp(System.currentTimeMillis()); 

            // attachment
            Part filePart = request.getPart("attachment");
            String fileName = null;
            if (filePart != null && filePart.getSize() > 0) {
                fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

                File uploadDir = new File(uploadPath); // checks uploads/  directory exists
                if (!uploadDir.exists()) uploadDir.mkdir(); // if not, make directory

                filePart.write(uploadPath + File.separator + fileName);
            }

            Ticket ticket = new Ticket();
            ticket.setName(name);
            ticket.setStudentId(studentId);
            ticket.setFaculty(faculty);
            ticket.setSubject(subject);
            ticket.setEmail(email);
            ticket.setPhone(phone);
            ticket.setIssueType(issueType);
            ticket.setDescription(description);
            ticket.setAttachment(fileName);
            ticket.setStatus(status);
            ticket.setCreatedAt(createdAt);

            boolean isCreated = ticketService.createTicket(ticket);

            if (isCreated) {
                response.sendRedirect(request.getContextPath() + "/student/tickets?success=true");
            } else {
                response.sendRedirect(request.getContextPath() + "/Dilsha/tickets.jsp?success=" + isCreated);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Dilsha/error.jsp");
        }
    }

    private void updateTicket(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int ticketId = Integer.parseInt(request.getParameter("ticketId"));
            String status = request.getParameter("status");

            boolean isUpdated = ticketService.updateTicketStatus(ticketId, status);
            response.sendRedirect(request.getContextPath() + "/Dilsha/tickets.jsp?updated=" + isUpdated);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Dilsha/error.jsp");
        }
    }

    private void deleteTicket(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int ticketId = Integer.parseInt(request.getParameter("ticketId"));

            boolean isDeleted = ticketService.deleteTicket(ticketId);
            response.sendRedirect(request.getContextPath() + "/Dilsha/tickets.jsp?deleted=" + isDeleted);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Dilsha/error.jsp");
        }
    }

    private void listTickets(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Ticket> tickets = ticketService.getAllTickets();
            request.setAttribute("tickets", tickets);
            request.getRequestDispatcher("/Dilsha/tickets.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Dilsha/error.jsp");
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
            request.getRequestDispatcher("/Dilsha/tickets.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Dilsha/error.jsp");
        }
    }

    private void listStudentTickets(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String studentId = request.getParameter("studentId");
            List<Ticket> studentTickets = ticketService.getTicketsByStudentId(studentId);
            request.setAttribute("studentTickets", studentTickets);
            request.getRequestDispatcher("/Dilsha/tickets.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Dilsha/error.jsp");
        }
    }
}
