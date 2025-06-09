package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Admin;
import model.Student;
import services.AdminService;
import services.Studentservice;
@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType"); 
        
        System.out.println("Login attempt for username: " + username + " as " + userType);
        
        if ("admin".equals(userType)) {
            // Admin login flow
            AdminService adminService = new AdminService();
            boolean isValidAdmin = false;
			try {
				isValidAdmin = adminService.authenticate(username, password);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
            if (isValidAdmin) {
                Admin admin = null;
				try {
					admin = adminService.getAdminByUsername(username);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                HttpSession session = request.getSession();
                session.setAttribute("admin", admin);
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            } else {
                request.setAttribute("errorMessage", "Invalid admin credentials");
                request.getRequestDispatcher("Bupathi/login.jsp").forward(request, response);
            }
        } else {
            // Existing student login flow
            Studentservice service = new Studentservice();
            boolean isValidUser = service.authenticate(username, password);
            
            if (isValidUser) {
                Student authenticatedStudent = service.getStudentByUsername(username);
                if (authenticatedStudent != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("student", authenticatedStudent);
                    session.setAttribute("stid", authenticatedStudent.getStdid());
                 // After successful login
                
                    response.sendRedirect(request.getContextPath() + "/student/dashboard");
                } else {
                    request.setAttribute("errorMessage", "Error retrieving user data");
                    request.getRequestDispatcher("/Bupathi/login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Invalid username or password");
                request.getRequestDispatcher("/Bupathi/login.jsp").forward(request, response);
            }
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/Bupathi/login.jsp");
    }
}