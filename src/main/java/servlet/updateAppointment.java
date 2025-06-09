package servlet;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Appointment;
import services.AppointmentService;

@WebServlet("/Dinali/updateAppointment")
public class updateAppointment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            // Get existing appointment to preserve status
            int appointmentId = Integer.parseInt(request.getParameter("id"));
            AppointmentService service = new AppointmentService();
            Appointment existingAppointment = service.getAppointmentById(appointmentId);
            
            if (existingAppointment == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Appointment not found");
                return;
            }
            
            // Update the appointment with new values
            Appointment updatedAppointment = new Appointment();
            updatedAppointment.setId(appointmentId);
            updatedAppointment.setName(request.getParameter("name"));
            updatedAppointment.setEmail(request.getParameter("email"));
            updatedAppointment.setTel(request.getParameter("tel"));
            updatedAppointment.setReason(request.getParameter("reason"));
            updatedAppointment.setDate(request.getParameter("date"));
            updatedAppointment.setMode(request.getParameter("mode"));
            updatedAppointment.setCounselor(request.getParameter("counselor"));
            updatedAppointment.setConcern(request.getParameter("concern"));
            updatedAppointment.setStatus(existingAppointment.getStatus()); // Preserve existing status
            
            // Perform the update
            boolean success = service.updateAppointment(updatedAppointment);
            
            if (success) {
                request.setAttribute("appointment", updatedAppointment);
                request.setAttribute("message", "Appointment updated successfully");
            } else {
                request.setAttribute("errorMessage", "Failed to update appointment");
            }
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Bupathi/dummydash.jsp");
            dispatcher.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error updating appointment: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Dinali/appointmentProfile.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/Bupathi/index.jsp");
    }
}