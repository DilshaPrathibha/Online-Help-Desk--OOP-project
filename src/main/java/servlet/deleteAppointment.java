package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import services.AppointmentService;

@WebServlet("/deleteAppointment")
public class deleteAppointment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Check if user is logged in
        if (session == null || session.getAttribute("student") == null) {
            response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
            return;
        }
        
        try {
            int appointmentId = Integer.parseInt(request.getParameter("id"));
            AppointmentService service = new AppointmentService();
            boolean success = service.deleteAppointment(appointmentId);
            
            if (success) {
                session.setAttribute("message", "Appointment deleted successfully");
            } else {
                session.setAttribute("errorMessage", "Failed to delete appointment");
            }
            
            response.sendRedirect(request.getContextPath() + "/userAppointments");
            
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error deleting appointment: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/userAppointments");
        }
    }
}