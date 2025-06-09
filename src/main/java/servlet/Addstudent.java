package servlet;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Student;
import services.Studentservice;

@WebServlet("/Addstudent")
public class Addstudent extends HttpServlet {
    
    // NEW: Handle GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to registration page for GET requests
    	
        response.sendRedirect(request.getContextPath() + "/Bupathi/register.jsp");
    }

    // Existing POST handler (with improved forward path)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Process form data
        Student st1 = new Student();
        st1.setFullname(request.getParameter("fullname"));
        st1.setEmail(request.getParameter("email"));
        st1.setPhonenumber(request.getParameter("phone"));
        st1.setStdid(request.getParameter("studentID"));
        
        //strt here
        System.out.println("Form data received:");
        System.out.println("Name: " + request.getParameter("fullname"));
        System.out.println("Email: " + request.getParameter("email"));
        // Add all other parameters
        
        
        
        String dobString = request.getParameter("dob");
        if (dobString != null && !dobString.isEmpty()) {
            st1.setDob(java.sql.Date.valueOf(dobString));
        }

        st1.setSemester(Integer.parseInt(request.getParameter("semester")));
        st1.setFos(request.getParameter("studyField"));
        st1.setUsername(request.getParameter("username"));
        st1.setPassword(request.getParameter("password"));
        
        // Save to database
        Studentservice service = new Studentservice();
        service.regstudent(st1);
        
        // Forward to index.jsp with absolute path
        response.sendRedirect(request.getContextPath() + "/Bupathi/index.jsp?msg=success");


    }
}