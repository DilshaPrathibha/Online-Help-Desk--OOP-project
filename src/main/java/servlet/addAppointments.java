package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Appointment;
import model.Student;
import services.AppointmentService;

@WebServlet("/addAppointments")
public class addAppointments extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Check if user is logged in
        if (session == null || session.getAttribute("student") == null) {
            response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
            return;
        }
        
        // Get logged in student
        Student student = (Student) session.getAttribute("student");
        
        // Create appointment object
        Appointment appointment = new Appointment();
        appointment.setName(request.getParameter("name"));
        appointment.setEmail(request.getParameter("email"));
        appointment.setTel(request.getParameter("tel"));
        appointment.setReason(request.getParameter("reason"));
        appointment.setDate(request.getParameter("date"));
        appointment.setMode(request.getParameter("mode"));
        appointment.setCounselor(request.getParameter("counselor"));
        appointment.setConcern(request.getParameter("concern"));
        appointment.setStid(String.valueOf(student.getStdid())); // Use logged-in student's ID
        
        // Save appointment
        AppointmentService service = new AppointmentService();
        boolean success = service.createAppointment(appointment);
        
        if (success) {
        	session.setAttribute("successMessage", "Appointment successfully created.");
            response.sendRedirect(request.getContextPath() + "/userAppointments");
        } else {
            request.setAttribute("errorMessage", "Failed to create appointment. Please try again.");
            request.getRequestDispatcher("/Bupathi/counseling.jsp").forward(request, response);
        }
    }
}