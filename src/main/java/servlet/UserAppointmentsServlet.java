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

import model.Appointment;
import model.Student;
import services.AppointmentService;

@WebServlet("/userAppointments")
public class UserAppointmentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        // Check if user is logged in
        if (session == null || session.getAttribute("student") == null) {
            response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
            return;
        }
        
        // Get logged in student
        Student student = (Student) session.getAttribute("student");
        String stid = student.getStdid();
        
        // Get appointments for this student
        AppointmentService service = new AppointmentService();
        List<Appointment> appointments = service.getAppointmentsByStudentId(stid);
        
        request.setAttribute("appointments", appointments);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Dinali/userAppointments.jsp");
        dispatcher.forward(request, response);
    }
}