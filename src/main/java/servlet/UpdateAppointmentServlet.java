package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import services.AppointmentService;

@WebServlet("/updateappointment")
public class UpdateAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Check if admin is logged in
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
            return;
        }
        
        // Get parameters
        int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
        String newStatus = request.getParameter("newStatus");
        
        // Update appointment status
        AppointmentService service = new AppointmentService();
        boolean success = service.updateAppointmentStatus(appointmentId, newStatus);
        
        if (success) {
            session.setAttribute("message", "Appointment status updated successfully!");
        } else {
            session.setAttribute("error", "Failed to update appointment status.");
        }
        
        response.sendRedirect(request.getContextPath() + "/adminappointments");
    }
}