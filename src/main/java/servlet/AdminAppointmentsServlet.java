package servlet;

import java.io.IOException;

import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Admin;
import model.Appointment;
import services.AppointmentService;

@WebServlet("/adminappointments")
public class AdminAppointmentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Check if admin is logged in
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
            return;
        }
        
        // Get all appointments
        AppointmentService service = new AppointmentService();
        List<Appointment> allAppointments = service.getAllAppointments();
        
        request.setAttribute("appointments", allAppointments);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Dinali/Adminappointments.jsp");
        dispatcher.forward(request, response);
    }
}