package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Student;
import services.Studentservice;

@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        
        if (student != null) {
            request.setAttribute("student", student);
            request.getRequestDispatcher("/Bupathi/editprofile.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Student currentStudent = (Student) session.getAttribute("student");
        
        if (currentStudent != null) {
            // Create updated student object from form data
            Student updatedStudent = new Student();
            updatedStudent.setStdid(currentStudent.getStdid()); // ID shouldn't change
            updatedStudent.setFullname(request.getParameter("fullname"));
            updatedStudent.setEmail(request.getParameter("email"));
            updatedStudent.setPhonenumber(request.getParameter("phonenumber"));
            updatedStudent.setSemester(Integer.parseInt(request.getParameter("semester")));
            updatedStudent.setFos(request.getParameter("fos"));
            updatedStudent.setDob(java.sql.Date.valueOf(request.getParameter("dob")));
            updatedStudent.setUsername(currentStudent.getUsername()); // Username shouldn't change
            updatedStudent.setPassword(currentStudent.getPassword()); // Password handled separately
            
            // Update in database
            Studentservice service = new Studentservice();
            boolean success = service.updateStudent(updatedStudent);
            
            if (success) {
                // Update session with new data
                session.setAttribute("student", updatedStudent);
                request.setAttribute("successMessage", "Profile updated successfully!");
                response.sendRedirect(request.getContextPath() + "/Bupathi/dummydash.jsp");
                return; // Add this return statement
            } else {
                request.setAttribute("errorMessage", "Failed to update profile");
                request.getRequestDispatcher("/Bupathi/editprofile.jsp").forward(request, response);
            }
            
            request.getRequestDispatcher("/Bupathi/editProfile.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
        }
    }
}