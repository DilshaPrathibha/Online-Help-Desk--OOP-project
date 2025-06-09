package servlet;

import java.io.IOException;

import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Student;
import services.Studentservice;

@WebServlet("/StudentList")
public class AdminStudentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        // Check admin authentication
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
            return;
        }
        
        Studentservice studentService = new Studentservice();
        List<Student> students = studentService.getAllStudents();
        
        request.setAttribute("students", students);
        request.getRequestDispatcher("/Bupathi/students.jsp").forward(request, response);
     // Notice the space before students.jsp
    }
}