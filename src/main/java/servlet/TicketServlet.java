package servlet;

import model.Ticket;
import services.TicketService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,   // 1MB
    maxFileSize = 1024 * 1024 * 10,        // 10MB
    maxRequestSize = 1024 * 1024 * 15      // 15MB
)
@WebServlet("/ticket")
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
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action");

            if (action == null || action.isEmpty()) {
                response.sendRedirect("Dilsha/tickets.jsp");
                return;
            }

            if ("list".equals(action)) {
                listTickets(request, response);
            } else if ("get".equals(action)) {
                getTicketById(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
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

            // Handle file upload
            Part filePart = request.getPart("attachment");
            String fileName = null;
            if (filePart != null && filePart.getSize() > 0) {
                fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();

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
            ticket.setAttachment(fileName);  // Store filename only
            ticket.setStatus(status);
            ticket.setCreatedAt(createdAt);

            boolean isCreated = ticketService.createTicket(ticket);

            if (isCreated) {
                response.sendRedirect(request.getContextPath() + "/Bupathi/index.jsp?success=" + isCreated); // update here to show submitted msg
            } else {
                response.sendRedirect(request.getContextPath() + "/Dilsha/tickets.jsp?success=" + isCreated);
            }

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
            response.sendRedirect("Dilsha/tickets.jsp?updated=" + isUpdated);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private void deleteTicket(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int ticketId = Integer.parseInt(request.getParameter("ticketId"));

            boolean isDeleted = ticketService.deleteTicket(ticketId);
            response.sendRedirect("Dilsha/tickets.jsp?deleted=" + isDeleted);
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
